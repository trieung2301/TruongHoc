<?php

namespace App\Services;

use App\Models\LichHoc;
use App\Models\LopHocPhan;
use App\Models\DangKyHocPhan;
use App\Models\HocKy;
use Exception;
use Illuminate\Support\Facades\DB;

class LichHocService
{
    public function getDanhSachLopTheoKy($namHocId = null, $hocKyId = null)
    {
        $query = LopHocPhan::with(['monHoc', 'lichHoc', 'hocKy.namHoc']);

        if (!$hocKyId && !$namHocId) {
            $latestHocKy = HocKy::orderBy('HocKyID', 'desc')->first();
            $hocKyId = $latestHocKy ? $latestHocKy->HocKyID : null;
        }

        if ($hocKyId) {
            $query->where('HocKyID', $hocKyId);
        }

        if ($namHocId) {
            $query->whereHas('hocKy', function($q) use ($namHocId) {
                $q->where('NamHocID', $namHocId);
            });
        }

        return $query->get();
    }

    public function createLichHoc(array $data)
    {
        $this->checkTrungLichSinhVien($data['LopHocPhanID'], $data['NgayHoc'], $data['TietBatDau'], $data['SoTiet']);
        return LichHoc::create($data);
    }

    public function updateLichHoc($id, array $data)
    {
        $lich = LichHoc::findOrFail($id);
        $this->checkTrungLichSinhVien($lich->LopHocPhanID, $data['NgayHoc'], $data['TietBatDau'], $data['SoTiet'], $id);
        $lich->update($data);
        return $lich;
    }

    private function checkTrungLichSinhVien($lopID, $ngayHoc, $tietBD, $soTiet, $excludeId = null)
    {
        $tietKT = $tietBD + $soTiet - 1;
        $sinhVienIds = DangKyHocPhan::where('LopHocPhanID', $lopID)->pluck('SinhVienID');

        if ($sinhVienIds->isEmpty()) return;

        $thuCuaNgay = \Carbon\Carbon::parse($ngayHoc)->dayOfWeek + 1; // Carbon 0 (Sun) -> 6 (Sat). SQL 2 -> 8.

        $trungLich = DB::table('lichhoc as lh')
            ->join('dangkyhocphan as dk', 'lh.LopHocPhanID', '=', 'dk.LopHocPhanID')
            ->whereIn('dk.SinhVienID', $sinhVienIds)
            ->where(function($query) use ($ngayHoc, $thuCuaNgay) {
                $query->where('lh.NgayHoc', $ngayHoc)
                    ->orWhere('lh.Thu', $thuCuaNgay); // Kiểm tra trùng theo thứ
            })
            ->where(function($q) use ($tietBD, $tietKT) {
                $q->whereBetween('lh.TietBatDau', [$tietBD, $tietKT])
                ->orWhereRaw('lh.TietBatDau + lh.SoTiet - 1 BETWEEN ? AND ?', [$tietBD, $tietKT]);
            });

        if ($excludeId) {
            $trungLich->where('lh.LichHocID', '<>', $excludeId);
        }

        $exists = $trungLich->first();

        if ($exists) {
            throw new \Exception("Trùng lịch: Một hoặc nhiều sinh viên trong lớp đã có lịch học khác vào thời gian này.");
        }
    }
}