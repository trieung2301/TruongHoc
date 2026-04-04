<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Services\LichHocService;
use Illuminate\Http\Request;
use Exception;

class LichHocController extends Controller
{
    protected $service;

    public function __construct(LichHocService $service) {
        $this->service = $service;
    }

    public function index(Request $request) {
        $data = $this->service->getDanhSachLopTheoKy(
            $request->input('NamHocID'), 
            $request->input('HocKyID')
        );
        return response()->json($data);
    }

    public function store(Request $request) {
        $data = $request->validate([
            'LopHocPhanID' => 'required|exists:lophocphan,LopHocPhanID',
            'NgayHoc'      => 'required|date',
            'Thu'          => 'required|integer|between:2,8',
            'BuoiHoc'      => 'required|string|in:Sáng,Chiều,Tối',
            'TietBatDau'   => 'required|integer|min:1',
            'SoTiet'       => 'required|integer|min:1',
            'PhongHoc'     => 'nullable|string',
            'GhiChu'       => 'nullable|string',
        ]);

        try {
            $res = $this->service->createLichHoc($data);
            return response()->json($res, 201);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 422);
        }
    }

    public function update(Request $request) {
        $id = $request->input('LichHocID');
        if (!$id) {
            return response()->json(['error' => 'LichHocID is required in JSON body'], 400);
        }

        $data = $request->validate([
            'NgayHoc'    => 'sometimes|required|date',
            'Thu'        => 'sometimes|required|integer|between:2,8',
            'BuoiHoc'    => 'sometimes|required|string',
            'TietBatDau' => 'sometimes|required|integer',
            'SoTiet'     => 'sometimes|required|integer',
            'PhongHoc'   => 'sometimes|nullable|string',
            'GhiChu'     => 'sometimes|nullable|string',
        ]);

        try {
            $res = $this->service->updateLichHoc($id, $data);
            return response()->json($res);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 422);
        }
    }
}