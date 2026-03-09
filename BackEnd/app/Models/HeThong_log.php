<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HeThongLog extends Model
{
    protected $table = 'hethong_log';
    protected $primaryKey = 'LogID';
    public $timestamps = true;
    const UPDATED_AT = null;

    protected $fillable = [
        'UserID',
        'HanhDong',
        'MoTa',
        'BangLienQuan',
        'IDBanGhi',
        'IP',
        'UserAgent'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'UserID', 'id');
    }
}