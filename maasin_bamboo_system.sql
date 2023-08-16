-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 14, 2023 at 01:48 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maasin_bamboo_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_created` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`, `date_created`) VALUES
(1, 'Administrator', 'admin', '81dc9bdb52d04dc20036dbd8313ed055', '2023-08-13 02:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `barangay`
--

DROP TABLE IF EXISTS `barangay`;
CREATE TABLE IF NOT EXISTS `barangay` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(160) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barangay`
--

INSERT INTO `barangay` (`id`, `name`) VALUES
(1, 'ABAY'),
(2, 'ABILAY'),
(3, 'AGROCEL'),
(4, 'AMERANG'),
(5, 'BAGACAY EAST'),
(6, 'BAGACAY WEST'),
(7, 'BOLO'),
(8, 'BUG-OT'),
(9, 'BULAY'),
(10, 'BUNTALAN'),
(11, 'BURAK'),
(12, 'CABANGCALAN'),
(13, 'CABATAC'),
(14, 'CAIGON'),
(15, 'CANANGHAN'),
(16, 'CANAWILI'),
(17, 'DAGAMI'),
(18, 'DAJA'),
(19, 'DALUSAN'),
(20, 'DELCAR'),
(21, 'INABASAN'),
(22, 'LAYOG'),
(23, 'LINAB'),
(24, 'LIÑAGAN CALSDA'),
(25, 'LIÑAGAN TACAS'),
(26, 'MAGSAYSAY'),
(27, 'MABRIZ'),
(28, 'MIAPA'),
(29, 'MANDOG'),
(30, 'NAGBA'),
(31, 'NASAKA'),
(32, 'NASLO'),
(33, 'NASULI'),
(34, 'PANALIAN'),
(35, 'PIANDA-AN WEST'),
(36, 'PIAND-AN EAST'),
(37, 'PISPIS'),
(38, 'PUNONG'),
(39, 'SINUBSUBAN'),
(40, 'STA. RITA'),
(41, 'SUBOG'),
(42, 'SIWALO'),
(43, 'THT&P'),
(44, 'TIGBAUAN'),
(45, 'TUBANG'),
(46, 'TULAHONG'),
(47, 'TUY-AN EAST'),
(48, 'TUY-AN WEST'),
(49, 'TRANGKA'),
(50, 'UBIAN');

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
CREATE TABLE IF NOT EXISTS `farmer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `address` varchar(160) NOT NULL,
  `brgy_id` smallint NOT NULL,
  `spouse_first_name` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_no` varchar(10) NOT NULL,
  `address` varchar(160) NOT NULL,
  `brgy_id` smallint NOT NULL,
  `arp_no` varchar(15) NOT NULL,
  `pin` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lot`
--

INSERT INTO `lot` (`id`, `lot_no`, `address`, `brgy_id`, `arp_no`, `pin`) VALUES
(1, 'a', 'a', 1, 'a', 'a'),
(2, 'b', 'b', 5, 'b', 'b'),
(3, 'c', 'c', 12, 'c', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `lot_bounds`
--

DROP TABLE IF EXISTS `lot_bounds`;
CREATE TABLE IF NOT EXISTS `lot_bounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_id` int NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lot_bounds`
--

INSERT INTO `lot_bounds` (`id`, `lot_id`, `latitude`, `longitude`) VALUES
(1, 1, '10.89909780', '122.40971039'),
(2, 1, '10.89893977', '122.41125513'),
(3, 1, '10.89807587', '122.41139459'),
(4, 1, '10.89741215', '122.41134095'),
(5, 1, '10.89694859', '122.41067585'),
(6, 1, '10.89702234', '122.40950657'),
(7, 1, '10.89729626', '122.40897020'),
(8, 1, '10.89783356', '122.40880928'),
(9, 1, '10.89872906', '122.40849819'),
(10, 1, '10.89906619', '122.40889510'),
(11, 2, '10.89084433', '122.44300942'),
(12, 2, '10.89135003', '122.44562691'),
(13, 2, '10.89050719', '122.44760075'),
(14, 2, '10.88861077', '122.44897386'),
(15, 2, '10.88599791', '122.44772948'),
(16, 2, '10.88684077', '122.44322397'),
(17, 2, '10.88827363', '122.44146467'),
(18, 2, '10.89029648', '122.44082103'),
(19, 3, '10.94695584', '122.39506937'),
(20, 3, '10.94628169', '122.40880045'),
(21, 3, '10.93987717', '122.41171831'),
(22, 3, '10.93448379', '122.40931537'),
(23, 3, '10.93471975', '122.39919152'),
(24, 3, '10.93615238', '122.39086705'),
(25, 3, '10.93986032', '122.38897903'),
(26, 3, '10.94533787', '122.38923648');

-- --------------------------------------------------------

--
-- Table structure for table `lot_img_reference`
--

DROP TABLE IF EXISTS `lot_img_reference`;
CREATE TABLE IF NOT EXISTS `lot_img_reference` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brgy_id` smallint NOT NULL,
  `img_path` varchar(512) NOT NULL,
  `top_left_lat` decimal(10,8) NOT NULL,
  `top_left_lng` decimal(11,8) NOT NULL,
  `bottom_right_lat` decimal(10,8) NOT NULL,
  `bottom_right_lng` decimal(11,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Farm owner'),
(2, 'Kagawad');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role_id` tinyint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `role_id`, `status`, `date_created`) VALUES
(1, 'Raul Armstrong', 'EdiWOW', '0f8ee9c0588abdc9caa17176aee50520', 1, 1, '2023-08-13 03:26:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

DROP TABLE IF EXISTS `user_status`;
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` tinyint NOT NULL,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `description`) VALUES
(-1, 'Inactive'),
(0, 'New'),
(1, 'Active');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
