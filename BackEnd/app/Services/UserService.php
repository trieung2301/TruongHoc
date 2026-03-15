<?php

namespace App\Services;

use App\Models\User;
use App\Models\SinhVien;
use App\Models\GiangVien;
use App\Models\Admin;
use App\Services\LogService;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserService
{
    protected $logService;

    public function __construct(LogService $logService) {
        $this->logService = $logService;
    }

    public function getSinhVienList(array $filters)
    {
        $query = SinhVien::with(['user', 'khoa', 'nganh']);

        if (!empty($filters['KhoaID'])) {
            $query->where('KhoaID', $filters['KhoaID']);
        }

        if (!empty($filters['NganhID'])) {
            $query->where('NganhID', $filters['NganhID']);
        }

        if (!empty($filters['khoahoc'])) {
            $query->where('khoahoc', 'LIKE', '%' . $filters['khoahoc'] . '%');
        }

        if (!empty($filters['search'])) {
            $query->where(function ($q) use ($filters) {
                $q->where('HoTen', 'LIKE', '%' . $filters['search'] . '%')
                  ->orWhere('MaSV', 'LIKE', '%' . $filters['search'] . '%');
            });
        }

        return $query->orderBy('SinhVienID', 'desc')->paginate(15);
    }

    public function getStaffList(array $filters)
    {
        $roleId = $filters['RoleID'];

        if ($roleId == 2) {
            $query = GiangVien::with(['user', 'khoa']);
        } else {
            $query = Admin::with(['user']);
        }

        if (!empty($filters['search'])) {
            $query->where('HoTen', 'LIKE', '%' . $filters['search'] . '%');
        }

        return $query->orderBy('created_at', 'desc')->paginate(15);
    }

    public function createSinhVienWithAccount(array $data)
    {
        return DB::transaction(function () use ($data) {
            $password = !empty($data['sodienthoai']) ? $data['sodienthoai'] : '123456';

            $user = User::create([
                'Username'     => $data['MaSV'],
                'PasswordHash' => Hash::make($password),
                'RoleID'       => 3,
                'is_active'    => true
            ]);

            $sinhVien = SinhVien::create([
                'UserID'        => $user->UserID,
                'MaSV'          => $data['MaSV'],
                'HoTen'         => $data['HoTen'],
                'khoahoc'       => $data['khoahoc'],
                'KhoaID'        => $data['KhoaID'],
                'NganhID'       => $data['NganhID'],
                'email'         => $data['email'] ?? null,
                'sodienthoai'   => $data['sodienthoai'] ?? null,
                'TinhTrang'     => 'DangHoc'
            ]);
            $this->logService->write(
                'CREATE_USER', 
                "Tạo tài khoản và profile cho SV: {$sinhVien->HoTen} (MSV: {$sinhVien->MaSV})", 
                'sinhvien', 
                $sinhVien->SinhVienID
            );

            return $sinhVien;
        });
    }

    public function createStaffProfile(array $data, $roleId)
    {
        if ($roleId == 2) {
            return GiangVien::create($data);
        } elseif ($roleId == 1) {
            return Admin::create($data);
        }
        throw new \Exception("INVALID_ROLE");
    }

    public function createAccountForExistingStaff(array $data)
    {
        return DB::transaction(function () use ($data) {
            $user = User::create([
                'Username'     => $data['username'],
                'PasswordHash' => Hash::make($data['password']),
                'RoleID'       => $data['RoleID'],
                'is_active'    => true
            ]);

            if ($data['RoleID'] == 2) {
                GiangVien::where('GiangVienID', $data['StaffID'])->update(['UserID' => $user->UserID]);
            } else {
                Admin::where('AdminID', $data['StaffID'])->update(['UserID' => $user->UserID]);
            }

            return $user;
        });
    }

    public function resetPassword($userId)
    {
        $user = User::findOrFail($userId);
        $user->PasswordHash = Hash::make('123456');
        $user->save();
        return $user;
    }

    public function updateUserStatus($userId)
    {
        $user = User::findOrFail($userId);
        $user->is_active = !$user->is_active;
        $user->save();
        return $user;
    }
}