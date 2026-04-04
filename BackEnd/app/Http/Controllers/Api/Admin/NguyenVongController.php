<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\NhomNguyenVong;
use App\Services\NguyenVongService;
use App\Services\LogService;
use Illuminate\Http\Request;

class NguyenVongController extends Controller
{
    protected $nguyenVongService;
    protected $logService;

    public function __construct(NguyenVongService $nguyenVongService, LogService $logService)
    {
        $this->nguyenVongService = $nguyenVongService;
        $this->logService = $logService;
    }

    public function index()
    {
        $ds = NhomNguyenVong::with(['monHoc', 'hocKy'])
            ->where('TrangThai', 'Đang gom')
            ->get();
        return response()->json(['success' => true, 'data' => $ds]);
    }

    public function convertToClass(Request $request)
    {
        $validated = $request->validate([
            'NhomID'        => 'required|integer',
            'GiangVienID'   => 'required|integer',
            'MaLopHP'       => 'required|string|unique:lophocphan,MaLopHP',
            'SoLuongToiDa'  => 'required|integer|min:1',
            'NgayBatDau'    => 'required|date',
            'NgayKetThuc'   => 'required|date|after:NgayBatDau',
        ]);

        try {
            $lop = $this->nguyenVongService->pheDuyetNguyenVong(
                $validated['NhomID'],
                $validated['GiangVienID'],
                $validated['MaLopHP'],
                $validated['SoLuongToiDa'],
                $validated['NgayBatDau'],
                $validated['NgayKetThuc']
            );

            $this->logService->write(
                'Chuyển đổi nguyện vọng',
                "Đã mở lớp học phần {$lop->MaLopHP} từ nhóm nguyện vọng ID: {$validated['NhomID']}",
                'lophocphan',
                $lop->LopHocPhanID
            );

            return response()->json([
                'success' => true,
                'message' => 'Đã mở lớp học phần thành công từ nguyện vọng.',
                'data' => $lop
            ]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 400);
        }
    }

    public function destroy(Request $request)
    {
        $validated = $request->validate([
            'NhomID' => 'required|integer|exists:nhom_nguyen_vong,NhomID'
        ]);

        try {
            $id = $validated['NhomID'];
            $nhom = NhomNguyenVong::findOrFail($id);
            
            $moTa = "Đã xóa nhóm nguyện vọng ID: $id";

            $nhom->chiTiet()->delete();
            $nhom->delete();

            $this->logService->write(
                'Xóa nguyện vọng',
                $moTa,
                'nhom_nguyen_vong',
                $id
            );

            return response()->json(['success' => true, 'message' => 'Đã xóa nhóm nguyện vọng.']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Không thể xóa: ' . $e->getMessage()], 400);
        }
    }
}