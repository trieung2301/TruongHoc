<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\SinhVien\ProfileController as SinhVienProfile;
use App\Http\Controllers\Api\SinhVien\ChuongTrinhDaoTaoController;
use App\Http\Controllers\Api\SinhVien\LichHocController;
use App\Http\Controllers\Api\SinhVien\LichThiController;
use App\Http\Controllers\Api\SinhVien\KetQuaHocTapController;
use App\Http\Controllers\Api\SinhVien\DangKyHocPhanController;
use App\Http\Controllers\Api\LopHocPhanController;
use App\Http\Controllers\Api\GiangVien\ProfileController as GiangVienProfile;
use App\Http\Controllers\Api\GiangVien\LopHocPhanGiangVienController;
use App\Http\Controllers\Api\GiangVien\LichGiangDayController;
use App\Http\Controllers\Api\GiangVien\LichCoiThiController;
use App\Http\Controllers\Api\GiangVien\LopSinhHoatCoVanController;

Route::post('/login', [AuthController::class, 'login']);

// Tất cả các đều yêu cầu Đăng nhập và Tài khoản phải đang Active
Route::middleware(['auth:api', \App\Http\Middleware\CheckActiveUser::class])->group(function () {

    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    Route::post('/change-password', [AuthController::class, 'changePassword']);
    Route::post('/reset-password', [AuthController::class, 'resetPassword']);

    // --- SINH VIÊN ---
    Route::middleware(['auth:api', 'check.active', 'check.sinhvien']) ->prefix('sinh-vien') ->group(function () {
        Route::get('profile', [SinhVienProfile::class, 'show']);
        Route::put('profile/contact', [SinhVienProfile::class, 'updateContact']);
        Route::get('study-info', [SinhVienProfile::class, 'studyInfo']);
        Route::get('chuong-trinh-dao-tao', [ChuongTrinhDaoTaoController::class, 'getChuongTrinh']);
        Route::get('mon-da-hoan-thanh', [ChuongTrinhDaoTaoController::class, 'getMonDaHoanThanh']);
        Route::get('mon-con-thieu', [ChuongTrinhDaoTaoController::class, 'getMonConThieu']);
        Route::get('loc-hoc-ky', [LichHocController::class, 'getBoLocHocKy']);
        Route::get('lich-hoc', [LichHocController::class, 'xemLichHoc']);
        Route::get('lich-thi', [LichThiController::class, 'xemLichThi']);
        Route::post('ket-qua-hoc-tap', [KetQuaHocTapController::class, 'xemKetQua']);
        // Đăng ký học phần (Sử dụng Redis Queue)
        Route::get('lop-hoc-phan-mo', [DangKyHocPhanController::class, 'getLopMo']);
        Route::post('dang-ky', [DangKyHocPhanController::class, 'dangKy']);
        Route::get('da-dang-ky', [DangKyHocPhanController::class, 'getDaDangKy']);
        Route::get('check-status/{lhpID}', [DangKyHocPhanController::class, 'checkStatus']);
    });

    // --- GIẢNG VIÊN ---
    Route::middleware(\App\Http\Middleware\CheckGiangVien::class)->prefix('giang-vien')->group(function () {
        // Profile & Account
        Route::get('profile', [GiangVienProfile::class, 'show']);
        Route::put('profile/update', [GiangVienProfile::class, 'update']);
        Route::post('/change-password', [GiangVienProfile::class, 'changePassword']);
        
        // Lớp học phần & Sinh viên
        Route::get('lop-hoc-phan', [LopHocPhanController::class, 'index']);
        Route::get('lop-hoc-phan/{id}/sinh-vien', [LopHocPhanController::class, 'showSinhVien']);
        Route::get('lop-hoc-phan/{id}/print', [LopHocPhanController::class, 'exportPrintData']);
        
        // Phân công & Lịch dạy
        Route::get('lop-phan-cong', [LopHocPhanGiangVienController::class, 'getLopPhanCong']);
        Route::post('lop/sinh-vien', [LopHocPhanGiangVienController::class, 'getSinhVienTrongLop']);
        Route::get('lich-giang-day', [LichGiangDayController::class, 'getLichGiangDay']);
        Route::get('lich-coi-thi', [LichCoiThiController::class, 'getLichCoiThi']);
        Route::get('lop-hoc-phan/sinh-vien', [LopHocPhanGiangVienController::class, 'getSinhVienTrongLop']);

        Route::post('nhap-diem', [LopHocPhanGiangVienController::class, 'updateDiem']);
        // Xuất Excel mẫu để nhập điểm
        Route::get('lop-hoc-phan/{id}/export-diem', [LopHocPhanGiangVienController::class, 'exportDiemTemplate']);
        // Import điểm từ Excel
        Route::post('lop-hoc-phan/{id}/import-diem', [LopHocPhanGiangVienController::class, 'importDiemFromExcel']);
    
        Route::get('lop-sinh-hoat/phan-cong', [LopSinhHoatCoVanController::class, 'getLopPhanCong']);
        Route::post('lop-sinh-hoat/sinh-vien', [LopSinhHoatCoVanController::class, 'getSinhVienTrongLop']);
        Route::post('lop-sinh-hoat/diem-ren-luyen', [LopSinhHoatCoVanController::class, 'getDiemRenLuyen']);
        Route::post('lop-sinh-hoat/cap-nhat-diem-ren-luyen', [LopSinhHoatCoVanController::class, 'capNhatDiemRenLuyen']);
    });

});