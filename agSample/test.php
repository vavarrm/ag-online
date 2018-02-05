<?php
ini_set('display_errors', 1);
error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT & ~E_USER_NOTICE & ~E_USER_DEPRECATED);
/**
 * TC-Gaming 天成游戏
 * PHPSample 范例, 测试页面, 您可以直接执行此 test.php
 * @author PHOENIX WU
 * @Date 2017/06/19
 * @Version 1.0.1
 */
header('Content-Type:text/json;charset=utf-8');
include_once('class/tcg_common.php');
$tcg_class = new tcg_class();

/**
 * 2.1. CREATE/REGISTER PLAYER API 创建/确认玩家接口
 * @param $username 会员名称
 * @param $password 会员密码
 */
// echo "--------> TC-Gaming Sample Code 天成游戏范例代码 <--------\n";
// echo print_r('執行 --> 2.1. CREATE/REGISTER PLAYER API 创建/确认玩家接口');
// echo "\n";
$username = 'tryion';
$password = '12345678';
// $tcg_class-> create_user($username,$password);
// echo "\n";
// echo "\n";

/**
 * 2.2. UPDATE PASSWORD API 更新密码接口
 * @param $username 会员名称
 * @param $password 会员密码
 */
// echo print_r('執行 --> 2.2. UPDATE PASSWORD API 更新密码接口');
// echo "\n";
// $newpassword = time();
// $tcg_class-> update_password($username,$newpassword);
// echo "\n";
// echo "\n";


	
/**
 * 2.3. GET BALANCE API 获取余额接口
 * @param $username  		会员名称
 * @param $product_type   	产品代码
 */
echo print_r('執行 --> 2.3. GET BALANCE API 获取余额接口');
echo "\n";
$product_type = 4;
$tcg_class-> get_balance($username,$product_type);
echo "\n";
echo "\n";

/**
 * 2.4. FUND TRANSFER API 资金转账接口
 * @param $username			会员名称
 * @param $product_type   	产品代码
 * @param int $fund_type  	值1=转入到  值2=转出
 * @param $amount			金额
 * @param $reference_no		交易代码
 */
// echo print_r('執行 --> 2.4. FUND TRANSFER API 资金转账接口');
// echo "\n";
// $username = 'phoenixPHP';
// $product_type=4;
// $fund_type='1';
// $amount=1;
// $reference_no=date("Ymd").rand(1,999);
// $tcg_class-> user_transfer($username, $product_type, $fund_type, $amount, $reference_no);
// echo "\n";
// echo "\n";

/**
 * 2.5. CHECK TRANSACTION STATUS API 检查交易状态接口
 * @param $product_type	产品代码
 * @param $reference_no	交易代码
 */
// echo print_r('執行 --> 2.5. CHECK TRANSACTION STATUS API 检查交易状态接口');
// echo "\n";
// $product_type=4;
// $reference_no='201606190004';
// $tcg_class-> check_transfer($product_type, $reference_no);
// echo "\n";
// echo "\n";

/**
 * 2.6. LAUNCH GAME API 启动游戏接口 - 电子游戏
 * @param $username
 * @param $product_type
 * @param $gameMode
 * @param $gameCode
 * @param $platform
 */
echo print_r('執行 --> 2.6. LAUNCH GAME API 启动游戏接口 - 电子游戏');
echo "\n";
$product_type = 4;
$gameMode = 1;
$gameCode = 'A00179';
$platform = 'html5';
$tcg_class-> getLaunchGameRng($username, $product_type, $gameMode, $gameCode, $platform);
echo "\n";
echo "\n";

/**
 * 2.6. LAUNCH GAME API 启动游戏接口 - 彩票游戏
 * @param $username
 * @param $product_type
 * @param $game_mode
 * @param $game_code
 * @param $platform
 * @param $view
 */
// echo print_r('執行 --> 2.6. LAUNCH GAME API 启动游戏接口 - 彩票游戏');
// echo "\n";
// $product_type = 4;
// $game_mode = '1';
// $game_code = 'Lobby';
// $platform = 'html5';
// $view = 'Lobby';
// $tcg_class-> getLaunchGameLottery($username, $product_type, $game_mode, $game_code, $platform, $view);
// echo "\n";
// echo "\n";


/**
 * 2.7. GAME LIST API 游戏列表接口
 * @param $product_type 产品代码
 * @param $platform 	平台 - flash or html5 or all
 * @param $client_type 	终端设备 - pc:电脑客户端, phone:手机客户端, web:网页浏览器, html5:手机浏览器
 * @param $game_type 	游戏类型 - RNG, LIVE, PVP
 * @param $page 		第几页 - 如果没有值默认为 page = 1
 * @param $page_size 	每页显示几笔
 * @return string
 */
echo print_r('執行 --> 2.7. GAME LIST API 游戏列表接口');
echo "\n";
$product_type = 4;
$platform = "html5";
$client_type = "web";
$game_type = "LIVE";
$page = 1 ;
$page_size = 100;
$tcg_class-> getGameList($product_type, $platform, $client_type, $game_type, $page, $page_size);
echo "\n";
echo "\n";

/**
 * 2.8. Player Game Rank API 玩家游戏排名接口
 * @param $product_type 	产品代码
 * @param $game_category 	RNG，LIVE 这是必需的，仅在产品类型不是 1 和 2 和 5 时使用
 * @param $game_code 		T2KSSC、SD11X5、P00001
 * @param $start_date 		开始日期 2016-01-01 00:00:00
 * @param $end_date 		结束日期 2016-01-01 00:00:00
 * @param $count 			最大行数
 *
 */
echo print_r('執行 --> 2.8. Player Game Rank API 玩家游戏排名接口');
echo "\n";
$product_type = 4;
$game_category = "LIVE";
$game_code = "A00002";
$start_date = "2018-02-01 00:00:00";
$end_date = "2018-02-05 23:59:59" ;
$count = 10;
$tcg_class-> getGameRank($product_type, $game_category, $game_code, $start_date, $end_date, $count);
echo "\n";
echo "\n";

/**
 * 3.1. GET RNG BET DETAILS 获得电子游戏及真人投注详情接口
 * @param $end_date 		结束日期 2016-01-01 00:00:00
 * @param $count 			最大行数
 *
 */
echo print_r('執行 --> 3.1. GET RNG BET DETAILS 获得电子游戏及真人投注详情接口');
echo "\n";
$batch_name="201706262010";
$page=1;
$tcg_class-> get_bet_details($batch_name, $page);
echo "\n";
echo "\n";

/**
 * 3.2. GET RNG BET DETAILS BY MEMBER 获得玩家电子游戏及真人投注详情接口
 * @param $username		会员名称	
 * @param $start_date 	开始时间	
 * @param $end_date 	结束时间
 */
echo print_r('執行 --> 3.2. GET RNG BET DETAILS BY MEMBER 获得玩家电子游戏及真人投注详情接口');
echo "\n";
$username = 'phoenixPHP';
$start_date='2017-06-26 20:10:00';
$end_date='2017-06-26 23:59:59';
$page=1;
$tcg_class-> get_bet_details_member($username, $start_date, $end_date, $page);
echo "\n";
echo "\n";

/**
 * 4.1. GET LOTTO TRANSACTIONS BY MEMBER 取得会员的实时彩票交易记录
 * @param $username		会员名称	
 * @param $start_date 	开始时间	
 * @param $end_date 	结束时间
 */
echo print_r('執行 --> 3.2. GET RNG BET DETAILS BY MEMBER 获得玩家电子游戏及真人投注详情接口');
echo "\n";
$username = 'phoenixPHP';
$start_date='2017-06-26 20:10:00';
$end_date='2017-06-26 23:59:59';
$page=1;
$tcg_class-> getLottoTxByMember($username, $start_date, $end_date, $page);
echo "\n";
echo "\n";





die();
?>
