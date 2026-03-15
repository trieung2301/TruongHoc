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
        try {
            $res = $this->service->createLichHoc($request->all());
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

        try {
            $res = $this->service->updateLichHoc($id, $request->all());
            return response()->json($res);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 422);
        }
    }
}