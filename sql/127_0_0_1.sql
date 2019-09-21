-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1:3306
-- 產生時間： 2019 年 09 月 15 日 07:08
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
(20, '送出', '/doRechargeAudit', 19, '2018-01-08 00:00:00', 'action', 'doRechargeAudit', 1),
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
) ENGINE=MyISAM AUTO_INCREMENT=937 DEFAULT CHARSET=utf8;

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
(792, 'api', '密碼錯誤', '2019-08-28 14:17:03', 'Api', 'login'),
(793, 'api', '尚未登入', '2019-08-30 09:34:04', 'Api', '__construct'),
(794, 'api', '尚未登入', '2019-08-30 09:34:11', 'Api', '__construct'),
(795, 'api', '尚未登入', '2019-08-30 09:34:12', 'Api', '__construct'),
(796, 'api', '尚未登入', '2019-08-30 09:34:15', 'Api', '__construct'),
(797, 'api', '尚未登入', '2019-08-30 09:34:17', 'Api', '__construct'),
(798, 'api', '尚未登入', '2019-08-30 09:34:19', 'Api', '__construct'),
(799, 'api', '尚未登入', '2019-08-30 09:34:20', 'Api', '__construct'),
(800, 'api', '尚未登入', '2019-08-30 09:34:21', 'Api', '__construct'),
(801, 'api', '尚未登入', '2019-08-30 09:34:22', 'Api', '__construct'),
(802, 'api', '尚未登入', '2019-08-30 09:34:22', 'Api', '__construct'),
(803, 'api', '尚未登入', '2019-08-30 09:34:23', 'Api', '__construct'),
(804, 'api', '尚未登入', '2019-08-30 10:21:07', 'Api', '__construct'),
(805, 'api', 'reponse 必传参数为空', '2019-08-30 10:21:35', 'Api', 'registered'),
(806, 'api', '验证码错误', '2019-08-30 10:21:39', 'Api', 'registered'),
(807, 'api', '尚未登入', '2019-08-30 10:26:39', 'Api', '__construct'),
(808, 'api', '尚未登入', '2019-08-30 10:40:58', 'Api', '__construct'),
(809, 'api', '尚未登入', '2019-08-30 10:42:35', 'Api', '__construct'),
(810, 'api', 'reponse 必传参数为空', '2019-08-30 10:42:39', 'Api', 'login'),
(811, 'api', 'reponse 必传参数为空', '2019-08-30 10:42:40', 'Api', 'login'),
(812, 'api', 'reponse 必传参数为空', '2019-08-30 10:42:40', 'Api', 'login'),
(813, 'api', 'reponse 必传参数为空', '2019-08-30 10:42:40', 'Api', 'login'),
(814, 'api', 'reponse 必传参数为空', '2019-08-30 10:42:57', 'Api', 'login'),
(815, 'api', '尚未登入', '2019-08-30 10:43:46', 'Api', '__construct'),
(816, 'api', '尚未登入', '2019-08-30 10:44:42', 'Api', '__construct'),
(817, 'api', 'reponse 必传参数为空', '2019-08-30 10:44:47', 'Api', 'registered'),
(818, 'api', '尚未登入', '2019-08-30 10:44:59', 'Api', '__construct'),
(819, 'api', '尚未登入', '2019-08-30 10:45:22', 'Api', '__construct'),
(820, 'api', '尚未登入', '2019-08-30 10:45:45', 'Api', '__construct'),
(821, 'api', 'reponse 必传参数为空', '2019-08-30 10:45:49', 'Api', 'registered'),
(822, 'api', '尚未登入', '2019-08-30 10:46:12', 'Api', '__construct'),
(823, 'api', 'reponse 必传参数为空', '2019-08-30 10:46:25', 'Api', 'registered'),
(824, 'api', 'reponse 必传参数为空', '2019-08-30 10:46:29', 'Api', 'registered'),
(825, 'api', 'reponse 必传参数为空', '2019-08-30 10:46:42', 'Api', 'registered'),
(826, 'api', 'reponse 必传参数为空', '2019-08-30 10:47:04', 'Api', 'registered'),
(827, 'api', 'reponse 必传参数为空', '2019-08-30 10:47:37', 'Api', 'registered'),
(828, 'api', 'reponse 必传参数为空', '2019-08-30 10:48:29', 'Api', 'registered'),
(829, 'api', 'reponse 必传参数为空', '2019-08-30 10:49:05', 'Api', 'registered'),
(830, 'api', 'reponse 必传参数为空', '2019-08-30 10:49:09', 'Api', 'registered'),
(831, 'api', 'reponse 必传参数为空', '2019-08-30 10:49:17', 'Api', 'registered'),
(832, 'api', 'reponse 必传参数为空', '2019-08-30 10:49:30', 'Api', 'registered'),
(833, 'api', 'reponse 必传参数为空', '2019-08-30 10:49:47', 'Api', 'registered'),
(834, 'api', '验证码错误', '2019-08-30 10:51:46', 'Api', 'registered'),
(835, 'api', '昵称长度为4~12位', '2019-08-30 10:51:55', 'Api', 'registered'),
(836, 'api', '帐号为4~10为小写英文与数字组合', '2019-08-30 10:52:08', 'Api', 'registered'),
(837, 'api', '尚未登入', '2019-08-30 10:57:37', 'Api', '__construct'),
(838, 'api', '此帐号已注册', '2019-08-30 10:58:34', 'Api', 'registered'),
(839, 'api', '尚未登入', '2019-08-30 11:00:39', 'Api', '__construct'),
(840, 'api', '此帐号已注册', '2019-08-30 13:34:26', 'Api', 'registered'),
(841, 'api', '尚未登入', '2019-08-30 14:18:43', 'Api', '__construct'),
(842, 'api', '尚未登入', '2019-08-30 14:18:44', 'Api', '__construct'),
(843, 'api', '尚未登入', '2019-08-30 14:18:44', 'Api', '__construct'),
(844, 'api', '尚未登入', '2019-09-06 08:51:54', 'Api', '__construct'),
(845, 'api', '尚未登入', '2019-09-06 08:57:33', 'Api', '__construct'),
(846, 'api', '尚未登入', '2019-09-06 08:59:33', 'Api', '__construct'),
(847, 'api', '尚未登入', '2019-09-06 09:02:34', 'Api', '__construct'),
(848, 'api', '尚未登入', '2019-09-06 09:02:48', 'Api', '__construct'),
(849, 'api', '尚未登入', '2019-09-06 09:03:12', 'Api', '__construct'),
(850, 'api', '尚未登入', '2019-09-06 09:03:31', 'Api', '__construct'),
(851, 'api', '尚未登入', '2019-09-06 09:06:36', 'Api', '__construct'),
(852, 'api', '尚未登入', '2019-09-06 09:06:57', 'Api', '__construct'),
(853, 'api', '尚未登入', '2019-09-06 09:07:14', 'Api', '__construct'),
(854, 'api', '尚未登入', '2019-09-06 09:09:00', 'Api', '__construct'),
(855, 'api', '尚未登入', '2019-09-06 09:09:32', 'Api', '__construct'),
(856, 'api', '尚未登入', '2019-09-06 09:09:48', 'Api', '__construct'),
(857, 'api', '尚未登入', '2019-09-06 09:11:26', 'Api', '__construct'),
(858, 'api', '尚未登入', '2019-09-06 09:13:48', 'Api', '__construct'),
(859, 'api', '尚未登入', '2019-09-06 09:14:16', 'Api', '__construct'),
(860, 'api', '尚未登入', '2019-09-06 09:15:12', 'Api', '__construct'),
(861, 'api', '尚未登入', '2019-09-06 09:15:14', 'Api', '__construct'),
(862, 'api', '尚未登入', '2019-09-06 09:15:15', 'Api', '__construct'),
(863, 'api', '尚未登入', '2019-09-06 09:15:16', 'Api', '__construct'),
(864, 'api', '尚未登入', '2019-09-06 09:15:20', 'Api', '__construct'),
(865, 'api', '尚未登入', '2019-09-06 09:15:24', 'Api', '__construct'),
(866, 'api', '尚未登入', '2019-09-06 09:15:25', 'Api', '__construct'),
(867, 'api', '尚未登入', '2019-09-06 09:15:48', 'Api', '__construct'),
(868, 'api', '尚未登入', '2019-09-06 09:15:52', 'Api', '__construct'),
(869, 'api', '尚未登入', '2019-09-06 09:15:59', 'Api', '__construct'),
(870, 'api', '尚未登入', '2019-09-06 09:16:03', 'Api', '__construct'),
(871, 'api', '尚未登入', '2019-09-06 09:16:04', 'Api', '__construct'),
(872, 'api', '尚未登入', '2019-09-06 09:16:07', 'Api', '__construct'),
(873, 'api', '尚未登入', '2019-09-06 09:16:07', 'Api', '__construct'),
(874, 'api', '尚未登入', '2019-09-06 09:16:09', 'Api', '__construct'),
(875, 'api', '尚未登入', '2019-09-06 09:16:12', 'Api', '__construct'),
(876, 'api', '尚未登入', '2019-09-06 09:16:51', 'Api', '__construct'),
(877, 'api', '尚未登入', '2019-09-06 09:16:53', 'Api', '__construct'),
(878, 'api', '尚未登入', '2019-09-06 09:16:54', 'Api', '__construct'),
(879, 'api', '尚未登入', '2019-09-06 09:16:57', 'Api', '__construct'),
(880, 'api', '尚未登入', '2019-09-08 12:50:27', 'Api', '__construct'),
(881, 'api', '无法取得取得游戏入口', '2019-09-08 12:51:52', 'Api', 'getGameUrl'),
(882, 'api', '无法取得取得游戏入口', '2019-09-08 13:00:06', 'Api', 'getGameUrl'),
(883, 'api', '无法取得取得游戏入口', '2019-09-08 13:00:07', 'Api', 'getGameUrl'),
(884, 'api', '无法取得取得游戏入口', '2019-09-08 13:04:35', 'Api', 'getGameUrl'),
(885, 'api', '无法取得取得游戏入口', '2019-09-08 13:04:36', 'Api', 'getGameUrl'),
(886, 'api', '无法取得取得游戏入口', '2019-09-08 13:05:08', 'Api', 'getGameUrl'),
(887, 'api', '无法取得取得游戏入口', '2019-09-08 13:05:10', 'Api', 'getGameUrl'),
(888, 'api', '查無此帳號', '2019-09-09 08:24:21', 'Api', 'login'),
(889, 'api', '查無此帳號', '2019-09-09 08:24:33', 'Api', 'login'),
(890, 'api', '查無此帳號', '2019-09-09 08:25:16', 'Api', 'login'),
(891, 'api', '密碼錯誤', '2019-09-09 08:25:53', 'Api', 'login'),
(892, 'api', '密碼錯誤', '2019-09-09 08:26:47', 'Api', 'login'),
(893, 'api', '密碼錯誤', '2019-09-09 08:26:53', 'Api', 'login'),
(894, 'api', '密碼錯誤', '2019-09-09 08:26:58', 'Api', 'login'),
(895, 'api', '密碼錯誤', '2019-09-09 08:27:41', 'Api', 'login'),
(896, 'api', '密碼錯誤', '2019-09-09 08:28:18', 'Api', 'login'),
(897, 'api', '密碼錯誤', '2019-09-09 08:28:50', 'Api', 'login'),
(898, 'api', '密碼錯誤', '2019-09-09 08:29:25', 'Api', 'login'),
(899, 'api', '查無此帳號', '2019-09-09 08:33:08', 'Api', 'login'),
(900, 'api', '尚未登入', '2019-09-10 00:08:42', 'Api', '__construct'),
(901, 'api', '无法取得取得第三方用户馀额', '2019-09-10 00:09:02', 'Api', 'getThirdBlance'),
(902, 'api', '无法取得使用者馀额', '2019-09-10 00:09:12', 'Api', 'transferToThird'),
(903, 'api', '无法取得用户投注列表', '2019-09-10 00:09:24', 'Api', 'getThirdBetByUser'),
(904, 'api', '无法取得取得第三方用户馀额', '2019-09-10 00:09:26', 'Api', 'getThirdBlance'),
(905, 'api', '无法取得取得第三方用户馀额', '2019-09-10 00:09:55', 'Api', 'getThirdBlance'),
(906, 'api', '无法取得使用者馀额', '2019-09-10 00:10:07', 'Api', 'transferToThird'),
(907, 'api', '无法取得取得第三方用户馀额', '2019-09-10 00:10:32', 'Api', 'getThirdBlance'),
(908, 'api', '尚未登入', '2019-09-10 08:15:45', 'Api', '__construct'),
(909, 'api', '无法取得取得第三方用户馀额', '2019-09-10 08:19:44', 'Api', 'getThirdBlance'),
(910, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 08:52:31', 'Api', 'doRechargeAudit'),
(911, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 08:54:36', 'Api', 'doRechargeAudit'),
(912, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 08:55:35', 'Api', 'doRechargeAudit'),
(913, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 08:56:34', 'Api', 'doRechargeAudit'),
(914, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 08:58:58', 'Api', 'doRechargeAudit'),
(915, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 08:59:04', 'Api', 'doRechargeAudit'),
(916, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 09:00:36', 'Api', 'doRechargeAudit'),
(917, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 09:00:48', 'Api', 'doRechargeAudit'),
(918, 'db', '儲值超过限制，一天只能儲值次，最高额度为', '2019-09-10 09:01:34', 'Api', 'doRechargeAudit'),
(919, 'api', '尚未登入', '2019-09-10 09:05:04', 'Api', '__construct'),
(920, 'api', '尚未登入', '2019-09-10 09:05:04', 'Api', '__construct'),
(921, 'api', '尚未登入', '2019-09-10 09:05:04', 'Api', '__construct'),
(922, 'api', '尚未登入', '2019-09-10 09:05:12', 'Api', '__construct'),
(923, 'api', '尚未登入', '2019-09-10 09:05:12', 'Api', '__construct'),
(924, 'api', '尚未登入', '2019-09-10 09:05:13', 'Api', '__construct'),
(925, 'api', '尚未登入', '2019-09-10 09:15:58', 'Api', '__construct'),
(926, 'api', '尚未登入', '2019-09-10 09:15:59', 'Api', '__construct'),
(927, 'api', '尚未登入', '2019-09-10 09:16:03', 'Api', '__construct'),
(928, 'api', '查無此帳號', '2019-09-10 09:16:17', 'Api', 'login'),
(929, 'api', '密碼錯誤', '2019-09-10 09:22:00', 'Api', 'login'),
(930, 'api', '無法取得使用者資料', '2019-09-10 09:22:17', 'Api', '__construct'),
(931, 'api', '无资料更新', '2019-09-10 09:50:53', 'Api', 'doRechargeAudit'),
(932, 'api', '无资料更新', '2019-09-10 10:12:31', 'Api', 'doRechargeAudit'),
(933, 'api', '无法取得取得第三方用户馀额', '2019-09-10 11:10:56', 'Api', 'getThirdBlance'),
(934, 'api', '无法取得取得第三方用户馀额', '2019-09-10 11:11:03', 'Api', 'getThirdBlance'),
(935, 'api', '无法取得取得第三方用户馀额', '2019-09-10 11:11:13', 'Api', 'getThirdBlance'),
(936, 'api', '无法取得取得第三方用户馀额', '2019-09-10 11:11:21', 'Api', 'getThirdBlance');

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
('gpf8vjjhqb1urm896pnbms264lvnl1av', '127.0.0.1', 1567918227, ''),
('ag1oct5vrvhlh111imftpo40ni73dc5a', '127.0.0.1', 1567918227, ''),
('ormlssnui37kdrl80m9equj4q7j2rvn7', '127.0.0.1', 1567918227, ''),
('1v0h7t8v87200rergse34vhio7cqun1g', '127.0.0.1', 1567926511, ''),
('mj1gt03loosocdijfal7nabi4go4vs33', '127.0.0.1', 1567988076, ''),
('e99vsf9getrfqa8ki3kn34uu0fivtj1a', '127.0.0.1', 1567988076, ''),
('mken2dh23k807qfid7r3ik4pjva427ve', '127.0.0.1', 1567993652, 0x656e63727970745f757365725f646174617c733a3734343a2253554932655752495955563251304e575a3370615279744e655456314e3156555532705a655451355232637a633346306246565651533947556e5933626b5279646d4d78635578446558424c4d5868584e335933557a4a704d6a4e3161485270515452446132687063323571597a4a78633349324d5773784b7a6c59593370486444525a64797478563152485a30355a4d6d706852586842626d74514d326c496454466863556c4d654646365245566d4e56637852584e34656e4a544e304e3261546c704e6e46364d48644656304a69553342716447527562324a5a546e5a4564566f79646c706c616b74684d7a67795432747456557468596b647153326c355553396c55573947634539464e6c686a4b334e505631687853473957526e6b304f585a36616b467951565256633268735a314675634568775447687863464e434d31417a59326c5961556858546e52794d474a6b5646553155584578633256785533517a523231434d57646863797461565774344d6c4e45636d31786357706b4e6e70484c3056514f57733154445644565770346344645a62324e3461484e574f57464961323968533035445a486870646d464461305a74616b395462325a57614864775431704f646e56525630745255326c684f56644459546447596d5a424e566c4c64554e775547467a55456c6952306c584b7a5a736448705a526b45315131644a6455457a543064575345524e4e315a47556e5a524e55517851564635516a6c4a4d30395a4e45746d4d6d4e6f4d567031646b31445a556f335a6e46444f455646556e704e646d357353577871576c526c63564577644464776430524762446b316331417a646b396b6433684763474643574668454b314a53515746555131527754574a30596d466a63556777526e597a516c45776247704b52445250635746446254517761454a76513249334d30646c5a6d4e7463584e3056573168633063764d6c4e7a64314a36636d6432576d707a5530644e4d6d744464486f324d584e5250513d3d223b),
('58dmngs6t9coqudc7p11t5dijoih6io3', '127.0.0.1', 1568045487, 0x656e63727970745f757365725f646174617c733a3832383a225244566b4d315a304f586b775345466d536d786a554552434c7a49345a307733654764775a3170364d454a714e57786b4d7a564d5547464262314a7a5453393157466876616a4d795a565677616e5a4b4e6a5a576355773263326c536446704d547a6c7762545a5157584a314e3152325a473833517a4e3363475a51535539756357523051545630544568486145566a4d5555764e565a32616e6c6d5245787759566f314e5756544e7973316158413259585a456569387a616e4a444e6e4a4765546b765431646e4d69395a593049344c304a424e5442315a4778564e6a464d61697335595552795557357665576c774e6e687a4e4856325331566854564e6c5632647251574e6f4f57526f5a6a497256305672656e466e4d7a526b6132354a5a55466a56544243597a4a7161464a77626c42744f45356164485a565a485a424f4856705933686c6357684c4d5778535a55313457457056647a4a55646e55354e5667354e6a63355657524d656a4a6f54485533635545775a6d34795644417a626e464762584e6d61564654546d39474e4855725748646e4e335631537a6c4e53324a5a4d3164596155746c5157705853564e506357387665545672566e464a57575655646e56434f57394c4c33497a4f5756734e46704a4e573878565564594f54526d5444564d4e437434545456784d475278544642344e446779643268356446463462307042545752564e48553256326c6f526d6b35526e5634556e683652315a475a33464b5756646c516d74784e7a67794d47747364555a6c5530314f536b4a43636c6f31636e526d576b314757485635646d6c4d4d6d49335557517a51327055575656504e6e45794f454a725a585a6163566444636b4972646d704b617939505757314d56464e4a64484e354d6d45775979387653336854555374545357704c55327047556d35535a3035686430465451316b7a4e6a5a794d3030305a464a576133706b5256566f4d564a78616c42534e576334656d685657446c704e44426e627a5a436132784e4f457453526b4a4c5a6c6c4e4f45707655564d3562484130647a6868565768594e3067785a6d563154484e4254454d77626c46735248564c53336c78536a6873626c5659576d70305345526e4d44303d223b),
('9ine0fqng8tothe8se5trfpg4863dr3h', '127.0.0.1', 1568045322, ''),
('v4futaicf0lmjoft6o7s598700ada367', '127.0.0.1', 1568045322, ''),
('cbrgv4b537ouhv2thmh3kcrmelsu8v7p', '127.0.0.1', 1568045322, ''),
('6bkbsj6or3g7nvpqsfke94d7vkip4nvl', '127.0.0.1', 1568074545, ''),
('9gsqpo7t8uhlu82oind1nbk3o6quunvp', '127.0.0.1', 1568074545, ''),
('b9f44eo2gfs24jue0dbn6mo5amk1qkvt', '127.0.0.1', 1568074545, ''),
('p2ul84dgqmqh417fp36j3vqivngd3f67', '127.0.0.1', 1568075277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037353237373b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b),
('9tfluar502hnbd4gmsei5hgcbk1r64a4', '127.0.0.1', 1568075682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037353638323b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b),
('kcv06rbu8llhhp9nhgoubjr6fqgvr9ba', '127.0.0.1', 1568076409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037363430393b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b),
('nkboj8q7b2hgj3549963qh9fs3qet14u', '127.0.0.1', 1568076751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037363735313b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b),
('f8f0q4988vkfn96crl69ank9s0t76lk7', '127.0.0.1', 1568077138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037373133383b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b),
('29mpmvbuvmm1gik58hmqphprialb8q07', '127.0.0.1', 1568077446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037373434363b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b),
('favodcl3bdtacg4evt3pinshq0rt6ruq', '127.0.0.1', 1568079112, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037393131323b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('fnalblsbhfmtkhu185b6m5cuabb9jg21', '127.0.0.1', 1568079636, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037393633363b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('0qjhg4vt5bapeilon6ibumfr15uhpbg7', '127.0.0.1', 1568079990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383037393939303b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('1thc2pndb95hras5ilgug4uogts309jp', '127.0.0.1', 1568080307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383038303330373b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('4rd0aksstqhr1iia4o09de3ibvru339l', '127.0.0.1', 1568080659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383038303635393b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('98ch9qsor0g9v295cunhq7f349vnl9p0', '127.0.0.1', 1568080974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383038303937343b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('5dll4kbn3i7a62804o6bssd2sbnfmqqq', '127.0.0.1', 1568081346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383038313334363b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('d1b3f51j1fh7g486bn3v58fqenf8h369', '127.0.0.1', 1568081655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383038313635353b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('kngri588navl3g37u5hsp8hknf4os861', '127.0.0.1', 1568085683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383038353638333b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b),
('cfhpsunq4jrv5n9aqnvr7c2tarr87h8r', '127.0.0.1', 1568085759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536383038353638333b656e63727970745f61646d696e5f646174617c733a3334343a22627a4a50656a4e44554556794e584972626d5a6e6457704d566c68494f444e4662305653556c5234536a646c516a5a53556b463652316849656c4a5655566b344b324e796232783353314935576d4a33596d70734e484d765a6d68325131557a4e565a4d633070494e47637765576c535a306b30523149304d32317555316b314d3164595345464c5a4670364e306877527a4d7a5245466f4e6e465365584a6f54574a455654673462544e4552485a756458426e59324a43536e707856444a6b616c6444616b564b646b396d656e68706232706f52304e735230566e5a6d4671615870795a4468494d6d3878626a4a56634670696133684e5657397463556c57574646684d326c614c3064506231683661553177616c425a4b327051556c42735345356e5647593261546c514e46684861586b77654564685a6b5242546c644651324e74546d7445597a6869516a526a5430313057673d3d223b656e63727970745f757365725f646174617c733a313139363a2264324e6e636a4e365a55647a51336c3561576c36566b6474546c41354d47644f64303156614842756557303453445643556b3135566b39684d576879633356724d444a54576a5673546b3533645646754f45566f656a5a4b516c4a44574739514d6d31694b7a5a354e55686f4d57524454335230596c564256485978515770716448467462306832556c6842515774785557313561335642616d70745545597859566c7956574e36543235724e576876543074684e475633534746434c304e7356793975516d56774f45303463574e73515864365a546c6c61454e57646b30774e574a574d7a6b72614652444d453035526e6c344b33686963304e4362556870626a565a4e6e4e4e62465a5753314a46613349315254466a553342324d5655344d584e75597a4a57516e7074544867334d3251786158647464545a6d4d6b677a4e3046455a5670774f544a42616b3573566d3546636e6330596c517957444a5a5456427756584e775a5445726131564753576872556e567653475a734e315a765a3052535346426c546d3150526b354254334e79576b63306347557751314e424e6c706f545773345930784e5747686e595339444f54517654484577635868584e465a5552335a6c4e324a4e5a455a7a516e68475431566c626a5a52554456535444426a54446b334d6a68525748527654314252545552794d56686e4f5464515757527151564a6e547a6c734d6e4a325158564e543078595332464565477077596b45314d57526d6555787362303578616b4a6d636e637854565a7a63466f344e6b6c486432686e4f4852615a6c4e4a625446345445383553544a3564554635565745774e586469536e5a6b64454e795a465a444c32347a656d64305930707061474e5265553935524578735532647151586c4a6248637a616d397362574d3455326334527939735555527452533877566b64315233705665464e3359315a6b524746764e545a496232463657454e434d3031614c32773062437436515668715230706a515545355a574e3159304a6c51554d3261486848616a59344d5564324d5574314f48706e4f57313664475a784e57393561564636656c5268536e5a474f45746a53545a726258424e616c6c515a57733361484d34576a687a5a58524d4d564678526b39534e6a5172547939365958427555564e6d6332355556446c594b336834517a46745648705152564245617a5a304f5641724b323132546d34785657356d613142504e47356a64444a75516e565656444a5764564176567a4e4553546c595745566c526d317a6230784762336c6c62484e43656a63786448497a5a5868586346567764556830524578795757633052316476566c4e33646e673054484a6b4f477854546d7455613052324d6d7334517a5a76526e4533643064334c3342445533647957575a795644524d5a6a6c554f47646c4d566869526d6c47526d49774c325a6a5a6e4e3662334634654539475758706b576b6378614864556357565a524734304f584a346247787a59586c794d46705a536d396c616d6c585544644f6346426d576e4a564e6b74324d485a544e325653643146764d557330525564505258673463336c7954574e4e4d54557256316c5a56455a5161306872596e645a525756775958493d223b);

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
  `u_payment_number_limit` tinyint(3) UNSIGNED NOT NULL DEFAULT '3',
  `u_payment_value_limit` int(11) UNSIGNED NOT NULL DEFAULT '10000',
  `u_received_number_limit` tinyint(3) UNSIGNED NOT NULL DEFAULT '3',
  `u_received_value_limit` int(11) UNSIGNED NOT NULL DEFAULT '100000',
  `u_balance` decimal(30,8) UNSIGNED NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_account` (`u_account`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user`
--

INSERT INTO `user` (`u_id`, `u_superior_id`, `u_name`, `u_account`, `u_passwd`, `u_money_passwd`, `u_status`, `u_add_datetime`, `u_ag_is_reg`, `u_is_lock`, `u_bank_card_lock`, `u_ag_game_model`, `u_payment_number_limit`, `u_payment_value_limit`, `u_received_number_limit`, `u_received_value_limit`, `u_balance`) VALUES
(1, 0, 'test0000', 'tryion000', '25d55ad283aa400af464c76d713c07ad', '1c63129ae9db9c60c3e8aa94d3e00495', '1', '2017-12-20 00:00:00', 1, 0, 0, 1, 3, 10000, 3, 100000, '2911.00000000'),
(2, 1, 'test0001', 'tryion001', '25d55ad283aa400af464c76d713c07ad', '', '1', '2017-12-20 16:52:27', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(3, 1, 'test0002', 'tryion002', '25d55ad283aa400af464c76d713c07ad', '', '1', '2017-12-20 17:51:34', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(4, 0, '1111111111', '111111111111', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-30 12:48:58', 0, 0, 0, 1, 3, 10000, 3, 100000, '400.00000000'),
(5, 0, '1111111111', '1223dfsdfse', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-30 12:49:07', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(6, 0, '111111111111', 'qswwww111111', '25d55ad283aa400af464c76d713c07ad', '593c9b4a9390551d53e5cacf28ebd638', '1', '2017-12-30 12:50:03', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(7, 6, '111111111111', '2eeeeeeee12', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-30 14:17:55', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(8, 1, '1ee22r3wr2r2', '42fdv11e2fed', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-30 14:21:07', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(9, 1, 'fevdvfevwdev', 'vfds cdfvedw', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-30 14:21:51', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(10, 1, 'wdscfssv', 'dwfwfwefq', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-30 14:22:25', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(11, 0, '11111111', '111111111', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-31 16:41:47', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(12, 0, '111111111111', 'aaaaaaqqqqqq', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-31 16:42:59', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(13, 0, '111111adcdca', 'sfwfsavdavd', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2017-12-31 16:44:31', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(14, 0, '111sadasdas', '111sdsdasda', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-01 14:47:02', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(15, 1, '1111111111', 'qwdddddddddd', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-06 13:05:47', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(16, 1, '111111wsssss', '1111eeeddddd', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-06 13:10:06', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(17, 1, 'qwe123qwe123', 'aswq112wwsqq', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-06 13:10:49', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(18, 1, 'eveeeeeeeeee', 'tryion3tryio', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-06 13:11:29', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(19, 0, 'wsdddddddddd', 'admin1111111', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-06 14:20:18', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(20, 1, 'test0001', 'tryion005', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-15 00:32:26', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(21, 0, '11111234532', '13rwefffffff', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2018-01-18 23:54:15', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(22, 0, '12345678', 'tyrion', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 10:57:44', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(23, 0, '12345678', 'tyrion690', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:35:11', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(24, 0, '12345678', 'tyrion101', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:38:59', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(25, 0, '12345678', 'tyrion715', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:39:28', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(26, 0, '12345678', 'tyrion205', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:39:56', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(27, 0, '12345678', 'tyrion284', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:40:21', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(28, 0, '12345678', 'tyrion480', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:42:18', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(29, 0, '12345678', 'tyrion948', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:42:31', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(30, 0, '12345678', 'tyrion200', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:42:48', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(31, 0, '12345678', 'tyrion187', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 13:43:12', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(32, 0, '12345678', 'tyrion612', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:01:13', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(33, 0, '12345678', 'tyrion246', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:01:47', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(34, 0, '12345678', 'tyrion494', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:02:50', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(35, 0, '12345678', 'tyrion634', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:02:56', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(36, 0, '12345678', 'tyrion401', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:03:22', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(37, 0, '12345678', 'tyrion592', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:04:14', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(38, 0, '12345678', 'tyrion988', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:04:26', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(39, 0, '12345678', 'tyrion262', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:04:49', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(40, 0, '12345678', 'tyrion289', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:05:04', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(41, 0, '12345678', 'tyrion746', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:05:45', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(42, 0, '12345678', 'tyrion192', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:07:42', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(43, 0, '12345678', 'tyrion521', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:15:14', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(44, 0, '12345678', 'tyrion767', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:16:01', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(45, 0, '12345678', 'tyrion806', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:17:35', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(46, 0, '12345678', 'tyrion974', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:17:43', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(47, 0, '12345678', 'tyrion554', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-08-30 14:17:51', 1, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(48, 0, '1111', '121212', '25d55ad283aa400af464c76d713c07ad', NULL, '1', '2019-09-09 08:59:13', 1, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000'),
(49, 32, '蔡政哲e', 'grfgfdgdfg', '0b25ba7bbccaee97789c8021f9cd0d33', NULL, '1', '2019-09-10 11:21:46', 0, 0, 0, 1, 3, 10000, 3, 100000, '0.00000000');

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
  `ua_status` enum('audit','payment','received','stopPayment','noAllowed') NOT NULL DEFAULT 'audit',
  `ua_from_ua_id` int(11) DEFAULT NULL,
  `ua_from_third` enum('ag') DEFAULT NULL,
  `ua_from_am_id` int(11) DEFAULT NULL,
  `ua_ub_id` int(11) DEFAULT NULL,
  `ua_upd_date` date DEFAULT NULL,
  `ua_order_id` int(11) NOT NULL,
  `ua_aduit_ad_id` int(11) NOT NULL,
  `ua_change_status_remarks` varchar(30) NOT NULL,
  PRIMARY KEY (`ua_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `user_account`
--

INSERT INTO `user_account` (`ua_id`, `ua_value`, `ua_type`, `ua_add_datetime`, `ua_from`, `ua_u_id`, `ua_remarks`, `ua_status`, `ua_from_ua_id`, `ua_from_third`, `ua_from_am_id`, `ua_ub_id`, `ua_upd_date`, `ua_order_id`, `ua_aduit_ad_id`, `ua_change_status_remarks`) VALUES
(1, 500, 1, '2019-09-10 10:14:25', '1', '1', '', 'received', NULL, NULL, 1, NULL, '2019-09-10', 0, 1, '');

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
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

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
(43, 1, 9, 'change_status', '2018-01-22 15:11:03', 'payment'),
(44, 1, 15, 'change_status', '2019-09-10 09:04:06', ''),
(45, 1, 16, 'change_status', '2019-09-10 09:32:16', ''),
(46, 1, 16, 'change_status', '2019-09-10 09:32:21', ''),
(47, 1, 16, 'change_status', '2019-09-10 09:32:32', 'noallowed'),
(48, 1, 16, 'change_status', '2019-09-10 09:32:35', ''),
(49, 1, 16, 'change_status', '2019-09-10 09:32:39', ''),
(50, 1, 17, 'change_status', '2019-09-10 09:41:04', ''),
(51, 1, 18, 'change_status', '2019-09-10 09:42:30', 'noallowed'),
(52, 1, 19, 'change_status', '2019-09-10 09:43:07', ''),
(53, 1, 20, 'change_status', '2019-09-10 09:49:34', 'noallowed'),
(54, 1, 8, 'change_status', '2019-09-10 09:50:48', 'noallowed'),
(55, 1, 7, 'change_status', '2019-09-10 09:51:28', ''),
(56, 1, 21, 'change_status', '2019-09-10 10:09:27', ''),
(57, 1, 22, 'change_status', '2019-09-10 10:12:10', ''),
(58, 1, 1, 'change_status', '2019-09-10 10:14:30', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

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
(34, '127.0.0.1', '2019-08-28 14:14:02', 1),
(35, '127.0.0.1', '2019-09-08 12:51:32', 47),
(36, '127.0.0.1', '2019-09-09 08:29:47', 47),
(37, '127.0.0.1', '2019-09-09 08:33:33', 1),
(38, '127.0.0.1', '2019-09-09 08:59:15', 48),
(39, '127.0.0.1', '2019-09-10 00:08:55', 1),
(40, '127.0.0.1', '2019-09-10 08:15:56', 1),
(41, '127.0.0.1', '2019-09-10 09:16:25', 1),
(42, '127.0.0.1', '2019-09-10 09:22:11', 1);

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
