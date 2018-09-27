-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018 年 09 月 25 日 08:42
-- 伺服器版本: 10.1.34-MariaDB
-- PHP 版本： 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- 資料庫： `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `project`;

-- --------------------------------------------------------

--
-- 資料表結構 `attendance`
--

CREATE TABLE `attendance` (
  `desNo` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `stoNo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `clock_in` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `clock_out` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `cq2_number`
--

CREATE TABLE `cq2_number` (
  `numplate` int(4) NOT NULL,
  `numTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `robNo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `callState` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `handleState` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `endTime` datetime(6) DEFAULT NULL,
  `desNo` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `designer`
--

CREATE TABLE `designer` (
  `desNo` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `desName` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `desID` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `desAddress` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `designer`
--

INSERT INTO `designer` (`desNo`, `desName`, `desID`, `birthday`, `desAddress`) VALUES
('D001', '葉老大', 'james001', '1988-01-01', '臺北市中山區北安路595巷13號'),
('D002', '羅小綾', 'lily002', '1988-01-01', '台北市大安區和平東路一段63號B1'),
('D003', '陳小如', 'lulu003', '1988-01-01', '桃園縣中壢市中華路二段501號(家樂福2樓)'),
('D004', '林小瑾', 'yee004', '1988-01-01', '新北市三重區三和路4段380號B1'),
('D005', '黃小瑄', 'joanna005', '1988-01-01', '台北市南港區南港路2段20巷1號2樓');

-- --------------------------------------------------------

--
-- 資料表結構 `match_rob`
--

CREATE TABLE `match_rob` (
  `robNo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `stoNo` varchar(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `match_rob`
--

INSERT INTO `match_rob` (`robNo`, `stoNo`) VALUES
('R001', '1'),
('R002', '2');

-- --------------------------------------------------------

--
-- 資料表結構 `on_duty_designer`
--

CREATE TABLE `on_duty_designer` (
  `desNo` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `desState` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `finishTime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `robot`
--

CREATE TABLE `robot` (
  `robNo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `robState` varchar(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `robot`
--

INSERT INTO `robot` (`robNo`, `robState`) VALUES
('R001', ''),
('R002', '');

-- --------------------------------------------------------

--
-- 資料表結構 `store`
--

CREATE TABLE `store` (
  `stoNo` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `stoCity` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `stoAddress` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `stoName` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `store`
--

INSERT INTO `store` (`stoNo`, `stoCity`, `stoAddress`, `stoName`) VALUES
('1', '台北市', '臺北市中山區北安路595巷13號', '大直店'),
('2', '台北市', '台北市大安區和平東路一段63號B1', '和平店'),
('3', '桃園市', '桃園縣中壢市中華路二段501號(家樂福2樓)', '中壢店'),
('4', '新北市', '新北市三重區三和路4段380號B1', '三重店'),
('5', '台北市', '台北市南港區南港路2段20巷1號2樓', '南港店'),
('6', '桃園市', '桃園縣蘆竹鄉南崁路152號', '南崁店'),
('7', '基隆市', '基隆市信義區深溪路53號B1', '基隆店');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `attendance`
--
ALTER TABLE `attendance`
  ADD KEY `att_des_index` (`desNo`),
  ADD KEY `att_sto_index` (`stoNo`);

--
-- 資料表索引 `cq2_number`
--
ALTER TABLE `cq2_number`
  ADD UNIQUE KEY `CQ2_number_index` (`numplate`,`numTime`,`robNo`),
  ADD KEY `numplate` (`numplate`),
  ADD KEY `desNo` (`desNo`),
  ADD KEY `robNo` (`robNo`);

--
-- 資料表索引 `designer`
--
ALTER TABLE `designer`
  ADD PRIMARY KEY (`desNo`);

--
-- 資料表索引 `match_rob`
--
ALTER TABLE `match_rob`
  ADD UNIQUE KEY `robNo` (`robNo`),
  ADD UNIQUE KEY `stoNo` (`stoNo`);

--
-- 資料表索引 `on_duty_designer`
--
ALTER TABLE `on_duty_designer`
  ADD PRIMARY KEY (`desNo`);

--
-- 資料表索引 `robot`
--
ALTER TABLE `robot`
  ADD PRIMARY KEY (`robNo`);

--
-- 資料表索引 `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`stoNo`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`stoNo`) REFERENCES `store` (`stoNo`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`desNo`) REFERENCES `on_duty_designer` (`desNo`);

--
-- 資料表的 Constraints `cq2_number`
-- 
ALTER TABLE `cq2_number`
  ADD CONSTRAINT `ava_designer_Fkey` FOREIGN KEY (`desNo`) REFERENCES `on_duty_designer` (`desNo`),
  ADD CONSTRAINT `cq2_number_ibfk_1` FOREIGN KEY (`robNo`) REFERENCES `match_rob` (`robNo`);

--
-- 資料表的 Constraints `match_rob`
--
ALTER TABLE `match_rob`
  ADD CONSTRAINT `rob_Fkey` FOREIGN KEY (`robNo`) REFERENCES `robot` (`robNo`),
  ADD CONSTRAINT `sto_Fkey` FOREIGN KEY (`stoNo`) REFERENCES `store` (`stoNo`);

--
-- 資料表的 Constraints `on_duty_designer`
--
ALTER TABLE `on_duty_designer`
  ADD CONSTRAINT `des_Fkey` FOREIGN KEY (`desNo`) REFERENCES `designer` (`desNo`);
COMMIT;
