-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2026 at 12:07 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `truonghoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_nguyen_vong`
--

CREATE TABLE `chi_tiet_nguyen_vong` (
  `ChiTietID` bigint(20) UNSIGNED NOT NULL,
  `NhomID` bigint(20) UNSIGNED NOT NULL,
  `SinhVienID` bigint(20) UNSIGNED NOT NULL,
  `NgayDangKy` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chi_tiet_nguyen_vong`
--

INSERT INTO `chi_tiet_nguyen_vong` (`ChiTietID`, `NhomID`, `SinhVienID`, `NgayDangKy`) VALUES
(3, 2, 3, '2026-04-04 09:17:33'),
(4, 3, 2, '2026-04-04 09:17:33'),
(5, 4, 105, '2026-04-04 09:17:33'),
(6, 1, 4, '2026-04-04 09:31:49'),
(14, 1, 1, '2026-04-04 11:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `phieu_nguyen_vong_nhom`
--

CREATE TABLE `phieu_nguyen_vong_nhom` (
  `NhomID` bigint(20) UNSIGNED NOT NULL,
  `MonHocID` int(10) UNSIGNED NOT NULL,
  `HocKyID` int(10) UNSIGNED NOT NULL,
  `Thu` int(11) NOT NULL,
  `BuoiHoc` enum('Sáng','Chiều','Tối') NOT NULL,
  `SoLuongHienTai` int(11) DEFAULT 0,
  `TrangThai` enum('Đang gom','Đã mở lớp','Hủy bỏ') DEFAULT 'Đang gom',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phieu_nguyen_vong_nhom`
--

INSERT INTO `phieu_nguyen_vong_nhom` (`NhomID`, `MonHocID`, `HocKyID`, `Thu`, `BuoiHoc`, `SoLuongHienTai`, `TrangThai`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'Sáng', 2, 'Đã mở lớp', '2026-04-04 03:54:57', '2026-04-04 04:24:47'),
(2, 1, 1, 5, 'Chiều', 1, 'Đang gom', '2026-04-04 09:17:22', '2026-04-04 09:17:22'),
(3, 1, 1, 3, 'Sáng', 2, 'Đang gom', '2026-04-04 09:17:22', '2026-04-04 04:11:01'),
(4, 3, 1, 4, 'Tối', 1, 'Đang gom', '2026-04-04 09:17:22', '2026-04-04 09:17:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chi_tiet_nguyen_vong`
--
ALTER TABLE `chi_tiet_nguyen_vong`
  ADD PRIMARY KEY (`ChiTietID`),
  ADD UNIQUE KEY `uk_sv_nhom_don` (`NhomID`,`SinhVienID`);

--
-- Indexes for table `phieu_nguyen_vong_nhom`
--
ALTER TABLE `phieu_nguyen_vong_nhom`
  ADD PRIMARY KEY (`NhomID`),
  ADD UNIQUE KEY `uk_mon_hk_lich` (`MonHocID`,`HocKyID`,`Thu`,`BuoiHoc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chi_tiet_nguyen_vong`
--
ALTER TABLE `chi_tiet_nguyen_vong`
  MODIFY `ChiTietID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `phieu_nguyen_vong_nhom`
--
ALTER TABLE `phieu_nguyen_vong_nhom`
  MODIFY `NhomID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
