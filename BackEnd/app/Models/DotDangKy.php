<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class DotDangKy extends Model
{
    protected $table = 'dotdangky';
    protected $primaryKey = 'DotDangKyID';
    public $timestamps = true;

    protected $fillable = [
        'HocKyID',
        'TenDot',
        'NgayBatDau',
        'NgayKetThuc',
        'TrangThai',
        'DoiTuong',
        'GhiChu'
    ];

    private function checkThoiGianDangKy($hocKyID) {
        $dot = DotDangKy::where('HocKyID', $hocKyID)
                        ->where('TrangThai', 1)
                        ->first();
        return $dot && $dot->isOpening();
    }

    public function isOpening(): bool
    {
        if ($this->TrangThai !== 1) {
            return false;
        }

        $now = now();

        return $this->NgayBatDau <= $now && $this->NgayKetThuc >= $now;
    }
}