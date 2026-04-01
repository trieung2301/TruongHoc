<?php

namespace App\Observers;

use App\Models\DotDangKy;
use Illuminate\Support\Facades\Cache;

class DotDangKyObserver
{
    public function created(DotDangKy $dot)
    {
        Cache::tags(['lop_mo'])->flush();
    }

    public function updated(DotDangKy $dot)
    {
        Cache::tags(['lop_mo'])->flush();
    }

    public function deleted(DotDangKy $dot)
    {
        Cache::tags(['lop_mo'])->flush();
    }
}