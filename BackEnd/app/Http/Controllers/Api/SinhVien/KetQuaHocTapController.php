<?php
namespace App\Http\Controllers\Api\SinhVien;

use App\Http\Controllers\Controller;
use App\Services\KetQuaHocTapService;
use Illuminate\Http\Request;

class KetQuaHocTapController extends Controller {
    protected $service;

    public function __construct(KetQuaHocTapService $service) {
        $this->service = $service;
    }

    public function xemKetQua(Request $request) {
        $hocKyId = $request->input('HocKyID');
        $data = $this->service->getKetQuaTongHop($request->user(), $hocKyId);

        return response()->json([
            'success' => true,
            'data' => $data
        ]);
    }
}