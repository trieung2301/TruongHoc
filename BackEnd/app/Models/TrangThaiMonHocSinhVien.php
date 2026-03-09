<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TrangThaiMonHocSinhVien extends Model
{
    protected $table = 'trangthai_monhoc_sinhvien';
    protected $primaryKey = 'ID';
    public $timestamps = true;

    protected $fillable = [
        'SinhVienID',
        'MonHocID',
        'HocKyHoanThanh',
        'TrangThai',
        'DiemTongKet',
        'LanThi',
        'GhiChu'
    ];

    public function sinhVien()
    {
        return $this->belongsTo(SinhVien::class, 'SinhVienID', 'SinhVienID');
    }

    public function monHoc()
    {
        return $this->belongsTo(MonHoc::class, 'MonHocID', 'MonHocID');
    }

    // Scope kiểm tra xem sinh viên đã qua môn chưa
    public function scopePassed($query)
    {
        return $query->where('TrangThai', 'Đã đạt');
    }
}