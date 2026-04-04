<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ChiTietNguyenVong extends Model
{
    protected $table = 'chi_tiet_nguyen_vong';
    protected $primaryKey = 'ChiTietID';
    public $timestamps = false;

    protected $fillable = ['NhomID', 'SinhVienID'];

    public function nhom()
    {
        return $this->belongsTo(NhomNguyenVong::class, 'NhomID', 'NhomID');
    }

    public function sinhVien()
    {
        return $this->belongsTo(SinhVien::class, 'SinhVienID', 'SinhVienID');
    }
}