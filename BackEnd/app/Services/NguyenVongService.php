<?php

namespace App\Services;

use App\Models\NhomNguyenVong;
use App\Models\ChiTietNguyenVong;
use App\Models\SinhVien;
use App\Models\LopHocPhan;
use App\Models\DangKyHocPhan;
use App\Models\LichHoc;
use Illuminate\Support\Facades\DB;

class NguyenVongService
{
    public function ghiDanhNguyenVong($data, $sinhVienId)
    {
        return DB::transaction(function () use ($data, $sinhVienId) {
            $daHocMonNay = DangKyHocPhan::where('SinhVienID', $sinhVienId)
                ->whereHas('lopHocPhan', function ($q) use ($data) {
                    $q->where('HocKyID', $data['HocKyID'])
                      ->where('MonHocID', $data['MonHocID']);
                })->exists();

            if ($daHocMonNay) {
                throw new \Exception("Bạn đã đăng ký môn học này trong học kỳ này rồi.");
            }

            $daCoNguyenVongMonNay = ChiTietNguyenVong::where('SinhVienID', $sinhVienId)
                ->whereHas('nhom', function ($q) use ($data) {
                    $q->where('HocKyID', $data['HocKyID'])
                      ->where('MonHocID', $data['MonHocID'])
                      ->where('TrangThai', 'Đang gom');
                })->exists();

            if ($daCoNguyenVongMonNay) {
                throw new \Exception("Bạn đã gửi nguyện vọng cho môn học này ở một lịch học khác.");
            }

            $isTrungLich = DangKyHocPhan::where('SinhVienID', $sinhVienId)
                ->whereHas('lopHocPhan.lichHoc', function ($q) use ($data) {
                    $q->where('Thu', $data['Thu'])
                      ->where('BuoiHoc', $data['BuoiHoc']);
                })->exists();

            if ($isTrungLich) {
                throw new \Exception("Trùng lịch: Bạn đã có lịch học vào Thứ {$data['Thu']} ({$data['BuoiHoc']}).");
            }

            $nhom = NhomNguyenVong::where('MonHocID', $data['MonHocID'])
                ->where('HocKyID', $data['HocKyID'])
                ->where('Thu', $data['Thu'])
                ->where('BuoiHoc', $data['BuoiHoc'])
                ->where('TrangThai', 'Đang gom')
                ->lockForUpdate() 
                ->first();

            if (!$nhom) {
                $nhom = NhomNguyenVong::create([
                    'MonHocID' => $data['MonHocID'],
                    'HocKyID'  => $data['HocKyID'],
                    'Thu'      => $data['Thu'],
                    'BuoiHoc'  => $data['BuoiHoc'],
                    'TrangThai' => 'Đang gom',
                    'SoLuongHienTai' => 0
                ]);
            }

            $alreadyJoined = ChiTietNguyenVong::where('NhomID', $nhom->NhomID)
                ->where('SinhVienID', $sinhVienId)
                ->exists();

            if ($alreadyJoined) {
                throw new \Exception("Bạn đã tham gia nhóm nguyện vọng này rồi.");
            }

            ChiTietNguyenVong::create([
                'NhomID' => $nhom->NhomID,
                'SinhVienID' => $sinhVienId
            ]);

            $nhom->increment('SoLuongHienTai');

            return $nhom;
        });
    }

    public function huyNguyenVong($nhomId, $sinhVienId)
    {
        return DB::transaction(function () use ($nhomId, $sinhVienId) {
            $chiTiet = ChiTietNguyenVong::where('NhomID', $nhomId)
                ->where('SinhVienID', $sinhVienId)
                ->first();

            if (!$chiTiet) {
                throw new \Exception("Không tìm thấy bản đăng ký nguyện vọng.");
            }

            $chiTiet->delete();

            $nhom = NhomNguyenVong::find($nhomId);
            if ($nhom && $nhom->SoLuongHienTai > 0) {
                $nhom->decrement('SoLuongHienTai');
            }

            return true;
        });
    }

    public function pheDuyetNguyenVong($nhomId, $giangVienId, $maLopHP, $soLuongToiDa, $ngayBD, $ngayKT)
    {
        return DB::transaction(function () use ($nhomId, $giangVienId, $maLopHP, $soLuongToiDa, $ngayBD, $ngayKT) {
            $nhom = NhomNguyenVong::with('chiTiet')->findOrFail($nhomId);

            $lopHP = LopHocPhan::create([
                'MonHocID'      => $nhom->MonHocID,
                'HocKyID'       => $nhom->HocKyID,
                'GiangVienID'   => $giangVienId,
                'MaLopHP'       => $maLopHP,
                'SoLuongToiDa'  => $soLuongToiDa,
                'NgayBatDau'    => $ngayBD,
                'NgayKetThuc'   => $ngayKT,
            ]);

            foreach ($nhom->chiTiet as $ct) {
                DangKyHocPhan::create([
                    'SinhVienID'     => $ct->SinhVienID,
                    'LopHocPhanID'   => $lopHP->LopHocPhanID,
                    'ThoiGianDangKy' => now(),
                    'TrangThai'      => 'Đã đăng ký'
                ]);
            }

            LichHoc::create([
                'LopHocPhanID' => $lopHP->LopHocPhanID,
                'NgayHoc'      => $ngayBD,
                'Thu'          => $nhom->Thu,
                'BuoiHoc'      => $nhom->BuoiHoc,
                'TietBatDau'   => ($nhom->BuoiHoc == 'Sáng') ? 1 : ($nhom->BuoiHoc == 'Chiều' ? 6 : 11),
                'SoTiet'       => 4,
                'PhongHoc'     => 'Phòng chờ sắp xếp',
            ]);

            $nhom->update(['TrangThai' => 'Đã mở lớp']);

            return $lopHP;
        });
    }
}