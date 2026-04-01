<?php

namespace App\Services\StoreProcedure;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\Facades\Cache;
use App\Models\DangKyHocPhan;
use Exception;

class HuyDangKyHocPhanService
{
    public function huyDangKy(int $dangKyID, int $sinhVienID): array
    {
        try {
            $dangKy = DangKyHocPhan::where('DangKyID', $dangKyID)->first();
            $lopHocPhanID = $dangKy ? $dangKy->LopHocPhanID : null;

            DB::statement("CALL sp_huy_dangky_hocphan(?, ?, @p_KetQua, @p_ThanhCong)", [
                $dangKyID,
                $sinhVienID
            ]);

            $result = DB::select("SELECT @p_KetQua AS ketqua, @p_ThanhCong AS thanhcong");
            $ketQua = $result[0]->ketqua ?? 'Không có phản hồi';
            $thanhCong = (isset($result[0]->thanhcong) && (int) $result[0]->thanhcong === 1);

            if ($thanhCong && $lopHocPhanID) {
                $slotsKey = "lophocphan:{$lopHocPhanID}:slots";
                
                if (Redis::exists($slotsKey)) {
                    Redis::incr($slotsKey);
                }

                if (Cache::getStore() instanceof \Illuminate\Cache\TaggableStore) {
                    Cache::tags(['lop_mo'])->flush();
                }
            }

            return [
                'success' => $thanhCong,
                'message' => $ketQua,
                'error'   => null
            ];
        } catch (Exception $e) {
            return [
                'success' => false,
                'message' => 'Lỗi khi xóa đăng ký',
                'error'   => $e->getMessage()
            ];
        }
    }
}