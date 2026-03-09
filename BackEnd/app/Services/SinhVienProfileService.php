<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Log;

class SinhVienProfileService
{
    public function getSinhVienProfile(User $user): array
    {
        $user->load([
            'role',
            'sinhVien' => function ($query) {
                $query->with([
                    'nganh' => fn($q) => $q->select('NganhID', 'MaNganh', 'TenNganh', 'KhoaID'),
                    'khoa'  => fn($q) => $q->select('KhoaID', 'TenKhoa'),
                    'lopSinhHoat' => function ($q) {
                        $q->with([
                            'khoa' => fn($sq) => $sq->select('KhoaID', 'TenKhoa'),
                            'coVanHocTap' => fn($sq) => $sq->select(
                                'GiangVienID',
                                'HoTen',
                                'email',
                                'sodienthoai',
                                'HocVi'
                            ),
                        ])->select(
                            'LopSinhHoatID',
                            'MaLop',
                            'TenLop',
                            'NamNhapHoc',
                            'KhoaID',
                            'GiangVienID'
                        );
                    }
                ])->select([
                    'SinhVienID', 'UserID', 'MaSV', 'HoTen', 'NgaySinh', 'gioitinh',
                    'email', 'sodienthoai', 'NganhID', 'KhoaID', 'LopSinhHoatID', 'TinhTrang'
                ]);
            }
        ]);

        $sv = $user->sinhVien;

        if (!$sv) {
                return [
                    'success' => false,
                    'message' => 'Không tìm thấy thông tin sinh viên liên kết với tài khoản này.',
                    'user_id' => $user->UserID,
                    'username' => $user->Username
                ];
            }
        return [
            'success' => true,
            'data' => [
                'user_id'       => $user->UserID,
                'username'      => $user->Username,
                'role'          => $user->role->RoleName ?? 'sinh_vien',
                'ma_sv'         => $sv->MaSV,
                'ho_ten'        => $sv->HoTen,
            'ngay_sinh'     => $sv->NgaySinh,
            'gioi_tinh'     => $sv->gioitinh,
            'email'         => $sv->email,
            'so_dien_thoai' => $sv->sodienthoai,
            'tinh_trang'    => $sv->TinhTrang,

            'nganh' => $sv->nganh ? [
                'ma_nganh'  => $sv->nganh->MaNganh,
                'ten_nganh' => $sv->nganh->TenNganh,
                'khoa'      => $sv->nganh->khoa?->TenKhoa,
            ] : null,

            'lop_sinh_hoat' => $sv->lopSinhHoat ? [
                'ma_lop'       => $sv->lopSinhHoat->MaLop,
                'ten_lop'      => $sv->lopSinhHoat->TenLop,
                'nam_nhap_hoc' => $sv->lopSinhHoat->NamNhapHoc,
                'khoa'         => $sv->lopSinhHoat->khoa?->TenKhoa,
            ] : null,

            'co_van_hoc_tap' => $sv->lopSinhHoat?->coVanHocTap ? [
                'ho_ten'       => $sv->lopSinhHoat->coVanHocTap->HoTen,
                'hoc_vi'       => $sv->lopSinhHoat->coVanHocTap->HocVi ?? null,
                'email'        => $sv->lopSinhHoat->coVanHocTap->email,
                'so_dien_thoai'=> $sv->lopSinhHoat->coVanHocTap->sodienthoai,
                ] : null,
            ]
            ];
    }

    // Cập nhật email + số điện thoại (chỉ cho phép cập nhật ở bảng sinhvien)
    public function updateContact(User $user, array $data): array
    {
        $sv = $user->sinhVien;

        if (!$sv) {
            throw new ModelNotFoundException('Không tìm thấy thông tin sinh viên.');
        }

        $updateData = array_filter($data, fn($v) => $v !== null && $v !== '');

        if (empty($updateData)) {
            throw new \InvalidArgumentException('Không có dữ liệu cập nhật hợp lệ.');
        }

        $sv->update($updateData);

        return $sv->only(['email', 'sodienthoai']);
    }

    public function getStudyInformation(User $user): array
    {
        $user->load([
            'sinhVien' => function ($query) {
                $query->with([
                    'nganh' => fn($q) => $q->select('NganhID', 'MaNganh', 'TenNganh', 'KhoaID'),
                    'khoa'  => fn($q) => $q->select('KhoaID', 'TenKhoa'),
                    'lopSinhHoat' => function ($q) {
                        $q->with([
                            'khoa' => fn($sq) => $sq->select('KhoaID', 'TenKhoa'),
                            'coVanHocTap' => fn($sq) => $sq->select(
                                'GiangVienID', 'HoTen', 'email', 'sodienthoai', 'HocVi'
                            ),
                        ])->select(
                            'LopSinhHoatID', 'MaLop', 'TenLop', 'NamNhapHoc', 'KhoaID', 'GiangVienID'
                        );
                    }
                ])->select(
                    'SinhVienID', 'UserID', 'NganhID', 'KhoaID', 'LopSinhHoatID'
                );
            }
        ]);

        $sv = $user->sinhVien;

        if (!$sv) {
            throw new ModelNotFoundException('Không tìm thấy thông tin sinh viên.');
        }

        return [
            'nganh' => $sv->nganh ? [
                'ma_nganh'  => $sv->nganh->MaNganh,
                'ten_nganh' => $sv->nganh->TenNganh,
                'khoa'      => $sv->nganh->khoa?->TenKhoa ?? null,
            ] : null,

            'lop_sinh_hoat' => $sv->lopSinhHoat ? [
                'ma_lop'       => $sv->lopSinhHoat->MaLop,
                'ten_lop'      => $sv->lopSinhHoat->TenLop,
                'nam_nhap_hoc' => $sv->lopSinhHoat->NamNhapHoc,
                'khoa'         => $sv->lopSinhHoat->khoa?->TenKhoa ?? null,
            ] : null,

            'co_van_hoc_tap' => $sv->lopSinhHoat?->coVanHocTap ? [
                'ho_ten'       => $sv->lopSinhHoat->coVanHocTap->HoTen,
                'hoc_vi'       => $sv->lopSinhHoat->coVanHocTap->HocVi ?? null,
                'email'        => $sv->lopSinhHoat->coVanHocTap->email,
                'so_dien_thoai'=> $sv->lopSinhHoat->coVanHocTap->sodienthoai,
            ] : null,
        ];
    }
}