-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2023 lúc 03:28 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cnw_hoian`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `IDUser` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`IDUser`, `Username`, `Password`) VALUES
('0001', 'admin1', 'admin1'),
('0002', 'admin2', 'admin2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `album`
--

CREATE TABLE `album` (
  `ID_Detail` varchar(20) NOT NULL,
  `ID_Image` varchar(20) NOT NULL,
  `Image` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `album`
--

INSERT INTO `album` (`ID_Detail`, `ID_Image`, `Image`, `Description`) VALUES
('1', '1', 'https://i.pinimg.com/564x/91/9f/04/919f04ded22bb8d7976cec290023defc.jpg', ''),
('1', '2', 'https://i.pinimg.com/736x/97/4c/77/974c77b926e3292140ba8e1935413252.jpg', ''),
('18', '5', 'https://i.pinimg.com/originals/ad/f2/d5/adf2d56486bf7433231b3b2942851b0c.jpg', 'des1'),
('17', 'ID_Image6', 'img6', 'des6'),
('17', 'ID_Image7', 'img7', 'des7');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalogue`
--

CREATE TABLE `catalogue` (
  `ID_Catalogue` varchar(20) NOT NULL,
  `Name_Catalogue` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalogue`
--

INSERT INTO `catalogue` (`ID_Catalogue`, `Name_Catalogue`) VALUES
('1', 'Giới Thiệu'),
('3', 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_catalogue`
--

CREATE TABLE `detail_catalogue` (
  `ID_Catalogue` varchar(20) NOT NULL,
  `ID_Detail` varchar(20) NOT NULL,
  `Title` text NOT NULL,
  `Name` text NOT NULL,
  `Content` text NOT NULL,
  `Other` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_catalogue`
--

INSERT INTO `detail_catalogue` (`ID_Catalogue`, `ID_Detail`, `Title`, `Name`, `Content`, `Other`) VALUES
('1', '1', 'Gioi thieu chung', '', 'xin chào mọi người', ''),
('1', '13', '', '', '1123', ''),
('1', '17', '', '', 'aaaa', ''),
('3', '18', '', '', 'xin chao', ''),
('1', '2', 'lich su', '', 'bbbbbbbbbbbbbbbbbbbb', ''),
('1', '4', '', '', 'aaaaa', ''),
('1', '5', '', '', 'aaaaa', ''),
('1', '6', '', '', 'bbbbb', ''),
('1', '7', '', '', '7777777777777777777', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Username`);

--
-- Chỉ mục cho bảng `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`ID_Image`),
  ADD KEY `ID_Detail` (`ID_Detail`);

--
-- Chỉ mục cho bảng `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`ID_Catalogue`);

--
-- Chỉ mục cho bảng `detail_catalogue`
--
ALTER TABLE `detail_catalogue`
  ADD PRIMARY KEY (`ID_Detail`),
  ADD KEY `ID_Catalogue` (`ID_Catalogue`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`ID_Detail`) REFERENCES `detail_catalogue` (`ID_Detail`);

--
-- Các ràng buộc cho bảng `detail_catalogue`
--
ALTER TABLE `detail_catalogue`
  ADD CONSTRAINT `detail_catalogue_ibfk_1` FOREIGN KEY (`ID_Catalogue`) REFERENCES `catalogue` (`ID_Catalogue`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
