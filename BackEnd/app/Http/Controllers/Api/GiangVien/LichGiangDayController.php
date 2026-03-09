<?php

namespace App\Http\Controllers\Api\GiangVien;

use App\Http\Controllers\Controller;
use App\Services\LichGiangDayService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class LichGiangDayController extends Controller
{
    protected $service;

    public function __construct(LichGiangDayService $service)
    {
        $this->service = $service;
    }

    public function getLichGiangDay(Request $request): JsonResponse
    {
        $giangVien = $request->user()->giangVien;
        $data = $this->service->getLichGiangDay($giangVien->GiangVienID);

        return $this->success($data, 'Lấy lịch giảng dạy thành công');
    }
}