<?php

namespace App\Http\Controllers\Api\SinhVien;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Cache;
use App\Models\LopHocPhan;
use App\Models\DotDangKy;
use App\Models\DangKyHocPhan;
use App\Services\StoreProcedure\HuyDangKyHocPhanService;
use App\Jobs\ProcessDangKyHocPhan;

class DangKyHocPhanController extends Controller
{
    public function getLopMo()
    {
        $dot = DotDangKy::where('TrangThai', 1)->first();
        if (!$dot || !$dot->isOpening()) {
            return response()->json(['message' => 'Ngoài thời gian đăng ký'], 400);
        }

        $lops = LopHocPhan::with(['monHoc', 'giangVien', 'lichHoc'])
            ->where('HocKyID', $dot->HocKyID)
            ->get();

        return response()->json($lops);
    }

    public function dangKy(Request $request)
    {
        $validated = $request->validate([
            'LopHocPhanID' => 'required|integer|exists:lophocphan,LopHocPhanID',
        ]);

        $user = $request->user(); 
        $sinhVien = $user->sinhVien;
        $lopHocPhanID = (int) $validated['LopHocPhanID'];

        if (!$sinhVien) {
            return response()->json(['message' => 'Không tìm thấy thông tin sinh viên.'], 404);
        }

        $statusKey = "registration_status:{$sinhVien->SinhVienID}:{$lopHocPhanID}";
        Redis::del($statusKey);

        $lockKey = "lock:lophocphan:{$lopHocPhanID}:reserve";
        $lock = Cache::lock($lockKey, 10);

        if (!$lock->get()) {
            return response()->json([
                'status'  => 'failed',
                'message' => 'Lớp đang được nhiều bạn đăng ký cùng lúc. Vui lòng thử lại sau 5-10 giây.'
            ], 429);
        }

        try {
            ProcessDangKyHocPhan::dispatch(
                $user->UserID,
                $sinhVien->SinhVienID,
                $lopHocPhanID
            )->onQueue('registration');

            return response()->json([
                'status'  => 'processing',
                'message' => 'Yêu cầu đăng ký đã được gửi. Hệ thống đang xử lý... Kết quả sẽ có trong vài giây.'
            ]);
        } finally {
            $lock->release();
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

    public function huyMon(Request $request, $dangKyID)
    {
        $service = app(HuyDangKyHocPhanService::class);
        $user = $request->user();

        $result = $service->huyDangKy($dangKyID, $user->UserID);

        if ($result['success']) {
            $dangKy = DangKyHocPhan::find($dangKyID);
            if ($dangKy) {
                $lopId = $dangKy->LopHocPhanID;
                $lop = LopHocPhan::find($lopId);

                if ($lop) {
                    $currentCount = DangKyHocPhan::where('LopHocPhanID', $lopId)->count();
                    $remaining = $lop->SoLuongToiDa - $currentCount;
                    Redis::set("lophocphan:{$lopId}:slots", max(0, $remaining));
                }
            }

            return response()->json(['message' => $result['message']]);
        }

        return response()->json(['message' => $result['message']], 400);
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
}