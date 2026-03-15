<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Services\LichThiService;
use Illuminate\Http\Request;
use Exception;

class LichThiController extends Controller
{
    protected $service;

    public function __construct(LichThiService $service) {
        $this->service = $service;
    }

    public function store(Request $request) {
        try {
            $res = $this->service->createLichThi($request->all());
            return response()->json($res, 201);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 422);
        }
    }

    public function update(Request $request) {
        $id = $request->input('LichThiID');
        if (!$id) {
            return response()->json(['error' => 'LichThiID is required in JSON body'], 400);
        }

        try {
            $res = $this->service->updateLichThi($id, $request->all());
            return response()->json($res);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 422);
        }
    }
}