<?php

namespace App\Services;

use App\Models\ThongBao;
use Illuminate\Support\Facades\Auth;

class ThongBaoService
{
    public function getAllThongBao()
    {
        return ThongBao::orderBy('created_at', 'desc')->get();
    }

    public function createThongBao(array $data)
    {
        $data['NguoiGuiID'] = Auth::id();
        return ThongBao::create($data);
    }
}