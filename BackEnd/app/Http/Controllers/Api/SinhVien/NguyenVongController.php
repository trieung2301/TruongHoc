<?php

namespace App\Http\Controllers\Api\SinhVien;

use App\Http\Controllers\Controller;
use App\Services\NguyenVongService;
use Illuminate\Http\Request;
use App\Models\NhomNguyenVong;

class NguyenVongController extends Controller
{
    protected $nguyenVongService;

    public function __construct(NguyenVongService $nguyenVongService)
    {
        $this->nguyenVongService = $nguyenVongService;
    }

    public function index(Request $request)
    {
        $monHocID = $request->input('MonHocID'); 
        $hocKyID = $request->input('HocKyID');

        if (!$monHocID || !$hocKyID) {
            return response()->json([
                'success' => false,
                'message' => 'Thiếu dữ liệu MonHocID hoặc HocKyID',
            ], 400);
        }

        $nhoms = NhomNguyenVong::where('MonHocID', $monHocID)
            ->where('HocKyID', $hocKyID)
            ->where('TrangThai', 'Đang gom')
            ->get();

        return response()->json([
            'success' => true,
            'data' => $nhoms
        ]);
    }

    public function store(Request $request)
    {
        $user = $request->user();
        $sinhVienId = $user->sinhVien->SinhVienID; 
        
        $validated = $request->validate([
            'MonHocID' => 'required|integer',
            'HocKyID'  => 'required|integer',
            'Thu'      => 'required|integer|between:2,8',
            'BuoiHoc'  => 'required|string|in:Sáng,Chiều,Tối',
        ]);

        try {
            $result = $this->nguyenVongService->ghiDanhNguyenVong($validated, $sinhVienId);

            return response()->json([
                'success' => true,
                'message' => 'Đăng ký nguyện vọng thành công.',
                'data' => $result
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage()
            ], 400);
        }
    }

    public function destroy(Request $request)
    {
        $user = $request->user();
        $sinhVienId = $user->sinhVien->SinhVienID;

        $validated = $request->validate([
            'NhomID' => 'required|integer',
        ]);

        try {
            $this->nguyenVongService->huyNguyenVong(
                $validated['NhomID'], 
                $sinhVienId
            );

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage()
            ], 400);
        }

        return response()->json([
            'success' => true,
            'message' => 'Đã hủy nguyện vọng thành công.'
        ], 200);
    }
}