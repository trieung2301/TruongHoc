<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DieuKienMonHoc extends Model
{
    protected $table = 'dieukienmonhoc';
    protected $primaryKey = 'DieuKienID';
    public $timestamps = false;

    protected $fillable = [
        'MonHocID',
        'MonTienQuyetID'
    ];

    public function monHocChinh()
    {
        return $this->belongsTo(MonHoc::class, 'MonHocID', 'MonHocID');
    }

    public function monTienQuyet()
    {
        return $this->belongsTo(MonHoc::class, 'MonTienQuyetID', 'MonHocID');
    }
}