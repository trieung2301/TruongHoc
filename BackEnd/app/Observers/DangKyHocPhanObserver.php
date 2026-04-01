<?php

namespace App\Observers;

use App\Models\DangKyHocPhan;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Cache;

class DangKyHocPhanObserver
{
    public function created(DangKyHocPhan $dangKy)
    {
        $this->clearCacheOnly($dangKy);
    }

    public function deleted(DangKyHocPhan $dangKy)
    {
        Redis::del("truonghoc-database-lophocphan:{$dangKy->LopHocPhanID}:slots");
        $this->clearCacheOnly($dangKy);
    }

    private function clearCacheOnly(DangKyHocPhan $dangKy)
    {
        Cache::tags(['lop_mo'])->flush();
        Cache::tags(["sinhvien_dangky:{$dangKy->SinhVienID}"])->flush();
        Redis::del("registration_status:{$dangKy->SinhVienID}:{$dangKy->LopHocPhanID}");
    }
}