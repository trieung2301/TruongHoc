<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;
use App\Models\DangKyHocPhan;
use App\Models\LopHocPhan;
use App\Models\DotDangKy;
use App\Observers\DangKyHocPhanObserver;
use App\Observers\LopHocPhanObserver;
use App\Observers\DotDangKyObserver;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [];

    public function boot(): void
    {
        parent::boot();

        DangKyHocPhan::observe(DangKyHocPhanObserver::class);
        LopHocPhan::observe(LopHocPhanObserver::class);
        DotDangKy::observe(DotDangKyObserver::class);
    }

    public function shouldDiscoverEvents(): bool
    {
        return false;
    }
}