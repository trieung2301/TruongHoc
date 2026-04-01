<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Services\ThongKeService;
use Illuminate\Http\Request;

class ThongKeController extends Controller
{
    protected $thongKeService;

    public function __construct(ThongKeService $thongKeService)
    {
        $this->thongKeService = $thongKeService;
    }

    public function thongKeSiSoLop(Request $request)
    {
        $filters = $request->only(['LopHocPhanID']);

        return response()->json([
            'success' => true,
            'data' => $this->thongKeService->thongKeSiSoLop($filters)
        ]);
    }
    

    public function sinhVienTheoKhoa()
    {
        return response()->json([
            'success' => true,
            'data' => $this->thongKeService->thongKeSinhVienTheoKhoa()
        ]);
    }

    public function tyLeDauRot(Request $request)
    {
        $lopID = $request->input('LopHocPhanID');
        if (!$lopID) return response()->json(['success' => false, 'message' => 'Thiếu LopHocPhanID'], 400);

        return response()->json([
            'success' => true,
            'data' => $this->thongKeService->thongKeTyLeDauRot($lopID)
        ]);
    }

    public function gpaTrungBinh(Request $request)
    {
        $idHocKy = $request->input('id_hoc_ky');
        if (!$idHocKy) {
            return response()->json(['message' => 'ID học kỳ không được để trống'], 400);
        }

        $data = $this->thongKeService->thongKeGPATrungBinh($idHocKy);

        return response()->json($data);
    }
}