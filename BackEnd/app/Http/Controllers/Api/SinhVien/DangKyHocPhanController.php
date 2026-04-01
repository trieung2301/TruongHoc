<?php

namespace App\Http\Controllers\Api\SinhVien;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Cache;
use App\Models\LopHocPhan;
use App\Models\DotDangKy;
use App\Models\DangKyHocPhan;
use App\Models\LichThi;
use App\Services\DangKyHocPhanService;
use App\Services\StoreProcedure\HuyDangKyHocPhanService;
use App\Jobs\ProcessDangKyHocPhan;

class DangKyHocPhanController extends Controller
{
    protected $service;

    public function __construct(DangKyHocPhanService $service)
    {
        $this->service = $service;
    }

    public function getLopMo()
    {
        $dotMo = DotDangKy::where('TrangThai', 1)
            ->where('NgayBatDau', '<=', now())
            ->where('NgayKetThuc', '>=', now())
            ->pluck('HocKyID');

        if ($dotMo->isEmpty()) {
            return response()->json(['message' => 'Ngoài thời gian đăng ký'], 400);
        }

        $lops = LopHocPhan::with(['monHoc', 'giangVien', 'lichHoc'])
            ->whereIn('HocKyID', $dotMo)
            ->get();

        return response()->json($lops);
    }

    public function dangKy(Request $request)
    {
        $validated = $request->validate([
            'LopHocPhanID' => 'required|integer|exists:LopHocPhan,LopHocPhanID',
        ]);

        try {
            $user = $request->user();
            $sinhVien = $user->sinhVien; 
            $lopHocPhanID = $validated['LopHocPhanID'];

            if (!$sinhVien) {
                return response()->json(['message' => 'Không tìm thấy thông tin sinh viên.'], 404);
            }

            $this->service->validateAll($sinhVien, $lopHocPhanID);

            ProcessDangKyHocPhan::dispatch($user->UserID, $sinhVien->SinhVienID, $lopHocPhanID)
                ->onQueue('registration');

            return response()->json([
                'status'  => 'success',
                'message' => 'Yêu cầu đăng ký đã được ghi nhận vào hệ thống xử lý.',
                'detail'  => 'Vui lòng kiểm tra trạng thái tại mục "Lớp đã đăng ký" sau vài giây.'
            ], 202);

        } catch (\Exception $e) {
            return response()->json([
                'status'  => 'error',
                'message' => $e->getMessage()
            ], 400);
        }
    }

    public function checkStatus(Request $request, $lhpID)
    {
        $svID = $request->user()->sinhVien->SinhVienID;
        $statusKey = "registration_status:{$svID}:{$lhpID}";

        $status = Redis::get($statusKey);

        if (!$status) {
            return response()->json([
                'status'  => 'processing',
                'message' => 'Yêu cầu đang được xếp hàng xử lý...'
            ]);
        }

        if ($status === 'success') {
            return response()->json([
                'status'  => 'success',
                'message' => 'Chúc mừng! Bạn đã đăng ký học phần thành công.'
            ]);
        }

        return response()->json([
            'status'  => 'failed',
            'message' => $status
        ]);
    }

    public function huyMon(Request $request, $lhpID)
    {
        $serviceHuy = app(HuyDangKyHocPhanService::class);
        $user = $request->user();
        $sinhVien = $user->sinhVien;

        if (!$sinhVien) {
            return response()->json(['message' => 'Không tìm thấy thông tin sinh viên.'], 404);
        }
        $dangKy = DangKyHocPhan::where('LopHocPhanID', $lhpID)
            ->where('SinhVienID', $sinhVien->SinhVienID)
            ->first();

        if (!$dangKy) {
            return response()->json(['message' => 'Bạn không có lịch đăng ký lớp này.'], 404);
        }

        $result = $serviceHuy->huyDangKy($dangKy->DangKyID, $user->UserID);

        if ($result['success']) {
            $this->updateSlotsAfterCancel($lhpID);

            return response()->json([
                'status' => 'success',
                'message' => $result['message']
            ]);
        }

        return response()->json(['status' => 'error', 'message' => $result['message']], 400);
    }

    private function updateSlotsAfterCancel(int $lhpID)
    {
        $lop = LopHocPhan::find($lhpID);
        if ($lop) {
            $key = "lophocphan:{$lhpID}:slots";
            
            $currentOccupied = DangKyHocPhan::where('LopHocPhanID', $lhpID)
                ->where('TrangThai', 'DaDangKy')
                ->count();
                
            $remaining = max(0, $lop->SoLuongToiDa - $currentOccupied);
            Redis::setex($key, 3600, $remaining);
            
            \Illuminate\Support\Facades\Cache::tags(['lop_mo'])->flush();
        }
    }

    public function getDaDangKy(Request $request)
    {
        $sinhVien = $request->user()->sinhVien;

        $dot = DotDangKy::where('TrangThai', 1)->first();
        if (!$dot) {
            return response()->json([
                'message' => 'Hiện tại không có đợt đăng ký nào đang mở.'
            ], 404);
        }

        $danhSach = DangKyHocPhan::where('SinhVienID', $sinhVien->SinhVienID)
            ->whereHas('lopHocPhan', function ($query) use ($dot) {
                $query->where('HocKyID', $dot->HocKyID);
            })
            ->with([
                'lopHocPhan.monHoc',
                'lopHocPhan.giangVien',
                'lopHocPhan.lichHoc'
            ])
            ->get();

        return response()->json([
            'hoc_ky' => $dot->TenDot,
            'data'   => $danhSach
        ]);
    }
    
    private function trungLichThi(LichThi $lt1, LichThi $lt2): bool
    {
        if ($lt1->NgayThi != $lt2->NgayThi) {
            return false;
        }

        $start1 = strtotime($lt1->GioBatDau);
        $end1   = strtotime($lt1->GioKetThuc);
        $start2 = strtotime($lt2->GioBatDau);
        $end2   = strtotime($lt2->GioKetThuc);

        if ($start1 === false || $end1 === false || $start2 === false || $end2 === false) {
            return false;
        }

        return !($end1 <= $start2 || $end2 <= $start1);
    }
}