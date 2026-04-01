<?php

namespace App\Observers;

use App\Models\LopHocPhan;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Cache;

class LopHocPhanObserver
{
    public function created(LopHocPhan $lop)
    {
        $this->clearLopMoCache();
    }

    public function updated(LopHocPhan $lop)
    {
        Redis::del("lophocphan:{$lop->LopHocPhanID}:slots");
        $this->clearLopMoCache();
        Cache::forget("lop_detail:{$lop->LopHocPhanID}");
    }

    public function deleted(LopHocPhan $lop)
    {
        Redis::del("lophocphan:{$lop->LopHocPhanID}:slots");
        $this->clearLopMoCache();
    }

    private function clearLopMoCache()
    {
        Cache::tags(['lop_mo'])->flush();
        Redis::del('dot_dangky_hien_tai');
    }
}