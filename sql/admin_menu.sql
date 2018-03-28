-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2018-03-28 23:43:32
-- 伺服器版本: 5.7.19
-- PHP 版本： 5.6.31

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

-- --------------------------------------------------------

--
-- 資料表結構 `admin_menu`
--

CREATE TABLE `admin_menu` (
  `am_id` int(11) NOT NULL,
  `am_title` varchar(12) NOT NULL,
  `am_router` varchar(30) NOT NULL,
  `am_parent_id` int(11) NOT NULL,
  `am_add_datetime` datetime NOT NULL,
  `am_type` enum('button','menu','head_button','action') NOT NULL DEFAULT 'menu',
  `am_func` varchar(50) DEFAULT NULL,
  `am_show` int(1) NOT NULL DEFAULT '1',
  `am_order` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `admin_menu`
--

INSERT INTO `admin_menu` (`am_id`, `am_title`, `am_router`, `am_parent_id`, `am_add_datetime`, `am_type`, `am_func`, `am_show`, `am_order`) VALUES
(1, '使用者管理', '/user', 0, '2017-12-18 00:00:00', 'menu', NULL, 1, 1),
(2, '列表', '/list', 1, '2017-12-24 00:00:00', 'menu', NULL, 1, 1),
(3, '系統設定', '/system', 0, '2017-12-24 00:00:00', 'menu', NULL, 1, 1),
(41, '设定充值上限', '/setUseraAccountLimitForm', 2, '2018-02-21 00:00:00', 'button', NULL, 1, 1),
(6, '修改使用者密碼', '/doSetUserPasswd', 2, '2017-12-24 00:00:00', 'action', NULL, 1, 1),
(7, '修改資金密碼', '/setMoneyPasswd', 2, '2017-12-24 00:00:00', 'button', NULL, 1, 1),
(8, '新增總代號', '/addParentUser', 2, '2017-12-24 00:00:00', 'head_button', NULL, 1, 1),
(9, '新增下級帳號', '/addChildUser', 2, '2017-12-24 00:00:00', 'button', NULL, 1, 1),
(14, '充值', '/rechargeForm', 2, '2018-01-31 00:00:00', 'button', NULL, 1, 1),
(11, '充提管理', '/account', 0, '2017-12-24 00:00:00', 'menu', NULL, 1, 1),
(12, '报表管理', '/report', 0, '2017-12-24 00:00:00', 'menu', NULL, 1, 1),
(31, '论播banner', '/bigBannerList', 30, '2018-01-18 00:00:00', 'menu', NULL, 1, 1),
(32, '新增', '/addBigBanner', 31, '2018-01-29 00:00:00', 'head_button', NULL, 1, 1),
(17, '提款審核', '/withdrawalAuditList', 11, '2018-01-17 00:00:00', 'menu', NULL, 1, 1),
(18, '使用者充值', '', 2, '2018-01-31 00:00:32', 'action', NULL, 1, 1),
(19, '充值审核', '/rechargeAuditList', 11, '2018-01-07 00:00:53', 'menu', NULL, 1, 1),
(20, '送出', '/doRechargeAudit', 19, '2018-01-08 00:00:00', 'action', 'RechargeAuditChange', 1, 1),
(21, '新增后台帐号', '/addAdmin', 22, '2018-01-09 00:00:00', 'head_button', NULL, 1, 1),
(22, '管理者列表', '/adminList', 3, '2018-01-30 00:00:00', 'menu', NULL, 1, 1),
(23, '公告管理', '/announcemetList', 1, '2018-01-23 00:00:00', 'menu', NULL, 1, 1),
(24, '新增', '/add', 23, '2018-01-13 00:00:37', 'head_button', NULL, 1, 1),
(25, '修改', '/edit', 23, '2018-01-13 00:00:37', 'button', NULL, 1, 1),
(26, '删除', '/del', 23, '2018-01-13 00:00:00', 'head_button', 'deleteAnnouncemet', 1, 1),
(27, '送出', '/doWithdrawalAudit', 17, '2018-01-09 00:00:00', 'action', 'RechargeAuditChange', 1, 1),
(28, '修改使用者密碼', '/setUserPasswd', 2, '2018-01-01 00:00:00', 'button', NULL, 1, 1),
(30, '网站管理', '/website', 0, '2018-01-01 00:00:00', 'menu', NULL, 1, 1),
(33, '删除', '/delBigBanner', 31, '2018-01-31 13:00:00', 'head_button', 'deleteBanner', 1, 1),
(34, '修改', '/editBigBanner', 31, '2018-01-21 05:00:20', 'button', NULL, 1, 1),
(35, '连结设定', '/editFooter', 30, '2018-01-17 00:00:00', 'menu', NULL, 1, 1),
(36, '删除后台帐号', '/delAdmin', 22, '2018-01-31 00:00:00', 'head_button', 'delAdmin', 1, 1),
(38, '电话回拨', '/phoneCallBackList', 30, '2018-01-23 00:00:00', 'menu', NULL, 1, 1),
(39, '送出', '/changePhoneCallBackStatus', 38, '2018-01-16 00:00:00', 'button', 'changeStatus', 1, 1),
(43, '查询下级', '', 2, '2018-02-08 00:00:00', 'button', 'searchSubordinate', 1, 1),
(42, '登入ip查询', '/loginList', 1, '2018-02-25 00:00:00', 'menu', NULL, 1, 1),
(45, '转帐帐变', '/thirdTransferList', 12, '2018-02-14 00:00:00', 'menu', NULL, 1, 1),
(46, '冻结帐号', '/lockUser', 2, '2018-02-06 00:00:00', 'button', 'lockUser', 1, 1),
(47, '取消冻结', '', 2, '2018-02-21 00:00:00', 'button', 'unLock', 1, 1),
(62, '微信设定', '/wechat3', 52, '2018-02-08 00:00:00', 'menu', NULL, 1, 1),
(48, '系统扣款', '/chargeback', 2, '2018-02-05 00:00:00', 'button', NULL, 1, 1),
(49, '扣减审核', '/chargebackAuditList', 11, '2018-02-09 00:00:00', 'menu', NULL, 1, 1),
(50, '送出', '/doChargebackAudit', 49, '2018-02-16 00:00:00', 'menu', 'RechargeAuditChange', 1, 1),
(51, '第三方投注帐变', '/thirdBettinglList', 12, '2018-02-16 00:00:00', 'menu', NULL, 1, 1),
(52, '银行卡管理', '/bank', 0, '2018-02-15 00:00:00', 'menu', NULL, 1, 1),
(53, '查询列表', '/bankList', 52, '2018-02-15 00:00:00', 'menu', NULL, 1, 1),
(54, '黑名单列表', '/bankBlackList', 52, '2018-02-09 00:00:00', 'menu', NULL, 1, 1),
(55, '解锁绑定银行卡', '', 2, '2018-02-07 00:00:00', 'button', 'unlockUserBankCard', 1, 1),
(56, '新增银行卡', '/addBlackList', 54, '2018-02-15 00:00:00', 'head_button', NULL, 1, 1),
(57, '充值訂單列表', '/userRechargeList', 11, '2018-02-10 00:00:00', 'menu', NULL, 1, 1),
(58, '收款银行卡设定', '/receiving_bank_card_list', 52, '2018-02-08 00:00:00', 'menu', NULL, 1, 1),
(59, '修改', '/editReceivingBankCardForm', 58, '2018-02-08 00:00:00', 'button', '', 1, 1),
(60, '新增收款银行卡', '/addReceivingBankCardForm', 58, '2018-02-08 00:00:00', 'head_button', NULL, 1, 1),
(61, '删除', '', 58, '2018-02-14 00:00:00', 'button', 'delReceivingBankCard', 1, 1),
(63, '支付宝设定', '/alipay2', 52, '2018-03-05 00:00:00', 'menu', NULL, 1, 1),
(64, '批次充值', '/batchRecharge', 11, '2018-03-21 00:00:00', 'menu', NULL, 1, 1);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`am_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `am_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
