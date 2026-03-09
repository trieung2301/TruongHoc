<?php

namespace App\Http\Controllers\Api\SinhVien;

use App\Http\Controllers\Controller;
use App\Models\NamHoc;
use App\Services\SinhVienLichService; // Sử dụng service đã gộp
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LichHocController extends Controller
{
    public function __construct(
        protected SinhVienLichService $lichService
    ) {}

    public function xemLichHoc(Request $request): JsonResponse
    {
        $request->validate([
            'hoc_ky_id'  => 'nullable|integer|exists:hocky,HocKyID',
            'date'       => 'nullable|date',
        ]);

        $result = $this->lichService->getLichHoc(
            $request->user(),
            $request->integer('hoc_ky_id'),
            $request->string('date')
        );

        return response()->json($result);
    }

    public function getBoLocHocKy(): JsonResponse
    {
        $data = NamHoc::where(['hocKy' => fn($q) => $q->select('HocKyID', 'NamHocID', 'TenHocKy')])
            ->orderBy('NgayBatDau', 'desc')
            ->get()
            ->map(fn($nam) => [
                'value'    => $nam->NamHocID,
                'label'    => $nam->TenNamHoc,
                'children' => $nam->hocKy->map(fn($hk) => [
                    'value' => $hk->HocKyID,
                    'label' => $hk->TenHocKy,
                ])
            ]);

        return response()->json([
            'success' => true,
            'data'    => $data,
        ]);
    }
}