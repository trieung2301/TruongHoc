-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: TruongHoc
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `HoTen` varchar(100) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `UserID` (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `SoDienThoai` (`SoDienThoai`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (3,1,'Nguyễn Văn Quản Trị',NULL,NULL,'2026-02-24 08:30:01');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-3425UdiZZJi4yfJq','s:7:\"forever\";',2088977835),('laravel-cache-illuminate:queue:restart','i:1772849959;',2088209959),('laravel-cache-OF2kvhmNo6GHHLz8','s:7:\"forever\";',2088977998);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdiemrenluyen`
--

DROP TABLE IF EXISTS `chitietdiemrenluyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitietdiemrenluyen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DiemRenLuyenID` int(11) NOT NULL,
  `TieuChiID` int(11) NOT NULL,
  `DiemDatDuoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DiemRenLuyenID` (`DiemRenLuyenID`,`TieuChiID`),
  KEY `TieuChiID` (`TieuChiID`),
  CONSTRAINT `chitietdiemrenluyen_ibfk_1` FOREIGN KEY (`DiemRenLuyenID`) REFERENCES `diemrenluyen` (`DiemRenLuyenID`) ON DELETE CASCADE,
  CONSTRAINT `chitietdiemrenluyen_ibfk_2` FOREIGN KEY (`TieuChiID`) REFERENCES `tieuchirenluyen` (`TieuChiID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdiemrenluyen`
--

LOCK TABLES `chitietdiemrenluyen` WRITE;
/*!40000 ALTER TABLE `chitietdiemrenluyen` DISABLE KEYS */;
INSERT INTO `chitietdiemrenluyen` VALUES (11,1,1,18),(12,1,2,19),(13,1,3,23),(14,1,4,18),(15,1,5,14);
/*!40000 ALTER TABLE `chitietdiemrenluyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuongtrinhdaotao`
--

DROP TABLE IF EXISTS `chuongtrinhdaotao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chuongtrinhdaotao` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NganhID` int(11) NOT NULL,
  `MonHocID` int(11) NOT NULL,
  `HocKyGoiY` int(11) DEFAULT NULL,
  `BatBuoc` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NganhID` (`NganhID`,`MonHocID`),
  KEY `MonHocID` (`MonHocID`),
  CONSTRAINT `chuongtrinhdaotao_ibfk_1` FOREIGN KEY (`NganhID`) REFERENCES `nganhdaotao` (`NganhID`) ON DELETE CASCADE,
  CONSTRAINT `chuongtrinhdaotao_ibfk_2` FOREIGN KEY (`MonHocID`) REFERENCES `monhoc` (`MonHocID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuongtrinhdaotao`
--

LOCK TABLES `chuongtrinhdaotao` WRITE;
/*!40000 ALTER TABLE `chuongtrinhdaotao` DISABLE KEYS */;
INSERT INTO `chuongtrinhdaotao` VALUES (1,1,1,4,0),(2,1,2,1,1),(6,1,6,3,1),(7,2,1,1,1),(8,2,2,1,1),(9,2,3,2,1),(10,2,6,2,1),(11,3,7,1,1),(12,3,8,1,1),(13,3,9,2,1),(14,3,10,2,1),(15,4,7,1,1),(16,4,11,1,1),(17,4,12,2,1),(18,1,5,3,1),(19,1,3,2,1),(20,1,4,2,1);
/*!40000 ALTER TABLE `chuongtrinhdaotao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dangkyhocphan`
--

DROP TABLE IF EXISTS `dangkyhocphan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dangkyhocphan` (
  `DangKyID` int(11) NOT NULL AUTO_INCREMENT,
  `SinhVienID` int(11) DEFAULT NULL,
  `LopHocPhanID` int(11) DEFAULT NULL,
  `ThoiGianDangKy` datetime DEFAULT current_timestamp(),
  `TrangThai` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DangKyID`),
  UNIQUE KEY `SinhVienID` (`SinhVienID`,`LopHocPhanID`),
  KEY `LopHocPhanID` (`LopHocPhanID`),
  CONSTRAINT `dangkyhocphan_ibfk_1` FOREIGN KEY (`SinhVienID`) REFERENCES `sinhvien` (`SinhVienID`),
  CONSTRAINT `dangkyhocphan_ibfk_2` FOREIGN KEY (`LopHocPhanID`) REFERENCES `lophocphan` (`LopHocPhanID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dangkyhocphan`
--

LOCK TABLES `dangkyhocphan` WRITE;
/*!40000 ALTER TABLE `dangkyhocphan` DISABLE KEYS */;
INSERT INTO `dangkyhocphan` VALUES (1,1,1,'2026-02-24 10:34:29','DaDangKy'),(2,1,2,'2026-02-24 10:34:29','DaDangKy'),(3,2,1,'2026-02-24 10:34:29','DaDangKy'),(4,2,2,'2026-02-24 10:34:29','DaDangKy'),(5,3,1,'2026-02-24 10:34:29','DaDangKy'),(6,4,3,'2026-02-24 10:34:29','DaDangKy'),(7,4,4,'2026-02-24 10:34:29','DaDangKy'),(8,5,3,'2026-02-24 10:34:29','DaDangKy'),(9,6,3,'2026-02-24 10:34:29','DaDangKy'),(54,1,11,'2026-03-31 22:41:11','DaDangKy');
/*!40000 ALTER TABLE `dangkyhocphan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_after_insert_dangkyhocphan
AFTER INSERT ON dangkyhocphan
FOR EACH ROW
BEGIN
    IF NEW.TrangThai = 'ThanhCong' THEN
        INSERT INTO hethong_log (
            UserID, 
            HanhDong, 
            MoTa, 
            BangLienQuan, 
            IDBanGhi, 
            created_at
        )
        VALUES (
            NULL,  -- lấy từ session backend
            'DangKyHocPhanMoi',
            CONCAT('Đăng ký học phần thành công - SV: ', NEW.SinhVienID, ' - Lớp HP: ', NEW.LopHocPhanID),
            'dangkyhocphan',
            NEW.DangKyID,
            CURRENT_TIMESTAMP
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_after_update_dangkyhocphan_huy
AFTER UPDATE ON dangkyhocphan
FOR EACH ROW
BEGIN
    IF NEW.TrangThai = 'Huy' AND OLD.TrangThai = 'ThanhCong' THEN
        INSERT INTO hethong_log (
            UserID, 
            HanhDong, 
            MoTa, 
            BangLienQuan, 
            IDBanGhi, 
            created_at
        )
        VALUES (
            NULL,  -- nếu không biết user nào hủy, để NULL hoặc lấy từ session ở backend
            'HuyDangKyHocPhan',
            CONCAT('Hủy đăng ký học phần ID: ', OLD.DangKyID, ' - Sinh viên: ', OLD.SinhVienID),
            'dangkyhocphan',
            OLD.DangKyID,
            CURRENT_TIMESTAMP
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `diemrenluyen`
--

DROP TABLE IF EXISTS `diemrenluyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diemrenluyen` (
  `DiemRenLuyenID` int(11) NOT NULL AUTO_INCREMENT,
  `SinhVienID` int(11) NOT NULL,
  `HocKyID` int(11) NOT NULL,
  `TongDiem` int(11) DEFAULT NULL,
  `XepLoai` varchar(50) DEFAULT NULL,
  `NgayDanhGia` date DEFAULT NULL,
  PRIMARY KEY (`DiemRenLuyenID`),
  UNIQUE KEY `SinhVienID` (`SinhVienID`,`HocKyID`),
  KEY `HocKyID` (`HocKyID`),
  CONSTRAINT `diemrenluyen_ibfk_1` FOREIGN KEY (`SinhVienID`) REFERENCES `sinhvien` (`SinhVienID`) ON DELETE CASCADE,
  CONSTRAINT `diemrenluyen_ibfk_2` FOREIGN KEY (`HocKyID`) REFERENCES `hocky` (`HocKyID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diemrenluyen`
--

LOCK TABLES `diemrenluyen` WRITE;
/*!40000 ALTER TABLE `diemrenluyen` DISABLE KEYS */;
INSERT INTO `diemrenluyen` VALUES (1,1,1,85,'Tốt','2026-03-15'),(2,2,1,72,'Khá','2026-03-15'),(3,3,1,78,'Kha','2025-01-10'),(4,4,1,88,'Tot','2025-01-10'),(5,5,1,70,'Kha','2025-01-10'),(6,6,1,60,'TrungBinh','2025-01-10');
/*!40000 ALTER TABLE `diemrenluyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diemso`
--

DROP TABLE IF EXISTS `diemso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diemso` (
  `DiemID` int(11) NOT NULL AUTO_INCREMENT,
  `DangKyID` int(11) DEFAULT NULL,
  `DiemChuyenCan` decimal(4,2) DEFAULT NULL,
  `DiemGiuaKy` decimal(4,2) DEFAULT NULL,
  `DiemThi` decimal(4,2) DEFAULT NULL,
  `DiemTongKet` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`DiemID`),
  UNIQUE KEY `DangKyID` (`DangKyID`),
  CONSTRAINT `diemso_ibfk_1` FOREIGN KEY (`DangKyID`) REFERENCES `dangkyhocphan` (`DangKyID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diemso`
--

LOCK TABLES `diemso` WRITE;
/*!40000 ALTER TABLE `diemso` DISABLE KEYS */;
INSERT INTO `diemso` VALUES (2,1,10.00,8.50,7.00,8.05),(4,2,9.00,7.00,6.50,7.15);
/*!40000 ALTER TABLE `diemso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieukienmonhoc`
--

DROP TABLE IF EXISTS `dieukienmonhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dieukienmonhoc` (
  `DieuKienID` int(11) NOT NULL AUTO_INCREMENT,
  `MonHocID` int(11) NOT NULL,
  `MonTienQuyetID` int(11) NOT NULL,
  PRIMARY KEY (`DieuKienID`),
  KEY `MonHocID` (`MonHocID`),
  KEY `MonTienQuyetID` (`MonTienQuyetID`),
  CONSTRAINT `dieukienmonhoc_ibfk_1` FOREIGN KEY (`MonHocID`) REFERENCES `monhoc` (`MonHocID`) ON DELETE CASCADE,
  CONSTRAINT `dieukienmonhoc_ibfk_2` FOREIGN KEY (`MonTienQuyetID`) REFERENCES `monhoc` (`MonHocID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieukienmonhoc`
--

LOCK TABLES `dieukienmonhoc` WRITE;
/*!40000 ALTER TABLE `dieukienmonhoc` DISABLE KEYS */;
INSERT INTO `dieukienmonhoc` VALUES (1,3,1),(2,4,3),(3,5,2),(4,2,1),(5,12,11),(6,10,1),(7,15,16);
/*!40000 ALTER TABLE `dieukienmonhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dotdangky`
--

DROP TABLE IF EXISTS `dotdangky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dotdangky` (
  `DotDangKyID` int(11) NOT NULL AUTO_INCREMENT,
  `HocKyID` int(11) NOT NULL,
  `TenDot` varchar(100) NOT NULL,
  `NgayBatDau` datetime NOT NULL,
  `NgayKetThuc` datetime NOT NULL,
  `TrangThai` tinyint(4) DEFAULT 1,
  `DoiTuong` varchar(255) DEFAULT NULL,
  `GhiChu` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`DotDangKyID`),
  KEY `HocKyID` (`HocKyID`),
  CONSTRAINT `dotdangky_ibfk_1` FOREIGN KEY (`HocKyID`) REFERENCES `hocky` (`HocKyID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dotdangky`
--

LOCK TABLES `dotdangky` WRITE;
/*!40000 ALTER TABLE `dotdangky` DISABLE KEYS */;
INSERT INTO `dotdangky` VALUES (11,11,'Đợt đăng ký học kỳ 1 - Lần 2','2024-07-01 07:30:00','2028-07-12 17:00:00',1,NULL,NULL,'2026-03-04 09:12:29','2026-03-13 10:02:41'),(12,11,'Đợt đăng ký Học kỳ 1','2026-03-15 08:00:00','2026-03-30 23:59:59',1,NULL,NULL,'2026-03-12 23:55:08','2026-03-12 23:55:08'),(13,11,'Đợt đăng ký Học kỳ 1','2024-06-01 08:00:00','2024-06-15 23:59:59',0,NULL,NULL,'2026-03-13 00:02:28','2026-03-13 00:02:28');
/*!40000 ALTER TABLE `dotdangky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
INSERT INTO `failed_jobs` VALUES (1,'0458ebab-a265-446f-80a0-9ed550705bd5','redis','registration','{\"uuid\":\"0458ebab-a265-446f-80a0-9ed550705bd5\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":2:{s:7:\\\"\\u0000*\\u0000svID\\\";i:1;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772846767,\"id\":\"t6b0xV0j3qoCVR0R2ScftczuFSzYJaVg\",\"attempts\":0,\"delay\":null}','Illuminate\\Database\\Eloquent\\ModelNotFoundException: No query results for model [App\\Models\\LopHocPhan]. in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php:630\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(49): Illuminate\\Database\\Eloquent\\Builder->findOrFail(NULL)\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#4 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#38 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#39 {main}','2026-03-06 18:39:15'),(2,'3e4dc102-8d88-41c4-b7d1-d345c4bf1c51','redis','registration','{\"uuid\":\"3e4dc102-8d88-41c4-b7d1-d345c4bf1c51\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10,30\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772847173,\"id\":\"wvTQkHBZU3iN2sw59kMYgpnXA8p7QJqq\",\"attempts\":0,\"delay\":null}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `TrangThai`) values (1, 11, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 18:39:17'),(3,'ff38c88d-417f-477f-93ad-e5007955543a','redis','registration','{\"uuid\":\"ff38c88d-417f-477f-93ad-e5007955543a\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10,30\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772847565,\"id\":\"uSjnIVmJr8vgo4VnSjHOicCwr2BcZB2L\",\"attempts\":0,\"delay\":null}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `TrangThai`) values (1, 11, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 18:39:26'),(4,'156a7d62-1bc4-411f-b0be-85251476c2ac','redis','registration','{\"uuid\":\"156a7d62-1bc4-411f-b0be-85251476c2ac\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10,30\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772847692,\"id\":\"lOAXO4zOooUhSIgub3m5YP2sxOgtgQi9\",\"attempts\":0,\"delay\":null}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `TrangThai`) values (1, 11, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 18:41:34'),(5,'9775f144-0315-4121-91ba-22713e398cf9','redis','registration','{\"uuid\":\"9775f144-0315-4121-91ba-22713e398cf9\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10,30\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772848258,\"id\":\"qKiRMty0TZT8J2VJ2BM9XPP7Qwz4Tny0\",\"attempts\":0,\"delay\":null}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `TrangThai`) values (1, 11, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 18:51:00'),(6,'d8fad866-3def-41db-831b-b76900c1e460','redis','registration','{\"uuid\":\"d8fad866-3def-41db-831b-b76900c1e460\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10,30\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772848371,\"id\":\"Bqfg9GgKAzRcE7eG1mvy52OXemT6JQlU\",\"attempts\":0,\"delay\":null}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `TrangThai`) values (1, 11, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 18:52:52'),(7,'dc3ff8ee-9e36-4c1e-b406-c09a2614374f','redis','registration','{\"uuid\":\"dc3ff8ee-9e36-4c1e-b406-c09a2614374f\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10,30\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772848589,\"id\":\"gf0svBWhb2ntMxNNJDGC6K6jpxl3lgul\",\"attempts\":0,\"delay\":null}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `TrangThai`) values (1, 11, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 18:56:30'),(8,'90055802-4932-4f27-a490-e33a9e185695','redis','registration','{\"uuid\":\"90055802-4932-4f27-a490-e33a9e185695\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":\"10,30\",\"timeout\":60,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"batchId\":null},\"createdAt\":1772848741,\"id\":\"7Dtiyf2UUbzVcUajvXR003V4rkW6djYh\",\"attempts\":0,\"delay\":null}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `TrangThai`) values (1, 11, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(73): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(47): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 18:59:04'),(9,'36b49470-307a-4e34-b110-44bb2891a03c','redis','registration','{\"uuid\":\"36b49470-307a-4e34-b110-44bb2891a03c\",\"timeout\":60,\"id\":\"NTLgA8mSAtNRAjuZBOfVkIDzZDGOBU4W\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"backoff\":\"10,30\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"createdAt\":1772848769,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"data\":{\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"batchId\":null},\"delay\":null,\"attempts\":2}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `ThoiGianDangKy`, `TrangThai`) values (1, 11, 2026-03-07 02:00:10, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 19:00:10'),(10,'ed301eea-2ba8-4115-a3a7-70725162db56','redis','registration','{\"uuid\":\"ed301eea-2ba8-4115-a3a7-70725162db56\",\"timeout\":60,\"id\":\"ZLbyUMkrcgqrEdpKZKmzLJEJT3tEYx9D\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"backoff\":\"10,30\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"createdAt\":1772848935,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"data\":{\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"batchId\":null},\"delay\":null,\"attempts\":2}','PDOException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\QueryException: SQLSTATE[01000]: Warning: 1265 Data truncated for column \'TrangThai\' at row 1 (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `ThoiGianDangKy`, `TrangThai`) values (1, 11, 2026-03-07 02:03:00, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 19:03:01'),(11,'4ab50300-e58f-4646-9372-ffcbb3674f36','redis','registration','{\"uuid\":\"4ab50300-e58f-4646-9372-ffcbb3674f36\",\"timeout\":60,\"id\":\"bSWXxStcQ7Aep1Gx9Q2w8Gm5bLro4Tjn\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"backoff\":\"10,30\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"createdAt\":1772849066,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"data\":{\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"batchId\":null},\"delay\":null,\"attempts\":2}','PDOException: SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-11\' for key \'SinhVienID\' in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\UniqueConstraintViolationException: SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-11\' for key \'SinhVienID\' (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `ThoiGianDangKy`, `TrangThai`) values (1, 11, 2026-03-07 02:05:13, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 19:05:13'),(12,'535a9b2c-14f2-4301-8d77-7c2e8d6ea3c1','redis','registration','{\"uuid\":\"535a9b2c-14f2-4301-8d77-7c2e8d6ea3c1\",\"timeout\":60,\"id\":\"7AgnziP4lPj9hLgPF4Ja1CakA3NHRabu\",\"displayName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"backoff\":\"10,30\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":3,\"createdAt\":1772849152,\"failOnTimeout\":false,\"maxExceptions\":null,\"retryUntil\":null,\"data\":{\"command\":\"O:29:\\\"App\\\\Jobs\\\\ProcessDangKyHocPhan\\\":3:{s:10:\\\"sinhVienID\\\";i:1;s:12:\\\"lopHocPhanID\\\";i:11;s:5:\\\"queue\\\";s:12:\\\"registration\\\";}\",\"commandName\":\"App\\\\Jobs\\\\ProcessDangKyHocPhan\",\"batchId\":null},\"delay\":null,\"attempts\":2}','PDOException: SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-11\' for key \'SinhVienID\' in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php:53\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(53): PDOStatement->execute()\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(827): Illuminate\\Database\\MySqlConnection->Illuminate\\Database\\{closure}(\'insert into `da...\', Array)\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#14 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#16 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#18 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#20 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#45 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#53 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#54 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#55 {main}\n\nNext Illuminate\\Database\\UniqueConstraintViolationException: SQLSTATE[23000]: Integrity constraint violation: 1062 Duplicate entry \'1-11\' for key \'SinhVienID\' (Connection: mysql, Host: 127.0.0.1, Port: 3306, Database: TruongHoc, SQL: insert into `dangkyhocphan` (`SinhVienID`, `LopHocPhanID`, `ThoiGianDangKy`, `TrangThai`) values (1, 11, 2026-03-07 02:06:37, DaDangKy)) in E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php:838\nStack trace:\n#0 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Connection.php(794): Illuminate\\Database\\Connection->runQueryCallback(\'insert into `da...\', Array, Object(Closure))\n#1 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\MySqlConnection.php(42): Illuminate\\Database\\Connection->run(\'insert into `da...\', Array, Object(Closure))\n#2 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Processors\\MySqlProcessor.php(35): Illuminate\\Database\\MySqlConnection->insert(\'insert into `da...\', Array, \'DangKyID\')\n#3 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Query\\Builder.php(4140): Illuminate\\Database\\Query\\Processors\\MySqlProcessor->processInsertGetId(Object(Illuminate\\Database\\Query\\Builder), \'insert into `da...\', Array, \'DangKyID\')\n#4 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(2235): Illuminate\\Database\\Query\\Builder->insertGetId(Array, \'DangKyID\')\n#5 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1436): Illuminate\\Database\\Eloquent\\Builder->__call(\'insertGetId\', Array)\n#6 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1401): Illuminate\\Database\\Eloquent\\Model->insertAndSetId(Object(Illuminate\\Database\\Eloquent\\Builder), Array)\n#7 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(1240): Illuminate\\Database\\Eloquent\\Model->performInsert(Object(Illuminate\\Database\\Eloquent\\Builder))\n#8 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1219): Illuminate\\Database\\Eloquent\\Model->save()\n#9 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\helpers.php(388): Illuminate\\Database\\Eloquent\\Builder->Illuminate\\Database\\Eloquent\\{closure}(Object(App\\Models\\DangKyHocPhan))\n#10 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Builder.php(1218): tap(Object(App\\Models\\DangKyHocPhan), Object(Closure))\n#11 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(23): Illuminate\\Database\\Eloquent\\Builder->create(Array)\n#12 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2540): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'create\', Array)\n#13 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2556): Illuminate\\Database\\Eloquent\\Model->__call(\'create\', Array)\n#14 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(67): Illuminate\\Database\\Eloquent\\Model::__callStatic(\'create\', Array)\n#15 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): App\\Jobs\\ProcessDangKyHocPhan->App\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#16 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\DatabaseManager.php(491): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#17 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Facades\\Facade.php(363): Illuminate\\Database\\DatabaseManager->__call(\'transaction\', Array)\n#18 E:\\TruongHoc\\BackEnd\\app\\Jobs\\ProcessDangKyHocPhan.php(45): Illuminate\\Support\\Facades\\Facade::__callStatic(\'transaction\', Array)\n#19 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\ProcessDangKyHocPhan->handle(Object(App\\Services\\DangKyHocPhanService))\n#20 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#21 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#22 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#23 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#24 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#25 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#26 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#27 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(136): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\ProcessDangKyHocPhan), false)\n#29 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#30 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\ProcessDangKyHocPhan))\n#31 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\ProcessDangKyHocPhan))\n#33 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#34 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#35 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#36 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#37 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'redis\', \'registration,de...\', Object(Illuminate\\Queue\\WorkerOptions))\n#38 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'registration,de...\')\n#39 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#40 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#41 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#42 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#43 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#44 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#45 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#46 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#47 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(1117): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 E:\\TruongHoc\\BackEnd\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#50 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#51 E:\\TruongHoc\\BackEnd\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#52 E:\\TruongHoc\\BackEnd\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#53 {main}','2026-03-06 19:06:37');
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giangvien`
--

DROP TABLE IF EXISTS `giangvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giangvien` (
  `GiangVienID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `HoTen` varchar(100) NOT NULL,
  `HocVi` varchar(100) DEFAULT NULL,
  `ChuyenMon` varchar(100) DEFAULT NULL,
  `KhoaID` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`GiangVienID`),
  UNIQUE KEY `UserID` (`UserID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `sodienthoai` (`sodienthoai`),
  KEY `KhoaID` (`KhoaID`),
  CONSTRAINT `giangvien_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `giangvien_ibfk_2` FOREIGN KEY (`KhoaID`) REFERENCES `khoa` (`KhoaID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvien`
--

LOCK TABLES `giangvien` WRITE;
/*!40000 ALTER TABLE `giangvien` DISABLE KEYS */;
INSERT INTO `giangvien` VALUES (1,2,'Trần Minh Tuấn','Tiến sĩ','Lập trình Web',1,'gv_new_email@example.com','0912345678','2026-02-24 07:31:27'),(2,3,'Lê Thị Hạnh','Thạc sĩ','Cơ sở dữ liệu',1,NULL,NULL,'2026-02-24 07:31:27'),(3,4,'Phạm Văn Long','Thạc sĩ','Quản trị doanh nghiệp',2,NULL,NULL,'2026-02-24 07:31:27'),(11,NULL,'ThS. Trần Văn Cường','Thạc sĩ','Công nghệ phần mềm',1,'cuong.tv@school.edu.vn','0988111222','2026-03-13 19:06:02');
/*!40000 ALTER TABLE `giangvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hethong_log`
--

DROP TABLE IF EXISTS `hethong_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hethong_log` (
  `LogID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `HanhDong` varchar(100) NOT NULL,
  `MoTa` text DEFAULT NULL,
  `BangLienQuan` varchar(50) DEFAULT NULL,
  `IDBanGhi` int(11) DEFAULT NULL,
  `IP` varchar(45) DEFAULT NULL,
  `UserAgent` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`LogID`),
  KEY `idx_user_hanhdong` (`UserID`,`HanhDong`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hethong_log`
--

LOCK TABLES `hethong_log` WRITE;
/*!40000 ALTER TABLE `hethong_log` DISABLE KEYS */;
INSERT INTO `hethong_log` VALUES (1,NULL,'DangKyHocPhanMoi','Đăng ký học phần thành công - SV: 1 - Lớp HP: 11','dangkyhocphan',29,NULL,NULL,'2026-03-04 10:06:59'),(2,NULL,'DangKyHocPhanMoi','Đăng ký học phần thành công - SV: 1 - Lớp HP: 11','dangkyhocphan',36,NULL,NULL,'2026-03-04 10:57:40'),(3,NULL,'DangKyHocPhanMoi','Đăng ký học phần thành công - SV: 1 - Lớp HP: 11','dangkyhocphan',40,NULL,NULL,'2026-03-04 11:10:59'),(4,NULL,'DangKyHocPhanMoi','Đăng ký học phần thành công - SV: 1 - Lớp HP: 11','dangkyhocphan',43,NULL,NULL,'2026-03-06 12:21:25'),(5,NULL,'DangKyHocPhanMoi','Đăng ký học phần thành công - SV: 1 - Lớp HP: 11','dangkyhocphan',44,NULL,NULL,'2026-03-06 12:27:41'),(6,2,'NhapDiem','Cập nhật điểm cho bản ghi đăng ký ID: 1','diemso',1,NULL,NULL,'2026-03-06 16:30:58'),(7,2,'NhapDiem','Cập nhật điểm cho bản ghi đăng ký ID: 1','diemso',1,NULL,NULL,'2026-03-07 09:50:56'),(8,1,'ĐÓNG_ĐĂNG_KÝ','Đóng đợt đăng ký học phần ID 11','dotdangky',11,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-12 23:54:53'),(9,1,'MỞ_ĐĂNG_KÝ','Mở đợt đăng ký: Đợt đăng ký Học kỳ 1','dotdangky',12,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-12 23:55:08'),(10,1,'DOI_TRANG_THAI_DOT','Khóa cứng đợt đăng ký ID: 11','dotdangky',11,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 00:16:18'),(11,1,'CAP_NHAT_DOT','Cập nhật thời gian đợt ID 11: 2024-07-01 07:30:00 -> 2024-07-15 17:00:00','dotdangky',11,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 00:19:19'),(12,1,'CAP_NHAT_DOT','Cập nhật thời gian đợt ID 11: 2024-07-01 07:30:00 -> 2024-07-15 17:00:00','dotdangky',11,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 00:23:57'),(13,1,'CAP_NHAT_DOT','Cập nhật đợt ID 11: 2024-07-01 07:30:00 → 2024-07-15 17:00:00','dotdangky',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 00:34:42'),(14,1,'DOI_TRANG_THAI_DOT','Khóa cứng đợt đăng ký ID: 11','dotdangky',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 00:38:03'),(15,1,'TAO_LOP_HOC_PHAN','Tạo lớp CT001-2025HK1-01 (ID: 13)','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 01:10:16'),(16,1,'TAO_LOP_HOC_PHAN','Tạo lớp CT001-2025HK1-02 (ID: 14)','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 01:12:26'),(17,1,'CAP_NHAT_LOP_HP','Cập nhật lớp CT001-2025HK1-03','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 01:29:44'),(18,1,'THEM_LICH_THI','Thêm lịch thi cho lớp IT101-01','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 01:49:03'),(19,1,'THEM_LICH_HOC','Thêm lịch học cho lớp IT101-01','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 01:50:57'),(20,1,'CAP_NHAT_LOP_HP','Cập nhật lớp CT001-2025HK1-03','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 01:59:54'),(21,1,'DOI_TRANG_THAI_DOT','Kích hoạt đợt đăng ký ID: 11','dotdangky',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:01:48'),(22,1,'TAO_LOP_HOC_PHAN','Tạo lớp IT001-HK1-2025-K23 (ID: 15)','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:50:45'),(23,1,'CAP_NHAT_LOP_HP','Cập nhật lớp CT001-2025HK1-03','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:51:20'),(24,1,'CAP_NHAT_LOP_HP','Cập nhật lớp CT001-2025HK1-03','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:51:40'),(25,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT001-HK1-2025-K23','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:52:53'),(26,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT001-HK1-2025-K23','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:53:06'),(27,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT001-HK1-2025-K23','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:53:14'),(28,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT101-01','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:55:29'),(29,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT101-01','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:56:37'),(30,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT101-01','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 03:56:43'),(31,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT101-01','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 04:07:08'),(32,1,'CAP_NHAT_LOP_HP','Cập nhật lớp IT001-HK1-2025-K23','lophocphan',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 04:07:29'),(33,1,'CREATE','Tạo môn học: Cấu trúc dữ liệu và Giải thuật','monhoc',16,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 23:16:12'),(34,1,'UPDATE','Cập nhật môn học: Cấu trúc dữ liệu và Giải thuật (Nâng cao)','monhoc',1,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-13 23:17:17'),(35,1,'NhapDiem','Cập nhật điểm cho bản ghi đăng ký ID: 1','diemso',1,NULL,NULL,'2026-03-16 05:40:07'),(36,1,'NhapDiem','Cập nhật điểm cho bản ghi đăng ký ID: 2','diemso',2,NULL,NULL,'2026-03-16 05:40:07'),(37,1,'Cập nhật điểm học phần','Người dùng ID 1 đã cập nhật điểm cho lớp HP ID 1','lophocphan',1,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-15 22:40:07'),(38,1,'Cập nhật điểm rèn luyện','Cập nhật điểm rèn luyện học kỳ ID 1','diemrenluyen',NULL,'127.0.0.1','PostmanRuntime/7.51.1','2026-03-15 22:41:05');
/*!40000 ALTER TABLE `hethong_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocky`
--

DROP TABLE IF EXISTS `hocky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hocky` (
  `HocKyID` int(11) NOT NULL AUTO_INCREMENT,
  `NamHocID` int(11) DEFAULT NULL,
  `TenHocKy` varchar(50) DEFAULT NULL,
  `LoaiHocKy` enum('HK1','HK2','He') DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  PRIMARY KEY (`HocKyID`),
  KEY `NamHocID` (`NamHocID`),
  CONSTRAINT `hocky_ibfk_1` FOREIGN KEY (`NamHocID`) REFERENCES `namhoc` (`NamHocID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocky`
--

LOCK TABLES `hocky` WRITE;
/*!40000 ALTER TABLE `hocky` DISABLE KEYS */;
INSERT INTO `hocky` VALUES (1,1,'Học kỳ 1','HK1',NULL,NULL),(2,1,'Học kỳ 2','HK2',NULL,NULL),(3,1,'Học kỳ hè','He',NULL,NULL),(4,2,'Học kỳ 1','HK1',NULL,NULL),(5,2,'Học kỳ 2','HK2',NULL,NULL),(11,11,'Học kỳ 1','HK1',NULL,NULL),(12,1,'Học kỳ 1 - 2025-2026','HK1',NULL,NULL);
/*!40000 ALTER TABLE `hocky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocphi`
--

DROP TABLE IF EXISTS `hocphi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hocphi` (
  `HocPhiID` int(11) NOT NULL AUTO_INCREMENT,
  `SinhVienID` int(11) DEFAULT NULL,
  `HocKyID` int(11) DEFAULT NULL,
  `TongTien` decimal(15,2) DEFAULT NULL,
  `DaNop` decimal(15,2) DEFAULT 0.00,
  `HanNop` date DEFAULT NULL,
  PRIMARY KEY (`HocPhiID`),
  KEY `SinhVienID` (`SinhVienID`),
  KEY `HocKyID` (`HocKyID`),
  CONSTRAINT `hocphi_ibfk_1` FOREIGN KEY (`SinhVienID`) REFERENCES `sinhvien` (`SinhVienID`),
  CONSTRAINT `hocphi_ibfk_2` FOREIGN KEY (`HocKyID`) REFERENCES `hocky` (`HocKyID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocphi`
--

LOCK TABLES `hocphi` WRITE;
/*!40000 ALTER TABLE `hocphi` DISABLE KEYS */;
INSERT INTO `hocphi` VALUES (1,1,1,4200000.00,4200000.00,'2024-10-30'),(2,2,1,4200000.00,3000000.00,'2024-10-30'),(3,3,1,2100000.00,2100000.00,'2024-10-30'),(4,4,1,4200000.00,4200000.00,'2024-10-30'),(5,5,1,2100000.00,2100000.00,'2024-10-30'),(6,6,1,2100000.00,0.00,'2024-10-30'),(7,1,1,4200000.00,4200000.00,'2024-10-30'),(8,2,1,4200000.00,3000000.00,'2024-10-30'),(9,3,1,2100000.00,2100000.00,'2024-10-30'),(10,4,1,4200000.00,4200000.00,'2024-10-30'),(11,5,1,2100000.00,2100000.00,'2024-10-30'),(12,6,1,2100000.00,0.00,'2024-10-30'),(13,1,1,4200000.00,4200000.00,'2024-10-30'),(14,2,1,4200000.00,3000000.00,'2024-10-30'),(15,3,1,2100000.00,2100000.00,'2024-10-30'),(16,4,1,4200000.00,4200000.00,'2024-10-30'),(17,5,1,2100000.00,2100000.00,'2024-10-30'),(18,6,1,2100000.00,0.00,'2024-10-30');
/*!40000 ALTER TABLE `hocphi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khoa` (
  `KhoaID` int(11) NOT NULL AUTO_INCREMENT,
  `MaKhoa` varchar(20) NOT NULL,
  `TenKhoa` varchar(100) NOT NULL,
  `DienThoai` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`KhoaID`),
  UNIQUE KEY `MaKhoa` (`MaKhoa`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'CNTT','Công nghệ thông tin (Cập nhật)','0905123456','cntt_new@truonghoc.edu.vn'),(2,'KT','Khoa Kinh tế','0289876543','kinhte@university.edu'),(11,'','Khoa Công nghệ thông tin',NULL,NULL);
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichhoc`
--

DROP TABLE IF EXISTS `lichhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lichhoc` (
  `LichHocID` int(11) NOT NULL AUTO_INCREMENT,
  `LopHocPhanID` int(11) NOT NULL,
  `NgayHoc` date NOT NULL,
  `BuoiHoc` varchar(30) NOT NULL,
  `TietBatDau` tinyint(4) NOT NULL,
  `SoTiet` tinyint(4) NOT NULL DEFAULT 3,
  `PhongHoc` varchar(50) DEFAULT NULL,
  `GhiChu` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`LichHocID`),
  KEY `LopHocPhanID` (`LopHocPhanID`),
  KEY `idx_ngay_buoi` (`NgayHoc`,`BuoiHoc`),
  CONSTRAINT `lichhoc_ibfk_1` FOREIGN KEY (`LopHocPhanID`) REFERENCES `lophocphan` (`LopHocPhanID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichhoc`
--

LOCK TABLES `lichhoc` WRITE;
/*!40000 ALTER TABLE `lichhoc` DISABLE KEYS */;
INSERT INTO `lichhoc` VALUES (1,1,'2026-03-15','Sáng',1,3,'A1.102','Học bù tiết 1-3','2026-03-13 01:50:57','2026-03-13 01:50:57'),(2,1,'2024-05-21','Chiều',7,3,'B2-202','Học bù','2026-03-14 00:18:07','2026-03-14 00:21:40');
/*!40000 ALTER TABLE `lichhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichthi`
--

DROP TABLE IF EXISTS `lichthi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lichthi` (
  `LichThiID` int(11) NOT NULL AUTO_INCREMENT,
  `LopHocPhanID` int(11) NOT NULL,
  `NgayThi` date NOT NULL,
  `GioBatDau` time NOT NULL,
  `GioKetThuc` time NOT NULL,
  `PhongThi` varchar(50) DEFAULT NULL,
  `HinhThucThi` enum('TracNghiem','TuLuan','ThucHanh','TongHop') DEFAULT 'TracNghiem',
  `GhiChu` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`LichThiID`),
  KEY `LopHocPhanID` (`LopHocPhanID`),
  CONSTRAINT `lichthi_ibfk_1` FOREIGN KEY (`LopHocPhanID`) REFERENCES `lophocphan` (`LopHocPhanID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichthi`
--

LOCK TABLES `lichthi` WRITE;
/*!40000 ALTER TABLE `lichthi` DISABLE KEYS */;
INSERT INTO `lichthi` VALUES (1,1,'2026-06-20','07:30:00','09:30:00','B2.205','TracNghiem','Mang theo thẻ sinh viên','2026-03-13 01:49:03','2026-03-13 01:49:03'),(2,1,'2024-06-15','07:30:00','09:30:00','Hội trường B','TuLuan',NULL,'2026-03-14 00:23:13','2026-03-14 00:24:59');
/*!40000 ALTER TABLE `lichthi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lophocphan`
--

DROP TABLE IF EXISTS `lophocphan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lophocphan` (
  `LopHocPhanID` int(11) NOT NULL AUTO_INCREMENT,
  `MonHocID` int(11) DEFAULT NULL,
  `HocKyID` int(11) DEFAULT NULL,
  `GiangVienID` int(11) DEFAULT NULL,
  `MaLopHP` varchar(50) DEFAULT NULL,
  `SoLuongToiDa` int(11) DEFAULT NULL,
  `KhoahocAllowed` varchar(255) DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  `TrangThaiNhapDiem` tinyint(4) DEFAULT 0 COMMENT '0: Mo, 1: Khoa',
  PRIMARY KEY (`LopHocPhanID`),
  UNIQUE KEY `MaLopHP` (`MaLopHP`),
  KEY `MonHocID` (`MonHocID`),
  KEY `HocKyID` (`HocKyID`),
  KEY `GiangVienID` (`GiangVienID`),
  CONSTRAINT `lophocphan_ibfk_1` FOREIGN KEY (`MonHocID`) REFERENCES `monhoc` (`MonHocID`),
  CONSTRAINT `lophocphan_ibfk_2` FOREIGN KEY (`HocKyID`) REFERENCES `hocky` (`HocKyID`),
  CONSTRAINT `lophocphan_ibfk_3` FOREIGN KEY (`GiangVienID`) REFERENCES `giangvien` (`GiangVienID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lophocphan`
--

LOCK TABLES `lophocphan` WRITE;
/*!40000 ALTER TABLE `lophocphan` DISABLE KEYS */;
INSERT INTO `lophocphan` VALUES (1,1,1,2,'IT101-01',910,'K3,K2',NULL,NULL,0),(2,2,1,2,'CT001-2025HK1-03',65,'K1,K2,K3,K4','2025-09-05','2025-12-28',0),(3,7,1,3,'KT101-01',80,'K1,K2,K3,K4',NULL,NULL,0),(4,8,1,3,'KT102-01',80,'K1,K2,K3,K4',NULL,NULL,0),(11,1,11,1,'IT101-E11',50,'K1,K2,K3,K4',NULL,NULL,0),(12,2,11,2,'IT102-E11',50,'K1,K2,K3,K4',NULL,NULL,0),(13,1,2,1,'CT001-2025HK1-01',60,'K1,K2,K3,K4','2025-09-01','2025-12-31',0),(14,1,2,1,'CT001-2025HK1-02',60,'K1,K2,K3,K4','2025-09-02','2025-12-31',0),(15,1,3,2,'IT001-HK1-2025-K23',10,'K3,K2','2025-09-01','2025-12-31',0);
/*!40000 ALTER TABLE `lophocphan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lopsinhhoat`
--

DROP TABLE IF EXISTS `lopsinhhoat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lopsinhhoat` (
  `LopSinhHoatID` int(11) NOT NULL AUTO_INCREMENT,
  `MaLop` varchar(20) NOT NULL,
  `TenLop` varchar(100) DEFAULT NULL,
  `KhoaID` int(11) NOT NULL,
  `GiangVienID` int(11) DEFAULT NULL,
  `NamNhapHoc` int(11) DEFAULT NULL,
  PRIMARY KEY (`LopSinhHoatID`),
  UNIQUE KEY `MaLop` (`MaLop`),
  KEY `KhoaID` (`KhoaID`),
  CONSTRAINT `lopsinhhoat_ibfk_1` FOREIGN KEY (`KhoaID`) REFERENCES `khoa` (`KhoaID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lopsinhhoat`
--

LOCK TABLES `lopsinhhoat` WRITE;
/*!40000 ALTER TABLE `lopsinhhoat` DISABLE KEYS */;
INSERT INTO `lopsinhhoat` VALUES (1,'CNTT2024A','CNTT Khóa 2024 A',1,1,2024),(2,'CNTT2024B','CNTT Khóa 2024 B',1,2,2024),(3,'KT2024A','Kinh tế Khóa 2024 A',2,3,2024),(6,'K24-CNTT01','Công nghệ thông tin 01 - Khóa 24',1,2,2024),(7,'K24-CNTT011','Công nghệ thông tin 01 - Khóa 24',1,2,2024);
/*!40000 ALTER TABLE `lopsinhhoat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monhoc` (
  `MonHocID` int(11) NOT NULL AUTO_INCREMENT,
  `MaMon` varchar(20) NOT NULL,
  `TenMon` varchar(100) NOT NULL,
  `SoTinChi` int(11) NOT NULL,
  `TietLyThuyet` int(11) DEFAULT NULL,
  `TietThucHanh` int(11) DEFAULT NULL,
  `KhoaID` int(11) NOT NULL,
  PRIMARY KEY (`MonHocID`),
  UNIQUE KEY `MaMon` (`MaMon`),
  KEY `KhoaID` (`KhoaID`),
  CONSTRAINT `monhoc_ibfk_1` FOREIGN KEY (`KhoaID`) REFERENCES `khoa` (`KhoaID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES (1,'IT101','Cấu trúc dữ liệu và Giải thuật (Nâng cao)',3,30,30,1),(2,'IT102','Cơ sở dữ liệu',3,30,30,1),(3,'IT103','Cấu trúc dữ liệu',3,30,30,1),(4,'IT104','Lập trình Web',3,30,30,1),(5,'IT105','Phân tích thiết kế hệ thống',3,30,15,1),(6,'IT106','Mạng máy tính',3,30,15,1),(7,'KT101','Nguyên lý kế toán',3,45,0,2),(8,'KT102','Quản trị học',3,45,0,2),(9,'KT103','Marketing căn bản',3,45,0,2),(10,'KT104','Tài chính doanh nghiệp',3,45,0,2),(11,'KT105','Kinh tế vi mô',3,45,0,2),(12,'KT106','Kinh tế vĩ mô',3,45,0,2),(13,'INT1306','Cấu trúc dữ liệu và Giải thuật',3,0,0,1),(14,'INT13061','Cấu trúc dữ liệu và Giải thuật',3,0,0,1),(15,'INT130611','Cấu trúc dữ liệu và Giải thuật',3,0,0,1),(16,'INT1306111','Cấu trúc dữ liệu và Giải thuật',3,0,0,1);
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc_songhanh`
--

DROP TABLE IF EXISTS `monhoc_songhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monhoc_songhanh` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MonHocID` int(11) NOT NULL,
  `MonSongHanhID` int(11) NOT NULL,
  `GhiChu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_pair` (`MonHocID`,`MonSongHanhID`),
  KEY `MonSongHanhID` (`MonSongHanhID`),
  CONSTRAINT `monhoc_songhanh_ibfk_1` FOREIGN KEY (`MonHocID`) REFERENCES `monhoc` (`MonHocID`) ON DELETE CASCADE,
  CONSTRAINT `monhoc_songhanh_ibfk_2` FOREIGN KEY (`MonSongHanhID`) REFERENCES `monhoc` (`MonHocID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc_songhanh`
--

LOCK TABLES `monhoc_songhanh` WRITE;
/*!40000 ALTER TABLE `monhoc_songhanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `monhoc_songhanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `namhoc`
--

DROP TABLE IF EXISTS `namhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `namhoc` (
  `NamHocID` int(11) NOT NULL AUTO_INCREMENT,
  `TenNamHoc` varchar(50) DEFAULT NULL,
  `NgayBatDau` date DEFAULT NULL,
  `NgayKetThuc` date DEFAULT NULL,
  PRIMARY KEY (`NamHocID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `namhoc`
--

LOCK TABLES `namhoc` WRITE;
/*!40000 ALTER TABLE `namhoc` DISABLE KEYS */;
INSERT INTO `namhoc` VALUES (1,'2024-2025','2024-09-01','2025-06-30'),(2,'2025-2026','2025-09-01','2026-06-30'),(11,'2025-2026','2025-09-01','2026-09-16'),(12,'2027-2028','2025-09-01','2026-08-31');
/*!40000 ALTER TABLE `namhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nganhdaotao`
--

DROP TABLE IF EXISTS `nganhdaotao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nganhdaotao` (
  `NganhID` int(11) NOT NULL AUTO_INCREMENT,
  `MaNganh` varchar(20) NOT NULL,
  `TenNganh` varchar(100) NOT NULL,
  `KhoaID` int(11) NOT NULL,
  PRIMARY KEY (`NganhID`),
  UNIQUE KEY `MaNganh` (`MaNganh`),
  KEY `KhoaID` (`KhoaID`),
  CONSTRAINT `nganhdaotao_ibfk_1` FOREIGN KEY (`KhoaID`) REFERENCES `khoa` (`KhoaID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nganhdaotao`
--

LOCK TABLES `nganhdaotao` WRITE;
/*!40000 ALTER TABLE `nganhdaotao` DISABLE KEYS */;
INSERT INTO `nganhdaotao` VALUES (1,'CNTT01','Kỹ thuật phần mềm',1),(2,'CNTT02','Hệ thống thông tin',1),(3,'KT01','Quản trị kinh doanh',2),(4,'KT02','Tài chính ngân hàng',2),(12,'KTPM','Kỹ thuật phần mềm',1);
/*!40000 ALTER TABLE `nganhdaotao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) NOT NULL,
  PRIMARY KEY (`RoleID`),
  UNIQUE KEY `RoleName` (`RoleName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'GIANGVIEN'),(3,'SINHVIEN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sinhvien` (
  `SinhVienID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `MaSV` varchar(20) NOT NULL,
  `khoahoc` varchar(50) DEFAULT NULL,
  `HoTen` varchar(100) NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `KhoaID` int(11) NOT NULL,
  `NganhID` int(11) NOT NULL,
  `TinhTrang` enum('DangHoc','BaoLuu','TotNghiep') DEFAULT 'DangHoc',
  `LopSinhHoatID` int(11) DEFAULT NULL,
  `gioitinh` tinyint(4) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sodienthoai` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`SinhVienID`),
  UNIQUE KEY `UserID` (`UserID`),
  UNIQUE KEY `MaSV` (`MaSV`),
  KEY `KhoaID` (`KhoaID`),
  KEY `NganhID` (`NganhID`),
  KEY `LopSinhHoatID` (`LopSinhHoatID`),
  KEY `idx_khoahoc` (`khoahoc`),
  CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinhvien_ibfk_2` FOREIGN KEY (`KhoaID`) REFERENCES `khoa` (`KhoaID`),
  CONSTRAINT `sinhvien_ibfk_3` FOREIGN KEY (`NganhID`) REFERENCES `nganhdaotao` (`NganhID`),
  CONSTRAINT `sinhvien_ibfk_4` FOREIGN KEY (`LopSinhHoatID`) REFERENCES `lopsinhhoat` (`LopSinhHoatID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES (1,5,'SV001','K2','Nguyễn Văn A','2004-03-12',1,1,'DangHoc',NULL,NULL,'trieung2301@gmail.com','0918123456','2026-02-24 07:27:55'),(2,6,'SV002','K2','Trần Thị B','2004-07-21',1,2,'DangHoc',1,NULL,NULL,NULL,'2026-02-24 07:27:55'),(3,7,'SV003','K1','Lê Văn C','2003-11-05',1,1,'DangHoc',7,NULL,NULL,NULL,'2026-02-24 07:27:55'),(4,8,'SV004','K3','Phạm Thị D','2004-01-15',2,3,'DangHoc',7,NULL,NULL,NULL,'2026-02-24 07:27:55'),(5,9,'SV005','K3','Nguyễn Văn E','2003-09-30',2,4,'DangHoc',NULL,NULL,NULL,NULL,'2026-02-24 07:27:55'),(6,10,'SV006','K4','Hoàng Thị F','2004-06-18',2,3,'DangHoc',NULL,NULL,NULL,NULL,'2026-02-24 07:27:55'),(11,11,'21001234',NULL,'Nguyễn Văn An',NULL,1,2,'DangHoc',NULL,NULL,NULL,'0912345678','2026-03-13 18:58:23'),(12,13,'1111111111','K25','Nguyễn Văn An',NULL,1,2,'DangHoc',NULL,NULL,'an.nv@gmail.com','0912345678','2026-03-13 19:04:40');
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_after_update_sinhvien_thongtin
AFTER UPDATE ON sinhvien
FOR EACH ROW
BEGIN
    IF OLD.Email <> NEW.Email OR OLD.SoDienThoai <> NEW.SoDienThoai OR OLD.HoTen <> NEW.HoTen THEN
        INSERT INTO hethong_log (
            UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi
        )
        VALUES (
            NULL,
            'CapNhatThongTinSV',
            CONCAT('Cập nhật thông tin SV: ', OLD.SinhVienID, ' (Email/Điện thoại/Họ tên)'),
            'sinhvien',
            OLD.SinhVienID,
            CURRENT_TIMESTAMP
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `thanhtoanhocphi`
--

DROP TABLE IF EXISTS `thanhtoanhocphi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thanhtoanhocphi` (
  `ThanhToanID` int(11) NOT NULL AUTO_INCREMENT,
  `HocPhiID` int(11) DEFAULT NULL,
  `SoTien` decimal(15,2) DEFAULT NULL,
  `NgayThanhToan` datetime DEFAULT current_timestamp(),
  `HinhThuc` enum('TienMat','ChuyenKhoan','Online') DEFAULT NULL,
  PRIMARY KEY (`ThanhToanID`),
  KEY `HocPhiID` (`HocPhiID`),
  CONSTRAINT `thanhtoanhocphi_ibfk_1` FOREIGN KEY (`HocPhiID`) REFERENCES `hocphi` (`HocPhiID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhtoanhocphi`
--

LOCK TABLES `thanhtoanhocphi` WRITE;
/*!40000 ALTER TABLE `thanhtoanhocphi` DISABLE KEYS */;
INSERT INTO `thanhtoanhocphi` VALUES (1,1,4200000.00,'2026-02-24 10:35:51','ChuyenKhoan'),(2,2,3000000.00,'2026-02-24 10:35:51','Online'),(3,3,2100000.00,'2026-02-24 10:35:51','TienMat'),(4,4,4200000.00,'2026-02-24 10:35:51','Online'),(5,5,2100000.00,'2026-02-24 10:35:51','ChuyenKhoan'),(6,1,4200000.00,'2026-02-24 10:38:18','ChuyenKhoan'),(7,2,3000000.00,'2026-02-24 10:38:18','Online'),(8,3,2100000.00,'2026-02-24 10:38:18','TienMat'),(9,4,4200000.00,'2026-02-24 10:38:18','Online'),(10,5,2100000.00,'2026-02-24 10:38:18','ChuyenKhoan'),(11,1,4200000.00,'2026-02-24 10:40:02','ChuyenKhoan'),(12,2,3000000.00,'2026-02-24 10:40:02','Online'),(13,3,2100000.00,'2026-02-24 10:40:02','TienMat'),(14,4,4200000.00,'2026-02-24 10:40:02','Online'),(15,5,2100000.00,'2026-02-24 10:40:02','ChuyenKhoan');
/*!40000 ALTER TABLE `thanhtoanhocphi` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_after_insert_thanhtoanhocphi
AFTER INSERT ON thanhtoanhocphi
FOR EACH ROW
BEGIN
    UPDATE hocphi
    SET DaNop = DaNop + NEW.SoTien,
        updated_at = CURRENT_TIMESTAMP
    WHERE HocPhiID = NEW.HocPhiID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `thongbao`
--

DROP TABLE IF EXISTS `thongbao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thongbao` (
  `ThongBaoID` int(11) NOT NULL AUTO_INCREMENT,
  `TieuDe` varchar(255) NOT NULL,
  `NoiDung` text NOT NULL,
  `LoaiThongBao` varchar(255) DEFAULT NULL,
  `NguoiGuiID` int(11) DEFAULT NULL,
  `DoiTuong` varchar(100) DEFAULT 'TatCa',
  `NgayBatDauHienThi` date DEFAULT NULL,
  `NgayKetThucHienThi` date DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`ThongBaoID`),
  KEY `NguoiGuiID` (`NguoiGuiID`),
  CONSTRAINT `thongbao_ibfk_1` FOREIGN KEY (`NguoiGuiID`) REFERENCES `users` (`UserID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thongbao`
--

LOCK TABLES `thongbao` WRITE;
/*!40000 ALTER TABLE `thongbao` DISABLE KEYS */;
INSERT INTO `thongbao` VALUES (1,'Thông báo mở đăng ký học phần','Sinh viên lưu ý thời gian đăng ký học phần từ ngày 20/03...','HocPhan',1,'SinhVien','2026-03-16','2026-03-30','2026-03-16 00:29:39'),(2,'Thông báo mở đăng ký học phần','Sinh viên lưu ý thời gian đăng ký học phần từ ngày 20/03...','HocPhan',1,'SinhVien','2026-03-16','2026-03-30','2026-03-16 00:31:00'),(3,'Thông báo mở đăng ký học phần','Sinh viên lưu ý thời gian đăng ký học phần từ ngày 20/03...','HocPhan',1,'SinhVien','2026-03-16','2026-03-30','2026-03-16 00:31:53'),(4,'Thông báo mở đăng ký học phần','Sinh viên lưu ý thời gian đăng ký học phần từ ngày 20/03...','HocPhan',1,'SinhVien','2026-03-16','2026-03-30','2026-03-16 00:34:08');
/*!40000 ALTER TABLE `thongbao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tieuchirenluyen`
--

DROP TABLE IF EXISTS `tieuchirenluyen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tieuchirenluyen` (
  `TieuChiID` int(11) NOT NULL AUTO_INCREMENT,
  `TenTieuChi` varchar(255) NOT NULL,
  `DiemToiDa` int(11) NOT NULL,
  `ThuTu` int(11) DEFAULT NULL,
  PRIMARY KEY (`TieuChiID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tieuchirenluyen`
--

LOCK TABLES `tieuchirenluyen` WRITE;
/*!40000 ALTER TABLE `tieuchirenluyen` DISABLE KEYS */;
INSERT INTO `tieuchirenluyen` VALUES (1,'Ý thức học tập',20,1),(2,'Chấp hành nội quy',20,2),(3,'Tham gia phong trào',25,3),(4,'Công tác lớp đoàn hội',20,4),(5,'Quan hệ cộng đồng',15,5),(6,'Ý thức học tập',20,1),(7,'Chấp hành nội quy',20,2),(8,'Tham gia phong trào',25,3),(9,'Công tác lớp đoàn hội',20,4),(10,'Quan hệ cộng đồng',15,5),(11,'Ý thức học tập',20,1),(12,'Chấp hành nội quy',20,2),(13,'Tham gia phong trào',25,3),(14,'Công tác lớp đoàn hội',20,4),(15,'Quan hệ cộng đồng',15,5);
/*!40000 ALTER TABLE `tieuchirenluyen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `RoleID` int(11) NOT NULL,
  `is_active` bit(1) NOT NULL DEFAULT b'1',
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin01','$2y$12$RNMG9yuqExbmvCxhzGGYuuH/uJ2Q.pibSR1JG.kRqeu0CDb48H.v6','admin01@uni.edu',1,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(2,'gv01','$2y$12$YZCpAMfkARdIQyetzAUhEumbqcYW6ItgIyCQ4uruONtdJUuVy9yWS','gv01@uni.edu',2,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(3,'gv02','123456','gv02@uni.edu',2,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(4,'gv03','123456','gv03@uni.edu',2,'\0','2026-02-24 10:22:04','2026-02-24 07:28:30'),(5,'svcntt01','$2y$12$hQ2OJc0pe0V.8U9I3HXfzu7YU4/02DGNAuSXPxPpdiKtYQrVxzs5y','svcntt01@uni.edu',3,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(6,'svcntt02','123456','svcntt02@uni.edu',3,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(7,'svcntt03','123456','svcntt03@uni.edu',3,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(8,'svkt01','$2y$12$RNMG9yuqExbmvCxhzGGYuuH/uJ2Q.pibSR1JG.kRqeu0CDb48H.v6','svkt01@uni.edu',3,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(9,'svkt02','123456','svkt02@uni.edu',3,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(10,'svkt03','123456','svkt03@uni.edu',3,'','2026-02-24 10:22:04','2026-02-24 07:28:30'),(11,'21001234','$2y$12$W8XpbYDwrP6ePQR9.GGmVODZ9NkHuK/yYfyFHTBoxilBQMmVZWTJ.',NULL,3,'','2026-03-14 08:58:23','2026-03-14 01:58:23'),(13,'1111111111','$2y$12$SIkQHKr0BkDXnRBXjFfCJO59Y2451433mwFjUuzw8dv/NuJRMWh9G',NULL,3,'','2026-03-14 09:04:40','2026-03-14 02:04:40'),(14,'gv_cuongtv','$2y$12$.FTZk0LITm/.yjIGwoFabORlh/FtS81/Bim6HAwf5B.g1Ty7npwnq',NULL,2,'','2026-03-14 09:06:22','2026-03-14 02:06:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_bangdiem_lop_hoc_phan`
--

DROP TABLE IF EXISTS `v_bangdiem_lop_hoc_phan`;
/*!50001 DROP VIEW IF EXISTS `v_bangdiem_lop_hoc_phan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_bangdiem_lop_hoc_phan` AS SELECT
 1 AS `LopHocPhanID`,
  1 AS `MaLopHP`,
  1 AS `TenMon`,
  1 AS `TenHocKy`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `DiemChuyenCan`,
  1 AS `DiemGiuaKy`,
  1 AS `DiemThi`,
  1 AS `DiemTongKet`,
  1 AS `DiemChu` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_cong_no_hoc_phi_sinhvien`
--

DROP TABLE IF EXISTS `v_cong_no_hoc_phi_sinhvien`;
/*!50001 DROP VIEW IF EXISTS `v_cong_no_hoc_phi_sinhvien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_cong_no_hoc_phi_sinhvien` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `TenHocKy`,
  1 AS `HocPhiID`,
  1 AS `TongTien`,
  1 AS `DaNop`,
  1 AS `ConNo`,
  1 AS `HanNop`,
  1 AS `TrangThaiNo`,
  1 AS `TongDaThanhToanChiTiet` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dangkyhocphan_hien_tai`
--

DROP TABLE IF EXISTS `v_dangkyhocphan_hien_tai`;
/*!50001 DROP VIEW IF EXISTS `v_dangkyhocphan_hien_tai`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_dangkyhocphan_hien_tai` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `DangKyID`,
  1 AS `ThoiGianDangKy`,
  1 AS `MaLopHP`,
  1 AS `MaMon`,
  1 AS `TenMon`,
  1 AS `SoTinChi`,
  1 AS `TenGiangVien`,
  1 AS `TenHocKy` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_danhsach_lop_giangvien`
--

DROP TABLE IF EXISTS `v_danhsach_lop_giangvien`;
/*!50001 DROP VIEW IF EXISTS `v_danhsach_lop_giangvien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_danhsach_lop_giangvien` AS SELECT
 1 AS `GiangVienID`,
  1 AS `TenGiangVien`,
  1 AS `HocVi`,
  1 AS `ChuyenMon`,
  1 AS `KhoaID`,
  1 AS `email`,
  1 AS `sodienthoai`,
  1 AS `LopHocPhanID`,
  1 AS `MaLopHP`,
  1 AS `MaMon`,
  1 AS `TenMon`,
  1 AS `SoTinChi`,
  1 AS `NamHoc`,
  1 AS `TenHocKy`,
  1 AS `LoaiHocKy`,
  1 AS `SoLuongToiDa`,
  1 AS `SoSinhVien` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_diem_hoc_ky_sinhvien`
--

DROP TABLE IF EXISTS `v_diem_hoc_ky_sinhvien`;
/*!50001 DROP VIEW IF EXISTS `v_diem_hoc_ky_sinhvien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_diem_hoc_ky_sinhvien` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `HocKyID`,
  1 AS `TenHocKy`,
  1 AS `NamHocID`,
  1 AS `MaMon`,
  1 AS `TenMon`,
  1 AS `SoTinChi`,
  1 AS `DiemChuyenCan`,
  1 AS `DiemGiuaKy`,
  1 AS `DiemThi`,
  1 AS `DiemTongKet`,
  1 AS `ThoiGianDangKy` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_diemrenluyen_sinhvien`
--

DROP TABLE IF EXISTS `v_diemrenluyen_sinhvien`;
/*!50001 DROP VIEW IF EXISTS `v_diemrenluyen_sinhvien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_diemrenluyen_sinhvien` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `HocKyID`,
  1 AS `TenHocKy`,
  1 AS `TongDiem`,
  1 AS `XepLoai`,
  1 AS `NgayDanhGia` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dot_dangky_hien_tai`
--

DROP TABLE IF EXISTS `v_dot_dangky_hien_tai`;
/*!50001 DROP VIEW IF EXISTS `v_dot_dangky_hien_tai`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_dot_dangky_hien_tai` AS SELECT
 1 AS `DotDangKyID`,
  1 AS `TenDot`,
  1 AS `TenHocKy`,
  1 AS `LoaiHocKy`,
  1 AS `NgayBatDau`,
  1 AS `NgayKetThuc`,
  1 AS `TrangThai`,
  1 AS `DoiTuong`,
  1 AS `GhiChu`,
  1 AS `ThoiGianHienTai`,
  1 AS `TrangThaiThucTe` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_gpa_hoc_ky`
--

DROP TABLE IF EXISTS `v_gpa_hoc_ky`;
/*!50001 DROP VIEW IF EXISTS `v_gpa_hoc_ky`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_gpa_hoc_ky` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `HocKyID`,
  1 AS `TenHocKy`,
  1 AS `NamHocID`,
  1 AS `SoMon`,
  1 AS `TongTinChi`,
  1 AS `GPA_HocKy_TamTinh` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_lich_hoc_sinhvien`
--

DROP TABLE IF EXISTS `v_lich_hoc_sinhvien`;
/*!50001 DROP VIEW IF EXISTS `v_lich_hoc_sinhvien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_lich_hoc_sinhvien` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `LichHocID`,
  1 AS `LopHocPhanID`,
  1 AS `NgayHoc`,
  1 AS `BuoiHoc`,
  1 AS `TietBatDau`,
  1 AS `SoTiet`,
  1 AS `PhongHoc`,
  1 AS `GhiChu`,
  1 AS `TenMon`,
  1 AS `MaLopHP`,
  1 AS `TenGiangVien`,
  1 AS `HocKyID`,
  1 AS `TenHocKy`,
  1 AS `NamHocID`,
  1 AS `TenNamHoc`,
  1 AS `NgayBatDauLop`,
  1 AS `NgayKetThucLop`,
  1 AS `NgayBatDauHocKy`,
  1 AS `NgayKetThucHocKy` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_lich_thi_sinhvien`
--

DROP TABLE IF EXISTS `v_lich_thi_sinhvien`;
/*!50001 DROP VIEW IF EXISTS `v_lich_thi_sinhvien`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_lich_thi_sinhvien` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `LichThiID`,
  1 AS `LopHocPhanID`,
  1 AS `NgayThi`,
  1 AS `GioBatDau`,
  1 AS `GioKetThuc`,
  1 AS `PhongThi`,
  1 AS `HinhThucThi`,
  1 AS `GhiChu`,
  1 AS `TenMon`,
  1 AS `MaLopHP`,
  1 AS `TenGiangVien`,
  1 AS `HocKyID`,
  1 AS `TenHocKy`,
  1 AS `NamHocID`,
  1 AS `TenNamHoc`,
  1 AS `NgayBatDauLop`,
  1 AS `NgayKetThucLop`,
  1 AS `NgayBatDauHocKy`,
  1 AS `NgayKetThucHocKy` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_lophocphan_mo_dangky`
--

DROP TABLE IF EXISTS `v_lophocphan_mo_dangky`;
/*!50001 DROP VIEW IF EXISTS `v_lophocphan_mo_dangky`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_lophocphan_mo_dangky` AS SELECT
 1 AS `LopHocPhanID`,
  1 AS `MaLopHP`,
  1 AS `MaMon`,
  1 AS `TenMon`,
  1 AS `SoTinChi`,
  1 AS `TenGiangVien`,
  1 AS `TenHocKy`,
  1 AS `TenDot`,
  1 AS `NgayBatDau`,
  1 AS `NgayKetThuc`,
  1 AS `TrangThaiDot`,
  1 AS `SoLuongToiDa`,
  1 AS `SoLuongDaDangKy` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sinhvien_chuongtrinhdaotao`
--

DROP TABLE IF EXISTS `v_sinhvien_chuongtrinhdaotao`;
/*!50001 DROP VIEW IF EXISTS `v_sinhvien_chuongtrinhdaotao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sinhvien_chuongtrinhdaotao` AS SELECT
 1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `MaNganh`,
  1 AS `TenNganh`,
  1 AS `MaMon`,
  1 AS `TenMon`,
  1 AS `SoTinChi`,
  1 AS `HocKyGoiY`,
  1 AS `BatBuoc`,
  1 AS `KhoaID` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sinhvien_lop_sinh_hoat`
--

DROP TABLE IF EXISTS `v_sinhvien_lop_sinh_hoat`;
/*!50001 DROP VIEW IF EXISTS `v_sinhvien_lop_sinh_hoat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sinhvien_lop_sinh_hoat` AS SELECT
 1 AS `LopSinhHoatID`,
  1 AS `MaLop`,
  1 AS `TenLop`,
  1 AS `NamNhapHoc`,
  1 AS `TenKhoa`,
  1 AS `TenCoVan`,
  1 AS `EmailCoVan`,
  1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTen`,
  1 AS `NgaySinh`,
  1 AS `Email`,
  1 AS `SoDienThoai` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_sinhvien_trong_lop_hoc_phan`
--

DROP TABLE IF EXISTS `v_sinhvien_trong_lop_hoc_phan`;
/*!50001 DROP VIEW IF EXISTS `v_sinhvien_trong_lop_hoc_phan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sinhvien_trong_lop_hoc_phan` AS SELECT
 1 AS `LopHocPhanID`,
  1 AS `MaLopHP`,
  1 AS `TenMon`,
  1 AS `TenHocKy`,
  1 AS `GiangVienPhuTrach`,
  1 AS `SinhVienID`,
  1 AS `MaSV`,
  1 AS `HoTenSinhVien`,
  1 AS `Email`,
  1 AS `SoDienThoai`,
  1 AS `ThoiGianDangKy`,
  1 AS `TrangThai` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'TruongHoc'
--

--
-- Dumping routines for database 'TruongHoc'
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_capnhat_trangthai_mon_hoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_capnhat_trangthai_mon_hoc`(
    IN p_SinhVienID INT,
    IN p_MonHocID INT,
    IN p_HocKyID INT,
    IN p_DiemTongKet DECIMAL(4,2),
    IN p_UserID INT
)
BEGIN
    DECLARE v_TrangThai ENUM('DaHoanThanh','Rot','HocLai','Mien') DEFAULT 'Rot';
    
    IF p_DiemTongKet >= 5.0 THEN
        SET v_TrangThai = 'DaHoanThanh';
    ELSEIF p_DiemTongKet >= 4.0 THEN
        SET v_TrangThai = 'HocLai';
    END IF;
    
    INSERT INTO trangthai_monhoc_sinhvien (
        SinhVienID, MonHocID, HocKyHoanThanh, TrangThai, DiemTongKet, LanThi
    )
    VALUES (p_SinhVienID, p_MonHocID, p_HocKyID, v_TrangThai, p_DiemTongKet, 1)
    ON DUPLICATE KEY UPDATE
        HocKyHoanThanh = p_HocKyID,
        TrangThai = v_TrangThai,
        DiemTongKet = p_DiemTongKet,
        LanThi = LanThi + 1;
    
    INSERT INTO hethong_log (UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi)
    VALUES (p_UserID, 'CapNhatTrangThaiMon', CONCAT('Cập nhật trạng thái môn ', p_MonHocID, ' cho SV ', p_SinhVienID), 'trangthai_monhoc_sinhvien', p_SinhVienID, CURRENT_TIMESTAMP);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dangky_hocphan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dangky_hocphan`(
    IN p_SinhVienID INT,
    IN p_LopHocPhanID INT,
    IN p_UserID INT,                -- để ghi log
    OUT p_KetQua VARCHAR(255),
    OUT p_ThanhCong TINYINT
)
BEGIN
    DECLARE v_DaDangKy INT DEFAULT 0;
    DECLARE v_SiSoHienTai INT DEFAULT 0;
    DECLARE v_SiSoToiDa INT DEFAULT 0;
    DECLARE v_MonHocID INT;
    DECLARE v_HocKyID INT;
    DECLARE v_DotDangKyID INT;
    DECLARE v_TrangThaiDot ENUM('Mo','Dong','TamNgung');
    DECLARE v_NgayBatDau DATETIME;
    DECLARE v_NgayKetThuc DATETIME;
    DECLARE v_CoNoHocPhi DECIMAL(15,2) DEFAULT 0;
    DECLARE v_MonTienQuyet INT DEFAULT 0;
    DECLARE v_MonSongHanh INT DEFAULT 0;
    DECLARE v_TrungLichHoc INT DEFAULT 0;
    DECLARE v_TrungLichThi INT DEFAULT 0;
    
    -- 1. Kiểm tra lớp học phần có tồn tại
    IF NOT EXISTS (SELECT 1 FROM lophocphan WHERE LopHocPhanID = p_LopHocPhanID) THEN
        SET p_KetQua = 'Lớp học phần không tồn tại';
        SET p_ThanhCong = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = p_KetQua;
    END IF;
    
    SELECT MonHocID, HocKyID, SoLuongToiDa INTO v_MonHocID, v_HocKyID, v_SiSoToiDa
    FROM lophocphan WHERE LopHocPhanID = p_LopHocPhanID;
    
    -- 2. Kiểm tra đã đăng ký môn này chưa (tránh trùng môn trong cùng học kỳ)
    SELECT COUNT(*) INTO v_DaDangKy
    FROM dangkyhocphan dk
    INNER JOIN lophocphan lh ON dk.LopHocPhanID = lh.LopHocPhanID
    WHERE dk.SinhVienID = p_SinhVienID
      AND lh.MonHocID = v_MonHocID
      AND lh.HocKyID = v_HocKyID
      AND dk.TrangThai = 'ThanhCong';
    
    IF v_DaDangKy > 0 THEN
        SET p_KetQua = 'Bạn đã đăng ký môn học này trong học kỳ này';
        SET p_ThanhCong = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = p_KetQua;
    END IF;
    
    -- 3. Kiểm tra sĩ số lớp
    SELECT COUNT(*) INTO v_SiSoHienTai
    FROM dangkyhocphan
    WHERE LopHocPhanID = p_LopHocPhanID AND TrangThai = 'ThanhCong';
    
    IF v_SiSoHienTai >= v_SiSoToiDa THEN
        SET p_KetQua = 'Lớp học phần đã đủ sĩ số';
        SET p_ThanhCong = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = p_KetQua;
    END IF;
    
    -- 4. Kiểm tra đợt đăng ký đang mở
    SELECT DotDangKyID, TrangThai, NgayBatDau, NgayKetThuc INTO v_DotDangKyID, v_TrangThaiDot, v_NgayBatDau, v_NgayKetThuc
    FROM dot_dangky
    WHERE HocKyID = v_HocKyID
      AND TrangThai = 'Mo'
      AND CURRENT_TIMESTAMP BETWEEN NgayBatDau AND NgayKetThuc
    LIMIT 1;
    
    IF v_DotDangKyID IS NULL THEN
        SET p_KetQua = 'Hiện không có đợt đăng ký nào đang mở cho học kỳ này';
        SET p_ThanhCong = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = p_KetQua;
    END IF;
    
    -- 5. Kiểm tra công nợ học phí (nếu có quy định chặn)
    SELECT (TongTien - DaNop) INTO v_CoNoHocPhi
    FROM hocphi
    WHERE SinhVienID = p_SinhVienID AND HocKyID = v_HocKyID
    LIMIT 1;
    
    IF v_CoNoHocPhi > 0 THEN   -- có thể điều chỉnh ngưỡng
        SET p_KetQua = 'Bạn còn nợ học phí, vui lòng thanh toán trước khi đăng ký';
        SET p_ThanhCong = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = p_KetQua;
    END IF;
    
    -- 6. Kiểm tra môn tiên quyết (đã hoàn thành chưa)
    SELECT COUNT(*) INTO v_MonTienQuyet
    FROM dieukienmonhoc dtq
    LEFT JOIN trangthai_monhoc_sinhvien tmhs 
      ON dtq.MonTienQuyetID = tmhs.MonHocID 
      AND tmhs.SinhVienID = p_SinhVienID
      AND tmhs.TrangThai = 'DaHoanThanh'
    WHERE dtq.MonHocID = v_MonHocID
      AND tmhs.ID IS NULL;
    
    IF v_MonTienQuyet > 0 THEN
        SET p_KetQua = 'Bạn chưa hoàn thành môn tiên quyết';
        SET p_ThanhCong = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = p_KetQua;
    END IF;
    
    -- 7. Kiểm tra môn song hành (nếu có quy định bắt buộc phải học cùng kỳ)
    -- (có thể bỏ qua nếu trường không yêu cầu nghiêm ngặt)
    
    -- 8. Kiểm tra trùng lịch học (so sánh tiết học)
    -- (cần logic phức tạp hơn, ví dụ join lich_hoc → so sánh ngày, buổi, tiết)
    -- tạm thời để comment, nếu cần triển khai chi tiết thì mở rộng sau
    
    -- Nếu qua hết kiểm tra → thực hiện đăng ký
    INSERT INTO dangkyhocphan (SinhVienID, LopHocPhanID, ThoiGianDangKy, TrangThai)
    VALUES (p_SinhVienID, p_LopHocPhanID, CURRENT_TIMESTAMP, 'ThanhCong');
    
    -- Ghi log
    INSERT INTO hethong_log (UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi, created_at)
    VALUES (p_UserID, 'DangKyHocPhan', CONCAT('SV ', p_SinhVienID, ' đăng ký lớp HP ', p_LopHocPhanID), 'dangkyhocphan', LAST_INSERT_ID(), CURRENT_TIMESTAMP);
    
    SET p_KetQua = 'Đăng ký học phần thành công';
    SET p_ThanhCong = 1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dong_dot_dangky` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dong_dot_dangky`(
    IN p_DotDangKyID INT,
    IN p_UserID INT,
    OUT p_KetQua VARCHAR(255)
)
BEGIN
    UPDATE dot_dangky
    SET TrangThai = 'Dong',
        updated_at = CURRENT_TIMESTAMP
    WHERE DotDangKyID = p_DotDangKyID;
    
    IF ROW_COUNT() = 0 THEN
        SET p_KetQua = 'Không tìm thấy đợt đăng ký';
    ELSE
        SET p_KetQua = 'Đóng đợt đăng ký thành công';
        
        INSERT INTO hethong_log (UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi)
        VALUES (p_UserID, 'DongDotDangKy', CONCAT('Đóng đợt ID ', p_DotDangKyID), 'dot_dangky', p_DotDangKyID, CURRENT_TIMESTAMP);
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_huy_dangky_hocphan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_huy_dangky_hocphan`(
    IN p_DangKyID INT,
    IN p_UserID INT,
    OUT p_KetQua VARCHAR(255),
    OUT p_ThanhCong TINYINT
)
BEGIN
    DECLARE v_SinhVienID INT;
    DECLARE v_LopHocPhanID INT;
    
    SELECT SinhVienID, LopHocPhanID INTO v_SinhVienID, v_LopHocPhanID
    FROM dangkyhocphan
    WHERE DangKyID = p_DangKyID AND TrangThai = 'ThanhCong';
    
    IF v_SinhVienID IS NULL THEN
        SET p_KetQua = 'Không tìm thấy đăng ký hợp lệ hoặc đã hủy';
        SET p_ThanhCong = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = p_KetQua;
    END IF;
    
    -- Kiểm tra thời gian hủy (ví dụ: chỉ cho hủy trong 7 ngày đầu đợt)
    -- Có thể thêm điều kiện ở đây
    
    UPDATE dangkyhocphan 
    SET TrangThai = 'Huy',
        ThoiGianDangKy = CURRENT_TIMESTAMP   -- có thể thêm trường ThoiGianHuy riêng
    WHERE DangKyID = p_DangKyID;
    
    INSERT INTO hethong_log (UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi)
    VALUES (p_UserID, 'HuyHocPhan', CONCAT('Hủy đăng ký ID ', p_DangKyID), 'dangkyhocphan', p_DangKyID, CURRENT_TIMESTAMP);
    
    SET p_KetQua = 'Hủy đăng ký thành công';
    SET p_ThanhCong = 1;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mo_dot_dangky` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mo_dot_dangky`(
    IN p_HocKyID INT,
    IN p_TenDot VARCHAR(100),
    IN p_NgayBatDau DATETIME,
    IN p_NgayKetThuc DATETIME,
    IN p_DoiTuong VARCHAR(255),
    IN p_GhiChu TEXT,
    IN p_UserID INT,
    OUT p_DotDangKyID INT
)
BEGIN
    INSERT INTO dot_dangky (
        HocKyID, TenDot, NgayBatDau, NgayKetThuc, TrangThai, DoiTuong, GhiChu
    )
    VALUES (
        p_HocKyID, p_TenDot, p_NgayBatDau, p_NgayKetThuc, 'Mo', p_DoiTuong, p_GhiChu
    );
    
    SET p_DotDangKyID = LAST_INSERT_ID();
    
    INSERT INTO hethong_log (UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi)
    VALUES (p_UserID, 'MoDotDangKy', CONCAT('Mở đợt đăng ký: ', p_TenDot), 'dot_dangky', p_DotDangKyID, CURRENT_TIMESTAMP);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_nhap_diem_tong_hop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nhap_diem_tong_hop`(
    IN p_DangKyID INT,
    IN p_DiemChuyenCan FLOAT,
    IN p_DiemGiuaKy FLOAT,
    IN p_DiemThi FLOAT,
    IN p_UserID INT,
    OUT p_KetQua VARCHAR(255)
)
BEGIN
    -- Kiểm tra bản ghi diemso đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM diemso WHERE DangKyID = p_DangKyID) THEN
        INSERT INTO diemso (DangKyID) VALUES (p_DangKyID);
    END IF;

    -- Cập nhật điểm: Dùng COALESCE để nếu tham số truyền vào là NULL thì giữ nguyên giá trị cũ
    UPDATE diemso
    SET 
        DiemChuyenCan = COALESCE(p_DiemChuyenCan, DiemChuyenCan),
        DiemGiuaKy    = COALESCE(p_DiemGiuaKy, DiemGiuaKy),
        DiemThi       = COALESCE(p_DiemThi, DiemThi)
    WHERE DangKyID = p_DangKyID;

    -- Ghi Log (Lựa chọn B: Đã bỏ CURRENT_TIMESTAMP dư thừa)
    INSERT INTO hethong_log (UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi)
    VALUES (
        p_UserID, 
        'NhapDiem', 
        CONCAT('Cập nhật điểm cho bản ghi đăng ký ID: ', p_DangKyID), 
        'diemso', 
        p_DangKyID
    );

    SET p_KetQua = 'Cập nhật điểm thành công';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tinh_diem_tong_ket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tinh_diem_tong_ket`(
    IN p_DangKyID INT,
    IN p_UserID INT
)
BEGIN
    DECLARE v_DiemTongKet DECIMAL(4,2);
    
    SELECT 
        ROUND(
            (COALESCE(DiemChuyenCan, 0) * 0.2) +
            (COALESCE(DiemGiuaKy, 0) * 0.3) +
            (COALESCE(DiemThi, 0) * 0.5),
            2
        ) INTO v_DiemTongKet
    FROM diemso
    WHERE DangKyID = p_DangKyID;
    
    UPDATE diemso
    SET DiemTongKet = v_DiemTongKet
    WHERE DangKyID = p_DangKyID;
    
    -- Ghi log
    INSERT INTO hethong_log (UserID, HanhDong, MoTa, BangLienQuan, IDBanGhi)
    VALUES (p_UserID, 'TinhDiemTongKet', CONCAT('Tính điểm tổng kết cho đăng ký ', p_DangKyID), 'diemso', p_DangKyID, CURRENT_TIMESTAMP);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tinh_gpa_hoc_ky` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tinh_gpa_hoc_ky`(
    IN p_SinhVienID INT,
    IN p_HocKyID INT,
    OUT p_GPA DECIMAL(4,2),
    OUT p_TongTinChi INT
)
BEGIN
    SELECT 
        ROUND(
            SUM(CASE 
                WHEN ds.DiemTongKet >= 8.0 THEN 4.0
                WHEN ds.DiemTongKet >= 7.0 THEN 3.5
                WHEN ds.DiemTongKet >= 6.0 THEN 3.0
                WHEN ds.DiemTongKet >= 5.0 THEN 2.0
                ELSE 0
            END * mh.SoTinChi) / SUM(mh.SoTinChi),
            2
        ),
        SUM(mh.SoTinChi)
    INTO p_GPA, p_TongTinChi
    FROM dangkyhocphan dk
    INNER JOIN lophocphan lh ON dk.LopHocPhanID = lh.LopHocPhanID
    INNER JOIN monhoc mh ON lh.MonHocID = mh.MonHocID
    LEFT JOIN diemso ds ON dk.DangKyID = ds.DangKyID
    WHERE dk.SinhVienID = p_SinhVienID
      AND lh.HocKyID = p_HocKyID
      AND dk.TrangThai = 'ThanhCong'
      AND ds.DiemTongKet IS NOT NULL;
      
    IF p_TongTinChi IS NULL THEN
        SET p_GPA = 0.00;
        SET p_TongTinChi = 0;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_bangdiem_lop_hoc_phan`
--

/*!50001 DROP VIEW IF EXISTS `v_bangdiem_lop_hoc_phan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_bangdiem_lop_hoc_phan` AS select `lh`.`LopHocPhanID` AS `LopHocPhanID`,`lh`.`MaLopHP` AS `MaLopHP`,`mh`.`TenMon` AS `TenMon`,`h`.`TenHocKy` AS `TenHocKy`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`ds`.`DiemChuyenCan` AS `DiemChuyenCan`,`ds`.`DiemGiuaKy` AS `DiemGiuaKy`,`ds`.`DiemThi` AS `DiemThi`,`ds`.`DiemTongKet` AS `DiemTongKet`,case when `ds`.`DiemTongKet` >= 8.0 then 'A' when `ds`.`DiemTongKet` >= 7.0 then 'B+' when `ds`.`DiemTongKet` >= 6.5 then 'B' when `ds`.`DiemTongKet` >= 5.5 then 'C+' when `ds`.`DiemTongKet` >= 5.0 then 'C' when `ds`.`DiemTongKet` >= 4.0 then 'D' else 'F' end AS `DiemChu` from (((((`lophocphan` `lh` join `monhoc` `mh` on(`lh`.`MonHocID` = `mh`.`MonHocID`)) join `hocky` `h` on(`lh`.`HocKyID` = `h`.`HocKyID`)) join `dangkyhocphan` `dk` on(`lh`.`LopHocPhanID` = `dk`.`LopHocPhanID`)) join `sinhvien` `sv` on(`dk`.`SinhVienID` = `sv`.`SinhVienID`)) left join `diemso` `ds` on(`dk`.`DangKyID` = `ds`.`DangKyID`)) where `dk`.`TrangThai` = 'ThanhCong' order by `lh`.`MaLopHP`,`sv`.`MaSV` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_cong_no_hoc_phi_sinhvien`
--

/*!50001 DROP VIEW IF EXISTS `v_cong_no_hoc_phi_sinhvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cong_no_hoc_phi_sinhvien` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`h`.`TenHocKy` AS `TenHocKy`,`hp`.`HocPhiID` AS `HocPhiID`,`hp`.`TongTien` AS `TongTien`,`hp`.`DaNop` AS `DaNop`,`hp`.`TongTien` - `hp`.`DaNop` AS `ConNo`,`hp`.`HanNop` AS `HanNop`,case when `hp`.`TongTien` - `hp`.`DaNop` <= 0 then 'DaHoanThanh' when `hp`.`HanNop` < curdate() then 'QuaHan' else 'ChuaHoanThanh' end AS `TrangThaiNo`,coalesce((select sum(`tt`.`SoTien`) from `thanhtoanhocphi` `tt` where `tt`.`HocPhiID` = `hp`.`HocPhiID`),0) AS `TongDaThanhToanChiTiet` from ((`sinhvien` `sv` join `hocphi` `hp` on(`sv`.`SinhVienID` = `hp`.`SinhVienID`)) join `hocky` `h` on(`hp`.`HocKyID` = `h`.`HocKyID`)) order by `sv`.`MaSV`,`hp`.`HanNop` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dangkyhocphan_hien_tai`
--

/*!50001 DROP VIEW IF EXISTS `v_dangkyhocphan_hien_tai`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dangkyhocphan_hien_tai` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`dk`.`DangKyID` AS `DangKyID`,`dk`.`ThoiGianDangKy` AS `ThoiGianDangKy`,`lh`.`MaLopHP` AS `MaLopHP`,`mh`.`MaMon` AS `MaMon`,`mh`.`TenMon` AS `TenMon`,`mh`.`SoTinChi` AS `SoTinChi`,`gv`.`HoTen` AS `TenGiangVien`,`h`.`TenHocKy` AS `TenHocKy` from (((((`sinhvien` `sv` join `dangkyhocphan` `dk` on(`sv`.`SinhVienID` = `dk`.`SinhVienID`)) join `lophocphan` `lh` on(`dk`.`LopHocPhanID` = `lh`.`LopHocPhanID`)) join `monhoc` `mh` on(`lh`.`MonHocID` = `mh`.`MonHocID`)) left join `giangvien` `gv` on(`lh`.`GiangVienID` = `gv`.`GiangVienID`)) join `hocky` `h` on(`lh`.`HocKyID` = `h`.`HocKyID`)) where `dk`.`TrangThai` = 'ThanhCong' and `h`.`HocKyID` = (select max(`hocky`.`HocKyID`) from `hocky`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_danhsach_lop_giangvien`
--

/*!50001 DROP VIEW IF EXISTS `v_danhsach_lop_giangvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_danhsach_lop_giangvien` AS select `gv`.`GiangVienID` AS `GiangVienID`,`gv`.`HoTen` AS `TenGiangVien`,`gv`.`HocVi` AS `HocVi`,`gv`.`ChuyenMon` AS `ChuyenMon`,`gv`.`KhoaID` AS `KhoaID`,`gv`.`email` AS `email`,`gv`.`sodienthoai` AS `sodienthoai`,`lhp`.`LopHocPhanID` AS `LopHocPhanID`,`lhp`.`MaLopHP` AS `MaLopHP`,`mh`.`MaMon` AS `MaMon`,`mh`.`TenMon` AS `TenMon`,`mh`.`SoTinChi` AS `SoTinChi`,`nh`.`TenNamHoc` AS `NamHoc`,`hk`.`TenHocKy` AS `TenHocKy`,`hk`.`LoaiHocKy` AS `LoaiHocKy`,`lhp`.`SoLuongToiDa` AS `SoLuongToiDa`,coalesce(count(`dkhp`.`DangKyID`),0) AS `SoSinhVien` from (((((`giangvien` `gv` join `lophocphan` `lhp` on(`gv`.`GiangVienID` = `lhp`.`GiangVienID`)) left join `monhoc` `mh` on(`lhp`.`MonHocID` = `mh`.`MonHocID`)) join `hocky` `hk` on(`lhp`.`HocKyID` = `hk`.`HocKyID`)) join `namhoc` `nh` on(`hk`.`NamHocID` = `nh`.`NamHocID`)) left join `dangkyhocphan` `dkhp` on(`lhp`.`LopHocPhanID` = `dkhp`.`LopHocPhanID`)) group by `gv`.`GiangVienID`,`gv`.`HoTen`,`gv`.`HocVi`,`gv`.`ChuyenMon`,`gv`.`KhoaID`,`gv`.`email`,`gv`.`sodienthoai`,`lhp`.`LopHocPhanID`,`lhp`.`MaLopHP`,`mh`.`MaMon`,`mh`.`TenMon`,`mh`.`SoTinChi`,`nh`.`TenNamHoc`,`hk`.`TenHocKy`,`hk`.`LoaiHocKy`,`lhp`.`SoLuongToiDa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_diem_hoc_ky_sinhvien`
--

/*!50001 DROP VIEW IF EXISTS `v_diem_hoc_ky_sinhvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_diem_hoc_ky_sinhvien` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`hk`.`HocKyID` AS `HocKyID`,`hk`.`TenHocKy` AS `TenHocKy`,`nh`.`NamHocID` AS `NamHocID`,`mh`.`MaMon` AS `MaMon`,`mh`.`TenMon` AS `TenMon`,`mh`.`SoTinChi` AS `SoTinChi`,`ds`.`DiemChuyenCan` AS `DiemChuyenCan`,`ds`.`DiemGiuaKy` AS `DiemGiuaKy`,`ds`.`DiemThi` AS `DiemThi`,`ds`.`DiemTongKet` AS `DiemTongKet`,`dkhp`.`ThoiGianDangKy` AS `ThoiGianDangKy` from ((((((`sinhvien` `sv` join `dangkyhocphan` `dkhp` on(`sv`.`SinhVienID` = `dkhp`.`SinhVienID`)) join `lophocphan` `lhp` on(`dkhp`.`LopHocPhanID` = `lhp`.`LopHocPhanID`)) join `hocky` `hk` on(`lhp`.`HocKyID` = `hk`.`HocKyID`)) join `namhoc` `nh` on(`hk`.`NamHocID` = `nh`.`NamHocID`)) join `monhoc` `mh` on(`lhp`.`MonHocID` = `mh`.`MonHocID`)) left join `diemso` `ds` on(`dkhp`.`DangKyID` = `ds`.`DangKyID`)) order by `sv`.`SinhVienID`,`hk`.`HocKyID`,`mh`.`MaMon` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_diemrenluyen_sinhvien`
--

/*!50001 DROP VIEW IF EXISTS `v_diemrenluyen_sinhvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_diemrenluyen_sinhvien` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`drl`.`HocKyID` AS `HocKyID`,`h`.`TenHocKy` AS `TenHocKy`,`drl`.`TongDiem` AS `TongDiem`,`drl`.`XepLoai` AS `XepLoai`,`drl`.`NgayDanhGia` AS `NgayDanhGia` from ((`sinhvien` `sv` join `diemrenluyen` `drl` on(`sv`.`SinhVienID` = `drl`.`SinhVienID`)) join `hocky` `h` on(`drl`.`HocKyID` = `h`.`HocKyID`)) order by `sv`.`SinhVienID`,`drl`.`HocKyID` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dot_dangky_hien_tai`
--

/*!50001 DROP VIEW IF EXISTS `v_dot_dangky_hien_tai`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dot_dangky_hien_tai` AS select `dd`.`DotDangKyID` AS `DotDangKyID`,`dd`.`TenDot` AS `TenDot`,`h`.`TenHocKy` AS `TenHocKy`,`h`.`LoaiHocKy` AS `LoaiHocKy`,`dd`.`NgayBatDau` AS `NgayBatDau`,`dd`.`NgayKetThuc` AS `NgayKetThuc`,`dd`.`TrangThai` AS `TrangThai`,`dd`.`DoiTuong` AS `DoiTuong`,`dd`.`GhiChu` AS `GhiChu`,current_timestamp() AS `ThoiGianHienTai`,case when current_timestamp() between `dd`.`NgayBatDau` and `dd`.`NgayKetThuc` then 'DangMo' when current_timestamp() < `dd`.`NgayBatDau` then 'ChuaMo' else 'DaDong' end AS `TrangThaiThucTe` from (`dotdangky` `dd` join `hocky` `h` on(`dd`.`HocKyID` = `h`.`HocKyID`)) where `dd`.`TrangThai` = 'Mo' and current_timestamp() <= `dd`.`NgayKetThuc` order by `dd`.`NgayBatDau` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_gpa_hoc_ky`
--

/*!50001 DROP VIEW IF EXISTS `v_gpa_hoc_ky`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_gpa_hoc_ky` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`hk`.`HocKyID` AS `HocKyID`,`hk`.`TenHocKy` AS `TenHocKy`,`nh`.`NamHocID` AS `NamHocID`,count(distinct `mh`.`MonHocID`) AS `SoMon`,sum(`mh`.`SoTinChi`) AS `TongTinChi`,round(avg(`ds`.`DiemTongKet`),2) AS `GPA_HocKy_TamTinh` from ((((((`sinhvien` `sv` join `dangkyhocphan` `dkhp` on(`sv`.`SinhVienID` = `dkhp`.`SinhVienID`)) join `lophocphan` `lhp` on(`dkhp`.`LopHocPhanID` = `lhp`.`LopHocPhanID`)) join `hocky` `hk` on(`lhp`.`HocKyID` = `hk`.`HocKyID`)) left join `namhoc` `nh` on(`hk`.`NamHocID` = `nh`.`NamHocID`)) join `monhoc` `mh` on(`lhp`.`MonHocID` = `mh`.`MonHocID`)) left join `diemso` `ds` on(`dkhp`.`DangKyID` = `ds`.`DangKyID`)) group by `sv`.`SinhVienID`,`sv`.`MaSV`,`sv`.`HoTen`,`hk`.`HocKyID`,`hk`.`TenHocKy`,`nh`.`NamHocID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_lich_hoc_sinhvien`
--

/*!50001 DROP VIEW IF EXISTS `v_lich_hoc_sinhvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lich_hoc_sinhvien` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`lh`.`LichHocID` AS `LichHocID`,`lh`.`LopHocPhanID` AS `LopHocPhanID`,`lh`.`NgayHoc` AS `NgayHoc`,`lh`.`BuoiHoc` AS `BuoiHoc`,`lh`.`TietBatDau` AS `TietBatDau`,`lh`.`SoTiet` AS `SoTiet`,`lh`.`PhongHoc` AS `PhongHoc`,`lh`.`GhiChu` AS `GhiChu`,`mh`.`TenMon` AS `TenMon`,`lhp`.`MaLopHP` AS `MaLopHP`,`gv`.`HoTen` AS `TenGiangVien`,`hk`.`HocKyID` AS `HocKyID`,`hk`.`TenHocKy` AS `TenHocKy`,`nh`.`NamHocID` AS `NamHocID`,`nh`.`TenNamHoc` AS `TenNamHoc`,`lhp`.`NgayBatDau` AS `NgayBatDauLop`,`lhp`.`NgayKetThuc` AS `NgayKetThucLop`,`hk`.`NgayBatDau` AS `NgayBatDauHocKy`,`hk`.`NgayKetThuc` AS `NgayKetThucHocKy` from (((((((`sinhvien` `sv` join `dangkyhocphan` `dk` on(`sv`.`SinhVienID` = `dk`.`SinhVienID`)) join `lichhoc` `lh` on(`dk`.`LopHocPhanID` = `lh`.`LopHocPhanID`)) join `lophocphan` `lhp` on(`lh`.`LopHocPhanID` = `lhp`.`LopHocPhanID`)) join `monhoc` `mh` on(`lhp`.`MonHocID` = `mh`.`MonHocID`)) left join `giangvien` `gv` on(`lhp`.`GiangVienID` = `gv`.`GiangVienID`)) join `hocky` `hk` on(`lhp`.`HocKyID` = `hk`.`HocKyID`)) join `namhoc` `nh` on(`hk`.`NamHocID` = `nh`.`NamHocID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_lich_thi_sinhvien`
--

/*!50001 DROP VIEW IF EXISTS `v_lich_thi_sinhvien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lich_thi_sinhvien` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`lt`.`LichThiID` AS `LichThiID`,`lt`.`LopHocPhanID` AS `LopHocPhanID`,`lt`.`NgayThi` AS `NgayThi`,`lt`.`GioBatDau` AS `GioBatDau`,`lt`.`GioKetThuc` AS `GioKetThuc`,`lt`.`PhongThi` AS `PhongThi`,`lt`.`HinhThucThi` AS `HinhThucThi`,`lt`.`GhiChu` AS `GhiChu`,`mh`.`TenMon` AS `TenMon`,`lhp`.`MaLopHP` AS `MaLopHP`,`gv`.`HoTen` AS `TenGiangVien`,`hk`.`HocKyID` AS `HocKyID`,`hk`.`TenHocKy` AS `TenHocKy`,`nh`.`NamHocID` AS `NamHocID`,`nh`.`TenNamHoc` AS `TenNamHoc`,`lhp`.`NgayBatDau` AS `NgayBatDauLop`,`lhp`.`NgayKetThuc` AS `NgayKetThucLop`,`hk`.`NgayBatDau` AS `NgayBatDauHocKy`,`hk`.`NgayKetThuc` AS `NgayKetThucHocKy` from (((((((`sinhvien` `sv` join `dangkyhocphan` `dk` on(`sv`.`SinhVienID` = `dk`.`SinhVienID`)) join `lichthi` `lt` on(`dk`.`LopHocPhanID` = `lt`.`LopHocPhanID`)) join `lophocphan` `lhp` on(`lt`.`LopHocPhanID` = `lhp`.`LopHocPhanID`)) join `monhoc` `mh` on(`lhp`.`MonHocID` = `mh`.`MonHocID`)) left join `giangvien` `gv` on(`lhp`.`GiangVienID` = `gv`.`GiangVienID`)) join `hocky` `hk` on(`lhp`.`HocKyID` = `hk`.`HocKyID`)) join `namhoc` `nh` on(`hk`.`NamHocID` = `nh`.`NamHocID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_lophocphan_mo_dangky`
--

/*!50001 DROP VIEW IF EXISTS `v_lophocphan_mo_dangky`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_lophocphan_mo_dangky` AS select `lh`.`LopHocPhanID` AS `LopHocPhanID`,`lh`.`MaLopHP` AS `MaLopHP`,`mh`.`MaMon` AS `MaMon`,`mh`.`TenMon` AS `TenMon`,`mh`.`SoTinChi` AS `SoTinChi`,`gv`.`HoTen` AS `TenGiangVien`,`h`.`TenHocKy` AS `TenHocKy`,`dd`.`TenDot` AS `TenDot`,`dd`.`NgayBatDau` AS `NgayBatDau`,`dd`.`NgayKetThuc` AS `NgayKetThuc`,`dd`.`TrangThai` AS `TrangThaiDot`,`lh`.`SoLuongToiDa` AS `SoLuongToiDa`,(select count(0) from `dangkyhocphan` `dk` where `dk`.`LopHocPhanID` = `lh`.`LopHocPhanID` and `dk`.`TrangThai` = 'ThanhCong') AS `SoLuongDaDangKy` from ((((`lophocphan` `lh` join `monhoc` `mh` on(`lh`.`MonHocID` = `mh`.`MonHocID`)) join `hocky` `h` on(`lh`.`HocKyID` = `h`.`HocKyID`)) left join `giangvien` `gv` on(`lh`.`GiangVienID` = `gv`.`GiangVienID`)) join `dotdangky` `dd` on(`h`.`HocKyID` = `dd`.`HocKyID`)) where `dd`.`TrangThai` = 'Mo' and current_timestamp() between `dd`.`NgayBatDau` and `dd`.`NgayKetThuc` order by `dd`.`NgayBatDau` desc,`lh`.`MaLopHP` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sinhvien_chuongtrinhdaotao`
--

/*!50001 DROP VIEW IF EXISTS `v_sinhvien_chuongtrinhdaotao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sinhvien_chuongtrinhdaotao` AS select `sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`n`.`MaNganh` AS `MaNganh`,`n`.`TenNganh` AS `TenNganh`,`mh`.`MaMon` AS `MaMon`,`mh`.`TenMon` AS `TenMon`,`mh`.`SoTinChi` AS `SoTinChi`,`ctdt`.`HocKyGoiY` AS `HocKyGoiY`,`ctdt`.`BatBuoc` AS `BatBuoc`,`mh`.`KhoaID` AS `KhoaID` from (((`sinhvien` `sv` join `nganhdaotao` `n` on(`sv`.`NganhID` = `n`.`NganhID`)) join `chuongtrinhdaotao` `ctdt` on(`n`.`NganhID` = `ctdt`.`NganhID`)) join `monhoc` `mh` on(`ctdt`.`MonHocID` = `mh`.`MonHocID`)) order by `sv`.`SinhVienID`,`ctdt`.`HocKyGoiY`,`mh`.`MaMon` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sinhvien_lop_sinh_hoat`
--

/*!50001 DROP VIEW IF EXISTS `v_sinhvien_lop_sinh_hoat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sinhvien_lop_sinh_hoat` AS select `lsh`.`LopSinhHoatID` AS `LopSinhHoatID`,`lsh`.`MaLop` AS `MaLop`,`lsh`.`TenLop` AS `TenLop`,`lsh`.`NamNhapHoc` AS `NamNhapHoc`,`k`.`TenKhoa` AS `TenKhoa`,`gv`.`HoTen` AS `TenCoVan`,`gv`.`email` AS `EmailCoVan`,`sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTen`,`sv`.`NgaySinh` AS `NgaySinh`,`sv`.`email` AS `Email`,`sv`.`sodienthoai` AS `SoDienThoai` from (((`lopsinhhoat` `lsh` join `khoa` `k` on(`lsh`.`KhoaID` = `k`.`KhoaID`)) left join `giangvien` `gv` on(`lsh`.`GiangVienID` = `gv`.`GiangVienID`)) left join `sinhvien` `sv` on(`lsh`.`LopSinhHoatID` = `sv`.`LopSinhHoatID`)) order by `lsh`.`MaLop`,`sv`.`MaSV` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_sinhvien_trong_lop_hoc_phan`
--

/*!50001 DROP VIEW IF EXISTS `v_sinhvien_trong_lop_hoc_phan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sinhvien_trong_lop_hoc_phan` AS select `lh`.`LopHocPhanID` AS `LopHocPhanID`,`lh`.`MaLopHP` AS `MaLopHP`,`mh`.`TenMon` AS `TenMon`,`h`.`TenHocKy` AS `TenHocKy`,`gv`.`HoTen` AS `GiangVienPhuTrach`,`sv`.`SinhVienID` AS `SinhVienID`,`sv`.`MaSV` AS `MaSV`,`sv`.`HoTen` AS `HoTenSinhVien`,`sv`.`email` AS `Email`,`sv`.`sodienthoai` AS `SoDienThoai`,`dk`.`ThoiGianDangKy` AS `ThoiGianDangKy`,`dk`.`TrangThai` AS `TrangThai` from (((((`lophocphan` `lh` join `monhoc` `mh` on(`lh`.`MonHocID` = `mh`.`MonHocID`)) join `hocky` `h` on(`lh`.`HocKyID` = `h`.`HocKyID`)) left join `giangvien` `gv` on(`lh`.`GiangVienID` = `gv`.`GiangVienID`)) join `dangkyhocphan` `dk` on(`lh`.`LopHocPhanID` = `dk`.`LopHocPhanID`)) join `sinhvien` `sv` on(`dk`.`SinhVienID` = `sv`.`SinhVienID`)) where `dk`.`TrangThai` = 'ThanhCong' order by `lh`.`MaLopHP`,`sv`.`MaSV` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-01  5:46:36
