<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MonHoc extends Model
{
    protected $table = 'monhoc';
    protected $primaryKey = 'MonHocID';
    public $timestamps = false;

    protected $fillable = [
        'MaMon',
        'TenMon',
        'SoTinChi',
        'TietLyThuyet',
        'TietThucHanh',
        'KhoaID'
    ];

    public function chuongTrinhDaoTao()
    {
        return $this->hasMany(ChuongTrinhDaoTao::class, 'MonHocID', 'MonHocID');
    }

    public function khoa()
    {
        return $this->belongsTo(Khoa::class, 'KhoaID', 'KhoaID');
    }
    
    public function lopHocPhans()
    {
        return $this->hasMany(LopHocPhan::class, 'MonHocID', 'MonHocID');
    }

    public function monTienQuyet()
    {
        return $this->belongsToMany(MonHoc::class, 'dieukienmonhoc', 'MonHocID', 'MonTienQuyetID');
    }

    public function monSongHanh()
    {
        return $this->belongsToMany(MonHoc::class, 'monhoc_songhanh', 'MonHocID', 'MonSongHanhID');
    }
}