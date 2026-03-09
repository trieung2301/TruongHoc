<?php

namespace App\Services;

use App\Models\User;
use App\Models\View\VDiemHocKySinhVien;
use App\Models\View\VGpaHocKy;

class KetQuaHocTapService
{
    public function getKetQuaTongHop($user, $hocKyId = null): array
    {
        $sv = $user->sinhVien;
        if (!$sv) {
            return ['success' => false, 'data' => null, 'message' => 'Không tìm thấy sinh viên'];
        }

        $query = VDiemHocKySinhVien::where('SinhVienID', $sv->SinhVienID);
        if ($hocKyId) {
            $query->where('HocKyID', $hocKyId);
        }

        $diemChiTiet = $query->get()->map(fn($item) => [
            'ten_hoc_ky'   => $item->TenHocKy,
            'ma_mon'       => $item->MaMon,
            'ten_mon'      => $item->TenMon,
            'so_tin_chi'   => $item->SoTinChi,
            'diem_cc'      => $item->DiemChuyenCan,
            'diem_gk'      => $item->DiemGiuaKy,
            'diem_thi'     => $item->DiemThi,
            'diem_tk'      => $item->DiemTongKet,
        ]);

        $gpa = VGpaHocKy::where('SinhVienID', $sv->SinhVienID)
            ->when($hocKyId, fn($q) => $q->where('HocKyID', $hocKyId))
            ->first();

        return [
            'success' => true,
            'data'    => [
                'diem_chi_tiet' => $diemChiTiet,
                'gpa_hoc_ky'    => $gpa ? [
                    'ten_hoc_ky'     => $gpa->TenHocKy,
                    'so_mon'         => $gpa->SoMon,
                    'tong_tin_chi'   => $gpa->TongTinChi,
                    'gpa'            => $gpa->GPA_HocKy_TamTinh,
                ] : null,
            ],
            'message' => 'Lấy kết quả học tập thành công',
        ];
    }
}