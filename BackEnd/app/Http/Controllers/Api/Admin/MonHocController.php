<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Services\MonHocService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class MonHocController extends Controller
{
    protected $monHocService;

    public function index(Request $request)
    {
        $khoaId = $request->json('KhoaID');
        $nganhId = $request->json('NganhID');

        $monHocs = $this->monHocService->getMonHocList($khoaId, $nganhId);

        return response()->json([
            'status' => 'success',
            'data' => $monHocs
        ]);
    }
    
    public function __construct(MonHocService $monHocService)
    {
        $this->monHocService = $monHocService;
    }

    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'MaMon'    => 'required|string|unique:monhoc,MaMon',
            'TenMon'   => 'required|string',
            'KhoaID'   => 'required|exists:khoa,KhoaID',
        ]);

        $monHoc = $this->monHocService->createMonHoc($validated);
        return response()->json(['message' => 'Thành công', 'data' => $monHoc], 201);
    }

    public function update(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'MonHocID'      => 'required|exists:monhoc,MonHocID',
            'MaMon'         => 'sometimes|string',
            'TenMon'        => 'sometimes|string',
            'SoTinChi'      => 'sometimes|integer',
            'TietLyThuyet'  => 'sometimes|integer',
            'TietThucHanh'  => 'sometimes|string',
            'KhoaID'        => 'sometimes|exists:khoa,KhoaID',
        ]);

        $monHoc = $this->monHocService->updateMonHoc($validated['MonHocID'], $validated);
        return response()->json(['message' => 'Cập nhật thành công', 'data' => $monHoc]);
    }

    public function addTienQuyet(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'mon_hoc_id'        => 'required|exists:monhoc,MonHocID',
            'mon_tien_quyet_id' => 'required|exists:monhoc,MonHocID|different:mon_hoc_id',
        ]);

        $record = $this->monHocService->addDieuKien($validated['mon_hoc_id'], $validated['mon_tien_quyet_id']);
        return response()->json(['message' => 'Gán điều kiện thành công', 'data' => $record]);
    }

    public function addSongHanh(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'mon_hoc_id'       => 'required|exists:monhoc,MonHocID',
            'mon_song_hanh_id' => 'required|exists:monhoc,MonHocID|different:mon_hoc_id',
        ]);

        $record = $this->monHocService->addDieuKien($validated['mon_hoc_id'], $validated['mon_song_hanh_id']);
        return response()->json(['message' => 'Gán môn song hành thành công', 'data' => $record]);
    }
}