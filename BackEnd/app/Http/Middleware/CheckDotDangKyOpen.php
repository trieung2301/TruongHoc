<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\DotDangKy;
use App\Models\LopHocPhan;

class CheckDotDangKyOpen
{
    public function handle(Request $request, Closure $next)
    {
        $lopHocPhanId = $request->input('LopHocPhanID') 
                        ?? $request->route('lopHocPhanId') 
                        ?? $request->route('lhpID');

        $query = DotDangKy::where('TrangThai', 1)
            ->where('NgayBatDau', '<=', now())
            ->where('NgayKetThuc', '>=', now());

        if ($lopHocPhanId) {
            $lop = LopHocPhan::find($lopHocPhanId);
            if (!$lop) {
                return response()->json(['message' => 'Lớp không tồn tại'], 404);
            }
            $query->where('HocKyID', $lop->HocKyID);
        }

        if (!$query->exists()) {
            return response()->json(['message' => 'Hiện tại không trong thời gian đăng ký'], 403);
        }

        return $next($request);
    }
}