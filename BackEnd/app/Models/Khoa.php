<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Khoa extends Model
{
    protected $table = 'khoa';
    protected $primaryKey = 'KhoaID';
    public $timestamps = false;

    protected $fillable = [
        'MaKhoa',
        'TenKhoa',
        'DienThoai',
        'Email'
    ];

    public function nganhDaoTao()
    {
        return $this->hasMany(NganhDaoTao::class, 'KhoaID', 'KhoaID');
    }

    public function monHoc()
    {
        return $this->hasMany(MonHoc::class, 'KhoaID', 'KhoaID');
    }
}