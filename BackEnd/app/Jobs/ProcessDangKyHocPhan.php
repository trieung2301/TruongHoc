<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Cache;
use App\Models\DangKyHocPhan;
use App\Models\LopHocPhan;
use App\Models\SinhVien;
use App\Services\DangKyHocPhanService;
use Throwable;

class ProcessDangKyHocPhan implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $userId;
    public $sinhVienID;
    public $lopHocPhanID;
    public $tries = 3;
    public $backoff = 5;

    public function __construct(int $userId, int $sinhVienID, int $lopHocPhanID)
    {
        $this->userId = $userId;
        $this->sinhVienID = $sinhVienID;
        $this->lopHocPhanID = $lopHocPhanID;
    }

    public function handle(): void
    {
        $dangKyService = app(DangKyHocPhanService::class);
        $statusKey = "registration_status:{$this->sinhVienID}:{$this->lopHocPhanID}";
        $slotsKey = "lophocphan:{$this->lopHocPhanID}:slots";

        try {
            DB::transaction(function () use ($dangKyService, $statusKey, $slotsKey) {
                
                $lop = LopHocPhan::where('LopHocPhanID', $this->lopHocPhanID)->lockForUpdate()->first();
                if (!$lop) throw new \Exception('Lớp học phần không tồn tại.');

                $exists = DangKyHocPhan::where('SinhVienID', $this->sinhVienID)
                    ->where('LopHocPhanID', $this->lopHocPhanID)
                    ->exists();
                if ($exists) {
                    Redis::set($statusKey, 'Bạn đã đăng ký môn học này rồi.', 'EX', 300);
                    return;
                }

                $currentCount = DangKyHocPhan::where('LopHocPhanID', $this->lopHocPhanID)->count();
                if ($currentCount >= $lop->SoLuongToiDa) {
                    Redis::set($slotsKey, 0, 'EX', 3600);
                    throw new \Exception('Lớp đã đầy sĩ số.');
                }

                $sinhVien = SinhVien::findOrFail($this->sinhVienID);
                $validation = $dangKyService->validateAll($sinhVien, $this->lopHocPhanID);
                if (!$validation['success']) throw new \Exception($validation['message']);

                DangKyHocPhan::create([
                    'SinhVienID'     => $this->sinhVienID,
                    'LopHocPhanID'   => $this->lopHocPhanID,
                    'UserID'         => $this->userId,
                    'ThoiGianDangKy' => now(),
                    'TrangThai'      => 'DaDangKy',
                ]);
                $newCount = $currentCount + 1;
                $remaining = max(0, $lop->SoLuongToiDa - $newCount);
                
                Redis::set($slotsKey, $remaining, 'EX', 3600);
                Cache::tags(['lop_mo'])->flush(); 

                Log::info("Thành công: SV {$this->sinhVienID} - Lớp {$this->lopHocPhanID}. Slots còn lại: {$remaining}");

                Redis::set($statusKey, 'success', 'EX', 600);
                
            }, 5);
        } catch (Throwable $e) {
            $this->handleJobError($e, $statusKey);
        }
    }

    protected function handleJobError(Throwable $e, string $statusKey): void
    {
        $message = mb_strtolower($e->getMessage());
        $userErrors = ['lớp đã đầy', 'trùng lịch', 'tiên quyết', 'không tồn tại', 'đã đăng ký'];
        
        $isUserError = false;
        foreach ($userErrors as $error) {
            if (str_contains($message, $error)) {
                $isUserError = true;
                break;
            }
        }

        if ($isUserError) {
            Redis::set($statusKey, $e->getMessage(), 'EX', 300);
        } else {
            Log::error("System Error [SV:{$this->sinhVienID}]: " . $e->getMessage());
            Redis::set($statusKey, 'Hệ thống bận, vui lòng thử lại.', 'EX', 60);
            throw $e;
        }
    }

    public function failed(Throwable $exception): void
    {
        $statusKey = "registration_status:{$this->sinhVienID}:{$this->lopHocPhanID}";
        Redis::set($statusKey, 'Đăng ký thất bại do lỗi hệ thống.', 'EX', 300);
    }
}