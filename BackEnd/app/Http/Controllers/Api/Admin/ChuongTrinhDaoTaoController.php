<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChuongTrinhDaoTao;
use Illuminate\Http\Request;

class ChuongTrinhDaoTaoController extends Controller
{
    protected $ctdtService;

    public function __construct(\App\Services\ChuongTrinhDaoTaoService $ctdtService)
    {
        $this->ctdtService = $ctdtService;
    }

    public function index(Request $request)
    {
        $filters = $request->validate([
            'KhoaID'    => 'nullable|exists:khoa,KhoaID',
            'NganhID'   => 'nullable|exists:nganhdaotao,NganhID',
            'HocKyGoiY' => 'nullable|integer',
            'search'    => 'nullable|string',
            'per_page'  => 'nullable|integer|min:1'
        ]);

        $data = $this->ctdtService->layDanhSachCTDT($filters);

        return response()->json([
            'message' => 'Lấy danh sách CTĐT thành công',
            'data'    => $data
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'NganhID'     => 'required|exists:nganhdaotao,NganhID',
            'MonHocID'    => 'required|exists:monhoc,MonHocID',
            'HocKyGoiY'   => 'required|integer|min:1|max:12',
            'BatBuoc'     => 'required|boolean',
        ]);

        $exists = ChuongTrinhDaoTao::where('NganhID', $data['NganhID'])
            ->where('MonHocID', $data['MonHocID'])
            ->exists();

        if ($exists) {
            return response()->json(['message' => 'Môn học này đã có trong CTĐT của ngành'], 422);
        }

        $ctdt = ChuongTrinhDaoTao::create($data);

        return response()->json([
            'message' => 'Thêm môn vào CTĐT thành công',
            'data'    => $ctdt
        ], 201);
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'ID'          => 'required|exists:chuongtrinhdaotao,ID',
            'HocKyGoiY'   => 'sometimes|required|integer|min:1|max:12',
            'BatBuoc'     => 'sometimes|required|boolean',
        ]);

        $ctdt = ChuongTrinhDaoTao::findOrFail($data['ID']);
        $ctdt->update($data);

        return response()->json([
            'message' => 'Cập nhật CTĐT thành công',
            'data'    => $ctdt
        ]);
    }

    public function ganNhieuMon(Request $request)
    {
        $data = $request->validate([
            'NganhID'     => 'required|exists:nganhdaotao,NganhID',
            'MonHocIDs'   => 'required|array',
            'MonHocIDs.*' => 'exists:monhoc,MonHocID',
            'HocKyGoiY'   => 'required|integer|min:1|max:12',
            'BatBuoc'     => 'required|boolean',
        ]);

        $inserted = 0;
        foreach ($data['MonHocIDs'] as $monID) {
            $exists = ChuongTrinhDaoTao::where('NganhID', $data['NganhID'])
                ->where('MonHocID', $monID)
                ->exists();

            if (!$exists) {
                ChuongTrinhDaoTao::create([
                    'NganhID'     => $data['NganhID'],
                    'MonHocID'    => $monID,
                    'HocKyGoiY'   => $data['HocKyGoiY'],
                    'BatBuoc'     => $data['BatBuoc'],
                ]);
                $inserted++;
            }
        }

        return response()->json([
            'message' => "Đã gán {$inserted} môn mới vào CTĐT ngành {$data['NganhID']}",
            'inserted' => $inserted
        ], 201);
    }
}