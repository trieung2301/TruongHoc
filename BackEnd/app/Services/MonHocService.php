<?php

namespace App\Services;

use App\Models\MonHoc;
use App\Models\DieuKienMonHoc;
use App\Models\DangKyHocPhan;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class MonHocService
{
    public function getMonHocList($khoaId = null, $nganhId = null)
    {
        $query = MonHoc::with('khoa');
        if ($khoaId) {
            $query->where('KhoaID', $khoaId);
        }

        if ($nganhId) {
            $query->whereHas('chuongTrinhDaoTao', function ($q) use ($nganhId) {
                $q->where('NganhID', $nganhId);
            });
        }

        return $query->get();
    }
    
    public function createMonHoc(array $data): MonHoc
    {
        $monHoc = DB::transaction(function () use ($data) {
            return MonHoc::create([
                'MaMon'         => $data['MaMon'],
                'TenMon'        => $data['TenMon'],
                'SoTinChi'      => $data['SoTinChi'] ?? 3,
                'TietLyThuyet'  => $data['TietLyThuyet'] ?? 0,
                'TietThucHanh'  => $data['TietThucHanh'] ?? 0,
                'KhoaID'        => $data['KhoaID'],
            ]);
        });

        $this->logAction('CREATE', "Tạo môn học: {$monHoc->TenMon}", 'monhoc', $monHoc->MonHocID);
        return $monHoc;
    }

    public function updateMonHoc(int $monHocId, array $data): MonHoc
    {
        $monHoc = MonHoc::findOrFail($monHocId);

        DB::transaction(function () use ($monHoc, $data) {
            $monHoc->update(array_filter([
                'MaMon'        => $data['MaMon'] ?? null,
                'TenMon'       => $data['TenMon'] ?? null,
                'SoTinChi'     => $data['SoTinChi'] ?? null,
                'TietLyThuyet' => $data['TietLyThuyet'] ?? null,
                'TietThucHanh' => $data['TietThucHanh'] ?? null,
                'KhoaID'       => $data['KhoaID'] ?? null,
            ]));
        });

        $this->logAction('UPDATE', "Cập nhật môn học: {$monHoc->TenMon}", 'monhoc', $monHoc->MonHocID);
        return $monHoc->fresh();
    }

    public function addDieuKien(int $monHocId, int $monDieuKienId)
    {
        return DieuKienMonHoc::updateOrCreate([
            'MonHocID' => $monHocId,
            'MonTienQuyetID' => $monDieuKienId
        ]);
    }


    protected function logAction($hanhDong, $moTa, $bang, $id)
    {

        DB::table('hethong_log')->insert([
            'UserID'       => Auth::id(),
            'HanhDong'     => $hanhDong,
            'MoTa'         => $moTa,
            'BangLienQuan' => $bang,
            'IDBanGhi'     => $id,
            'IP'           => request()->ip(),
            'UserAgent'    => request()->userAgent(),
            'created_at'   => now(),
        ]);
    }
}