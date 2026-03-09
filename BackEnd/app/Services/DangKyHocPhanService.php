<?php

namespace App\Services;

use App\Models\LopHocPhan;
use App\Models\DangKyHocPhan;
use App\Models\ChuongTrinhDaoTao;
use App\Models\DotDangKy;
use App\Models\SinhVien;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class DangKyHocPhanService
{
    public function validateAll(SinhVien $sinhVien, int $lopHocPhanID): array
    {
        $lop = LopHocPhan::with([
            'monHoc.monTienQuyet',
            'monHoc.monSongHanh',
            'lichHoc',
            'lichThi',
            'hocKy'
        ])->findOrFail($lopHocPhanID);

        // 0. Kiểm tra đợt đăng ký đang mở
        $dot = DotDangKy::where('HocKyID', $lop->HocKyID)
            ->where('TrangThai', 1)
            ->first();

        if (!$dot || !$dot->isOpening()) {
            throw new Exception('Hiện tại không trong thời gian đăng ký học phần cho học kỳ này.');
        }

        // 1. Đã đăng ký môn này trong học kỳ chưa 
        if ($this->daDangKyMonTrongHocKy($sinhVien->SinhVienID, $lop->MonHocID, $lop->HocKyID)) {
            throw new Exception('Bạn đã đăng ký một lớp khác của môn học này trong học kỳ hiện tại.');
        }

        // 2. Kiểm tra sĩ số lớp
        if (!$this->checkSiSo($lop)) {
            throw new Exception('Lớp học phần đã đầy sĩ số.');
        }

        // 3. Môn tiên quyết
        if (!$this->checkMonTienQuyet($sinhVien->SinhVienID, $lop->monHoc)) {
            throw new Exception('Bạn chưa hoàn thành môn tiên quyết cho môn này.');
        }

        // 4. Môn song hành (nếu có)
        if (!$this->checkMonSongHanh($sinhVien->SinhVienID, $lop->monHoc)) {
            throw new Exception('Bạn cần đăng ký đồng thời môn song hành.');
        }

        // 5. Trùng lịch học / thi
        if ($this->checkTrungLich($sinhVien, $lop)) {
            throw new Exception('Lịch học hoặc lịch thi bị trùng với lớp đã đăng ký.');
        }

        return [
            'success' => true,
            'message' => 'Validate đăng ký thành công, có thể tiến hành đăng ký.',
        ];
    }
    private function daDangKyMonTrongHocKy(int $sinhVienID, int $monHocID, int $hocKyID): bool
    {
        try {
            return DB::table('v_dangkyhocphan_hien_tai')
                ->where('SinhVienID', $sinhVienID)
                ->where('MaMon', function ($q) use ($monHocID) {
                    $q->select('MaMon')->from('monhoc')->where('MonHocID', $monHocID);
                })
                ->exists();
        } catch (\Exception $e) {
            Log::warning("View v_dangkyhocphan_hien_tai lỗi, fallback query: " . $e->getMessage());

            return DangKyHocPhan::where('SinhVienID', $sinhVienID)
                ->whereHas('lopHocPhan', function ($q) use ($monHocID, $hocKyID) {
                    $q->where('MonHocID', $monHocID)
                      ->where('HocKyID', $hocKyID);
                })
                ->exists();
        }
    }

    private function checkSiSo(LopHocPhan $lop): bool
    {
        $daDangKy = $lop->dangKyHocPhan()->count();
        return $daDangKy < $lop->SoLuongToiDa;
    }

    private function checkMonTienQuyet(int $sinhVienID, $monHoc): bool
    {
        $tienQuyetIDs = $monHoc->monTienQuyet->pluck('MonHocID');

        if ($tienQuyetIDs->isEmpty()) {
            return true;
        }

        return DB::table('trangthai_monhoc_sinhvien')
            ->where('SinhVienID', $sinhVienID)
            ->whereIn('MonHocID', $tienQuyetIDs)
            ->where('TrangThai', 'Đã đạt')
            ->count() === $tienQuyetIDs->count();
    }

    private function checkMonSongHanh(int $sinhVienID, $monHoc): bool
    {
        $songHanhIDs = $monHoc->monSongHanh->pluck('MonHocID');

        if ($songHanhIDs->isEmpty()) {
            return true;
        }

        return DangKyHocPhan::where('SinhVienID', $sinhVienID)
            ->whereHas('lopHocPhan', fn($q) => $q->whereIn('MonHocID', $songHanhIDs))
            ->exists();
    }

    private function checkTrungLich(SinhVien $sinhVien, LopHocPhan $lopMoi): bool
    {
        $dangKyHienTai = $sinhVien->dangKyHocPhan()
            ->with(['lopHocPhan.lichHoc', 'lopHocPhan.lichThi'])
            ->get();

        foreach ($dangKyHienTai as $dk) {
            $lopCu = $dk->lopHocPhan;

            foreach ($lopMoi->lichHoc as $lhMoi) {
                foreach ($lopCu->lichHoc as $lhCu) {
                    if ($this->trungLich($lhMoi, $lhCu)) {
                        return true;
                    }
                }
            }

            foreach ($lopMoi->lichThi as $ltMoi) {
                foreach ($lopCu->lichThi as $ltCu) {
                    if ($this->trungLichThi($ltMoi, $ltCu)) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    private function trungLich($lh1, $lh2): bool
    {
        if ($lh1->NgayHoc !== $lh2->NgayHoc) {
            return false;
        }

        $tietBD1 = $lh1->TietBatDau;
        $tietKT1 = $tietBD1 + $lh1->SoTiet - 1;

        $tietBD2 = $lh2->TietBatDau;
        $tietKT2 = $tietBD2 + $lh2->SoTiet - 1;

        return !($tietKT1 < $tietBD2 || $tietKT2 < $tietBD1);
    }

    private function trungLichThi($lt1, $lt2): bool
    {
        if ($lt1->NgayThi !== $lt2->NgayThi) {
            return false;
        }

        // Mapping ca thi (giả sử ca 1: 1-3, ca 2: 4-6, ...)
        $mapping = [
            1 => ['start' => 1, 'end' => 3],
            2 => ['start' => 4, 'end' => 6],
            3 => ['start' => 7, 'end' => 9],
            4 => ['start' => 10, 'end' => 12],
        ];

        $ca1 = $this->getCaThi($lt1->GioBatDau);
        $ca2 = $this->getCaThi($lt2->GioBatDau);

        $range1 = $mapping[$ca1] ?? null;
        $range2 = $mapping[$ca2] ?? null;

        if (!$range1 || !$range2) return false;

        return !($range1['end'] < $range2['start'] || $range2['end'] < $range1['start']);
    }

    // Helper: ước lượng ca thi từ giờ bắt đầu (cần điều chỉnh theo quy định trường)
    private function getCaThi(string $gioBatDau): ?int
    {
        $hour = (int) explode(':', $gioBatDau)[0];
        if ($hour >= 7 && $hour < 10) return 1;
        if ($hour >= 10 && $hour < 13) return 2;
        if ($hour >= 13 && $hour < 16) return 3;
        if ($hour >= 16) return 4;
        return null;
    }
}