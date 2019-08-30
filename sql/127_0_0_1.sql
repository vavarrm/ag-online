-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1:3306
-- 產生時間： 2019 年 08 月 28 日 06:55
-- 伺服器版本: 5.7.23
-- PHP 版本： 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ag`
--
CREATE DATABASE IF NOT EXISTS `ag` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ag`;

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_account` varchar(12) NOT NULL,
  `ad_passwd` varchar(32) NOT NULL,
  `ad_role` int(11) NOT NULL,
  `ad_add_datetime` datetime NOT NULL,
  PRIMARY KEY (`ad_id`),
  UNIQUE KEY `ad_account` (`ad_account`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin`
--

INSERT INTO `admin` (`ad_id`, `ad_account`, `ad_passwd`, `ad_role`, `ad_add_datetime`) VALUES
(1, 'admin', '25d55ad283aa400af464c76d713c07ad', 1, '2017-12-24 00:00:00'),
(2, '111111111111', '593c9b4a9390551d53e5cacf28ebd638', 1, '2018-01-09 16:50:43'),
(3, 'tryo11111111', '593c9b4a9390551d53e5cacf28ebd638', 2, '2018-01-09 18:54:51'),
(4, 'sfdvdsvdsfsv', '593c9b4a9390551d53e5cacf28ebd638', 2, '2018-01-09 18:55:35'),
(5, 'dfgregewwwww', '593c9b4a9390551d53e5cacf28ebd638', 3, '2018-01-09 18:56:35'),
(6, 'efewssssssss', '593c9b4a9390551d53e5cacf28ebd638', 3, '2018-01-09 18:56:47'),
(7, 'aaaaaaaaaaaa', '45e4812014d83dde5666ebdf5a8ed1ed', 2, '2018-01-09 19:36:53'),
(8, 'dgegegewge', '25d55ad283aa400af464c76d713c07ad', 2, '2018-01-09 20:39:45'),
(9, 'dgsdgeww', '593c9b4a9390551d53e5cacf28ebd638', 1, '2018-01-09 20:48:18'),
(10, 'adminaaaa', '593c9b4a9390551d53e5cacf28ebd638', 2, '2018-01-09 20:52:17');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE IF NOT EXISTS `admin_menu` (
  `am_id` int(11) NOT NULL AUTO_INCREMENT,
  `am_title` varchar(12) NOT NULL,
  `am_router` varchar(30) NOT NULL,
  `am_parent_id` int(11) NOT NULL,
  `am_add_datetime` datetime NOT NULL,
  `am_type` enum('button','menu','head_button','action') NOT NULL DEFAULT 'menu',
  `am_func` varchar(50) DEFAULT NULL,
  `am_show` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`am_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_menu`
--

INSERT INTO `admin_menu` (`am_id`, `am_title`, `am_router`, `am_parent_id`, `am_add_datetime`, `am_type`, `am_func`, `am_show`) VALUES
(1, '使用者管理', '/user', 0, '2017-12-18 00:00:00', 'menu', NULL, 1),
(2, '列表', '/list', 1, '2017-12-24 00:00:00', 'menu', NULL, 1),
(3, '系統設定', '/system', 0, '2017-12-24 00:00:00', 'menu', NULL, 1),
(4, '權限管理', '/permissions', 3, '2017-12-24 00:00:00', 'menu', NULL, 1),
(5, '項目管裡', '/menu', 3, '2017-12-24 06:00:00', 'menu', NULL, 1),
(6, '修改使用者密碼', '/doSetUserPasswd', 2, '2017-12-24 00:00:00', 'action', NULL, 1),
(7, '修改資金密碼', '/setMoneyPasswd', 2, '2017-12-24 00:00:00', 'button', NULL, 1),
(8, '新增總代號', '/addParentUser', 2, '2017-12-24 00:00:00', 'head_button', NULL, 1),
(9, '新增下級帳號', '/addChildUser', 2, '2017-12-24 00:00:00', 'button', NULL, 1),
(14, '充值', '/rechargeForm', 2, '2018-01-31 00:00:00', 'button', NULL, 1),
(11, '充提管理', '/account', 0, '2017-12-24 00:00:00', 'menu', NULL, 1),
(12, '報表查詢', '/report', 0, '2017-12-24 00:00:00', 'button', NULL, 1),
(31, '论播banner', '/bigBannerList', 30, '2018-01-18 00:00:00', 'menu', NULL, 1),
(32, '新增', '/addBigBanner', 31, '2018-01-29 00:00:00', 'head_button', NULL, 1),
(17, '提款審核', '/withdrawalAuditList', 11, '2018-01-17 00:00:00', 'menu', NULL, 1),
(18, '使用者充值', '', 2, '2018-01-31 00:00:32', 'action', NULL, 1),
(19, '充值审核', '/rechargeAuditList', 11, '2018-01-07 00:00:53', 'menu', NULL, 1),
(20, '送出', '/doRechargeAudit', 19, '2018-01-08 00:00:00', 'action', NULL, 1),
(21, '新增后台帐号', '/addAdmin', 22, '2018-01-09 00:00:00', 'head_button', NULL, 1),
(22, '管理者列表', '/adminList', 3, '2018-01-30 00:00:00', 'menu', NULL, 1),
(23, '公告管理', '/announcemetList', 1, '2018-01-23 00:00:00', 'menu', NULL, 1),
(24, '新增', '/add', 23, '2018-01-13 00:00:37', 'head_button', NULL, 1),
(25, '修改', '/edit', 23, '2018-01-13 00:00:37', 'button', NULL, 1),
(26, '删除', '/del', 23, '2018-01-13 00:00:00', 'head_button', 'deleteAnnouncemet', 1),
(27, '送出', '/doWithdrawalAudit', 17, '2018-01-09 00:00:00', 'action', NULL, 1),
(28, '修改使用者密碼', '/setUserPasswd', 2, '2018-01-01 00:00:00', 'button', NULL, 1),
(30, '网站管理', '/website', 0, '2018-01-01 00:00:00', 'menu', NULL, 1),
(33, '删除', '/delBigBanner', 31, '2018-01-31 13:00:00', 'head_button', 'deleteBanner', 1),
(34, '修改', '/editBigBanner', 31, '2018-01-21 05:00:20', 'button', NULL, 1),
(35, '连结设定', '/editFooter', 30, '2018-01-17 00:00:00', 'menu', NULL, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `admin_menu_control`
--

DROP TABLE IF EXISTS `admin_menu_control`;
CREATE TABLE IF NOT EXISTS `admin_menu_control` (
  `amc_id` int(11) NOT NULL AUTO_INCREMENT,
  `amc_ad_id` int(11) NOT NULL,
  `amc_am_id` int(11) NOT NULL,
  `amc_add_datetime` datetime NOT NULL,
  PRIMARY KEY (`amc_id`),
  UNIQUE KEY `amc_ap_id` (`amc_ad_id`,`amc_am_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_menu_control`
--

INSERT INTO `admin_menu_control` (`amc_id`, `amc_ad_id`, `amc_am_id`, `amc_add_datetime`) VALUES
(1, 1, 1, '2017-12-28 00:00:00'),
(2, 1, 2, '2017-12-24 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE IF NOT EXISTS `admin_role` (
  `ar_id` int(11) NOT NULL AUTO_INCREMENT,
  `ar_name` varchar(12) NOT NULL,
  `ar_add_datetime` datetime NOT NULL,
  PRIMARY KEY (`ar_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_role`
--

INSERT INTO `admin_role` (`ar_id`, `ar_name`, `ar_add_datetime`) VALUES
(1, '系統管理者', '2017-12-24 00:00:00'),
(2, '运营', '2018-01-09 00:00:00'),
(3, '市场', '2018-01-09 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `announcemet`
--

DROP TABLE IF EXISTS `announcemet`;
CREATE TABLE IF NOT EXISTS `announcemet` (
  `an_id` int(11) NOT NULL AUTO_INCREMENT,
  `an_title` varchar(100) NOT NULL,
  `an_content` text NOT NULL,
  `an_datetime` datetime NOT NULL,
  `an_update_datetime` datetime DEFAULT NULL,
  `an_is_open` enum('0','1') NOT NULL DEFAULT '0',
  `an_type` enum('action','public') NOT NULL,
  `an_image` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`an_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `announcemet`
--

INSERT INTO `announcemet` (`an_id`, `an_title`, `an_content`, `an_datetime`, `an_update_datetime`, `an_is_open`, `an_type`, `an_image`) VALUES
(3, '11', '1', '2018-01-19 23:03:46', NULL, '0', 'action', ''),
(4, '11', '11', '2018-01-19 23:18:38', NULL, '0', 'action', ''),
(5, '1', '1', '2018-01-19 23:19:24', NULL, '0', 'action', ''),
(6, '1', '1', '2018-01-20 15:54:21', NULL, '0', 'action', ''),
(7, '1', '1', '2018-01-20 15:54:39', NULL, '0', 'action', ''),
(8, '1', '1', '2018-01-20 16:01:27', NULL, '0', 'action', ''),
(9, '111', '1', '2018-01-20 16:02:01', NULL, '0', 'action', ''),
(10, '1', '1', '2018-01-20 16:02:43', NULL, '0', 'action', ''),
(11, '1', '1', '2018-01-20 16:03:13', NULL, '0', 'action', ''),
(12, '111', '1', '2018-01-20 16:03:34', NULL, '0', 'action', ''),
(13, '1', '1', '2018-01-20 16:08:05', NULL, '0', 'action', '');

-- --------------------------------------------------------

--
-- 資料表結構 `api_error_log`
--

DROP TABLE IF EXISTS `api_error_log`;
CREATE TABLE IF NOT EXISTS `api_error_log` (
  `ael_id` int(11) NOT NULL AUTO_INCREMENT,
  `ael_type` enum('system','api','db','customize') NOT NULL,
  `aei_error_message` text,
  `aei_add_datetime` datetime NOT NULL,
  `aei_class` varchar(30) NOT NULL,
  `aei_function` varchar(30) NOT NULL,
  PRIMARY KEY (`ael_id`)
) ENGINE=MyISAM AUTO_INCREMENT=793 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `api_error_log`
--

INSERT INTO `api_error_log` (`ael_id`, `ael_type`, `aei_error_message`, `aei_add_datetime`, `aei_class`, `aei_function`) VALUES
(1, 'db', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM user\' at line 1', '2017-12-20 13:48:49', 'Api', 'test'),
(2, 'api', 'reponse 必傳參數為空', '2017-12-20 16:29:06', 'Api', 'registered'),
(3, 'api', 'reponse 必傳參數為空', '2017-12-20 16:31:13', 'Api', 'registered'),
(4, 'api', '暱稱長度為8~12位', '2017-12-20 16:31:22', 'Api', 'registered'),
(5, 'api', 'reponse 必傳參數為空', '2017-12-20 16:44:23', 'Api', 'registered'),
(6, 'api', '暱稱長度為8~12位', '2017-12-20 16:44:49', 'Api', 'registered'),
(7, 'api', '暱稱長度為8~12位', '2017-12-20 16:45:11', 'Api', 'registered'),
(8, 'api', '帳號長度為8~12位', '2017-12-20 16:45:28', 'Api', 'registered'),
(9, 'api', '無法註冊總代號', '2017-12-20 16:45:52', 'Api', 'registered'),
(10, 'api', '使用者帳號已存在', '2017-12-20 17:44:44', 'Api', 'registered'),
(11, 'api', '使用者帳號已存在', '2017-12-20 17:44:55', 'Api', 'registered'),
(12, 'api', '使用者帳號已存在', '2017-12-20 18:00:39', 'Api', 'registered'),
(13, 'api', 'reponse 必傳參數為空', '2017-12-22 13:19:36', 'Api', 'doLogin'),
(14, 'api', 'reponse 必傳參數為空', '2017-12-22 13:20:08', 'Api', 'doLogin'),
(15, 'api', 'reponse 必傳參數為空', '2017-12-22 13:20:27', 'Api', 'doLogin'),
(16, 'api', 'reponse 必傳參數為空', '2017-12-22 13:20:38', 'Api', 'doLogin'),
(17, 'api', 'reponse 必傳參數為空', '2017-12-22 13:21:25', 'Api', 'doLogin'),
(18, 'api', 'reponse 必傳參數為空', '2017-12-22 13:21:45', 'Api', 'doLogin'),
(19, 'api', '查無此帳號', '2017-12-22 13:30:11', 'Api', 'doLogin'),
(20, 'api', '查無此帳號', '2017-12-22 13:30:15', 'Api', 'doLogin'),
(21, 'api', '查無此帳號', '2017-12-22 13:31:36', 'Api', 'doLogin'),
(22, 'api', '密碼錯誤', '2017-12-22 13:31:43', 'Api', 'doLogin'),
(23, 'api', '密碼錯誤', '2017-12-22 13:31:51', 'Api', 'doLogin'),
(24, 'api', 'reponse 必傳參數為空', '2017-12-22 14:16:06', 'Api', 'getUser'),
(25, 'api', 'reponse 必傳參數為空', '2017-12-22 14:16:20', 'Api', 'getUser'),
(26, 'api', 'reponse 必傳參數為空', '2017-12-22 14:16:33', 'Api', 'getUser'),
(27, 'api', 'reponse 必傳參數為空', '2017-12-22 14:31:44', 'Api', 'getUser'),
(28, 'api', '尚未登入', '2017-12-22 14:54:30', 'Api', 'getUser'),
(29, 'api', '尚未登入', '2017-12-22 14:55:00', 'Api', 'getUser'),
(30, 'api', '無法取得使用者資料', '2017-12-22 15:53:36', 'Api', '__construct'),
(31, 'api', '無法取得使用者資料', '2017-12-22 15:53:51', 'Api', '__construct'),
(32, 'api', '無法取得使用者資料', '2017-12-22 15:54:06', 'Api', '__construct'),
(33, 'api', '無法取得使用者資料', '2017-12-22 15:55:29', 'Api', '__construct'),
(34, 'api', '無法取得使用者資料', '2017-12-22 15:55:40', 'Api', '__construct'),
(35, 'api', 'reponse 必傳參數為空', '2017-12-22 15:55:54', 'Api', 'getUser'),
(36, 'api', '無法取得使用者資料', '2017-12-22 15:57:26', 'Api', '__construct'),
(37, 'api', 'reponse 必傳參數為空', '2017-12-22 15:59:53', 'Api', '__construct'),
(38, 'api', 'reponse 必傳參數為空', '2017-12-22 16:00:01', 'Api', '__construct'),
(39, 'api', '無法取得使用者資料', '2017-12-22 16:00:18', 'Api', '__construct'),
(40, 'api', '無法取得使用者資料', '2017-12-22 16:00:22', 'Api', '__construct'),
(41, 'api', 'reponse 必傳參數為空', '2017-12-22 16:02:24', 'Api', 'setUserPassword'),
(42, 'api', '密碼長度為8~12位', '2017-12-22 16:03:30', 'Api', 'setUserPassword'),
(43, 'api', '密碼未更新', '2017-12-22 16:12:49', 'Api', 'setUserPassword'),
(44, 'api', 'reponse 必傳參數為空', '2017-12-22 16:21:01', 'Api', 'setUserPassword'),
(45, 'api', '密碼未更新', '2017-12-22 16:21:15', 'Api', 'setUserPassword'),
(46, 'api', '密碼未更新', '2017-12-22 16:21:33', 'Api', 'setUserMoneyPassword'),
(47, 'api', '密碼未更新', '2017-12-22 16:25:12', 'Api', 'setUserPassword'),
(48, 'api', '密碼未更新', '2017-12-22 16:25:20', 'Api', 'setUserPassword'),
(49, 'api', '密碼未更新', '2017-12-22 16:25:21', 'Api', 'setUserPassword'),
(50, 'api', '密碼未更新', '2017-12-22 16:25:23', 'Api', 'setUserPassword'),
(51, 'api', 'reponse 必傳參數為空', '2017-12-22 16:25:32', 'Api', '__construct'),
(52, 'api', 'reponse 必傳參數為空', '2017-12-22 16:25:46', 'Api', '__construct'),
(53, 'api', 'reponse 必傳參數為空', '2017-12-22 16:25:49', 'Api', '__construct'),
(54, 'api', 'reponse 必傳參數為空', '2017-12-22 16:26:28', 'Api', '__construct'),
(55, 'api', 'reponse 必傳參數為11空', '2017-12-22 16:26:39', 'Api', '__construct'),
(56, 'api', '密碼未更新', '2017-12-22 16:27:30', 'Api', 'setUserPassword'),
(57, 'api', '密碼未更新', '2017-12-22 16:27:35', 'Api', 'setUserPassword'),
(58, 'api', '密碼未更新', '2017-12-22 16:27:39', 'Api', 'setUserPassword'),
(59, 'api', '密碼未更新', '2017-12-22 16:28:22', 'Api', 'setUserPassword'),
(60, 'api', '使用者密碼不能與資金密碼相同', '2017-12-22 16:28:43', 'Api', 'setUserPassword'),
(61, 'api', '無法取得使用者資料', '2017-12-22 16:29:08', 'Api', '__construct'),
(62, 'api', '密碼未更新', '2017-12-22 16:29:20', 'Api', 'setUserMoneyPassword'),
(63, 'api', '密碼未更新', '2017-12-22 16:29:21', 'Api', 'setUserMoneyPassword'),
(64, 'api', '密碼未更新', '2017-12-22 16:29:55', 'Api', 'setUserMoneyPassword'),
(65, 'api', '使用者密碼不能與資金密碼相同', '2017-12-22 16:30:34', 'Api', 'setUserPassword'),
(66, 'api', '使用者密碼不能與資金密碼相同', '2017-12-22 16:30:48', 'Api', 'setUserMoneyPassword'),
(67, 'api', '使用者密碼不能與資金密碼相同', '2017-12-22 16:31:21', 'Api', 'setUserMoneyPassword'),
(68, 'api', 'reponse 必傳參數為11空', '2017-12-22 16:51:29', 'Api', '__construct'),
(69, 'api', 'reponse 必傳參數為空', '2017-12-22 16:51:48', 'Api', '__construct'),
(70, 'api', 'reponse 必傳參數為空', '2017-12-24 18:10:34', 'Api', '__construct'),
(71, 'api', 'reponse 必傳參數為空', '2017-12-24 18:10:55', 'Api', '__construct'),
(72, 'api', 'reponse 必傳參數為空', '2017-12-24 18:11:21', 'Api', '__construct'),
(73, 'api', 'reponse 必傳參數為空', '2017-12-24 18:11:38', 'Api', '__construct'),
(74, 'api', 'reponse 必傳參數為空', '2017-12-24 18:11:49', 'Api', '__construct'),
(75, 'api', 'reponse 必傳參數為空', '2017-12-24 18:12:02', 'Api', '__construct'),
(76, 'api', 'reponse 必傳參數為空', '2017-12-24 18:12:11', 'Api', '__construct'),
(77, 'api', 'reponse 必傳參數為空', '2017-12-24 18:13:02', 'Api', '__construct'),
(78, 'api', 'reponse 必傳參數為空', '2017-12-24 18:13:15', 'Api', '__construct'),
(79, 'api', 'reponse 必傳參數為空', '2017-12-24 18:15:08', 'Api', '__construct'),
(80, 'api', 'reponse 必傳參數為空', '2017-12-24 18:15:21', 'Api', '__construct'),
(81, 'api', 'reponse 必傳參數為空', '2017-12-24 18:19:56', 'Api', '__construct'),
(82, 'api', 'reponse 必傳參數為空', '2017-12-24 18:20:00', 'Api', '__construct'),
(83, 'api', 'reponse 必傳參數為空', '2017-12-24 18:20:07', 'Api', '__construct'),
(84, 'api', 'reponse 必傳參數為空', '2017-12-24 18:20:11', 'Api', '__construct'),
(85, 'api', 'reponse 必傳參數為空', '2017-12-24 18:20:15', 'Api', '__construct'),
(86, 'api', '查無此帳號', '2017-12-24 21:47:28', 'Api', 'login'),
(87, 'api', '密碼錯誤', '2017-12-24 21:47:51', 'Api', 'login'),
(88, 'api', '密碼錯誤', '2017-12-24 21:48:00', 'Api', 'login'),
(89, 'api', '密碼錯誤', '2017-12-24 21:48:26', 'Api', 'login'),
(90, 'api', '密碼錯誤', '2017-12-24 21:48:39', 'Api', 'login'),
(91, 'api', '密碼錯誤', '2017-12-24 21:49:02', 'Api', 'login'),
(92, 'api', '查無此帳號', '2017-12-24 21:51:40', 'Api', 'login'),
(93, 'api', '查無此帳號', '2017-12-24 21:52:34', 'Api', 'login'),
(94, 'api', '查無此帳號', '2017-12-24 21:58:56', 'Api', 'login'),
(95, 'api', '密碼錯誤', '2017-12-24 21:59:05', 'Api', 'login'),
(96, 'api', '查無此帳號', '2017-12-24 22:03:45', 'Api', 'login'),
(97, 'api', '查無此帳號', '2017-12-24 22:04:18', 'Api', 'login'),
(98, 'api', '查無此帳號', '2017-12-24 22:04:20', 'Api', 'login'),
(99, 'api', '查無此帳號', '2017-12-24 22:04:33', 'Api', 'login'),
(100, 'api', '查無此帳號', '2017-12-24 22:04:35', 'Api', 'login'),
(101, 'api', '密碼錯誤', '2017-12-27 11:30:32', 'Api', 'login'),
(102, 'api', '密碼錯誤', '2017-12-27 11:30:35', 'Api', 'login'),
(103, 'api', 'reponse 必傳參數為空', '2017-12-27 11:56:35', 'Api', '__construct'),
(104, 'api', 'reponse 必傳參數為空', '2017-12-27 11:57:55', 'Api', '__construct'),
(105, 'api', 'reponse 必傳參數為空', '2017-12-27 11:57:58', 'Api', '__construct'),
(106, 'api', 'reponse 必傳參數為空', '2017-12-27 11:58:00', 'Api', '__construct'),
(107, 'api', 'reponse 必傳參數為空', '2017-12-27 11:58:40', 'Api', '__construct'),
(108, 'api', 'reponse 必傳參數為空', '2017-12-27 12:01:24', 'Api', '__construct'),
(109, 'api', 'reponse 必傳參數為空', '2017-12-27 12:01:26', 'Api', '__construct'),
(110, 'api', 'reponse 必傳參數為空', '2017-12-27 12:02:40', 'Api', '__construct'),
(111, 'api', 'reponse 必傳參數為空', '2017-12-27 12:02:43', 'Api', '__construct'),
(112, 'api', 'reponse 必傳參數為空', '2017-12-27 12:03:56', 'Api', '__construct'),
(113, 'api', 'reponse 必傳參數為空', '2017-12-27 12:04:32', 'Api', '__construct'),
(114, 'api', 'reponse 必傳參數為空', '2017-12-27 12:04:38', 'Api', '__construct'),
(115, 'api', 'reponse 必傳參數為空', '2017-12-27 12:08:11', 'Api', '__construct'),
(116, 'api', 'reponse 必傳參數為空', '2017-12-27 12:12:27', 'Api', '__construct'),
(117, 'api', 'reponse 必傳參數為空', '2017-12-27 12:13:24', 'Api', '__construct'),
(118, 'api', 'reponse 必傳參數為空', '2017-12-27 12:14:29', 'Api', '__construct'),
(119, 'api', 'reponse 必傳參數為空', '2017-12-27 12:15:04', 'Api', '__construct'),
(120, 'api', 'reponse 必傳參數為空', '2017-12-27 12:16:00', 'Api', '__construct'),
(121, 'api', '無法取得使用者資料', '2017-12-27 12:16:27', 'Api', '__construct'),
(122, 'api', '無法取得使用者資料', '2017-12-27 12:16:36', 'Api', '__construct'),
(123, 'api', '無法取得使用者資料', '2017-12-27 12:16:41', 'Api', '__construct'),
(124, 'api', '密碼錯誤', '2017-12-27 12:23:04', 'Api', 'login'),
(125, 'api', '無法取得使用者資料', '2017-12-27 12:23:08', 'Api', '__construct'),
(126, 'api', '無法取得使用者資料', '2017-12-27 12:27:11', 'Api', '__construct'),
(127, 'api', '無法取得使用者資料', '2017-12-27 12:28:28', 'Api', '__construct'),
(128, 'api', '無法取得使用者資料', '2017-12-27 12:30:21', 'Api', '__construct'),
(129, 'api', '無法取得使用者資料', '2017-12-27 12:31:08', 'Api', '__construct'),
(130, 'api', '無法取得使用者資料', '2017-12-27 12:32:43', 'Api', '__construct'),
(131, 'api', '無法取得使用者資料', '2017-12-27 12:32:48', 'Api', '__construct'),
(132, 'api', '無法取得使用者資料', '2017-12-27 12:34:25', 'Api', '__construct'),
(133, 'api', '無法取得使用者資料', '2017-12-27 12:34:32', 'Api', '__construct'),
(134, 'api', '無法取得使用者資料', '2017-12-28 10:21:43', 'Api', '__construct'),
(135, 'api', '尚未登入', '2017-12-29 16:05:06', 'Api', '__construct'),
(136, 'api', '尚未登入', '2017-12-29 16:05:06', 'Api', '__construct'),
(137, 'api', '尚未登入', '2017-12-29 16:05:09', 'Api', '__construct'),
(138, 'api', '尚未登入', '2017-12-29 16:05:10', 'Api', '__construct'),
(139, 'api', '尚未登入', '2017-12-29 16:05:16', 'Api', '__construct'),
(140, 'api', '尚未登入', '2017-12-29 16:05:22', 'Api', '__construct'),
(141, 'api', 'reponse 必傳參數為空', '2017-12-30 11:18:42', 'Api', 'addParentUser'),
(142, 'api', 'reponse 必傳參數為空', '2017-12-30 11:18:47', 'Api', 'addParentUser'),
(143, 'api', 'reponse 必傳參數為空', '2017-12-30 11:18:48', 'Api', 'addParentUser'),
(144, 'api', 'reponse 必傳參數為空', '2017-12-30 11:18:48', 'Api', 'addParentUser'),
(145, 'api', 'reponse 必傳參數為空', '2017-12-30 11:18:48', 'Api', 'addParentUser'),
(146, 'api', 'reponse 必傳參數為空', '2017-12-30 11:18:49', 'Api', 'addParentUser'),
(147, 'api', 'reponse 必傳參數為空', '2017-12-30 11:18:50', 'Api', 'addParentUser'),
(148, 'api', 'reponse 必傳參數為空', '2017-12-30 11:21:28', 'Api', 'addParentUser'),
(149, 'api', 'reponse 必傳參數為空', '2017-12-30 11:21:40', 'Api', 'addParentUser'),
(150, 'api', 'reponse 必傳參數為空', '2017-12-30 11:21:43', 'Api', 'addParentUser'),
(151, 'api', 'reponse 必傳參數為空', '2017-12-30 11:21:44', 'Api', 'addParentUser'),
(152, 'api', 'reponse 必傳參數為空', '2017-12-30 11:22:21', 'Api', 'addParentUser'),
(153, 'api', 'reponse 必傳參數為空', '2017-12-30 11:22:37', 'Api', 'addParentUser'),
(154, 'api', 'reponse 必傳參數為空', '2017-12-30 11:23:50', 'Api', 'addParentUser'),
(155, 'api', 'reponse 必傳參數為空', '2017-12-30 11:24:02', 'Api', 'addParentUser'),
(156, 'api', 'reponse 必傳參數為空', '2017-12-30 11:25:22', 'Api', 'addParentUser'),
(157, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:01', 'Api', 'addParentUser'),
(158, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:01', 'Api', 'addParentUser'),
(159, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:01', 'Api', 'addParentUser'),
(160, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:01', 'Api', 'addParentUser'),
(161, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:01', 'Api', 'addParentUser'),
(162, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:01', 'Api', 'addParentUser'),
(163, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:01', 'Api', 'addParentUser'),
(164, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:02', 'Api', 'addParentUser'),
(165, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:02', 'Api', 'addParentUser'),
(166, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:02', 'Api', 'addParentUser'),
(167, 'api', 'reponse 必傳參數為空', '2017-12-30 11:36:02', 'Api', 'addParentUser'),
(168, 'api', 'reponse 必傳參數為空', '2017-12-30 12:33:16', 'Api', 'addParentUser'),
(169, 'api', 'reponse 必傳參數為空', '2017-12-30 12:39:03', 'Api', 'addParentUser'),
(170, 'api', 'reponse 必傳參數為空', '2017-12-30 12:39:15', 'Api', 'addParentUser'),
(171, 'api', 'reponse 必傳參數為空', '2017-12-30 12:42:09', 'Api', 'addParentUser'),
(172, 'api', 'reponse 必傳參數為空', '2017-12-30 12:42:17', 'Api', 'addParentUser'),
(173, 'api', 'reponse 必傳參數為空', '2017-12-30 12:44:40', 'Api', 'addParentUser'),
(174, 'api', 'reponse 必傳參數為空', '2017-12-30 12:44:47', 'Api', 'addParentUser'),
(175, 'api', 'reponse 必傳參數為空', '2017-12-30 12:45:14', 'Api', 'addParentUser'),
(176, 'api', 'reponse 必傳參數為空', '2017-12-30 12:45:23', 'Api', 'addParentUser'),
(177, 'api', '暱稱長度為8~12位', '2017-12-30 12:45:53', 'Api', 'addParentUser'),
(178, 'api', '帳號長度為8~12位', '2017-12-30 12:46:00', 'Api', 'addParentUser'),
(179, 'api', '帳號長度為8~12位', '2017-12-30 12:46:04', 'Api', 'addParentUser'),
(180, 'api', '無法註冊總代號', '2017-12-30 12:46:08', 'Api', 'addParentUser'),
(181, 'api', '使用者帳號已存在', '2017-12-30 12:49:04', 'Api', 'addParentUser'),
(182, 'api', '使用者帳號已存在', '2017-12-30 12:49:13', 'Api', 'addParentUser'),
(183, 'api', 'reponse 必傳參數為空', '2017-12-30 14:14:00', 'Api', 'addChildUser'),
(184, 'api', 'reponse 必傳參數為空', '2017-12-30 14:16:35', 'Api', 'addChildUser'),
(185, 'api', 'reponse 必傳參數為空', '2017-12-30 14:16:40', 'Api', 'addChildUser'),
(186, 'api', '暱稱長度為8~12位', '2017-12-30 14:17:49', 'Api', 'addChildUser'),
(187, 'api', '帳號長度為8~12位', '2017-12-30 14:17:52', 'Api', 'addChildUser'),
(188, 'api', '暱稱長度為8~12位', '2017-12-30 14:21:03', 'Api', 'addChildUser'),
(189, 'api', '使用者帳號已存在', '2017-12-30 14:35:42', 'Api', 'addChildUser'),
(190, 'api', '帳號長度為8~12位', '2017-12-30 14:35:57', 'Api', 'addChildUser'),
(191, 'api', '使用者名稱不能與帳號相同', '2017-12-30 14:36:02', 'Api', 'addChildUser'),
(192, 'api', '使用者名稱不能與帳號相同', '2017-12-30 14:36:06', 'Api', 'addChildUser'),
(193, 'api', '暱稱長度為8~12位', '2017-12-30 14:36:09', 'Api', 'addChildUser'),
(194, 'api', '使用者帳號已存在', '2017-12-30 14:36:12', 'Api', 'addChildUser'),
(195, 'api', '暱稱長度為8~12位', '2017-12-31 16:41:37', 'Api', 'addParentUser'),
(196, 'api', '帳號長度為8~12位', '2017-12-31 16:42:56', 'Api', 'addParentUser'),
(197, 'api', '暱稱長度為8~12位', '2017-12-31 16:44:27', 'Api', 'addParentUser'),
(198, 'api', 'reponse 必傳參數為空', '2018-01-01 10:03:41', 'Api', 'childUserList'),
(199, 'api', 'reponse 必傳參數為空', '2018-01-01 10:04:33', 'Api', 'childUserList'),
(200, 'api', 'reponse 必傳參數為空', '2018-01-01 10:05:41', 'Api', 'childUserList'),
(201, 'api', 'reponse 必傳參數為空', '2018-01-01 10:06:02', 'Api', 'childUserList'),
(202, 'api', '尚未登入', '2018-01-01 14:32:38', 'Api', '__construct'),
(203, 'api', '尚未登入', '2018-01-01 14:32:38', 'Api', '__construct'),
(204, 'api', '尚未登入', '2018-01-01 14:32:43', 'Api', '__construct'),
(205, 'api', '尚未登入', '2018-01-01 14:32:45', 'Api', '__construct'),
(206, 'api', '尚未登入', '2018-01-01 14:33:23', 'Api', '__construct'),
(207, 'api', '尚未登入', '2018-01-01 14:33:23', 'Api', '__construct'),
(208, 'api', '尚未登入', '2018-01-01 14:34:09', 'Api', '__construct'),
(209, 'api', '尚未登入', '2018-01-01 14:34:09', 'Api', '__construct'),
(210, 'api', '尚未登入', '2018-01-01 14:34:15', 'Api', '__construct'),
(211, 'api', '尚未登入', '2018-01-01 14:34:16', 'Api', '__construct'),
(212, 'api', '尚未登入', '2018-01-01 14:34:30', 'Api', '__construct'),
(213, 'api', '尚未登入', '2018-01-01 14:34:30', 'Api', '__construct'),
(214, 'api', '尚未登入', '2018-01-01 14:34:33', 'Api', '__construct'),
(215, 'api', '尚未登入', '2018-01-01 14:34:33', 'Api', '__construct'),
(216, 'api', '暱稱長度為8~12位', '2018-01-01 14:46:57', 'Api', 'addParentUser'),
(217, 'api', 'reponse 必傳參數為空', '2018-01-02 13:59:24', 'Api', 'childUserList'),
(218, 'api', 'reponse 必傳參數為空', '2018-01-02 13:59:32', 'Api', 'childUserList'),
(219, 'api', 'reponse 必傳參數為空', '2018-01-02 15:06:42', 'Api', 'setUserPasswd'),
(220, 'db', '无资料更新', '2018-01-03 10:31:58', 'Api', 'setUserPasswd'),
(221, 'api', '两次输入密码不一致', '2018-01-03 10:32:13', 'Api', 'setUserPasswd'),
(222, 'db', '无资料更新', '2018-01-03 10:32:20', 'Api', 'setUserPasswd'),
(223, 'db', '无资料更新', '2018-01-03 10:33:04', 'Api', 'setUserPasswd'),
(224, 'db', '无资料更新', '2018-01-03 10:33:34', 'Api', 'setUserPasswd'),
(225, 'api', '密碼錯誤', '2018-01-03 10:36:49', 'Api', 'login'),
(226, 'api', '密碼錯誤', '2018-01-03 10:36:58', 'Api', 'login'),
(227, 'api', '密碼錯誤', '2018-01-03 10:37:01', 'Api', 'login'),
(228, 'api', '密碼錯誤', '2018-01-03 10:37:09', 'Api', 'login'),
(229, 'db', '无资料更新', '2018-01-03 10:37:18', 'Api', 'setUserPasswd'),
(230, 'db', '无资料更新', '2018-01-03 10:37:25', 'Api', 'setUserPasswd'),
(231, 'db', '无资料更新', '2018-01-03 10:37:36', 'Api', 'setUserPasswd'),
(232, 'db', '无资料更新', '2018-01-03 10:37:54', 'Api', 'setUserPasswd'),
(233, 'db', '无资料更新', '2018-01-03 10:38:10', 'Api', 'setUserPasswd'),
(234, 'db', '无资料更新', '2018-01-03 10:38:34', 'Api', 'setUserPasswd'),
(235, 'db', '无资料更新', '2018-01-03 10:39:01', 'Api', 'setUserPasswd'),
(236, 'api', 'reponse 必傳參數為空', '2018-01-03 18:53:01', 'Api', 'getActionList'),
(237, 'api', 'reponse 必傳參數為空', '2018-01-03 18:53:06', 'Api', 'getActionList'),
(238, 'api', 'reponse 必傳參數為空', '2018-01-03 18:54:17', 'Api', 'getActionList'),
(239, 'api', 'reponse 必傳參數為空', '2018-01-03 18:54:29', 'Api', 'getActionList'),
(240, 'api', 'reponse 必傳參數為空', '2018-01-03 18:54:41', 'Api', 'getActionList'),
(241, 'api', 'reponse 必傳參數為空', '2018-01-03 18:55:02', 'Api', 'getActionList'),
(242, 'api', 'reponse 必傳參數為空', '2018-01-03 18:55:13', 'Api', 'getActionList'),
(243, 'api', 'reponse 必傳參數為空', '2018-01-03 18:55:47', 'Api', 'getActionList'),
(244, 'api', 'reponse 必傳參數為空', '2018-01-03 18:56:11', 'Api', 'getActionList'),
(245, 'api', 'reponse 必傳參數為空', '2018-01-03 18:56:18', 'Api', 'getActionList'),
(246, 'api', 'reponse 必傳參數為空', '2018-01-03 18:57:00', 'Api', 'getActionList'),
(247, 'api', 'reponse 必傳參數為空', '2018-01-03 18:59:29', 'Api', 'getActionList'),
(248, 'api', 'reponse 必傳參數為空', '2018-01-04 15:21:17', 'Api', 'getActionList'),
(249, 'api', 'reponse 必傳參數為空', '2018-01-04 15:22:02', 'Api', 'getActionList'),
(250, 'api', 'reponse 必傳參數為空', '2018-01-04 15:25:54', 'Api', 'getActionList'),
(251, 'api', 'reponse 必傳參數為空', '2018-01-04 15:37:35', 'Api', 'getActionList'),
(252, 'api', 'reponse 必傳參數為空', '2018-01-04 15:37:39', 'Api', 'getActionList'),
(253, 'api', 'reponse 必傳參數為空', '2018-01-04 15:37:49', 'Api', 'getActionList'),
(254, 'api', 'reponse 必傳參數為空', '2018-01-04 15:38:26', 'Api', 'getActionList'),
(255, 'api', 'reponse 必傳參數為空', '2018-01-04 15:38:29', 'Api', 'getActionList'),
(256, 'api', 'reponse 必傳參數為空', '2018-01-04 15:40:04', 'Api', 'getActionList'),
(257, 'api', 'reponse 必傳參數為空', '2018-01-04 15:41:13', 'Api', 'getActionList'),
(258, 'api', 'reponse 必傳參數為空', '2018-01-04 15:41:37', 'Api', 'getActionList'),
(259, 'api', 'reponse 必傳參數為空', '2018-01-04 15:41:49', 'Api', 'getActionList'),
(260, 'api', 'reponse 必傳參數為空', '2018-01-04 15:41:53', 'Api', 'getActionList'),
(261, 'api', 'reponse 必傳參數為空', '2018-01-04 15:42:12', 'Api', 'getActionList'),
(262, 'api', 'reponse 必傳參數為空', '2018-01-04 15:43:06', 'Api', 'getActionList'),
(263, 'api', 'reponse 必傳參數為空', '2018-01-04 15:43:54', 'Api', 'getActionList'),
(264, 'api', 'reponse 必傳參數為空', '2018-01-04 15:44:06', 'Api', 'getActionList'),
(265, 'api', 'reponse 必傳參數為空', '2018-01-04 15:44:09', 'Api', 'getActionList'),
(266, 'api', 'reponse 必傳參數為空', '2018-01-04 15:46:32', 'Api', 'getActionList'),
(267, 'api', 'reponse 必傳參數為空', '2018-01-04 15:47:46', 'Api', 'getActionList'),
(268, 'api', 'reponse 必傳參數為空', '2018-01-04 15:54:15', 'Api', 'getActionList'),
(269, 'api', 'reponse 必傳參數為空', '2018-01-06 13:00:38', 'Api', 'getActionList'),
(270, 'api', '帳號長度為8~12位', '2018-01-06 13:05:32', 'Api', 'addChildUser'),
(271, 'api', '使用者帳號已存在', '2018-01-06 13:05:38', 'Api', 'addChildUser'),
(272, 'api', '暱稱長度為8~12位', '2018-01-06 13:09:54', 'Api', 'addChildUser'),
(273, 'api', '帳號長度為8~12位', '2018-01-06 13:10:00', 'Api', 'addChildUser'),
(274, 'api', '暱稱長度為8~12位', '2018-01-06 13:11:13', 'Api', 'addChildUser'),
(275, 'api', '暱稱長度為8~12位', '2018-01-06 13:11:18', 'Api', 'addChildUser'),
(276, 'api', '帳號長度為8~12位', '2018-01-06 13:11:25', 'Api', 'addChildUser'),
(277, 'api', 'reponse 必傳參數為空', '2018-01-06 13:15:14', 'Api', 'getActionList'),
(278, 'api', 'reponse 必傳參數為空', '2018-01-06 13:15:25', 'Api', 'getActionList'),
(279, 'api', 'reponse 必傳參數為空', '2018-01-06 13:16:01', 'Api', 'getActionList'),
(280, 'api', 'reponse 必傳參數為空', '2018-01-06 13:20:51', 'Api', 'getActionList'),
(281, 'db', '无资料更新', '2018-01-06 14:37:23', 'Api', 'setUserPasswd'),
(282, 'db', '无资料更新', '2018-01-06 14:40:54', 'Api', 'setUserPasswd'),
(283, 'db', '无资料更新', '2018-01-06 14:42:36', 'Api', 'setMoneyPasswd'),
(284, 'db', '无资料更新', '2018-01-06 14:42:53', 'Api', 'setMoneyPasswd'),
(285, 'api', 'reponse 必傳參數為空', '2018-01-07 19:08:34', 'Api', 'getRechargenitInTypeList'),
(286, 'api', 'reponse 必傳參數為空', '2018-01-07 19:24:44', 'Api', 'addChildUser'),
(287, 'api', 'reponse 必傳參數為空', '2018-01-07 19:47:06', 'Api', 'addBalance'),
(288, 'api', 'reponse 必傳參數為空', '2018-01-07 19:47:15', 'Api', 'addBalance'),
(289, 'api', 'reponse 必傳參數為空', '2018-01-07 19:47:55', 'Api', 'addBalance'),
(290, 'api', 'reponse 必傳參數為空', '2018-01-07 19:48:03', 'Api', 'addBalance'),
(291, 'api', 'reponse 必傳參數為空', '2018-01-07 19:48:22', 'Api', 'addBalance'),
(292, 'api', 'reponse 必傳參數為空', '2018-01-07 19:48:30', 'Api', 'addBalance'),
(293, 'api', 'reponse 必傳參數為空', '2018-01-07 19:48:47', 'Api', 'addBalance'),
(294, 'api', 'reponse 必傳參數為空', '2018-01-07 19:49:42', 'Api', 'addBalance'),
(295, 'api', 'reponse 必傳參數為空', '2018-01-07 19:49:49', 'Api', 'addBalance'),
(296, 'api', 'reponse 必傳參數為空', '2018-01-07 19:50:23', 'Api', 'addBalance'),
(297, 'api', 'reponse 必傳參數為空', '2018-01-07 19:50:50', 'Api', 'addBalance'),
(298, 'api', 'reponse 必傳參數為空', '2018-01-07 19:50:54', 'Api', 'addBalance'),
(299, 'api', 'reponse 必傳參數為空', '2018-01-07 20:05:06', 'Api', 'addBalance'),
(300, 'api', 'reponse 必傳參數為空', '2018-01-07 20:06:55', 'Api', 'addBalance'),
(301, 'api', 'reponse 必傳參數為空', '2018-01-07 20:07:46', 'Api', 'addBalance'),
(302, 'api', 'reponse 必傳參數為空', '2018-01-07 20:07:57', 'Api', 'addBalance'),
(303, 'api', 'reponse 必傳參數為空', '2018-01-07 20:09:22', 'Api', 'addBalance'),
(304, 'api', 'reponse 必傳參數為空', '2018-01-07 20:10:39', 'Api', 'addBalance'),
(305, 'api', 'reponse 必傳參數為空', '2018-01-07 20:10:59', 'Api', 'addBalance'),
(306, 'api', '更新馀额失败', '2018-01-07 20:15:56', 'Api', 'addBalance'),
(307, 'api', '更新馀额失败', '2018-01-07 20:16:23', 'Api', 'addBalance'),
(308, 'api', '更新馀额失败', '2018-01-07 20:17:21', 'Api', 'addBalance'),
(309, 'api', '更新馀额失败', '2018-01-07 20:17:32', 'Api', 'addBalance'),
(310, 'api', 'reponse 必傳參數為空', '2018-01-07 20:18:29', 'Api', 'addBalance'),
(311, 'api', 'reponse 必傳參數為空', '2018-01-07 20:18:39', 'Api', 'addBalance'),
(312, 'api', '馀额要大于0', '2018-01-08 12:45:45', 'Api', 'addBalance'),
(313, 'api', '馀额要大于0', '2018-01-08 16:35:37', 'Api', 'addBalance'),
(314, 'api', 'reponse 必傳參數為空', '2018-01-08 17:15:43', 'Api', 'checkAudit'),
(315, 'api', 'reponse 必傳參數為空', '2018-01-08 18:22:06', 'Api', '__construct'),
(316, 'api', 'reponse 必傳參數為空', '2018-01-08 18:23:06', 'Api', '__construct'),
(317, 'api', 'reponse 必傳參數為空', '2018-01-08 18:23:19', 'Api', '__construct'),
(318, 'api', 'reponse 必傳參數為空', '2018-01-08 18:23:22', 'Api', '__construct'),
(319, 'api', 'reponse 必傳參數為空', '2018-01-08 18:23:29', 'Api', '__construct'),
(320, 'api', 'reponse 必傳參數為空', '2018-01-08 18:24:00', 'Api', '__construct'),
(321, 'api', 'reponse 必傳參數為空', '2018-01-08 18:36:03', 'Api', '__construct'),
(322, 'api', 'reponse 必傳參數為空', '2018-01-08 18:39:38', 'Api', '__construct'),
(323, 'api', 'reponse 必傳參數為空', '2018-01-08 18:39:43', 'Api', '__construct'),
(324, 'api', 'reponse 必傳參數為空', '2018-01-08 18:40:02', 'Api', '__construct'),
(325, 'api', 'reponse 必傳參數為空', '2018-01-08 18:40:21', 'Api', '__construct'),
(326, 'api', 'reponse 必傳參數為空', '2018-01-08 18:40:36', 'Api', '__construct'),
(327, 'api', 'reponse 必傳參數為空', '2018-01-08 18:41:22', 'Api', '__construct'),
(328, 'api', 'reponse 必傳參數為空', '2018-01-08 18:41:37', 'Api', '__construct'),
(329, 'api', 'reponse 必傳參數為空', '2018-01-08 18:41:57', 'Api', '__construct'),
(330, 'api', 'reponse 必傳參數為空', '2018-01-08 18:42:06', 'Api', '__construct'),
(331, 'api', 'reponse 必傳參數為空', '2018-01-08 18:42:09', 'Api', '__construct'),
(332, 'api', 'reponse 必傳參數為空', '2018-01-08 18:42:28', 'Api', '__construct'),
(333, 'api', 'reponse 必傳參數為空', '2018-01-08 18:42:44', 'Api', '__construct'),
(334, 'api', 'reponse 必傳參數為空', '2018-01-08 18:42:52', 'Api', '__construct'),
(335, 'api', 'reponse 必傳參數為空', '2018-01-08 18:43:01', 'Api', '__construct'),
(336, 'api', 'reponse 必傳參數為空', '2018-01-08 18:43:45', 'Api', '__construct'),
(337, 'api', 'reponse 必傳參數為空', '2018-01-08 18:44:01', 'Api', '__construct'),
(338, 'api', '無法取得使用者資料', '2018-01-09 12:17:30', 'Api', '__construct'),
(339, 'api', '無法取得使用者資料', '2018-01-09 12:17:53', 'Api', '__construct'),
(340, 'api', '無法取得使用者資料', '2018-01-09 12:18:12', 'Api', '__construct'),
(341, 'api', '無法取得使用者資料', '2018-01-09 12:18:21', 'Api', '__construct'),
(342, 'api', '無法取得使用者資料', '2018-01-09 12:19:41', 'Api', '__construct'),
(343, 'api', '無法取得使用者資料', '2018-01-09 12:19:55', 'Api', '__construct'),
(344, 'api', 'reponse 必傳參數為空', '2018-01-09 12:28:12', 'Api', '__construct'),
(345, 'api', 'reponse 必傳參數為空', '2018-01-09 16:21:59', 'Api', '__construct'),
(346, 'api', 'reponse 必傳參數為空', '2018-01-09 16:23:06', 'Api', '__construct'),
(347, 'api', 'reponse 必傳參數為空', '2018-01-09 16:24:51', 'Api', '__construct'),
(348, 'api', 'reponse 必傳參數為空', '2018-01-09 16:24:53', 'Api', '__construct'),
(349, 'api', 'reponse 必傳參數為空', '2018-01-09 16:24:55', 'Api', '__construct'),
(350, 'api', 'reponse 必傳參數為空', '2018-01-09 16:26:04', 'Api', '__construct'),
(351, 'api', 'reponse 必傳參數為空', '2018-01-09 16:29:18', 'Api', '__construct'),
(352, 'api', 'reponse 必傳參數為空', '2018-01-09 16:29:20', 'Api', '__construct'),
(353, 'api', 'reponse 必傳參數為空', '2018-01-09 16:29:46', 'Api', '__construct'),
(354, 'api', 'reponse 必傳參數為空', '2018-01-09 16:30:18', 'Api', '__construct'),
(355, 'api', 'reponse 必傳參數為空', '2018-01-09 16:30:21', 'Api', '__construct'),
(356, 'api', 'reponse 必傳參數為空', '2018-01-09 16:41:00', 'Api', '__construct'),
(357, 'api', 'reponse 必傳參數為空', '2018-01-09 16:44:16', 'Api', '__construct'),
(358, 'api', 'reponse 必傳參數為空', '2018-01-09 16:44:18', 'Api', '__construct'),
(359, 'api', 'reponse 必傳參數為空', '2018-01-09 16:45:48', 'Api', '__construct'),
(360, 'api', 'reponse 必傳參數為空', '2018-01-09 16:46:18', 'Api', '__construct'),
(361, 'api', 'reponse 必傳參數為空', '2018-01-09 16:46:52', 'Api', '__construct'),
(362, 'api', 'reponse 必傳參數為空', '2018-01-09 16:46:55', 'Api', '__construct'),
(363, 'api', 'reponse 必傳參數為空', '2018-01-09 16:47:02', 'Api', '__construct'),
(364, 'api', '帳號長度為8~12位', '2018-01-09 16:49:15', 'Api', 'addAdmin'),
(365, 'api', '此帳號已存在', '2018-01-09 16:50:47', 'Api', 'addAdmin'),
(366, 'api', 'reponse 必傳參數為空', '2018-01-09 16:52:28', 'Api', '__construct'),
(367, 'api', '帳號長度為8~12位', '2018-01-09 16:53:27', 'Api', 'addAdmin'),
(368, 'api', 'reponse 必傳參數為空', '2018-01-09 17:12:56', 'Api', '__construct'),
(369, 'api', 'reponse 必傳參數為空', '2018-01-09 17:13:42', 'Api', '__construct'),
(370, 'api', 'reponse 必傳參數為空', '2018-01-09 17:13:51', 'Api', '__construct'),
(371, 'api', 'reponse 必傳參數為空', '2018-01-09 17:14:08', 'Api', '__construct'),
(372, 'api', 'reponse 必傳參數為空', '2018-01-09 17:15:00', 'Api', '__construct'),
(373, 'api', 'reponse 必傳參數為空', '2018-01-09 17:15:05', 'Api', '__construct'),
(374, 'api', 'reponse 必傳參數為空', '2018-01-09 17:18:12', 'Api', '__construct'),
(375, 'api', '無法取得使用者資料', '2018-01-09 18:04:03', 'Api', '__construct'),
(376, 'api', '無法取得使用者資料', '2018-01-09 18:04:11', 'Api', '__construct'),
(377, 'api', '無法取得使用者資料', '2018-01-09 18:05:04', 'Api', '__construct'),
(378, 'api', '無法取得使用者資料', '2018-01-09 18:05:12', 'Api', '__construct'),
(379, 'api', '無法取得使用者資料', '2018-01-09 18:06:06', 'Api', '__construct'),
(380, 'api', '無法取得使用者資料', '2018-01-09 18:06:11', 'Api', '__construct'),
(381, 'api', '無法取得使用者資料', '2018-01-09 18:06:20', 'Api', '__construct'),
(382, 'api', '此帳號已存在', '2018-01-09 18:55:30', 'Api', 'addAdmin'),
(383, 'api', '帳號長度為8~12位', '2018-01-09 18:55:50', 'Api', 'addAdmin'),
(384, 'api', '帳號長度為8~12位', '2018-01-09 18:55:53', 'Api', 'addAdmin'),
(385, 'api', '帳號長度為8~12位', '2018-01-09 18:55:57', 'Api', 'addAdmin'),
(386, 'api', '帳號長度為8~12位', '2018-01-09 18:56:22', 'Api', 'addAdmin'),
(387, 'api', '無法取得使用者資料', '2018-01-09 19:05:11', 'Api', '__construct'),
(388, 'api', 'reponse 必傳參數為空', '2018-01-09 20:47:56', 'Api', 'getActionList'),
(389, 'api', 'reponse 必傳參數為空', '2018-01-10 17:09:29', 'Api', '__construct'),
(390, 'api', 'reponse 必傳參數為空', '2018-01-10 17:09:47', 'Api', '__construct'),
(391, 'api', 'reponse 必傳參數為空', '2018-01-10 17:10:15', 'Api', '__construct'),
(392, 'api', 'reponse 必傳參數為空', '2018-01-10 17:12:40', 'Api', '__construct'),
(393, 'api', 'reponse 必傳參數為空', '2018-01-10 17:16:13', 'Api', '__construct'),
(394, 'api', 'reponse 必傳參數為空', '2018-01-10 17:16:52', 'Api', '__construct'),
(395, 'api', 'reponse 必傳參數為空', '2018-01-10 17:24:34', 'Api', 'login'),
(396, 'api', 'reponse 必傳參數為空', '2018-01-10 17:25:24', 'Api', '__construct'),
(397, 'api', 'reponse 必傳參數為空', '2018-01-10 17:26:25', 'Api', 'login'),
(398, 'api', '尚未登入', '2018-01-10 17:29:49', 'Api', '__construct'),
(399, 'api', '尚未登入', '2018-01-10 17:30:17', 'Api', '__construct'),
(400, 'api', '無法取得使用者資料', '2018-01-10 17:31:16', 'Api', '__construct'),
(401, 'api', '尚未登入', '2018-01-10 17:31:34', 'Api', '__construct'),
(402, 'api', '使用者密碼不能與資金密碼相同', '2018-01-10 17:32:16', 'Api', 'setUserPassword'),
(403, 'api', '使用者密碼不能與資金密碼相同', '2018-01-10 17:32:52', 'Api', 'setUserPassword'),
(404, 'api', 'reponse 必傳參數為空', '2018-01-10 17:33:00', 'Api', 'setUserPassword'),
(405, 'api', 'reponse 必傳參數為空', '2018-01-10 17:33:34', 'Api', 'setUserPassword'),
(406, 'api', 'reponse 必傳參數為空', '2018-01-10 17:44:40', 'Api', '__construct'),
(407, 'api', 'reponse 必傳參數為空', '2018-01-10 17:53:20', 'Api', '__construct'),
(408, 'api', 'reponse 必傳參數為空', '2018-01-10 18:01:17', 'Api', '__construct'),
(409, 'api', 'reponse 必傳參數為空', '2018-01-10 20:37:40', 'Api', '__construct'),
(410, 'api', 'reponse 必傳參數為空', '2018-01-10 23:11:17', 'Api', '__construct'),
(411, 'api', 'reponse 必傳參數為空', '2018-01-11 22:18:15', 'Api', '__construct'),
(412, 'db', '无资料更新', '2018-01-14 00:11:18', 'Api', 'delAnnouncemet'),
(413, 'db', '无资料更新', '2018-01-14 00:11:26', 'Api', 'delAnnouncemet'),
(414, 'db', '无资料更新', '2018-01-14 00:11:50', 'Api', 'delAnnouncemet'),
(415, 'db', '无资料更新', '2018-01-14 00:12:04', 'Api', 'delAnnouncemet'),
(416, 'db', '无资料更新', '2018-01-14 00:12:15', 'Api', 'delAnnouncemet'),
(417, 'db', '无资料更新', '2018-01-14 00:12:37', 'Api', 'delAnnouncemet'),
(418, 'db', '无资料更新', '2018-01-14 00:12:40', 'Api', 'delAnnouncemet'),
(419, 'db', '无资料更新', '2018-01-14 00:12:55', 'Api', 'delAnnouncemet'),
(420, 'db', '无资料更新', '2018-01-14 00:15:54', 'Api', 'delAnnouncemet'),
(421, 'db', '无资料更新', '2018-01-14 00:16:23', 'Api', 'delAnnouncemet'),
(422, 'db', '无资料更新', '2018-01-14 00:16:42', 'Api', 'delAnnouncemet'),
(423, 'api', '無法取得使用者資料', '2018-01-14 13:13:27', 'Api', '__construct'),
(424, 'api', '尚未登入', '2018-01-14 16:55:09', 'Api', '__construct'),
(425, 'api', '尚未登入', '2018-01-14 16:55:13', 'Api', '__construct'),
(426, 'api', 'reponse 必傳參數為空', '2018-01-14 16:55:32', 'Api', 'login'),
(427, 'api', '密碼錯誤', '2018-01-14 16:55:41', 'Api', 'login'),
(428, 'api', '尚未登入', '2018-01-14 16:57:00', 'Api', '__construct'),
(429, 'api', '尚未登入', '2018-01-14 16:57:06', 'Api', '__construct'),
(430, 'api', '尚未登入', '2018-01-14 16:57:24', 'Api', '__construct'),
(431, 'api', '尚未登入1', '2018-01-14 16:57:38', 'Api', '__construct'),
(432, 'api', '尚未登入', '2018-01-14 16:57:42', 'Api', '__construct'),
(433, 'api', '尚未登入', '2018-01-14 16:57:54', 'Api', '__construct'),
(434, 'api', '尚未登入', '2018-01-14 16:58:23', 'Api', '__construct'),
(435, 'api', '尚未登入', '2018-01-14 16:58:26', 'Api', '__construct'),
(436, 'api', '尚未登入', '2018-01-14 16:59:10', 'Api', '__construct'),
(437, 'api', '尚未登入', '2018-01-14 16:59:36', 'Api', '__construct'),
(438, 'api', '尚未登入', '2018-01-14 17:02:43', 'Api', '__construct'),
(439, 'api', '尚未登入', '2018-01-14 17:02:49', 'Api', '__construct'),
(440, 'api', '尚未登入', '2018-01-14 17:02:50', 'Api', '__construct'),
(441, 'api', '尚未登入', '2018-01-14 17:02:51', 'Api', '__construct'),
(442, 'api', '尚未登入', '2018-01-14 17:03:08', 'Api', '__construct'),
(443, 'api', 'reponse 必傳參數為空', '2018-01-14 17:03:49', 'Api', 'login'),
(444, 'api', 'reponse 必傳參數為空', '2018-01-14 17:04:51', 'Api', '__construct'),
(445, 'api', '尚未登入', '2018-01-14 17:05:05', 'Api', '__construct'),
(446, 'api', '尚未登入', '2018-01-14 17:07:32', 'Api', '__construct'),
(447, 'api', '無法取得使用者資料', '2018-01-14 17:09:24', 'Api', '__construct'),
(448, 'api', 'reponse 必傳參數為空', '2018-01-14 17:10:27', 'Api', '__construct'),
(449, 'api', 'reponse 必傳參數為空', '2018-01-14 17:10:43', 'Api', '__construct'),
(450, 'api', 'reponse 必傳參數為空', '2018-01-14 17:11:02', 'Api', '__construct'),
(451, 'api', '無法取得使用者資料', '2018-01-14 17:11:27', 'Api', '__construct'),
(452, 'system', '參數輸入有誤', '2018-01-14 17:25:30', 'Api', 'setUserBankInfo'),
(453, 'db', 'You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'1  FROM user WHERE u_id = \'1\'\' at line 1', '2018-01-14 17:27:58', 'Api', 'setUserBankInfo'),
(454, 'api', 'reponse 必傳參數為空', '2018-01-14 17:59:52', 'Api', 'setUserBankInfo'),
(455, 'api', 'reponse 必傳參數為空', '2018-01-14 18:01:57', 'Api', 'setUserBankInfo'),
(456, 'db', '此銀行帳號已被綁定', '2018-01-14 18:04:21', 'Api', 'setUserBankInfo'),
(457, 'api', '分行必須為簡體中文', '2018-01-14 18:13:55', 'Api', 'setUserBankInfo'),
(458, 'db', '此銀行帳號已被綁定', '2018-01-14 18:14:13', 'Api', 'setUserBankInfo'),
(459, 'api', '支行名称長度為1-20個字符串', '2018-01-14 18:15:58', 'Api', 'setUserBankInfo'),
(460, 'db', '此銀行帳號已被綁定', '2018-01-14 18:16:34', 'Api', 'setUserBankInfo'),
(461, 'api', '支行名称長度為1-20個字符串', '2018-01-14 18:16:44', 'Api', 'setUserBankInfo'),
(462, 'db', '此銀行帳號已被綁定', '2018-01-14 18:16:51', 'Api', 'setUserBankInfo'),
(463, 'api', '开户银行省份必須為簡體中文', '2018-01-14 18:17:48', 'Api', 'setUserBankInfo'),
(464, 'db', '此銀行帳號已被綁定', '2018-01-14 18:18:15', 'Api', 'setUserBankInfo'),
(465, 'api', '开户人姓名必須為中文', '2018-01-14 18:19:50', 'Api', 'setUserBankInfo'),
(466, 'db', '此銀行帳號已被綁定', '2018-01-14 18:20:05', 'Api', 'setUserBankInfo'),
(467, 'db', '此銀行帳號已被綁定', '2018-01-14 20:18:48', 'Api', 'setUserBankInfo'),
(468, 'api', '银行卡号为16～19位数字组成', '2018-01-14 20:21:08', 'Api', 'setUserBankInfo'),
(469, 'api', '银行卡号为16～19位数字组成', '2018-01-14 20:21:18', 'Api', 'setUserBankInfo'),
(470, 'db', '此銀行帳號已被綁定', '2018-01-14 20:22:41', 'Api', 'setUserBankInfo'),
(471, 'db', '此銀行帳號已被綁定', '2018-01-14 20:24:09', 'Api', 'setUserBankInfo'),
(472, 'db', '此銀行帳號已被綁定', '2018-01-14 20:24:53', 'Api', 'setUserBankInfo'),
(473, 'db', '此銀行帳號已被綁定', '2018-01-14 20:26:07', 'Api', 'setUserBankInfo'),
(474, 'api', 'reponse 必傳參數為空', '2018-01-15 00:28:39', 'Api', 'registered'),
(475, 'api', '無法註冊總代號', '2018-01-15 00:29:03', 'Api', 'registered'),
(476, 'api', '使用者帳號已存在', '2018-01-15 00:32:18', 'Api', 'registered'),
(477, 'api', 'reponse 必傳參數為空', '2018-01-15 00:45:06', 'Api', '__construct'),
(478, 'api', 'reponse 必傳參數為空', '2018-01-15 00:45:40', 'Api', '__construct'),
(479, 'api', 'reponse 必傳參數為空', '2018-01-15 00:46:10', 'Api', '__construct'),
(480, 'api', 'reponse 必傳參數為空', '2018-01-15 00:46:34', 'Api', '__construct'),
(481, 'api', 'reponse 必傳參數為空', '2018-01-15 00:46:53', 'Api', '__construct'),
(482, 'api', 'reponse 必傳參數為空', '2018-01-15 00:48:40', 'Api', '__construct'),
(483, 'api', 'reponse 必傳參數為空', '2018-01-15 00:49:03', 'Api', '__construct'),
(484, 'api', '尚未登入', '2018-01-15 12:14:45', 'Api', '__construct'),
(485, 'api', 'reponse 必傳參數為空', '2018-01-15 12:27:47', 'Api', 'sendUserMessage'),
(486, 'api', 'reponse 必傳參數為空', '2018-01-15 12:28:28', 'Api', 'sendUserMessage'),
(487, 'api', 'reponse 必傳參數為空', '2018-01-15 12:28:33', 'Api', 'sendUserMessage'),
(488, 'api', 'reponse 必傳參數為空', '2018-01-15 12:28:37', 'Api', 'sendUserMessage'),
(489, 'api', 'reponse 必傳參數為空', '2018-01-15 12:29:02', 'Api', 'sendUserMessage'),
(490, 'api', 'reponse 必傳參數為空', '2018-01-15 12:29:16', 'Api', 'sendUserMessage'),
(491, 'api', 'reponse 必傳參數1為空', '2018-01-15 12:29:21', 'Api', 'sendUserMessage'),
(492, 'db', '无下级使用者', '2018-01-15 12:43:07', 'Api', 'sendUserMessage'),
(493, 'db', '无下级使用者', '2018-01-15 12:45:13', 'Api', 'sendSubordinateUserMessage'),
(494, 'api', 'reponse 必傳參數為空', '2018-01-15 12:55:14', 'Api', 'sendSubordinateUserMessage'),
(495, 'api', 'reponse 必傳參數為空', '2018-01-15 12:55:40', 'Api', 'sendSubordinateUserMessage'),
(496, 'api', 'reponse 必傳參數為空', '2018-01-15 12:59:36', 'Api', 'sendSubordinateUserMessage'),
(497, 'api', 'reponse 必傳參數為空', '2018-01-15 12:59:48', 'Api', 'sendSubordinateUserMessage'),
(498, 'api', 'reponse 必傳參數為空', '2018-01-15 12:59:58', 'Api', 'sendSubordinateUserMessage'),
(499, 'api', 'reponse 必傳參數1為空', '2018-01-15 13:00:08', 'Api', 'sendSubordinateUserMessage'),
(500, 'api', 'reponse 必傳參數為空', '2018-01-15 13:00:34', 'Api', 'sendSubordinateUserMessage'),
(501, 'db', '新增站内讯息失败', '2018-01-15 13:01:53', 'Api', 'sendSubordinateUserMessage'),
(502, 'db', '新增站内讯息失败', '2018-01-15 13:02:47', 'Api', 'sendSubordinateUserMessage'),
(503, 'db', '无下级使用者', '2018-01-15 16:53:53', 'Api', 'sendSubordinateUserMessage'),
(504, 'db', '无下级使用者', '2018-01-15 16:53:57', 'Api', 'sendSubordinateUserMessage'),
(505, 'db', '无此下级使用者', '2018-01-15 16:56:45', 'Api', 'sendSubordinateUserMessage'),
(506, 'db', '无此下级使用者', '2018-01-15 16:57:11', 'Api', 'sendSubordinateUserMessage'),
(507, 'db', '无此下级使用者', '2018-01-15 16:57:40', 'Api', 'sendSubordinateUserMessage'),
(508, 'db', '无此下级使用者', '2018-01-15 16:57:47', 'Api', 'sendSubordinateUserMessage'),
(509, 'db', '无此下级使用者', '2018-01-15 16:57:58', 'Api', 'sendSubordinateUserMessage'),
(510, 'db', '无此下级使用者', '2018-01-15 16:58:10', 'Api', 'sendSubordinateUserMessage'),
(511, 'api', 'reponse 必傳參數為空', '2018-01-15 17:05:15', 'Api', '__construct'),
(512, 'api', 'reponse 必傳參數為空', '2018-01-15 17:05:35', 'Api', '__construct'),
(513, 'api', '总代用互无上级', '2018-01-15 17:10:00', 'Api', 'sendSuperiorUserMessage'),
(514, 'api', '無法取得使用者資料', '2018-01-15 17:20:54', 'Api', '__construct'),
(515, 'api', 'reponse 必傳參數為空', '2018-01-15 17:33:05', 'Api', 'getUserMessage'),
(516, 'api', 'reponse 必傳參數為空', '2018-01-15 17:45:52', 'Api', '__construct'),
(517, 'api', '尚未登入', '2018-01-16 10:28:55', 'Api', '__construct'),
(518, 'api', '尚未登入', '2018-01-16 10:29:06', 'Api', '__construct'),
(519, 'api', '尚未登入', '2018-01-16 10:29:54', 'Api', '__construct'),
(520, 'api', '尚未登入', '2018-01-16 10:29:56', 'Api', '__construct'),
(521, 'api', '尚未登入', '2018-01-16 10:29:57', 'Api', '__construct'),
(522, 'api', '尚未登入', '2018-01-16 10:29:57', 'Api', '__construct'),
(523, 'api', 'reponse 必傳參數為空', '2018-01-16 10:31:02', 'Api', 'withdrawal'),
(524, 'api', '提款额必须大于0', '2018-01-16 11:24:52', 'Api', 'withdrawal'),
(525, 'api', '提款额必须大于0', '2018-01-16 11:25:14', 'Api', 'withdrawal'),
(526, 'api', '提款额必须大于0', '2018-01-16 11:25:20', 'Api', 'withdrawal'),
(527, 'api', 'reponse 必傳參數為空', '2018-01-16 11:25:24', 'Api', 'withdrawal'),
(528, 'api', 'reponse 必傳參數為空', '2018-01-16 11:25:25', 'Api', 'withdrawal'),
(529, 'api', 'reponse 必傳參數為空', '2018-01-16 11:25:35', 'Api', 'withdrawal'),
(530, 'api', '提款额必须大于0', '2018-01-16 11:25:52', 'Api', 'withdrawal'),
(531, 'system', '馀额不足', '2018-01-16 11:33:35', 'Api', 'withdrawal'),
(532, 'system', '馀额不足', '2018-01-16 11:34:03', 'Api', 'withdrawal'),
(533, 'system', '馀额不足', '2018-01-16 11:35:12', 'Api', 'withdrawal'),
(534, 'system', '馀额不足', '2018-01-16 11:35:16', 'Api', 'withdrawal'),
(535, 'system', '尚未绑定银行卡', '2018-01-16 11:37:06', 'Api', 'withdrawal'),
(536, 'api', '無法取得使用者資料', '2018-01-16 11:40:15', 'Api', '__construct'),
(537, 'api', 'reponse 必傳參數為空', '2018-01-16 11:43:05', 'Api', '__construct'),
(538, 'api', 'reponse 必傳參數為空', '2018-01-16 11:50:46', 'Api', '__construct'),
(539, 'api', 'reponse 必傳參數為空', '2018-01-16 11:50:58', 'Api', 'report'),
(540, 'api', 'reponse 必傳參數為空', '2018-01-16 11:51:05', 'Api', 'report'),
(541, 'api', '无资料更新', '2018-01-18 12:42:43', 'Api', 'doWithdrawalAudit'),
(542, 'api', '无资料更新', '2018-01-18 18:36:08', 'Api', 'doWithdrawalAudit'),
(543, 'api', '无资料更新', '2018-01-18 19:06:27', 'Api', 'doWithdrawalAudit'),
(544, 'api', '无资料更新', '2018-01-18 19:12:12', 'Api', 'doWithdrawalAudit'),
(545, 'api', '无资料更新', '2018-01-18 19:12:21', 'Api', 'doWithdrawalAudit'),
(546, 'api', '无资料更新', '2018-01-18 19:15:54', 'Api', 'doWithdrawalAudit'),
(547, 'api', '无资料更新', '2018-01-18 19:27:48', 'Api', 'doWithdrawalAudit'),
(548, 'api', '无资料更新', '2018-01-18 19:28:07', 'Api', 'doWithdrawalAudit'),
(549, 'api', '无资料更新', '2018-01-18 20:07:24', 'Api', 'doRechargeAudit'),
(550, 'api', '无资料更新', '2018-01-18 20:07:37', 'Api', 'doRechargeAudit'),
(551, 'api', '无资料更新', '2018-01-18 20:07:41', 'Api', 'doRechargeAudit'),
(552, 'api', '无资料更新', '2018-01-18 20:07:58', 'Api', 'doRechargeAudit'),
(553, 'api', '无资料更新', '2018-01-18 20:08:00', 'Api', 'doRechargeAudit'),
(554, 'api', '无资料更新', '2018-01-18 20:08:07', 'Api', 'doRechargeAudit'),
(555, 'api', '無法取得使用者資料', '2018-01-18 20:13:59', 'Api', '__construct'),
(556, 'api', 'reponse 必傳參數為空', '2018-01-18 20:22:38', 'Api', 'withdrawal'),
(557, 'api', 'reponse 必傳參數為空', '2018-01-18 20:22:49', 'Api', 'withdrawal'),
(558, 'system', '馀额不足', '2018-01-18 20:23:54', 'Api', 'withdrawal'),
(559, 'db', '无资料更新', '2018-01-18 21:17:01', 'Api', 'doSetUserPasswd'),
(560, 'api', '无资料更新', '2018-01-18 21:43:23', 'Api', 'doRechargeAudit'),
(561, 'api', '无资料更新', '2018-01-18 21:43:32', 'Api', 'doRechargeAudit'),
(562, 'api', '无资料更新', '2018-01-18 21:44:52', 'Api', 'doWithdrawalAudit'),
(563, 'api', '无资料更新', '2018-01-18 21:45:02', 'Api', 'doWithdrawalAudit'),
(564, 'api', '无资料更新', '2018-01-18 21:45:15', 'Api', 'doWithdrawalAudit'),
(565, 'system', '馀额不足', '2018-01-18 21:45:52', 'Api', 'withdrawal'),
(566, 'db', '无资料更新', '2018-01-18 23:16:12', 'Api', 'setMoneyPasswd'),
(567, 'db', '无资料更新', '2018-01-18 23:16:33', 'Api', 'setMoneyPasswd'),
(568, 'db', '无资料更新', '2018-01-18 23:16:35', 'Api', 'setMoneyPasswd'),
(569, 'db', '无资料更新', '2018-01-18 23:16:55', 'Api', 'setMoneyPasswd'),
(570, 'db', '无资料更新', '2018-01-18 23:19:11', 'Api', 'setMoneyPasswd'),
(571, 'db', '无资料更新', '2018-01-18 23:22:27', 'Api', 'doSetUserPasswd'),
(572, 'db', '无资料更新', '2018-01-18 23:22:39', 'Api', 'setMoneyPasswd'),
(573, 'db', '无资料更新', '2018-01-18 23:23:39', 'Api', 'doSetUserPasswd'),
(574, 'db', '无资料更新', '2018-01-18 23:23:40', 'Api', 'doSetUserPasswd'),
(575, 'db', '无资料更新', '2018-01-18 23:23:40', 'Api', 'doSetUserPasswd'),
(576, 'db', '无资料更新', '2018-01-18 23:23:40', 'Api', 'doSetUserPasswd'),
(577, 'db', '无资料更新', '2018-01-18 23:23:41', 'Api', 'doSetUserPasswd'),
(578, 'db', '无资料更新', '2018-01-18 23:23:42', 'Api', 'doSetUserPasswd'),
(579, 'db', '无资料更新', '2018-01-18 23:23:46', 'Api', 'doSetUserPasswd'),
(580, 'db', '无资料更新', '2018-01-18 23:24:31', 'Api', 'doSetUserPasswd'),
(581, 'db', '无资料更新', '2018-01-18 23:25:09', 'Api', 'doSetUserPasswd'),
(582, 'db', '无资料更新', '2018-01-18 23:25:37', 'Api', 'doSetUserPasswd'),
(583, 'db', '无资料更新', '2018-01-18 23:25:40', 'Api', 'doSetUserPasswd'),
(584, 'db', '无资料更新', '2018-01-18 23:25:58', 'Api', 'doSetUserPasswd'),
(585, 'db', '无资料更新', '2018-01-18 23:26:01', 'Api', 'setMoneyPasswd'),
(586, 'db', '无资料更新', '2018-01-18 23:26:24', 'Api', 'setMoneyPasswd'),
(587, 'db', '无资料更新', '2018-01-18 23:26:34', 'Api', 'setMoneyPasswd'),
(588, 'db', '无资料更新', '2018-01-18 23:27:23', 'Api', 'setMoneyPasswd'),
(589, 'db', '无资料更新', '2018-01-18 23:27:50', 'Api', 'setMoneyPasswd'),
(590, 'db', '无资料更新', '2018-01-18 23:28:04', 'Api', 'setMoneyPasswd'),
(591, 'db', '无资料更新', '2018-01-18 23:28:43', 'Api', 'setMoneyPasswd'),
(592, 'api', '不能与使用者密码一致', '2018-01-18 23:28:58', 'Api', 'setMoneyPasswd'),
(593, 'api', '不能与使用者密码一致', '2018-01-18 23:29:42', 'Api', 'setMoneyPasswd'),
(594, 'db', '无资料更新', '2018-01-18 23:32:27', 'Api', 'doSetUserPasswd'),
(595, 'api', '無法取得使用者資料', '2018-01-18 23:43:35', 'Api', '__construct'),
(596, 'api', '無法取得使用者資料', '2018-01-18 23:43:42', 'Api', '__construct'),
(597, 'api', '帳號長度為8~12位', '2018-01-18 23:54:07', 'Api', 'addParentUser'),
(598, 'api', '密碼長度為8~12位', '2018-01-18 23:54:11', 'Api', 'addParentUser'),
(599, 'api', '密碼錯誤', '2018-01-19 11:16:26', 'Api', 'login'),
(600, 'api', '密碼錯誤', '2018-01-19 11:16:34', 'Api', 'login'),
(601, 'api', '密碼錯誤', '2018-01-19 11:16:46', 'Api', 'login'),
(602, 'api', '密碼錯誤', '2018-01-19 11:16:53', 'Api', 'login'),
(603, 'api', 'reponse 必傳參數為空', '2018-01-19 22:33:45', 'Api', '__construct'),
(604, 'api', 'reponse 必傳參數為空', '2018-01-19 22:33:52', 'Api', '__construct'),
(605, 'api', 'reponse 必傳參數為空', '2018-01-19 22:35:02', 'Api', '__construct'),
(606, 'api', 'reponse 必傳參數為空', '2018-01-19 22:40:48', 'Api', '__construct'),
(607, 'api', 'reponse 必傳參數為空', '2018-01-19 22:46:57', 'Api', '__construct'),
(608, 'api', 'reponse 必傳參數為空', '2018-01-19 22:52:39', 'Api', '__construct'),
(609, 'api', 'reponse 必傳參數為空', '2018-01-19 23:03:13', 'Api', 'addAnnouncemet'),
(610, 'api', '<p>You did not select a file to upload.</p>', '2018-01-19 23:18:38', 'Api', 'addAnnouncemet'),
(611, 'api', '<p>You did not select a file to upload.</p>', '2018-01-19 23:19:24', 'Api', 'addAnnouncemet'),
(612, 'api', 'You did not select a file to upload.', '2018-01-19 23:22:51', 'Api', 'addAnnouncemet'),
(613, 'api', 'The upload path does not appear to be valid.', '2018-01-19 23:23:11', 'Api', 'addAnnouncemet'),
(614, 'api', '图片上传失败', '2018-01-19 23:24:41', 'Api', 'addAnnouncemet'),
(615, 'api', '图片上传失败', '2018-01-19 23:26:24', 'Api', 'addAnnouncemet'),
(616, 'api', '图片上传失败', '2018-01-19 23:26:51', 'Api', 'addAnnouncemet'),
(617, 'api', '图片上传失败', '2018-01-19 23:27:16', 'Api', 'addAnnouncemet'),
(618, 'api', '图片上传失败', '2018-01-19 23:27:36', 'Api', 'addAnnouncemet'),
(619, 'api', 'The filetype you are attempting to upload is not allowed.', '2018-01-20 13:50:51', 'Api', 'addAnnouncemet'),
(620, 'api', 'The filetype you are attempting to upload is not allowed.', '2018-01-20 15:53:48', 'Api', 'addAnnouncemet'),
(621, 'api', 'You did not select a file to upload.', '2018-01-20 15:54:21', 'Api', 'addAnnouncemet'),
(622, 'api', 'The filetype you are attempting to upload is not allowed.', '2018-01-20 15:54:39', 'Api', 'addAnnouncemet'),
(623, 'api', 'The upload path does not appear to be valid.', '2018-01-20 16:01:27', 'Api', 'addAnnouncemet'),
(624, 'api', 'The upload path does not appear to be valid.', '2018-01-20 16:02:01', 'Api', 'addAnnouncemet'),
(625, 'api', 'The upload path does not appear to be valid.', '2018-01-20 16:02:43', 'Api', 'addAnnouncemet'),
(626, 'api', 'The upload path does not appear to be valid.', '2018-01-20 16:03:13', 'Api', 'addAnnouncemet'),
(627, 'api', 'You did not select a file to upload.', '2018-01-20 16:10:42', 'Api', 'addAnnouncemet'),
(628, 'api', '無法取得使用者資料', '2018-01-20 17:13:11', 'Api', '__construct'),
(629, 'db', '无资料更新', '2018-01-20 18:23:12', 'Api', 'editAnnouncemet'),
(630, 'db', '无资料更新', '2018-01-20 18:23:31', 'Api', 'editAnnouncemet'),
(631, 'db', '无资料更新', '2018-01-20 18:26:02', 'Api', 'editAnnouncemet'),
(632, 'db', '无资料更新', '2018-01-20 19:06:52', 'Api', 'editAnnouncemet'),
(633, 'api', '必傳參數為空', '2018-01-20 19:09:06', 'Api', 'editAnnouncemet'),
(634, 'db', '无资料更新', '2018-01-20 19:09:22', 'Api', 'editAnnouncemet'),
(635, 'db', '无资料更新', '2018-01-20 19:09:29', 'Api', 'editAnnouncemet'),
(636, 'api', '必傳參數為空', '2018-01-20 19:09:49', 'Api', 'editAnnouncemet'),
(637, 'api', '必傳參數為空', '2018-01-20 19:10:37', 'Api', 'editAnnouncemet'),
(638, 'api', '必傳參數為空', '2018-01-20 19:10:48', 'Api', 'editAnnouncemet'),
(639, 'api', '必傳參數為空', '2018-01-20 19:11:20', 'Api', 'editAnnouncemet'),
(640, 'api', '必傳參數為空', '2018-01-20 19:11:32', 'Api', 'editAnnouncemet'),
(641, 'api', '必傳參數為空', '2018-01-20 19:11:48', 'Api', 'editAnnouncemet'),
(642, 'api', '必傳參數為空', '2018-01-20 19:12:00', 'Api', 'editAnnouncemet'),
(643, 'api', '必傳參數為空', '2018-01-20 19:12:36', 'Api', 'editAnnouncemet'),
(644, 'api', '必傳參數為空', '2018-01-20 19:12:49', 'Api', 'editAnnouncemet'),
(645, 'api', '必傳參數為空', '2018-01-20 19:13:00', 'Api', 'editAnnouncemet'),
(646, 'api', '必傳參數為空', '2018-01-20 19:13:55', 'Api', 'editAnnouncemet'),
(647, 'api', '必傳參數為空', '2018-01-20 19:14:00', 'Api', 'editAnnouncemet'),
(648, 'api', '必傳參數為空', '2018-01-20 19:14:31', 'Api', 'editAnnouncemet'),
(649, 'api', '必傳參數為空', '2018-01-20 19:14:51', 'Api', 'editAnnouncemet'),
(650, 'db', '无资料更新', '2018-01-20 19:16:01', 'Api', 'editAnnouncemet'),
(651, 'api', '必傳參數為空', '2018-01-20 19:16:14', 'Api', 'editAnnouncemet'),
(652, 'api', '必傳參數為空', '2018-01-20 19:16:23', 'Api', 'editAnnouncemet'),
(653, 'api', '新增公告失败', '2018-01-20 19:17:05', 'Api', 'editAnnouncemet'),
(654, 'api', '新增公告失败', '2018-01-20 19:17:25', 'Api', 'editAnnouncemet'),
(655, 'api', '新增公告失败', '2018-01-20 19:17:36', 'Api', 'editAnnouncemet'),
(656, 'api', 'You did not select a file to upload.', '2018-01-20 19:25:21', 'Api', 'editAnnouncemet'),
(657, 'api', 'You did not select a file to upload.', '2018-01-20 19:25:54', 'Api', 'editAnnouncemet'),
(658, 'api', 'You did not select a file to upload.', '2018-01-20 19:26:13', 'Api', 'editAnnouncemet'),
(659, 'api', 'You did not select a file to upload.', '2018-01-20 19:27:02', 'Api', 'editAnnouncemet'),
(660, 'api', 'You did not select a file to upload.', '2018-01-20 19:27:43', 'Api', 'editAnnouncemet'),
(661, 'api', '新增公告失败', '2018-01-20 19:27:56', 'Api', 'editAnnouncemet'),
(662, 'api', '尚未登入', '2018-01-20 19:40:10', 'Api', '__construct'),
(663, 'api', '尚未登入', '2018-01-20 19:40:13', 'Api', '__construct'),
(664, 'api', '無法取得使用者資料', '2018-01-20 20:00:25', 'Api', '__construct'),
(665, 'api', '無法取得使用者資料', '2018-01-20 20:00:29', 'Api', '__construct'),
(666, 'api', '無法取得使用者資料', '2018-01-20 20:00:37', 'Api', '__construct'),
(667, 'api', '無法取得使用者資料', '2018-01-20 20:00:51', 'Api', '__construct'),
(668, 'api', '無法取得使用者資料', '2018-01-20 20:05:08', 'Api', '__construct'),
(669, 'api', '無法取得使用者資料', '2018-01-20 20:05:10', 'Api', '__construct'),
(670, 'api', 'reponse 必傳參數為空', '2018-01-21 00:19:08', 'Api', 'getActionList'),
(671, 'api', 'reponse 必傳參數為空', '2018-01-21 00:19:12', 'Api', 'getActionList'),
(672, 'api', 'reponse 必傳參數為空', '2018-01-21 00:24:35', 'Api', 'getActionList'),
(673, 'api', 'reponse 必傳參數為空', '2018-01-21 00:24:40', 'Api', 'getActionList'),
(674, 'api', 'reponse 必傳參數為空', '2018-01-21 00:24:53', 'Api', 'getActionList'),
(675, 'api', 'reponse 必傳參數為空', '2018-01-21 00:24:57', 'Api', 'getActionList'),
(676, 'api', 'reponse 必傳參數為空', '2018-01-21 00:45:34', 'Api', '__construct'),
(677, 'api', 'reponse 必傳參數為空', '2018-01-21 00:45:49', 'Api', '__construct'),
(678, 'api', 'reponse 必傳參數為空', '2018-01-21 00:46:14', 'Api', '__construct'),
(679, 'api', 'reponse 必傳參數為空', '2018-01-21 00:46:42', 'Api', '__construct'),
(680, 'api', 'reponse 必傳參數為空', '2018-01-21 00:47:26', 'Api', '__construct');
INSERT INTO `api_error_log` (`ael_id`, `ael_type`, `aei_error_message`, `aei_add_datetime`, `aei_class`, `aei_function`) VALUES
(681, 'api', 'reponse 必傳參數為空', '2018-01-21 00:47:58', 'Api', '__construct'),
(682, 'api', 'reponse 必傳參數為空', '2018-01-21 00:48:12', 'Api', '__construct'),
(683, 'api', '新增失败', '2018-01-21 00:49:03', 'Api', 'addBigBalance'),
(684, 'api', '新增失败', '2018-01-21 00:49:30', 'Api', 'addBigBalance'),
(685, 'api', '新增失败', '2018-01-21 00:51:08', 'Api', 'addBigBalance'),
(686, 'api', 'The upload path does not appear to be valid.', '2018-01-21 11:45:27', 'Api', 'addBigBalance'),
(687, 'api', 'reponse 必傳參數為空', '2018-01-21 11:55:12', 'Api', 'getActionList'),
(688, 'api', 'reponse 必傳參數為空', '2018-01-21 14:48:04', 'Api', 'editBigBalanceInit'),
(689, 'api', 'reponse 必傳參數為空', '2018-01-21 15:08:18', 'Api', 'getActionList'),
(690, 'api', '必傳參數為空', '2018-01-21 15:11:09', 'Api', 'editBigBalance'),
(691, 'api', '必傳參數為空', '2018-01-21 15:11:35', 'Api', 'editBigBalance'),
(692, 'api', 'The image you are attempting to upload doesn\'t fit into the allowed dimensions.', '2018-01-21 15:12:46', 'Api', 'editBigBalance'),
(693, 'api', 'The image you are attempting to upload doesn\'t fit into the allowed dimensions.', '2018-01-21 15:13:05', 'Api', 'editBigBalance'),
(694, 'api', '必傳參數為空', '2018-01-21 15:13:17', 'Api', 'editBigBalance'),
(695, 'api', 'reponse 必傳參數為空', '2018-01-21 15:13:18', 'Api', 'getActionList'),
(696, 'api', '必傳參數為空', '2018-01-21 15:13:34', 'Api', 'editBigBalance'),
(697, 'db', '无资料更新', '2018-01-21 15:14:54', 'Api', 'editBigBalance'),
(698, 'api', 'The image you are attempting to upload doesn\'t fit into the allowed dimensions.', '2018-01-21 15:15:03', 'Api', 'editBigBalance'),
(699, 'db', '无资料更新', '2018-01-21 15:16:50', 'Api', 'editBigBalance'),
(700, 'db', '无资料更新', '2018-01-21 15:17:51', 'Api', 'editBigBalance'),
(701, 'db', '无资料更新', '2018-01-21 15:18:08', 'Api', 'editBigBalance'),
(702, 'api', 'reponse 必傳參數為空', '2018-01-21 16:23:09', 'Api', 'delBigBanner'),
(703, 'api', 'reponse 必傳參數為空', '2018-01-21 16:23:19', 'Api', 'delBigBanner'),
(704, 'api', '参数传递错误', '2018-01-22 11:20:59', 'Api', 'setFooterInit'),
(705, 'api', '取得资料失败', '2018-01-22 12:09:06', 'Api', 'setFooterInit'),
(706, 'api', '更新连结', '2018-01-22 12:36:19', 'Api', 'editFooter'),
(707, 'api', '更新失败', '2018-01-22 12:58:50', 'Api', 'editFooter'),
(708, 'api', '更新失败', '2018-01-22 12:59:23', 'Api', 'editFooter'),
(709, 'api', '更新失败', '2018-01-22 12:59:32', 'Api', 'editFooter'),
(710, 'api', '必傳參數為空', '2018-01-22 13:00:47', 'Api', 'editFooter'),
(711, 'api', '无资料更新', '2018-01-22 13:36:59', 'Api', 'doWithdrawalAudit'),
(712, 'api', '已出款拒绝出款不能在修改', '2018-01-22 13:37:03', 'Api', 'doWithdrawalAudit'),
(713, 'api', '无资料更新', '2018-01-22 13:54:01', 'Api', 'doWithdrawalAudit'),
(714, 'api', '无资料更新', '2018-01-22 15:06:45', 'Api', 'doWithdrawalAudit'),
(715, 'api', '无资料更新', '2018-01-22 15:08:55', 'Api', 'doWithdrawalAudit'),
(716, 'api', '无资料更新', '2018-01-22 15:09:00', 'Api', 'doWithdrawalAudit'),
(717, 'api', '无资料更新', '2018-01-22 15:11:19', 'Api', 'doWithdrawalAudit'),
(718, 'api', '无资料更新', '2018-01-22 15:11:44', 'Api', 'doWithdrawalAudit'),
(719, 'api', '无资料更新', '2018-01-22 15:11:57', 'Api', 'doWithdrawalAudit'),
(720, 'api', '无资料更新', '2018-01-22 15:12:12', 'Api', 'doWithdrawalAudit'),
(721, 'api', '无资料更新', '2018-01-22 15:12:30', 'Api', 'doWithdrawalAudit'),
(722, 'db', '提款超过限制，一天只能出款三次，最高额度为300000', '2018-01-22 15:13:44', 'Api', 'doWithdrawalAudit'),
(723, 'db', '提款超过限制，一天只能出款三次，最高额度为300000', '2018-01-22 15:14:11', 'Api', 'doWithdrawalAudit'),
(724, 'api', '无法取得游戏列表', '2019-08-27 16:51:14', 'Api', 'getGameList'),
(725, 'api', '无法取得游戏列表', '2019-08-27 16:53:13', 'Api', 'getGameList'),
(726, 'api', '无法取得游戏列表', '2019-08-27 16:53:16', 'Api', 'getGameList'),
(727, 'api', '无法取得游戏列表', '2019-08-27 16:53:23', 'Api', 'getGameList'),
(728, 'api', '无法取得游戏列表', '2019-08-27 16:55:26', 'Api', 'getGameList'),
(729, 'api', '无法取得游戏列表', '2019-08-27 16:55:36', 'Api', 'getGameList'),
(730, 'api', '无法取得游戏列表', '2019-08-27 16:55:44', 'Api', 'getGameList'),
(731, 'api', '无法取得游戏列表', '2019-08-27 16:56:22', 'Api', 'getGameList'),
(732, 'api', '无法取得游戏列表', '2019-08-27 16:56:34', 'Api', 'getGameList'),
(733, 'api', '密碼錯誤', '2019-08-28 09:15:50', 'Api', 'login'),
(734, 'api', 'ag帐号长度为4~14位、由小写英文及数字组合', '2019-08-28 10:53:24', 'Api', 'doLogin'),
(735, 'api', 'ag帐号长度为4~14位、由小写英文及数字组合', '2019-08-28 10:53:24', 'Api', 'login'),
(736, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:54:52', 'Api', 'doLogin'),
(737, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:54:52', 'Api', 'login'),
(738, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:55:09', 'Api', 'doLogin'),
(739, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:55:09', 'Api', 'login'),
(740, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:55:41', 'Api', 'doLogin'),
(741, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:55:41', 'Api', 'login'),
(742, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:55:51', 'Api', 'doLogin'),
(743, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 10:55:51', 'Api', 'login'),
(744, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:07:37', 'Api', 'doLogin'),
(745, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:07:37', 'Api', 'login'),
(746, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:07:46', 'Api', 'doLogin'),
(747, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:07:46', 'Api', 'login'),
(748, 'api', '密碼錯誤', '2019-08-28 11:07:54', 'Api', 'login'),
(749, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:26', 'Api', 'doLogin'),
(750, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:26', 'Api', 'login'),
(751, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:32', 'Api', 'doLogin'),
(752, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:32', 'Api', 'login'),
(753, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:43', 'Api', 'doLogin'),
(754, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:43', 'Api', 'login'),
(755, 'api', 'a1g密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:55', 'Api', 'doLogin'),
(756, 'api', 'a1g密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:08:55', 'Api', 'login'),
(757, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:09:05', 'Api', 'doLogin'),
(758, 'api', 'ag密码长度为6~12位、由大小写英文及数字组合', '2019-08-28 11:09:05', 'Api', 'login'),
(759, 'api', NULL, '2019-08-28 11:10:11', 'Api', 'doLogin'),
(760, 'api', NULL, '2019-08-28 11:10:11', 'Api', 'login'),
(761, 'api', NULL, '2019-08-28 11:11:25', 'Api', 'doLogin'),
(762, 'api', NULL, '2019-08-28 11:11:25', 'Api', 'login'),
(763, 'api', NULL, '2019-08-28 11:14:04', 'Api', 'doLogin'),
(764, 'api', NULL, '2019-08-28 11:14:04', 'Api', 'login'),
(765, 'api', NULL, '2019-08-28 11:15:01', 'Api', 'doLogin'),
(766, 'api', NULL, '2019-08-28 11:15:01', 'Api', 'login'),
(767, 'api', NULL, '2019-08-28 14:01:25', 'Api', 'doLogin'),
(768, 'api', NULL, '2019-08-28 14:01:25', 'Api', 'login'),
(769, 'api', NULL, '2019-08-28 14:02:05', 'Api', 'doLogin'),
(770, 'api', NULL, '2019-08-28 14:02:05', 'Api', 'login'),
(771, 'api', NULL, '2019-08-28 14:02:19', 'Api', 'doLogin'),
(772, 'api', NULL, '2019-08-28 14:02:19', 'Api', 'login'),
(773, 'api', NULL, '2019-08-28 14:02:36', 'Api', 'doLogin'),
(774, 'api', NULL, '2019-08-28 14:02:36', 'Api', 'login'),
(775, 'api', NULL, '2019-08-28 14:03:04', 'Api', 'doLogin'),
(776, 'api', NULL, '2019-08-28 14:03:04', 'Api', 'login'),
(777, 'api', NULL, '2019-08-28 14:03:11', 'Api', 'doLogin'),
(778, 'api', NULL, '2019-08-28 14:03:11', 'Api', 'login'),
(779, 'api', NULL, '2019-08-28 14:03:42', 'Api', 'doLogin'),
(780, 'api', NULL, '2019-08-28 14:03:42', 'Api', 'login'),
(781, 'api', NULL, '2019-08-28 14:03:50', 'Api', 'doLogin'),
(782, 'api', NULL, '2019-08-28 14:03:50', 'Api', 'login'),
(783, 'api', NULL, '2019-08-28 14:03:58', 'Api', 'doLogin'),
(784, 'api', NULL, '2019-08-28 14:03:58', 'Api', 'login'),
(785, 'api', NULL, '2019-08-28 14:04:56', 'Api', 'doLogin'),
(786, 'api', NULL, '2019-08-28 14:04:56', 'Api', 'login'),
(787, 'api', NULL, '2019-08-28 14:05:49', 'Api', 'doLogin'),
(788, 'api', NULL, '2019-08-28 14:05:49', 'Api', 'login'),
(789, 'api', NULL, '2019-08-28 14:06:32', 'Api', 'doLogin'),
(790, 'api', NULL, '2019-08-28 14:06:32', 'Api', 'login'),
(791, 'api', '密碼錯誤', '2019-08-28 14:08:43', 'Api', 'login'),
(792, 'api', '密碼錯誤', '2019-08-28 14:17:03', 'Api', 'login');

-- --------------------------------------------------------

--
-- 資料表結構 `bank_info`
--

DROP TABLE IF EXISTS `bank_info`;
CREATE TABLE IF NOT EXISTS `bank_info` (
  `bi_id` int(11) NOT NULL AUTO_INCREMENT,
  `bi_name` varchar(50) NOT NULL,
  `bi_add_datetime` datetime NOT NULL,
  `bi_upd_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`bi_id`),
  UNIQUE KEY `bi_name` (`bi_name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `bank_info`
--

INSERT INTO `bank_info` (`bi_id`, `bi_name`, `bi_add_datetime`, `bi_upd_datetime`) VALUES
(1, '中国工商银行', '2018-01-14 00:00:00', '2018-01-14 00:00:00'),
(2, '中国农业银行', '2018-01-14 00:00:00', '2018-01-14 00:00:00'),
(3, '中国建设银行', '2018-01-14 00:00:00', '2018-01-14 00:00:00'),
(4, '中国民生银行', '2018-01-14 00:00:00', '2018-01-14 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `big_banner`
--

DROP TABLE IF EXISTS `big_banner`;
CREATE TABLE IF NOT EXISTS `big_banner` (
  `bb_id` int(11) NOT NULL AUTO_INCREMENT,
  `bb_order` int(11) NOT NULL DEFAULT '0',
  `bb_image` varchar(40) DEFAULT NULL,
  `bb_add_datetime` datetime NOT NULL,
  `bb_ position` enum('big') NOT NULL DEFAULT 'big',
  PRIMARY KEY (`bb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `big_banner`
--

INSERT INTO `big_banner` (`bb_id`, `bb_order`, `bb_image`, `bb_add_datetime`, `bb_ position`) VALUES
(5, 1, '3a5f0618daea2ea987c678183ee7ad69.jpg', '2018-01-21 16:24:51', 'big');

-- --------------------------------------------------------

--
-- 資料表結構 `captcha`
--

DROP TABLE IF EXISTS `captcha`;
CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('v417fpsdgnvlbs8064ulfoaphnka0038', '127.0.0.1', 1515924697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932343435323b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('a9vhq15gqjpngkqjig7186uan9aivrd3', '127.0.0.1', 1515925455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353435353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('fspmer05lhligqjg8f1fbs9fo0758ve6', '127.0.0.1', 1515925458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353435383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('325akc0q1cm93jjkdmei6vl2mm4f74bc', '127.0.0.1', 1515925530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353533303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('mremgdhvrbfa4kc0hg20b78onmh44hvv', '127.0.0.1', 1515925541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353534313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('e37267bd31ckiirt6hd74i9e7923p6mo', '127.0.0.1', 1515925558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353535383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('t383hk1nl966asmt3evvs6rogjtvfnc9', '127.0.0.1', 1515925571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353537313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('md0ft6i5d71fue89hvj5lm65lvcn174a', '127.0.0.1', 1515925610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353631303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('s6smqp606skre2ab7h3ukh9fdmcs85ko', '127.0.0.1', 1515925678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353637383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('nut6cs8k2u5f0hh9iliso881i7pjmr1q', '127.0.0.1', 1515925747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353734373b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('1t6vpnhda6gtn1pnjn9uvfo8vdq1kvl1', '127.0.0.1', 1515925781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932353738313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('shefnioe2tkrpikeklvl9rv3rgt9am93', '127.0.0.1', 1515927469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373436393b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('icfr2d0dsrg2nc6mpsnn730m03ao4591', '127.0.0.1', 1515927500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373530303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('n86c0a3om472ft6o6cv7k54qc8f5mvh8', '127.0.0.1', 1515927507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373530373b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('rnguebbm0atq02d9bgqpk7hbabltj010', '127.0.0.1', 1515927592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373539323b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('rvfhacsufpoic555p4bgffvomqrvdevg', '127.0.0.1', 1515927717, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373731373b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('lqddjdgdp6g3t5fenv5cq8a5if6cufu5', '127.0.0.1', 1515927786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373738363b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('1e8kagpvev4n7n329mn1s7g0eodi3rmv', '127.0.0.1', 1515927854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373835343b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('fsei3uh6jit5l62jo7o9k6f8f3a939tj', '127.0.0.1', 1515927861, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932373836313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('s1chrgk3a05dhsbrhflbd00eumslqh7f', '127.0.0.1', 1515928435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383433353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('vc83paiqug1fe4cjpg32tk230oauqbt0', '127.0.0.1', 1515928453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383435333b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('cj9ffetfellvboq27r5hr5441prrvoj8', '127.0.0.1', 1515928558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383535383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('ch0m946fpt4cfhcibv8d87i1m9cti0m4', '127.0.0.1', 1515928594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383539343b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('9jqdhcaluno9eab3vgefk24v3m1g5oan', '127.0.0.1', 1515928604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383630343b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('hma91bksr4adgf44kuumqvt7poco7kbo', '127.0.0.1', 1515928611, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383631313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('89eecooa71278n5k6u7jin80pftd57po', '127.0.0.1', 1515928668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383636383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('n6guu25sr6gfhjob4rkj164gt5bderms', '127.0.0.1', 1515928695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383639353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('duu201r1hl3rfmki1j9rrug84dsn63e0', '127.0.0.1', 1515928790, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383739303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('4hq92tllroa1hpobc184tqvkpd714lq7', '127.0.0.1', 1515928805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353932383830353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('82j7lpu9v0cjpq01slq641j4cjkuncq1', '127.0.0.1', 1515935928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933353932383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('ts69nq5fcnr9gpqkqpph3i9lhbnif8ev', '127.0.0.1', 1515936068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363036383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('2lk68h5f782sgciuf0j1s78v6u64mc53', '127.0.0.1', 1515936078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363037383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('u18431m08ufo0ck6frv1m4elpsai1buh', '127.0.0.1', 1515936085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363038353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('bvl5qci7615b86j3pciqh9h4637bmqs4', '127.0.0.1', 1515936091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363039313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('7e2mp7rgghtu31jk2v67gedh1ad7adf1', '127.0.0.1', 1515936127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363132373b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('ib9e2c5arh14a2e2p9q5mro3t2eiu6ii', '127.0.0.1', 1515936161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363136313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('c64t8qgtu7eo412ag7p6q62b1al4qfc9', '127.0.0.1', 1515936249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363234393b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('lasnro6sc39sltg6lvueedkft5nptv4h', '127.0.0.1', 1515936259, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363235393b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('g2rbj7m5v3v2bdhsjk143bmc78unfeht', '127.0.0.1', 1515936293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363239333b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b);
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('mqam79hkgabn79fqkn2amc5aj24o9dqs', '127.0.0.1', 1515936365, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363336353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('njdfoc66jqnbbcv4pe8frp160f6sj5bp', '127.0.0.1', 1515936367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363336373b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('42mof9fhc74d9jhtec2fjrbfj5adan02', '127.0.0.1', 1515936918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363931383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('pv0s35aihqgqnndffckuagpdrnhunkj2', '127.0.0.1', 1515936936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363933363b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('g9uc37c82chf0b72au43vbj6k5j4fb9m', '127.0.0.1', 1515936946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363934363b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('ch2qs697gvbshn3rim25e6b6tjn5ul1a', '127.0.0.1', 1515936961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933363936313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('7dpj6nqv1nbr68q9e7frh5jhq3k3q5rq', '127.0.0.1', 1515937240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373234303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('3cdd7qk4b6j8a2tpmkfjqfai2ipqhmfh', '127.0.0.1', 1515937264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373236343b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('8an1u8208nu6476q53i1cvqro6nqf8ph', '127.0.0.1', 1515937275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373237353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('63h41v2fjjspaorjptrgp2oeabnkuf0b', '127.0.0.1', 1515937373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373337333b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('3a3tjdheqs6vatshiu4dsii8q8akbrnu', '127.0.0.1', 1515937440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373434303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('irikntk1nsipism352tt8tad2sodpfc6', '127.0.0.1', 1515937456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373435363b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('ifu3rm7ufgqidn0v32qs5b7ebks32kij', '127.0.0.1', 1515937472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373437323b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('2eu9kenijotbhl0d8okuhb4enl0n44nb', '127.0.0.1', 1515937511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373531313b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('u4pbhm3hddp45ogm63as3sr59ira809i', '127.0.0.1', 1515937513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353933373531333b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('4a1odtjmruvapgggg3b2gk6ta5etfeos', '127.0.0.1', 1515940927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353934303932373b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('fkm6e6aml3i7bbgjh6dqth2c6u8q4bgp', '127.0.0.1', 1515940948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353934303934383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('nvk03oip4hcv22vl63j1ond9jetusu0n', '127.0.0.1', 1515941223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353934313232333b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('bgjrmci0rsr4n38cb4vg8prtijakfjnh', '127.0.0.1', 1515941224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353934313232343b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('hm3k8rje3je07385c2qvhcvm4l7kfk22', '127.0.0.1', 1515941254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353934313235343b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('g4boc26a208hq6h3gp9iafs8d1thj7ti', '127.0.0.1', 1515941289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353934313238393b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('51ucc8l3le5ao2ulv6o66kepf58o75ap', '127.0.0.1', 1515950638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935303633383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('4ig23t0sdn70braolddjr3jr6pg8gd5a', '127.0.0.1', 1515950654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935303635343b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('rs4ni2414ul3iq7l10u4j61vllhobrul', '127.0.0.1', 1515950665, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935303636353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('9n1d5g5a0q8bsi2k9n0e1qq8n62o34sl', '127.0.0.1', 1515950919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935303931393b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('7b8r17c9cuq9d5od9rqd23qfqr47uq01', '127.0.0.1', 1515950943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935303934333b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('63qikoa2pt8ct2edoqu62q8psn0hc3f3', '127.0.0.1', 1515951138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313133383b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('et1airjdglatvf8k7r8dsk4ovrju712i', '127.0.0.1', 1515951146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313134363b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('kfn8tcvompfkitbmp86k8sibjvuja52u', '127.0.0.1', 1515951439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313433393b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('t9fv9be6elon7jer379o7m78gb39ec5o', '127.0.0.1', 1515951489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313438393b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('diuj9adl54qi8itahqrgmsa9h241vo12', '127.0.0.1', 1515951715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313731353b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('a9717si4hep3s90ahtp781ej6g28rvnm', '127.0.0.1', 1515951906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313930363b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('b3f0ohi1q9cthqf5t199a5f946qu5gkn', '127.0.0.1', 1515951940, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313934303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('nlc74pusmt0obnb1v3vj4psar7q26h1e', '127.0.0.1', 1515952266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935313937303b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('co2v8atctsj6hmvq17mo0a1urg3rg84q', '127.0.0.1', 1515952366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353935323330333b656e63727970745f757365725f646174617c733a3534343a2256586b325a305a6e5746685859564133576c4a734e56493163445243535859304d6a4a4b654846335432316d546d4d7a5a544a4353477847565535545647704f6455597853585a7554453973623364705547684965475a7a656c6c73655452515658524e52464e6d566d4a305353394253456c706157353657574e4f516d4670655535725a45464e5a3156475257387657466c4b523074614d3056495445353152477830526e4e3059324e546345684255574979646a4e7051576c334d48427164573832646e6c5a5a6e42735248686b5a30457752797443626d464c4d445a444c3239596269733256444258526c687a4e6d567864334245596a5a47636d70574e5746506157493252305a526157307651314a4c52314a4f63336c72526e425151574a32534778576557706d633364596445525055474d796157744d6455524253317079576c4a694d79747854545a53555570446345706f4e455a5264306c475a314a4565464a33654578596556424a52455a4f554663306445524359565a77647a593161575630516d64315547777657693968595856345a305a32654735526369733451315a4a55544e30616b7436537a6c30636b387855564245553342424e6e5a5055554e79513141315a33426d645774345545453456314a7563566c594d566c4e64324e744f5777725a6c427252316779566d70315432523665565647576c7075554746764f45633452454d7851566c6c5254524f63453936647a3039223b),
('2hp2urqabv7k5j5lrk1renqdsl4pgpqk', '127.0.0.1', 1515993395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939333238353b656e63727970745f757365725f646174617c733a3534343a226554643555566b7861564a784b334e765353395053444a48616c523353574633625646434b33524c4e486f7859324e4a5533426d4f55566d4d55524853484d33656d644b627a4677613346795a576377553231545556684551314e34646d4634626a4e4a626d5a72617a4d34626d35455455685564316469616d5a6d516c70526558427261555a61634759325646466d5a574a59516b67344f4538325744677a523235745956426959566479535570704e4856304f584e694f5756754e45524b526c683564324e715a5445765a474e55626d703163473530576c423355464576554749316156564c536d786f533078705447784d5931425553554e764e4656365569387764324e6e52556b336548425957576875556b68346558646e54305a52536b7848616a4e7a4e6c4e524e3046554e31466865584e36656d78575a57746164304e5353464254536d356a5654525059574a6c4d574e6d4b325a325157517764485a6e546e56325433704b534531476369395863303032596e566e56445576566b38325a5646714b323172526a63315a5670616447644c51304e346556553363464e7151554e7962316332516c6332516b70335357394656465a4d63454d7662567049516e424a627939714d55687a54555a324d6e68454d6e413151585a6c4d335252526a56564d6a5934636a6c4a617a63724e564a324b7a5935626b56504e4642326453394764566853546b3945576c7072537939525547644a647a3039223b),
('re4p3kttohhv54qpmo5dt38mfbndt8fo', '127.0.0.1', 1515994207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939343036373b656e63727970745f757365725f646174617c733a3534343a226554643555566b7861564a784b334e765353395053444a48616c523353574633625646434b33524c4e486f7859324e4a5533426d4f55566d4d55524853484d33656d644b627a4677613346795a576377553231545556684551314e34646d4634626a4e4a626d5a72617a4d34626d35455455685564316469616d5a6d516c70526558427261555a61634759325646466d5a574a59516b67344f4538325744677a523235745956426959566479535570704e4856304f584e694f5756754e45524b526c683564324e715a5445765a474e55626d703163473530576c423355464576554749316156564c536d786f533078705447784d5931425553554e764e4656365569387764324e6e52556b336548425957576875556b68346558646e54305a52536b7848616a4e7a4e6c4e524e3046554e31466865584e36656d78575a57746164304e5353464254536d356a5654525059574a6c4d574e6d4b325a325157517764485a6e546e56325433704b534531476369395863303032596e566e56445576566b38325a5646714b323172526a63315a5670616447644c51304e346556553363464e7151554e7962316332516c6332516b70335357394656465a4d63454d7662567049516e424a627939714d55687a54555a324d6e68454d6e413151585a6c4d335252526a56564d6a5934636a6c4a617a63724e564a324b7a5935626b56504e4642326453394764566853546b3945576c7072537939525547644a647a3039223b),
('i7106tga1uqgsg85slulicmn2tfricmt', '127.0.0.1', 1515995113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939343837333b656e63727970745f757365725f646174617c733a3534343a226554643555566b7861564a784b334e765353395053444a48616c523353574633625646434b33524c4e486f7859324e4a5533426d4f55566d4d55524853484d33656d644b627a4677613346795a576377553231545556684551314e34646d4634626a4e4a626d5a72617a4d34626d35455455685564316469616d5a6d516c70526558427261555a61634759325646466d5a574a59516b67344f4538325744677a523235745956426959566479535570704e4856304f584e694f5756754e45524b526c683564324e715a5445765a474e55626d703163473530576c423355464576554749316156564c536d786f533078705447784d5931425553554e764e4656365569387764324e6e52556b336548425957576875556b68346558646e54305a52536b7848616a4e7a4e6c4e524e3046554e31466865584e36656d78575a57746164304e5353464254536d356a5654525059574a6c4d574e6d4b325a325157517764485a6e546e56325433704b534531476369395863303032596e566e56445576566b38325a5646714b323172526a63315a5670616447644c51304e346556553363464e7151554e7962316332516c6332516b70335357394656465a4d63454d7662567049516e424a627939714d55687a54555a324d6e68454d6e413151585a6c4d335252526a56564d6a5934636a6c4a617a63724e564a324b7a5935626b56504e4642326453394764566853546b3945576c7072537939525547644a647a3039223b),
('koqnpk31ri6988hehjsho5o4l7jek4q2', '127.0.0.1', 1515995198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939353139383b656e63727970745f757365725f646174617c733a3534343a226554643555566b7861564a784b334e765353395053444a48616c523353574633625646434b33524c4e486f7859324e4a5533426d4f55566d4d55524853484d33656d644b627a4677613346795a576377553231545556684551314e34646d4634626a4e4a626d5a72617a4d34626d35455455685564316469616d5a6d516c70526558427261555a61634759325646466d5a574a59516b67344f4538325744677a523235745956426959566479535570704e4856304f584e694f5756754e45524b526c683564324e715a5445765a474e55626d703163473530576c423355464576554749316156564c536d786f533078705447784d5931425553554e764e4656365569387764324e6e52556b336548425957576875556b68346558646e54305a52536b7848616a4e7a4e6c4e524e3046554e31466865584e36656d78575a57746164304e5353464254536d356a5654525059574a6c4d574e6d4b325a325157517764485a6e546e56325433704b534531476369395863303032596e566e56445576566b38325a5646714b323172526a63315a5670616447644c51304e346556553363464e7151554e7962316332516c6332516b70335357394656465a4d63454d7662567049516e424a627939714d55687a54555a324d6e68454d6e413151585a6c4d335252526a56564d6a5934636a6c4a617a63724e564a324b7a5935626b56504e4642326453394764566853546b3945576c7072537939525547644a647a3039223b);
INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('pdkp9oddk0lt1ivus0gko4efg4in0fq3', '127.0.0.1', 1515995740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939353634383b656e63727970745f757365725f646174617c733a3534343a226554643555566b7861564a784b334e765353395053444a48616c523353574633625646434b33524c4e486f7859324e4a5533426d4f55566d4d55524853484d33656d644b627a4677613346795a576377553231545556684551314e34646d4634626a4e4a626d5a72617a4d34626d35455455685564316469616d5a6d516c70526558427261555a61634759325646466d5a574a59516b67344f4538325744677a523235745956426959566479535570704e4856304f584e694f5756754e45524b526c683564324e715a5445765a474e55626d703163473530576c423355464576554749316156564c536d786f533078705447784d5931425553554e764e4656365569387764324e6e52556b336548425957576875556b68346558646e54305a52536b7848616a4e7a4e6c4e524e3046554e31466865584e36656d78575a57746164304e5353464254536d356a5654525059574a6c4d574e6d4b325a325157517764485a6e546e56325433704b534531476369395863303032596e566e56445576566b38325a5646714b323172526a63315a5670616447644c51304e346556553363464e7151554e7962316332516c6332516b70335357394656465a4d63454d7662567049516e424a627939714d55687a54555a324d6e68454d6e413151585a6c4d335252526a56564d6a5934636a6c4a617a63724e564a324b7a5935626b56504e4642326453394764566853546b3945576c7072537939525547644a647a3039223b),
('3nj2g5fh9iooe9k54n260i321dg4t3pk', '127.0.0.1', 1515996240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939353937363b656e63727970745f757365725f646174617c733a3534343a226554643555566b7861564a784b334e765353395053444a48616c523353574633625646434b33524c4e486f7859324e4a5533426d4f55566d4d55524853484d33656d644b627a4677613346795a576377553231545556684551314e34646d4634626a4e4a626d5a72617a4d34626d35455455685564316469616d5a6d516c70526558427261555a61634759325646466d5a574a59516b67344f4538325744677a523235745956426959566479535570704e4856304f584e694f5756754e45524b526c683564324e715a5445765a474e55626d703163473530576c423355464576554749316156564c536d786f533078705447784d5931425553554e764e4656365569387764324e6e52556b336548425957576875556b68346558646e54305a52536b7848616a4e7a4e6c4e524e3046554e31466865584e36656d78575a57746164304e5353464254536d356a5654525059574a6c4d574e6d4b325a325157517764485a6e546e56325433704b534531476369395863303032596e566e56445576566b38325a5646714b323172526a63315a5670616447644c51304e346556553363464e7151554e7962316332516c6332516b70335357394656465a4d63454d7662567049516e424a627939714d55687a54555a324d6e68454d6e413151585a6c4d335252526a56564d6a5934636a6c4a617a63724e564a324b7a5935626b56504e4642326453394764566853546b3945576c7072537939525547644a647a3039223b),
('7cab9bcerg41gs3fkl3qrncl5eth5hs3', '127.0.0.1', 1515996397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531353939363339373b656e63727970745f757365725f646174617c733a3534343a226554643555566b7861564a784b334e765353395053444a48616c523353574633625646434b33524c4e486f7859324e4a5533426d4f55566d4d55524853484d33656d644b627a4677613346795a576377553231545556684551314e34646d4634626a4e4a626d5a72617a4d34626d35455455685564316469616d5a6d516c70526558427261555a61634759325646466d5a574a59516b67344f4538325744677a523235745956426959566479535570704e4856304f584e694f5756754e45524b526c683564324e715a5445765a474e55626d703163473530576c423355464576554749316156564c536d786f533078705447784d5931425553554e764e4656365569387764324e6e52556b336548425957576875556b68346558646e54305a52536b7848616a4e7a4e6c4e524e3046554e31466865584e36656d78575a57746164304e5353464254536d356a5654525059574a6c4d574e6d4b325a325157517764485a6e546e56325433704b534531476369395863303032596e566e56445576566b38325a5646714b323172526a63315a5670616447644c51304e346556553363464e7151554e7962316332516c6332516b70335357394656465a4d63454d7662567049516e424a627939714d55687a54555a324d6e68454d6e413151585a6c4d335252526a56564d6a5934636a6c4a617a63724e564a324b7a5935626b56504e4642326453394764566853546b3945576c7072537939525547644a647a3039223b),
('hrcgkdioe88md6nprur326g8hgq7nk6q', '127.0.0.1', 1516010290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031303031373b656e63727970745f757365725f646174617c733a3534343a226247745559544a684d305a334e4770465455747053576859626e5248596c64475957786c5656493153586476635664564d57314a636a427052553034563239426244645251303572536c5254656b686151316856546b567a4d6c6432635759724e306c44526c4a785a486c4e656d4a6d4d31497854544d35636b6c4754444e6d5a6a46435753395865466c524e7a5647556e4a3663556453626b6c59656a42774d7939475346565a62475252525651785130343364556c4f52584a48656e52325933526f6547673255464a3362576f314e306c4763316477656939686256564c64325a714d5468736257497955485a484e6b314e54304d30536c6b785646527251554a545a55565752444e524e584a33646d523556584e6c5456685153474644636e4a5863486c324f5856614d545670575646704e325a3562484a6b65585a7a5457526b63475a70575442465a32466a4d314e7451566848596d785a4f484a4c576c42765a54424a575841355a43746f52327332633239584d5555316254687153323179633141315154523353554a504e6e4a4c4d584e31646a5a48526e564b64446470556a6c324d577479515574795245747261335a5a623341795330777264334976623356764e5646475a693949646c6476575656454e30773552454e33596d6c514d5763724f486469564842585956686a4e444e4d62336c6e646d31554e303543595534355756466a62324661526e68784d4868514e693955647a3039223b),
('8pc2lmik535622hnh33vr61n6fl6tqi0', '127.0.0.1', 1516010486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031303339363b656e63727970745f757365725f646174617c733a3534343a226247745559544a684d305a334e4770465455747053576859626e5248596c64475957786c5656493153586476635664564d57314a636a427052553034563239426244645251303572536c5254656b686151316856546b567a4d6c6432635759724e306c44526c4a785a486c4e656d4a6d4d31497854544d35636b6c4754444e6d5a6a46435753395865466c524e7a5647556e4a3663556453626b6c59656a42774d7939475346565a62475252525651785130343364556c4f52584a48656e52325933526f6547673255464a3362576f314e306c4763316477656939686256564c64325a714d5468736257497955485a484e6b314e54304d30536c6b785646527251554a545a55565752444e524e584a33646d523556584e6c5456685153474644636e4a5863486c324f5856614d545670575646704e325a3562484a6b65585a7a5457526b63475a70575442465a32466a4d314e7451566848596d785a4f484a4c576c42765a54424a575841355a43746f52327332633239584d5555316254687153323179633141315154523353554a504e6e4a4c4d584e31646a5a48526e564b64446470556a6c324d577479515574795245747261335a5a623341795330777264334976623356764e5646475a693949646c6476575656454e30773552454e33596d6c514d5763724f486469564842585956686a4e444e4d62336c6e646d31554e303543595534355756466a62324661526e68784d4868514e693955647a3039223b),
('nfe82qom99414a3addrgufgelnd0p017', '127.0.0.1', 1516011000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031303731353b656e63727970745f757365725f646174617c733a3534343a226247745559544a684d305a334e4770465455747053576859626e5248596c64475957786c5656493153586476635664564d57314a636a427052553034563239426244645251303572536c5254656b686151316856546b567a4d6c6432635759724e306c44526c4a785a486c4e656d4a6d4d31497854544d35636b6c4754444e6d5a6a46435753395865466c524e7a5647556e4a3663556453626b6c59656a42774d7939475346565a62475252525651785130343364556c4f52584a48656e52325933526f6547673255464a3362576f314e306c4763316477656939686256564c64325a714d5468736257497955485a484e6b314e54304d30536c6b785646527251554a545a55565752444e524e584a33646d523556584e6c5456685153474644636e4a5863486c324f5856614d545670575646704e325a3562484a6b65585a7a5457526b63475a70575442465a32466a4d314e7451566848596d785a4f484a4c576c42765a54424a575841355a43746f52327332633239584d5555316254687153323179633141315154523353554a504e6e4a4c4d584e31646a5a48526e564b64446470556a6c324d577479515574795245747261335a5a623341795330777264334976623356764e5646475a693949646c6476575656454e30773552454e33596d6c514d5763724f486469564842585956686a4e444e4d62336c6e646d31554e303543595534355756466a62324661526e68784d4868514e693955647a3039223b),
('9rlmhecoepl5roecmjcfraks0uldg8c5', '127.0.0.1', 1516011046, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031313033383b656e63727970745f757365725f646174617c733a3438383a2262306c4b516d7332534856694e476c4b62544a474c3077314d6e563457546c544d7a463665554d32556d526a5a466c784e454e764e3370324e33647954454e484e446c46543146314d48567863446459554578355a3367354d444652656d7878596e4d31656a424c646c4a71646b396e4c31566e644664474e306c446554467a5557784c616e6c744e45397a626d6469637a4531656c567856307442595339574e57315064445658637974465757786a5a314d77516c424f57544e5862564a324f4735704d336c4e61564e6d656d4d7856573577513170785433706e656c7047546c4e5263306c54563056425354466f54315a775447784959584652616b466d5a6e56725a335a72626c6c5862485a4b4d43746e4f464e744d5663315a6a6c6f617a466b5a47315356544a4f62305642556c4d354c3363765a5777336155787254484a76517a687961544a325344523455335233655855774e6d465353475a4b526b343053464a33526c4655596e6c46654846774c32466a65444e4e6232746a54324e536447566d516c42764d554e58556c5635553070465a327859636b747563555a30615856555254464a64556c4d6255463455475572646b5a4262444976523352314e484275556b6475634468545657467654556c514e585645626b684c5432513050513d3d223b),
('1atvg77cifjlvjeqtbbc6oe33m7ce8h6', '127.0.0.1', 1516011672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031313438303b656e63727970745f757365725f646174617c733a3438383a2262306c4b516d7332534856694e476c4b62544a474c3077314d6e563457546c544d7a463665554d32556d526a5a466c784e454e764e3370324e33647954454e484e446c46543146314d48567863446459554578355a3367354d444652656d7878596e4d31656a424c646c4a71646b396e4c31566e644664474e306c446554467a5557784c616e6c744e45397a626d6469637a4531656c567856307442595339574e57315064445658637974465757786a5a314d77516c424f57544e5862564a324f4735704d336c4e61564e6d656d4d7856573577513170785433706e656c7047546c4e5263306c54563056425354466f54315a775447784959584652616b466d5a6e56725a335a72626c6c5862485a4b4d43746e4f464e744d5663315a6a6c6f617a466b5a47315356544a4f62305642556c4d354c3363765a5777336155787254484a76517a687961544a325344523455335233655855774e6d465353475a4b526b343053464a33526c4655596e6c46654846774c32466a65444e4e6232746a54324e536447566d516c42764d554e58556c5635553070465a327859636b747563555a30615856555254464a64556c4d6255463455475572646b5a4262444976523352314e484275556b6475634468545657467654556c514e585645626b684c5432513050513d3d223b),
('f9u6kaphe8321o201oofv8d7m8ii6f5c', '127.0.0.1', 1516012523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031323338353b656e63727970745f757365725f646174617c733a3438383a2262306c4b516d7332534856694e476c4b62544a474c3077314d6e563457546c544d7a463665554d32556d526a5a466c784e454e764e3370324e33647954454e484e446c46543146314d48567863446459554578355a3367354d444652656d7878596e4d31656a424c646c4a71646b396e4c31566e644664474e306c446554467a5557784c616e6c744e45397a626d6469637a4531656c567856307442595339574e57315064445658637974465757786a5a314d77516c424f57544e5862564a324f4735704d336c4e61564e6d656d4d7856573577513170785433706e656c7047546c4e5263306c54563056425354466f54315a775447784959584652616b466d5a6e56725a335a72626c6c5862485a4b4d43746e4f464e744d5663315a6a6c6f617a466b5a47315356544a4f62305642556c4d354c3363765a5777336155787254484a76517a687961544a325344523455335233655855774e6d465353475a4b526b343053464a33526c4655596e6c46654846774c32466a65444e4e6232746a54324e536447566d516c42764d554e58556c5635553070465a327859636b747563555a30615856555254464a64556c4d6255463455475572646b5a4262444976523352314e484275556b6475634468545657467654556c514e585645626b684c5432513050513d3d223b),
('0tprqgj11s2ig8h6nktfivqrj2oht5uq', '127.0.0.1', 1516013435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031333135323b656e63727970745f757365725f646174617c733a3534343a225a6d315753573033615774485a6d70545457677955486c5465453947636939754b3278754b3168615a32706a4f57356a4d47704e62575a336248426c62466446575755335279744263556835563152774d3168724e316b3063324e7751304656646d68464b7a6778654864756432784f55485233566c704c564556615a6b6870566d6879547a46334e6a4e59626b5a51526d52785a4441784e48646d65544577567a6850576d7853546d5a43565452364d5845724e69744c64314978576e704b646a4659596a427159557069546c5679626d383355476834565864474e5656554c33645264476c45536c4e6e4d48423351334a326155785753456f786446467664577855534642466455647662565278555374544e546c5364564a70655546454d7a52584e44467a54336376597a526c63456475546b316e4e55645a55334a43656b633357464d345658704452484a454e454a6a63486f30624856324f545130646c6c6e5532643064466844564568594e4651796330356e5131593356585a4763315233536c46435a6d74364d3259775455526b4e6b4e365532557756575a5a52556b3454474635546b49305356646e64306b35635534315557684b4e3342685a47343354553549624846454d57786d4e6b45795345497957464251526e70764f465643646e497263444675626e4a584e6b343561466c4b53453177596e5a59634756756353747664444935656d524d634752705744686a4c326c3051543039223b),
('sld51dj1gpskkqf7n2p2sm55tibfp0g1', '127.0.0.1', 1516013497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363031333436353b656e63727970745f757365725f646174617c733a3534343a225a6d315753573033615774485a6d70545457677955486c5465453947636939754b3278754b3168615a32706a4f57356a4d47704e62575a336248426c62466446575755335279744263556835563152774d3168724e316b3063324e7751304656646d68464b7a6778654864756432784f55485233566c704c564556615a6b6870566d6879547a46334e6a4e59626b5a51526d52785a4441784e48646d65544577567a6850576d7853546d5a43565452364d5845724e69744c64314978576e704b646a4659596a427159557069546c5679626d383355476834565864474e5656554c33645264476c45536c4e6e4d48423351334a326155785753456f786446467664577855534642466455647662565278555374544e546c5364564a70655546454d7a52584e44467a54336376597a526c63456475546b316e4e55645a55334a43656b633357464d345658704452484a454e454a6a63486f30624856324f545130646c6c6e5532643064466844564568594e4651796330356e5131593356585a4763315233536c46435a6d74364d3259775455526b4e6b4e365532557756575a5a52556b3454474635546b49305356646e64306b35635534315557684b4e3342685a47343354553549624846454d57786d4e6b45795345497957464251526e70764f465643646e497263444675626e4a584e6b343561466c4b53453177596e5a59634756756353747664444935656d524d634752705744686a4c326c3051543039223b),
('hvmk8gv41jncb4fh55m152eqod8c7d1a', '127.0.0.1', 1516071210, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037313231303b),
('01bv0tn6ma0quijq32uq7rc3p2hjjth9', '127.0.0.1', 1516073479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037333333353b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('0n10i25hc2flg1j3s4v0cq1aafpgecid', '127.0.0.1', 1516075019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037343934333b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('0ab6b4ana4m6i7q9eas1akr2s8ubiep9', '127.0.0.1', 1516075529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037353234373b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('fc691qc4udcdr2biikqosqf8aq3dpb50', '127.0.0.1', 1516075836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037353535393b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('a4r254nf0b13cdehqtf5tdv23aggc9nk', '127.0.0.1', 1516075973, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037353937333b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('u5lukric6uloifmpnl10bt2qasfp736d', '127.0.0.1', 1516076452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037363338363b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('gsjl6jrugbibr5hu21gq2s3mop7tm8pj', '127.0.0.1', 1516076757, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037363639323b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('s4d0cbvmni6uaa0267q8cemvr94acl45', '127.0.0.1', 1516077243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037373030373b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('dcck97qmkiqov5hvnl10h0kl2e3ki139', '127.0.0.1', 1516077426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037373331323b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('jh1ocrplerahgujk02qjhffjin486os1', '127.0.0.1', 1516077864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037373631353b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('0k29dp922gia6ekgku6n6cr2p6le3cqt', '127.0.0.1', 1516078354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363037383234363b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('4vqbmnp6d2n2fev05550uavtpaukp03c', '127.0.0.1', 1516082728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363038323435383b656e63727970745f757365725f646174617c733a3534343a224e6d5a50574868356454685763485a6c5445314b4d7a4172547a4a715648527652446850626a5135576d314b55464251644339466130497861475a4d526b704764487068524549354f545a6c564852766331426b55584e36656d6c474c316c48547a68704f4746424d6b566d4f57746d56445a5a4c3251345a6b317163565a73595752465a5577785958703559334e44633049325354557256466c3354314e6f4d6b5a4459334d79546d6379656a4253636d646d61484655616d706e626a4248616a564c6355783664444a4e6247684d54327835636e513364326c69625456735a5739524f56526d62533833574577774e5539494d4664446457784253316c764d484653525445315933497a576d6c73535652364e4756564b32317563307047556d493264576445546a4e7755456c6b656d73305631646f4e487053556c70556354425756334a50556b74495a553948526a59344d7a4a544e335a6d5a6c6b314e55647361476c784d334268566b78715644565752574d726345684e4d484e5359585a32513230325531417962566b76544856615244527254455a4254586c316246686a4d4570684d31686b61554e6d556e4e44656a5642556d784d4c307455536d786f614664785344645154574e514e7a6c435747706d53586f724d544a615745744d4d335a4959586876566a6c525a4642326230564c63477448543231584e335a6c575664436248526f52314e6c51544a4a4d6e417251304d725a7a3039223b),
('55qmjvud5oedongib8g2d419gkkv46i2', '127.0.0.1', 1516090387, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363039303338373b),
('gmai3f2ui8pqv6ebl8rlpng6p17b2br2', '127.0.0.1', 1516251523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363235313532333b),
('347jep7turr1784rlg2m1f9v3t90mi62', '127.0.0.1', 1516281245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363238313233323b656e63727970745f757365725f646174617c733a3534343a2256544632516d56574d6c4a4d4f474e766257314463555532547a4d354d6d744254556c434d6a6c6a4d7a4276526b357761485a5452335a4b4f4642314f474a3256476458624868715544424d56584e4b6253745865485a3156577452535867795a47307862576b316344417763457457623364704c32645a564442455a48524d5a304d7a4f477073647a5230647a686f51577846644756474b3056794d6c424955467031626e5a564f565a784e30644c4b326b3265553978553252615a55784a626e52695256417255576c4e5558597a64446451546d6c6b6345706157576b34614868584e5570685a475a754e57553454544a79614374695a6b684353586849654468565432684c556a41354b7a5930596a4a4655454a305531706f4e544277596e4a774e33705554325a6153326c784e305a324e6a56754e315254654739334d44524759336c774d6e5a6d5743744b4b7939574f57393064564e52536c52504d553032636a524c533278484d555a615930524a5532527661455579546b684d567939436145787052554d724f544e714e446447555841335a6b4e7a566e4e4f5956525a52484676645668475a6b4e4965564e6d526d4e73626a567856546c434b7973345158704d516c466b526c68585a455a504c334e54634339696147684351546731546c46495332685861314e54595578745532394961466778624746304d7a51325a456456637a466d65445a34623170554e486c485569747251543039223b),
('9sn53q8buvo85cgao0kt26q52s1dvu6o', '127.0.0.1', 1516281841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363238313638373b656e63727970745f757365725f646174617c733a3534343a2256544632516d56574d6c4a4d4f474e766257314463555532547a4d354d6d744254556c434d6a6c6a4d7a4276526b357761485a5452335a4b4f4642314f474a3256476458624868715544424d56584e4b6253745865485a3156577452535867795a47307862576b316344417763457457623364704c32645a564442455a48524d5a304d7a4f477073647a5230647a686f51577846644756474b3056794d6c424955467031626e5a564f565a784e30644c4b326b3265553978553252615a55784a626e52695256417255576c4e5558597a64446451546d6c6b6345706157576b34614868584e5570685a475a754e57553454544a79614374695a6b684353586849654468565432684c556a41354b7a5930596a4a4655454a305531706f4e544277596e4a774e33705554325a6153326c784e305a324e6a56754e315254654739334d44524759336c774d6e5a6d5743744b4b7939574f57393064564e52536c52504d553032636a524c533278484d555a615930524a5532527661455579546b684d567939436145787052554d724f544e714e446447555841335a6b4e7a566e4e4f5956525a52484676645668475a6b4e4965564e6d526d4e73626a567856546c434b7973345158704d516c466b526c68585a455a504c334e54634339696147684351546731546c46495332685861314e54595578745532394961466778624746304d7a51325a456456637a466d65445a34623170554e486c485569747251543039223b),
('r132000j3fk80m8bkqmj4f3btkl9ak3q', '127.0.0.1', 1516282754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363238323731313b656e63727970745f757365725f646174617c733a3534343a2256544632516d56574d6c4a4d4f474e766257314463555532547a4d354d6d744254556c434d6a6c6a4d7a4276526b357761485a5452335a4b4f4642314f474a3256476458624868715544424d56584e4b6253745865485a3156577452535867795a47307862576b316344417763457457623364704c32645a564442455a48524d5a304d7a4f477073647a5230647a686f51577846644756474b3056794d6c424955467031626e5a564f565a784e30644c4b326b3265553978553252615a55784a626e52695256417255576c4e5558597a64446451546d6c6b6345706157576b34614868584e5570685a475a754e57553454544a79614374695a6b684353586849654468565432684c556a41354b7a5930596a4a4655454a305531706f4e544277596e4a774e33705554325a6153326c784e305a324e6a56754e315254654739334d44524759336c774d6e5a6d5743744b4b7939574f57393064564e52536c52504d553032636a524c533278484d555a615930524a5532527661455579546b684d567939436145787052554d724f544e714e446447555841335a6b4e7a566e4e4f5956525a52484676645668475a6b4e4965564e6d526d4e73626a567856546c434b7973345158704d516c466b526c68585a455a504c334e54634339696147684351546731546c46495332685861314e54595578745532394961466778624746304d7a51325a456456637a466d65445a34623170554e486c485569747251543039223b),
('rpdi8dj5nc8c8pjt8dd93ib1pq9tiaku', '127.0.0.1', 1516286784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363238363734363b656e63727970745f757365725f646174617c733a3534343a2256544632516d56574d6c4a4d4f474e766257314463555532547a4d354d6d744254556c434d6a6c6a4d7a4276526b357761485a5452335a4b4f4642314f474a3256476458624868715544424d56584e4b6253745865485a3156577452535867795a47307862576b316344417763457457623364704c32645a564442455a48524d5a304d7a4f477073647a5230647a686f51577846644756474b3056794d6c424955467031626e5a564f565a784e30644c4b326b3265553978553252615a55784a626e52695256417255576c4e5558597a64446451546d6c6b6345706157576b34614868584e5570685a475a754e57553454544a79614374695a6b684353586849654468565432684c556a41354b7a5930596a4a4655454a305531706f4e544277596e4a774e33705554325a6153326c784e305a324e6a56754e315254654739334d44524759336c774d6e5a6d5743744b4b7939574f57393064564e52536c52504d553032636a524c533278484d555a615930524a5532527661455579546b684d567939436145787052554d724f544e714e446447555841335a6b4e7a566e4e4f5956525a52484676645668475a6b4e4965564e6d526d4e73626a567856546c434b7973345158704d516c466b526c68585a455a504c334e54634339696147684351546731546c46495332685861314e54595578745532394961466778624746304d7a51325a456456637a466d65445a34623170554e486c485569747251543039223b),
('8a71l6nt2tghh3pt4gajc3fn61b5kul1', '127.0.0.1', 1516293883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363239333830353b656e63727970745f757365725f646174617c733a3534343a22635568555a7a55725a5552584d56566c61334a32534668304e326b305445564d646a5a73524338774e314e6b5a6b6c4d5954423364573835526a46315255745a51305a6b4e6b3951533352335a6b6c32633051315a5670795a7a52765a33686d5a326f7755577432627a64784f585972545652684e316868574374576269737a62307843636c4e7064327458647a6c585645464b5355703363444e535346646a536d38325a6b493459326c48576d6c464e45313054586777553245794f454e3451325652613074754e314e7854315a58555556595346567a56565a344d477035596a427a556e5a695446524f544374554f4767355a6d6c6153585278546c52725557356e615664314f484253636d465763464250617a5a74626d5a504d31565653473433625846574f56597264453953536e56325545354861336c54646e4a4364576477576b6c53557a6868526b4673516e427a4f577053566a68545a3349324c7a4e49595535714f544e73574464315432396e624752776354566d656d64356433673155565658644642734b315657564668334d326c73645656335a4756526132744c646e5a764e32497a5155316e4c334535626b4d34596b5a5863305a5754335a47543364705453396d646a463453316c3264327378636e5647516b524c6447645261575a3151546c765a693872576a5532576b5a6c5445387851306c7259307455646c5934616d6858645867775a6b466a647a4d334e47565355543039223b),
('ae92pcrggiguj5cgmcprl39gf3ot7re6', '127.0.0.1', 1516354790, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363335343439303b),
('07sb9aa0q0m3jkf2jv78j1sgg2o7us0j', '127.0.0.1', 1516354983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363335343739363b),
('0ci77d3d52trfl1m77l5b49k7q9lcgfc', '127.0.0.1', 1516355580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363335353433383b),
('o2u1gvl1cvr30r621j53duffgs3aqfo9', '127.0.0.1', 1516356783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363335363738333b),
('02j99o6i5kkllrlmuvrllsn27j1sh9n6', '127.0.0.1', 1516375388, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363337353338383b),
('esjalo6d9uame4j2nt7eg5mggqc300lj', '127.0.0.1', 1516443658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363434333635383b),
('hq7k9b1l2c61rjkn59sisqafq40oja5h', '127.0.0.1', 1516526304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531363532363330343b),
('2a82pjpivd4dpi5k0jno9e8s9ueee1t9', '127.0.0.1', 1566883786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363838333738363b),
('pqiclluomvitivdusve20r6b7rjj1nfq', '127.0.0.1', 1566884252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363838333738363b),
('k0blsl36dmneqhgdq52vp1uk5g35i590', '127.0.0.1', 1566895643, ''),
('1mc7nkoihsseudce4ck7f30mcdspdftr', '127.0.0.1', 1566895993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363839353939333b),
('ivps0lkhp5tpm2v2k290b54q4sd3keqi', '127.0.0.1', 1566895643, ''),
('1dep2lfl2m6r6ir89cgth53mjliccp8n', '127.0.0.1', 1566900781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363839353939333b),
('j6dlv25eff3hlmc3649fbh1qllevr81j', '127.0.0.1', 1566954506, ''),
('5oanfs3hulfi4rr45hpnjnm7an6il5d0', '127.0.0.1', 1566954506, ''),
('9a70gosmos7o4ltq0mht105ud6olso4i', '127.0.0.1', 1566962101, ''),
('oeas6n070quus1bqj30v94d7f8hpgrr3', '127.0.0.1', 1566973275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363937333237353b656e63727970745f61646d696e5f646174617c733a3334343a2253315230636e4651646c704a526a464b6333527463564e454d6d4a4a4d6b637a6246684363565a4b4e464a7451544e6e596b49314f4642304d6e4e6e536e59796345354e4f546461615756434e6b565661473543556a56745445564a4f4646715456566b656d3147626d356961454a70614455345347314c536c5275576e68734c3246316147746d554764744c323161616d5253626e4e7454466c4b63575652543252746445464b55464e495330396f55454e79574552425a6a6844633277326147396c646b5234516c684b63473936656e63795332526f646a4e535346467062474a56527a686f566c46594c314e5764465a345a47644f4f445a796254597752453545565570614e335a7056586c57517a4670646e4533656e6c5a4b3068724f565277625546545432466c59304635516b394a62316c736547396e6154633151575a745a6a68795757777865454e316547637663513d3d223b),
('ja5muvnhv31gbtmfg9rtbh5b1b3vockt', '127.0.0.1', 1566973283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536363937333237353b656e63727970745f61646d696e5f646174617c733a3334343a2253315230636e4651646c704a526a464b6333527463564e454d6d4a4a4d6b637a6246684363565a4b4e464a7451544e6e596b49314f4642304d6e4e6e536e59796345354e4f546461615756434e6b565661473543556a56745445564a4f4646715456566b656d3147626d356961454a70614455345347314c536c5275576e68734c3246316147746d554764744c323161616d5253626e4e7454466c4b63575652543252746445464b55464e495330396f55454e79574552425a6a6844633277326147396c646b5234516c684b63473936656e63795332526f646a4e535346467062474a56527a686f566c46594c314e5764465a345a47644f4f445a796254597752453545565570614e335a7056586c57517a4670646e4533656e6c5a4b3068724f565277625546545432466c59304635516b394a62316c736547396e6154633151575a745a6a68795757777865454e316547637663513d3d223b);

-- --------------------------------------------------------

--
-- 資料表結構 `registered_link`
--

DROP TABLE IF EXISTS `registered_link`;
CREATE TABLE IF NOT EXISTS `registered_link` (
  `rl_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`rl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `registered_link`
--

INSERT INTO `registered_link` (`rl_id`, `u_id`) VALUES
(00000001, 1),
(00000002, 1),
(00000003, 1),
(00000004, 1),
(00000005, 1),
(00000006, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_superior_id` int(11) NOT NULL,
  `u_name` varchar(12) NOT NULL,
  `u_account` varchar(12) NOT NULL,
  `u_passwd` varchar(32) NOT NULL,
  `u_money_passwd` varchar(32) DEFAULT NULL,
  `u_status` enum('0','1') DEFAULT '1',
  `u_add_datetime` datetime NOT NULL,
  `u_ag_is_reg` tinyint(1) NOT NULL DEFAULT '0',
  `u_is_lock` tinyint(1) NOT NULL DEFAULT '0',
  `u_bank_card_lock` tinyint(1) NOT NULL DEFAULT '0',
  `u_ag_game_model` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_account` (`u_account`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`u_id`, `u_superior_id`, `u_name`, `u_account`, `u_passwd`, `u_money_passwd`, `u_status`, `u_add_datetime`, `u_ag_is_reg`, `u_is_lock`, `u_bank_card_lock`, `u_ag_game_model`) VALUES
(1, 0, 'test0000', 'tryion000', '8c97677e7cf25c075d5a0f8c907daaca', '1c63129ae9db9c60c3e8aa94d3e00495', '1', '2017-12-20 00:00:00', 1, 0, 0, 1),
(2, 1, 'test0001', 'tryion001', '8c97677e7cf25c075d5a0f8c907daaca', '', '1', '2017-12-20 16:52:27', 0, 0, 0, 1),
(3, 1, 'test0002', 'tryion002', '25d55ad283aa400af464c76d713c07ad', '', '1', '2017-12-20 17:51:34', 0, 0, 0, 1),
(4, 0, '1111111111', '111111111111', '593c9b4a9390551d53e5cacf28ebd638', NULL, '1', '2017-12-30 12:48:58', 0, 0, 0, 1),
(5, 0, '1111111111', '1223dfsdfse', '593c9b4a9390551d53e5cacf28ebd638', NULL, '1', '2017-12-30 12:49:07', 0, 0, 0, 1),
(6, 0, '111111111111', 'qswwww111111', '593c9b4a9390551d53e5cacf28ebd638', '593c9b4a9390551d53e5cacf28ebd638', '1', '2017-12-30 12:50:03', 0, 0, 0, 1),
(7, 6, '111111111111', '2eeeeeeee12', '6d7b52022ecefdb50f0ddac3c939cdaa', NULL, '1', '2017-12-30 14:17:55', 0, 0, 0, 1),
(8, 1, '1ee22r3wr2r2', '42fdv11e2fed', '57ba71e8b13ce4d87d70d16b837da3ab', NULL, '1', '2017-12-30 14:21:07', 0, 0, 0, 1),
(9, 1, 'fevdvfevwdev', 'vfds cdfvedw', '4b7a4732ebc1f0a2af5de0f941dd65e3', NULL, '1', '2017-12-30 14:21:51', 0, 0, 0, 1),
(10, 1, 'wdscfssv', 'dwfwfwefq', 'ce96593e4b718bceb76fa5c90bdd058f', NULL, '1', '2017-12-30 14:22:25', 0, 0, 0, 1),
(11, 0, '11111111', '111111111', 'adbc91a43e988a3b5b745b8529a90b61', NULL, '1', '2017-12-31 16:41:47', 0, 0, 0, 1),
(12, 0, '111111111111', 'aaaaaaqqqqqq', '93ebbbcb07b3abfdbff2cf3239060f1d', NULL, '1', '2017-12-31 16:42:59', 0, 0, 0, 1),
(13, 0, '111111adcdca', 'sfwfsavdavd', 'bfa191d9bcb77afda59b2e70ba5ccc61', NULL, '1', '2017-12-31 16:44:31', 0, 0, 0, 1),
(14, 0, '111sadasdas', '111sdsdasda', 'cbd59802ab8dd8a78db97c351ae8630a', NULL, '1', '2018-01-01 14:47:02', 0, 0, 0, 1),
(15, 1, '1111111111', 'qwdddddddddd', '593c9b4a9390551d53e5cacf28ebd638', NULL, '1', '2018-01-06 13:05:47', 0, 0, 0, 1),
(16, 1, '111111wsssss', '1111eeeddddd', '5f7ac67cbee86d37e550e9e5e9086f86', NULL, '1', '2018-01-06 13:10:06', 0, 0, 0, 1),
(17, 1, 'qwe123qwe123', 'aswq112wwsqq', 'a22c97c9f7232db208f1dfbdd8c87d6c', NULL, '1', '2018-01-06 13:10:49', 0, 0, 0, 1),
(18, 1, 'eveeeeeeeeee', 'tryion3tryio', '4b08f6289c57d10482e07650395e11a9', NULL, '1', '2018-01-06 13:11:29', 0, 0, 0, 1),
(19, 0, 'wsdddddddddd', 'admin1111111', 'efa7d5aff41d7401fcf1682fc07c00aa', NULL, '1', '2018-01-06 14:20:18', 0, 0, 0, 1),
(20, 1, 'test0001', 'tryion005', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-15 00:32:26', 0, 0, 0, 1),
(21, 0, '11111234532', '13rwefffffff', '4a52ad7592cef56dd55071fc7e540449', NULL, '1', '2018-01-18 23:54:15', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user_account`
--

DROP TABLE IF EXISTS `user_account`;
CREATE TABLE IF NOT EXISTS `user_account` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT,
  `ua_value` float UNSIGNED NOT NULL DEFAULT '0',
  `ua_type` int(2) NOT NULL,
  `ua_add_datetime` datetime NOT NULL,
  `ua_from` varchar(50) DEFAULT NULL,
  `ua_u_id` varchar(50) DEFAULT NULL,
  `ua_remarks` text,
  `ua_status` enum('audit','payment','recorded','stopPayment','noAllowed') NOT NULL DEFAULT 'audit',
  `ua_from_ua_id` int(11) DEFAULT NULL,
  `ua_from_third` enum('ag') DEFAULT NULL,
  `ua_from_am_id` int(11) DEFAULT NULL,
  `ua_ub_id` int(11) DEFAULT NULL,
  `ua_upd_date` date DEFAULT NULL,
  `ua_order_id` int(11) NOT NULL,
  PRIMARY KEY (`ua_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_account`
--

INSERT INTO `user_account` (`ua_id`, `ua_value`, `ua_type`, `ua_add_datetime`, `ua_from`, `ua_u_id`, `ua_remarks`, `ua_status`, `ua_from_ua_id`, `ua_from_third`, `ua_from_am_id`, `ua_ub_id`, `ua_upd_date`, `ua_order_id`) VALUES
(1, 100, 1, '2018-01-18 19:42:15', '1', '1', '11', 'recorded', NULL, NULL, NULL, NULL, '2018-01-18', 0),
(2, 50, 3, '2018-01-18 20:24:01', NULL, '1', NULL, 'stopPayment', NULL, NULL, NULL, 1, '2018-01-18', 0),
(3, 5, 1, '2018-01-18 20:42:09', '1', '1', '0', 'audit', NULL, NULL, NULL, NULL, NULL, 0),
(4, 12, 1, '2018-01-18 20:42:25', '1', '1', '0', 'audit', NULL, NULL, NULL, NULL, NULL, 0),
(5, 11, 1, '2018-01-18 20:45:46', '1', '1', '1', 'audit', NULL, NULL, NULL, NULL, NULL, 0),
(6, 9, 1, '2018-01-18 20:57:08', '1', '1', '0', 'audit', NULL, NULL, NULL, NULL, NULL, 0),
(7, 16, 1, '2018-01-18 20:59:49', '1', '1', '11', 'audit', NULL, NULL, NULL, NULL, NULL, 0),
(8, 11, 1, '2018-01-18 21:00:04', '1', '1', '0', 'audit', NULL, NULL, NULL, NULL, NULL, 0),
(9, 50, 3, '2018-01-18 21:46:11', NULL, '1', NULL, 'payment', NULL, NULL, NULL, 1, '2018-01-22', 0),
(10, 50, 3, '2018-01-18 21:46:15', NULL, '1', NULL, 'payment', NULL, NULL, NULL, 1, '2018-01-22', 0),
(11, 50, 3, '2018-01-18 21:46:16', NULL, '1', NULL, 'payment', NULL, NULL, NULL, 1, '2018-01-22', 0),
(12, 50, 3, '2018-01-18 21:46:17', NULL, '1', NULL, 'payment', NULL, NULL, NULL, 1, '2018-01-22', 0),
(13, 50, 3, '2018-01-18 21:46:23', NULL, '1', NULL, 'stopPayment', NULL, NULL, NULL, 1, NULL, 0),
(14, 50, 3, '2018-01-18 21:46:24', NULL, '1', NULL, 'payment', NULL, NULL, NULL, 1, NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `user_account_record`
--

DROP TABLE IF EXISTS `user_account_record`;
CREATE TABLE IF NOT EXISTS `user_account_record` (
  `uar_id` int(11) NOT NULL AUTO_INCREMENT,
  `uar_am_id` int(11) NOT NULL,
  `uar_ua_id` int(11) NOT NULL,
  `uar_action` enum('change_status','insert','delete') DEFAULT NULL,
  `uar_add_datetime` datetime NOT NULL,
  `uar_change_status` enum('allowed','audit','noallowed','payment') NOT NULL,
  PRIMARY KEY (`uar_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_account_record`
--

INSERT INTO `user_account_record` (`uar_id`, `uar_am_id`, `uar_ua_id`, `uar_action`, `uar_add_datetime`, `uar_change_status`) VALUES
(1, 1, 35, 'change_status', '2018-01-18 19:27:48', 'allowed'),
(2, 1, 35, 'change_status', '2018-01-18 19:27:54', 'audit'),
(3, 1, 35, 'change_status', '2018-01-18 19:28:10', 'allowed'),
(4, 1, 35, 'change_status', '2018-01-18 19:28:41', 'audit'),
(5, 1, 22, 'change_status', '2018-01-18 19:30:35', 'allowed'),
(6, 1, 23, 'change_status', '2018-01-18 19:30:35', 'allowed'),
(7, 1, 24, 'change_status', '2018-01-18 19:30:35', 'allowed'),
(8, 1, 36, 'change_status', '2018-01-18 19:30:35', 'allowed'),
(9, 1, 37, 'change_status', '2018-01-18 19:30:35', 'allowed'),
(10, 1, 1, 'change_status', '2018-01-18 20:04:57', ''),
(11, 1, 1, 'change_status', '2018-01-18 20:12:56', 'audit'),
(12, 1, 1, 'change_status', '2018-01-18 20:22:16', ''),
(13, 1, 2, 'change_status', '2018-01-18 20:38:15', 'payment'),
(14, 1, 1, 'change_status', '2018-01-18 21:35:51', 'noallowed'),
(15, 1, 1, 'change_status', '2018-01-18 21:36:35', 'noallowed'),
(16, 1, 1, 'change_status', '2018-01-18 21:36:54', 'noallowed'),
(17, 1, 1, 'change_status', '2018-01-18 21:37:12', 'audit'),
(18, 1, 1, 'change_status', '2018-01-18 21:38:47', 'audit'),
(19, 1, 1, 'change_status', '2018-01-18 21:38:50', 'noallowed'),
(20, 1, 1, 'change_status', '2018-01-18 21:39:01', 'noallowed'),
(21, 1, 1, 'change_status', '2018-01-18 21:40:07', 'noallowed'),
(22, 1, 1, 'change_status', '2018-01-18 21:40:18', 'audit'),
(23, 1, 1, 'change_status', '2018-01-18 21:40:34', 'audit'),
(24, 1, 1, 'change_status', '2018-01-18 21:41:19', 'audit'),
(25, 1, 1, 'change_status', '2018-01-18 21:41:31', 'audit'),
(26, 1, 1, 'change_status', '2018-01-18 21:41:37', 'audit'),
(27, 1, 1, 'change_status', '2018-01-18 21:41:50', 'audit'),
(28, 1, 1, 'change_status', '2018-01-18 21:43:29', 'noallowed'),
(29, 1, 1, 'change_status', '2018-01-18 21:43:40', 'audit'),
(30, 1, 1, 'change_status', '2018-01-18 21:43:59', 'noallowed'),
(31, 1, 1, 'change_status', '2018-01-18 21:44:21', 'audit'),
(32, 1, 1, 'change_status', '2018-01-18 21:44:23', 'noallowed'),
(33, 1, 2, 'change_status', '2018-01-18 21:44:32', ''),
(34, 1, 2, 'change_status', '2018-01-18 21:44:38', 'payment'),
(35, 1, 1, 'change_status', '2018-01-18 21:46:09', ''),
(36, 1, 14, 'change_status', '2018-01-18 21:46:31', ''),
(37, 1, 14, 'change_status', '2018-01-18 21:47:57', 'payment'),
(38, 1, 2, 'change_status', '2018-01-18 23:44:40', ''),
(39, 1, 13, 'change_status', '2018-01-22 13:37:47', ''),
(40, 1, 12, 'change_status', '2018-01-22 13:53:57', 'payment'),
(41, 1, 11, 'change_status', '2018-01-22 15:09:19', 'payment'),
(42, 1, 10, 'change_status', '2018-01-22 15:10:47', 'payment'),
(43, 1, 9, 'change_status', '2018-01-22 15:11:03', 'payment');

-- --------------------------------------------------------

--
-- 資料表結構 `user_account_type`
--

DROP TABLE IF EXISTS `user_account_type`;
CREATE TABLE IF NOT EXISTS `user_account_type` (
  `uat_id` int(11) NOT NULL AUTO_INCREMENT,
  `uat_name` varchar(50) NOT NULL,
  `uat_out_in` enum('out','in') NOT NULL,
  PRIMARY KEY (`uat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_account_type`
--

INSERT INTO `user_account_type` (`uat_id`, `uat_name`, `uat_out_in`) VALUES
(1, '系統充值', 'in'),
(2, '使用者充值', 'in'),
(3, '提款', 'out'),
(4, '轉入', 'in'),
(5, '轉出', 'out');

-- --------------------------------------------------------

--
-- 資料表結構 `user_bank_info`
--

DROP TABLE IF EXISTS `user_bank_info`;
CREATE TABLE IF NOT EXISTS `user_bank_info` (
  `ub_id` int(11) NOT NULL AUTO_INCREMENT,
  `ub_u_id` int(11) NOT NULL,
  `ub_account` bigint(19) UNSIGNED NOT NULL,
  `ub_account_name` varchar(20) NOT NULL,
  `ub_bank_id` int(11) NOT NULL,
  `ub_province` varchar(10) NOT NULL,
  `ub_city` varchar(10) NOT NULL,
  `ub_branch_name` varchar(20) NOT NULL,
  `ub_add_datetime` datetime NOT NULL,
  PRIMARY KEY (`ub_id`),
  UNIQUE KEY `ub_account` (`ub_account`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_bank_info`
--

INSERT INTO `user_bank_info` (`ub_id`, `ub_u_id`, `ub_account`, `ub_account_name`, `ub_bank_id`, `ub_province`, `ub_city`, `ub_branch_name`, `ub_add_datetime`) VALUES
(1, 1, 12345678910911213, '蔡政哲', 1, '云南', '大理', '云南分行云南分行', '2018-01-14 20:26:05'),
(2, 1, 12345678912211213, '蔡政哲', 1, '云南', '大理', '云南分行云南分行', '2018-01-14 20:45:11');

-- --------------------------------------------------------

--
-- 資料表結構 `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE IF NOT EXISTS `user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ull_ip` varchar(30) NOT NULL,
  `ull_add_datetime` datetime NOT NULL,
  `ull_u_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_login_log`
--

INSERT INTO `user_login_log` (`id`, `ull_ip`, `ull_add_datetime`, `ull_u_id`) VALUES
(1, '127.0.0.1', '2019-08-28 11:07:37', 1),
(2, '127.0.0.1', '2019-08-28 11:07:46', 1),
(3, '127.0.0.1', '2019-08-28 11:08:26', 1),
(4, '127.0.0.1', '2019-08-28 11:08:32', 1),
(5, '127.0.0.1', '2019-08-28 11:08:43', 1),
(6, '127.0.0.1', '2019-08-28 11:08:55', 1),
(7, '127.0.0.1', '2019-08-28 11:09:05', 1),
(8, '127.0.0.1', '2019-08-28 11:09:15', 1),
(9, '127.0.0.1', '2019-08-28 11:10:11', 1),
(10, '127.0.0.1', '2019-08-28 11:11:25', 1),
(11, '127.0.0.1', '2019-08-28 11:14:04', 1),
(12, '127.0.0.1', '2019-08-28 11:15:01', 1),
(13, '127.0.0.1', '2019-08-28 14:01:25', 1),
(14, '127.0.0.1', '2019-08-28 14:02:05', 1),
(15, '127.0.0.1', '2019-08-28 14:02:19', 1),
(16, '127.0.0.1', '2019-08-28 14:02:36', 1),
(17, '127.0.0.1', '2019-08-28 14:03:04', 1),
(18, '127.0.0.1', '2019-08-28 14:03:11', 1),
(19, '127.0.0.1', '2019-08-28 14:03:42', 1),
(20, '127.0.0.1', '2019-08-28 14:03:50', 1),
(21, '127.0.0.1', '2019-08-28 14:03:58', 1),
(22, '127.0.0.1', '2019-08-28 14:04:56', 1),
(23, '127.0.0.1', '2019-08-28 14:05:49', 1),
(24, '127.0.0.1', '2019-08-28 14:06:32', 1),
(25, '127.0.0.1', '2019-08-28 14:06:45', 1),
(26, '127.0.0.1', '2019-08-28 14:06:53', 1),
(27, '127.0.0.1', '2019-08-28 14:07:02', 1),
(28, '127.0.0.1', '2019-08-28 14:08:11', 1),
(29, '127.0.0.1', '2019-08-28 14:08:16', 1),
(30, '127.0.0.1', '2019-08-28 14:08:54', 1),
(31, '127.0.0.1', '2019-08-28 14:09:10', 1),
(32, '127.0.0.1', '2019-08-28 14:09:15', 1),
(33, '127.0.0.1', '2019-08-28 14:09:27', 1),
(34, '127.0.0.1', '2019-08-28 14:14:02', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `user_message`
--

DROP TABLE IF EXISTS `user_message`;
CREATE TABLE IF NOT EXISTS `user_message` (
  `um_id` int(11) NOT NULL AUTO_INCREMENT,
  `um_u_id` int(11) NOT NULL,
  `um_title` varchar(50) NOT NULL,
  `um_content` text NOT NULL,
  `um_add_datetime` datetime NOT NULL,
  `um_is_read` enum('0','1') NOT NULL DEFAULT '0',
  `um_from_u_id` int(11) NOT NULL,
  PRIMARY KEY (`um_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_message`
--

INSERT INTO `user_message` (`um_id`, `um_u_id`, `um_title`, `um_content`, `um_add_datetime`, `um_is_read`, `um_from_u_id`) VALUES
(1, 1, '測試@', '測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@測試@', '2018-01-09 00:00:00', '0', 0),
(2, 0, '1', '1', '2018-01-15 13:01:53', '0', 1),
(3, 0, '1', '1', '2018-01-15 13:02:47', '0', 1),
(4, 0, '1', '1', '2018-01-15 13:03:06', '0', 1),
(5, 20, '1', '1', '2018-01-15 13:04:00', '0', 1),
(6, 20, '1', '1', '2018-01-15 13:06:37', '0', 1),
(7, 20, '1', '1', '2018-01-15 16:53:46', '0', 1),
(8, 2, '1', '1', '2018-01-15 16:59:56', '0', 1),
(9, 3, '1', '1', '2018-01-15 16:59:56', '0', 1),
(10, 8, '1', '1', '2018-01-15 16:59:56', '0', 1),
(11, 9, '1', '1', '2018-01-15 16:59:56', '0', 1),
(12, 10, '1', '1', '2018-01-15 16:59:56', '0', 1),
(13, 15, '1', '1', '2018-01-15 16:59:56', '0', 1),
(14, 16, '1', '1', '2018-01-15 16:59:56', '0', 1),
(15, 17, '1', '1', '2018-01-15 16:59:56', '0', 1),
(16, 18, '1', '1', '2018-01-15 16:59:56', '0', 1),
(17, 20, '1', '1', '2018-01-15 16:59:56', '0', 1),
(18, 2, '1', '1', '2018-01-15 17:01:26', '1', 1),
(19, 3, '1', '1', '2018-01-15 17:01:26', '0', 1),
(20, 8, '1', '1', '2018-01-15 17:01:26', '0', 1),
(21, 9, '1', '1', '2018-01-15 17:01:26', '0', 1),
(22, 10, '1', '1', '2018-01-15 17:01:26', '0', 1),
(23, 15, '1', '1', '2018-01-15 17:01:26', '0', 1),
(24, 16, '1', '1', '2018-01-15 17:01:26', '0', 1),
(25, 17, '1', '1', '2018-01-15 17:01:26', '0', 1),
(26, 18, '1', '1', '2018-01-15 17:01:26', '0', 1),
(27, 20, '1', '1', '2018-01-15 17:01:26', '0', 1),
(28, 1, '1', '2018-01-15 17:20:39', '0000-00-00 00:00:00', '0', 2),
(29, 1, '1', '2018-01-15 17:20:42', '0000-00-00 00:00:00', '0', 2);

-- --------------------------------------------------------

--
-- 資料表結構 `user_transfer_account`
--

DROP TABLE IF EXISTS `user_transfer_account`;
CREATE TABLE IF NOT EXISTS `user_transfer_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uta_reference_no` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `web_config`
--

DROP TABLE IF EXISTS `web_config`;
CREATE TABLE IF NOT EXISTS `web_config` (
  `wc_id` int(11) NOT NULL AUTO_INCREMENT,
  `wc_name` varchar(20) NOT NULL,
  `wc_value` varchar(50) NOT NULL,
  `wc_key` varchar(60) NOT NULL,
  `we_add_datetime` datetime NOT NULL,
  `we_enable` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`wc_id`),
  UNIQUE KEY `we_key` (`wc_key`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `web_config`
--

INSERT INTO `web_config` (`wc_id`, `wc_name`, `wc_value`, `wc_key`, `we_add_datetime`, `we_enable`) VALUES
(1, 'wechat帐号', '122', 'wechat_account', '2018-01-10 00:00:00', '1'),
(2, 'wechatQR图', '6b891b9fac5160a82e9cd8545858b7a1.png', 'wechat_qr_image', '2018-01-21 00:11:00', '1'),
(3, 'QQ号', '111111111111', 'qq_account', '2018-01-21 00:11:00', '1'),
(4, 'QQ号qr图', '6e1aabdf28618a2515d860f515c52de1.png', 'qq_qr_image', '2018-01-21 00:00:00', '1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
