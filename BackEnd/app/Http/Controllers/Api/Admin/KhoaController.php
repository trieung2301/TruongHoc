<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Services\KhoaService;
use Illuminate\Http\Request;

class KhoaController extends Controller
{
    protected $khoaService;

    public function __construct(KhoaService $khoaService)
    {
        $this->khoaService = $khoaService;
    }

    public function index()
    {
        return response()->json($this->khoaService->getAll());
    }

    public function store(Request $request)
    {
        $data = $this->khoaService->create($request->all());
        return response()->json($data, 201);
    }

    public function update(Request $request)
    {
        $data = $this->khoaService->update($request->all());
        return response()->json([
            'message' => 'Cập nhật khoa thành công',
            'data' => $data
        ]);
    }

    public function destroy(Request $request)
    {
        $this->khoaService->delete($request->all());
        return response()->json(['message' => 'Xóa khoa thành công']);
    }
}