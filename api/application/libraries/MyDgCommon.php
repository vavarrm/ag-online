<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MyDgCommon{
	/**
	 * 共用参数区
	 */
	private $CI ;
    function __construct(){
        $this->url = $_SERVER['API_URL'];
        $this->merchant_code = $_SERVER['MERCHANT_CODE'];		//代理商号
        $this->desKey = $_SERVER['DES_KEY'];				//加密金钥
        $this->signKey = $_SERVER['SHA256_KEY'];				//加密签名档
        $this->currency = 'CNY'; 	
		$this->CI =& get_instance();		//币别
        $this->host="http://api.dg99web.com";
        $this->apiKey="d4bcd31b036b42378977cbe9ec81fb66";
        $this->agentName="DGTE01010B";
        $this->password=md5('23SINK3X');
		$this->winLimit=1000;
    }
	
	public function getTransaction()
	{
		$curl = curl_init();

		$random = rand(10,100);
		$MD5Key = $this->getMD5Key($random);
		$request = array(
			"token"=> $MD5Key,
			"random"=>$random,
		);

		$requestJsonStr = json_encode($request);

		curl_setopt_array($curl, array(
		  CURLOPT_URL => "http://api.dg99web.com/game/getReport/DGTE01010B",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_POSTFIELDS => $requestJsonStr,
		  CURLOPT_HTTPHEADER => array(
			"Content-Type: application/json",
			"Postman-Token: 695c50be-a6d6-4160-9322-6ecc79bf77bd",
			"cache-control: no-cache"
		  ),
		));

		$response = curl_exec($curl);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
		  // echo "cURL Error #:" . $err;
		} else {
		  // echo $response;
		  return json_decode($response,true);
		}
	}
	
    /**
     * 2.1. CREATE/REGISTER PLAYER API 创建/确认玩家接口
     * @param $username 会员名称
     * @param $password 会员密码
     * @return array|SimpleXMLElement
     */
    public function getLoginUrl($user)
    {
		
		// var_dump($user);
		
		$output = array(
			'code'  =>999,
			'message'  =>'get game url failure',
		);
		$response = $this->logApi($user);
			
		if ($response['codeId'] == '102')
		{
			$ary= [
				'username'	=>$user['u_account'],
				'winLimit'	=>$this->winLimit,
			];
			$createUserResponse = $this->createUser($ary);
			if($createUserResponse ['codeId'] =='0')
			{
				 $response = $this->logApi($user);
			}
			// var_dump($createUserResponse);
		}
		// exit();
		if($response['codeId'] =="0")
		{
			$output = array(
				'code'  =>100,
				'message'  =>'get game url success',
				'pc'=>$response['list'][0].$response['token'],
				'mobile '=>$response['list'][1].$response['token'],
			);
		}
        return $output;
    }
	
	public function transferAPI($param)
	{
		// var_dump($param);
		$curl = curl_init();

		$random = rand(10,100);
		$MD5Key = $this->getMD5Key($random);
		$request = array(
			"token"=> $MD5Key,
			"random"=>$random,
			"data" =>$param['reference_no'],
			"member"=>array(
				"username"=>$param['username'],
				"amount"=>$param['amount'],
			)
		);

		$requestJsonStr = json_encode($request);

		curl_setopt_array($curl, array(
		  CURLOPT_URL => $this->host."/account/transfer/".$this->agentName,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_POSTFIELDS => $requestJsonStr,
		  CURLOPT_HTTPHEADER => array(
			"Content-Type: application/json",
			"Postman-Token: f2f1f817-214c-4c62-846d-86802b82fd0f",
			"cache-control: no-cache"
		  ),
		));

		$response = curl_exec($curl);
		$err = curl_error($curl);
		$response = json_decode($response,true);
		// var_dump($response );
		curl_close($curl);

		if ($err) {
		  // echo "cURL Error #:" . $err;
		} else {
			$output['code']=100;
            $output['message'] ="transfer success";
            $output = array_merge($output,$response);
		  return  $output;
		}
	}
	
	public function logApi($user)
	{
		$output = array(
           'code'  =>999,
           'message'  =>'get game url failure',
       );
       $curl = curl_init();
       $random = rand(10,100);
       $MD5Key = $this->getMD5Key($random);
       $request = array(
            "token"=> $MD5Key,
            "random"=>$random,
            "lang" =>"cn",
            "member"=>array(
                "username"=>$user['u_account'],
                "password"=>$this->password,
            )
       );
	   $url =$this->host."/user/login/".$this->agentName."/ ";
	   // $url =$this->host."/user/free/".$this->agentName."/ ";
       $requestJsonStr = json_encode( $request);
       curl_setopt_array($curl, array(
          CURLOPT_URL =>  $url,
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_POSTFIELDS =>$requestJsonStr,
          CURLOPT_HTTPHEADER => array(
            "Content-Type: application/json",
            "cache-control: no-cache"
          ),
        ));

        $response = curl_exec($curl);
        $response = json_decode($response,true);
		// var_dump($response);
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) 
        {
            $output['message'].="cURL Error #:" . $err;
        }
		// echo "F";
		return $response;
	}
	
	public function createUser($param)
    {
       $output = array(
           'code'  =>999,
           'message'  =>'createUser failure',
       );
       $curl = curl_init();
       $random = rand(10,100);
       $MD5Key = $this->getMD5Key($random);
       $request = array(
            "token"=> $MD5Key,
            "random"=>$random,
            "data" =>"A",
            "member"=>array(
                "username"=>$param['username'],
                "password"=>$this->password,
                "currencyName"=>$this->currency ,
                "winLimit"=>$param['winLimit']
            )
       );
       $requestJsonStr = json_encode( $request);
       curl_setopt_array($curl, array(
          CURLOPT_URL =>  $this->host."/user/signup/".$this->agentName."/",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_POSTFIELDS =>$requestJsonStr,
          CURLOPT_HTTPHEADER => array(
            "Content-Type: application/json",
            "cache-control: no-cache"
          ),
        ));

        $response = curl_exec($curl);
        $response = json_decode($response,true);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) 
        {
            $output['message'].="cURL Error #:" . $err;
        } elseif( $response['codeId']==0){
            $output['code']=100;
            $output['message'] ="createUser success";
            $output = array_merge($output,$response);
            
        }
        
        return $output;
    }
	
	public function getBalanceApi($param)
	{
		// var_dump($param);
		
		$output = array(
           'code'  =>999,
           'message'  =>'get  balance failure',
       );
       $curl = curl_init();
       $random = rand(10,100);
       $MD5Key = $this->getMD5Key($random);
       $request = array(
            "token"=> $MD5Key,
            "random"=>$random,
            "member"=>array(
                "username"=>$param['username']
            )
       );
       $requestJsonStr = json_encode( $request);
       curl_setopt_array($curl, array(
          CURLOPT_URL =>  $this->host."/user/getBalance/".$this->agentName."/",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_POSTFIELDS =>$requestJsonStr,
          CURLOPT_HTTPHEADER => array(
            "Content-Type: application/json",
            "cache-control: no-cache"
          ),
        ));

        $response = curl_exec($curl);
        $response = json_decode($response,true);
		// var_dump( $response );
		// if()
		
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) 
        {
            $output['message'].="cURL Error #:" . $err;
        } elseif( $response['codeId']==0){
            $output['code']=100;
            $output['message'] ="createUser success";
            $output = array_merge($output,$response);
            
        }
        
        return $output;
	}
	
	/**
	 * 2.2. UPDATE PASSWORD API 更新密码接口
	 * @param $username 会员名称
	 * @param $password 会员密码
     * @return array|SimpleXMLElement
     */
	public function update_password($username,$password){
		$registerParams = array('username' => $username, 'currency' => $this->currency, 'method' => 'up', 'password' => $password);
		//print_r($getBalanceParams);
        $result = $this->send_require($registerParams);
        return $result;
	}
	
    /**
     * 2.3. GET BALANCE API 获取余额接口
     * @param $username  		会员名称
	 * @param $product_type   	产品代码
     * @return array|SimpleXMLElement
     */
    public function get_balance($ary){
        $getBalanceParams = array('username' => $username, 'method' => 'gb' , 'product_type' => $product_type);
		// var_dump($getBalanceParams);
        $result = $this->send_require($getBalanceParams);
        return $result;
    }

    /**
     * 2.4. FUND TRANSFER API 资金转账接口
     * @param $username			会员名称
	 * @param $product_type   	产品代码
     * @param int $fund_type  	值1=转入到  值2=转出
     * @param $amount			金额
     * @param $reference_no		交易代码
     * @return array|SimpleXMLElement
     */
    public function user_transfer($username, $product_type, $fund_type, $amount, $reference_no){
        $getBalanceParams = array('username' => $username, 'method' => 'ft' , 'product_type' => $product_type,'fund_type' => $fund_type,'amount' => $amount,'reference_no' => $reference_no);
		//print_r($getBalanceParams);
        $result = $this->send_require($getBalanceParams);
        return $result;
    }

    /**
     * 2.5. CHECK TRANSACTION STATUS API 检查交易状态接口
     * @param $product_type	产品代码
     * @param $reference_no	交易代码
     * @return array|SimpleXMLElement
     */
    public function check_transfer($product_type, $reference_no){
        $getBalanceParams = array('method' => 'cs' , 'product_type' => $product_type, 'ref_no' => $reference_no);
		//print_r($getBalanceParams);
        $result = $this->send_require($getBalanceParams);
        return $result;
    }

    /**
	 * 2.6. LAUNCH GAME API 启动游戏接口 -电子游戏
     * @param $username 会员名称
     * @param $gameMode 值1=正式 值0=测试
     * @param $gameCode 游戏编码
     * @return string
     */
    public function getLaunchGameRng($username, $product_type, $game_mode, $game_code, $platform){
		/** RNG GAME 电子游戏 **/
		$getBalanceParams = array('username' => $username, 'method' => 'lg' , 'product_type' => $product_type,'game_mode' => $game_mode,'game_code' => $game_code,'platform'=>$platform);
		//print_r($getBalanceParams);
		$result = $this->send_require($getBalanceParams);
        return $result;
    }
	
	/**
	 * 2.6. LAUNCH GAME API 启动游戏接口 - 彩票游戏
     * @param $username 	会员名称
	 * @param $product_type 彩票代码为 2 
     * @param $game_mode 	值1=正式 值0=测试
     * @param $game_code 	游戏编码
	 * @param $platform 	平台 flash，html5
	 * @param $view 		平台 
     * @return string
     */
	public function getLaunchGameLottery($username, $product_type, $game_mode, $game_code, $platform, $view){
		/** Lottery GAME 彩票游戏 **/
		// 模式 目前只能使用 Traditional 传统及 Traditional_Mobile 传统_移动两种模式
		$lottery_bet_mode = 'Traditional'; 
		$series = array();
		$series[] = array('game_group_code'=>'SSC','prize_mode_id'=>1,'max_series'=>1956,'min_series'=>1700,'max_bet_series'=>1950,'default_series'=>1800);
		$getBalanceParams = array('username'=>$username, 'method'=>'lg', 'product_type'=> $product_type, 'game_code'=>$game_code, 'game_mode'=>$game_mode, 'platform'=>$platform, 'lottery_bet_mode'=>$lottery_bet_mode, 'view'=>$view, 'series'=>$series);
		//print_r($getBalanceParams);
		$result = $this->send_require($getBalanceParams);
        return $result;
    }

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
	public function getGameList($product_type, $platform, $client_type, $game_type, $page, $page_size){
		$getBalanceParams = array('method'=>'tgl', 'product_type'=>$product_type, 'platform'=>$platform, 'client_type'=>$client_type, 'game_type'=>$game_type, 'page'=>$page, 'page_size'=>$page_size);
		//print_r($getBalanceParams);
		$result = $this->send_require($getBalanceParams);
        return $result;
	}
	
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
	public function getGameRank($product_type, $game_category, $game_code, $start_date, $end_date, $count){
		$getBalanceParams = array('method'=>'pgr', 'product_type'=>$product_type, 'game_category'=>$game_category, 'game_code'=>$game_code, 'start_date'=>$start_date, 'end_date'=>$end_date, 'count'=>$count);
		$result = $this->send_require($getBalanceParams);
        return $result;
	} 

	/**
	 * 3.1. GET RNG BET DETAILS 获得电子游戏及真人投注详情接口
	 * @param $batch_name 	批次号
	 * @param $page 		第几页
	 */
    public function get_bet_details($batch_name, $page){
        $time_str = $stime;
        $getBalanceParams = array('method'=>'bd', 'batch_name'=>$batch_name, 'page'=>$page);
        $result = $this->send_require($getBalanceParams);
        return $result;
    }
	
	/**
	 * 3.2. GET RNG BET DETAILS BY MEMBER 获得玩家电子游戏及真人投注详情接口
	 * @param $username		会员名称	
	 * @param $start_date 	开始时间	
	 * @param $end_date 	结束时间
	 */
	public function get_bet_details_member($username, $start_date, $end_date, $page){
        $getBalanceParams = array('username'=>$username, 'method'=>'bdm', 'start_date'=>$start_date, 'end_date'=>$end_date, 'page'=>$page);
        $result = $this->send_require($getBalanceParams);
        return $result;
    }
	
	/**
	 * 4.1. GET LOTTO TRANSACTIONS BY MEMBER 取得会员的实时彩票交易记录
	 * @param $username		会员名称	
	 * @param $start_date 	开始时间	
	 * @param $end_date 	结束时间
	 */
	public function getLottoTxByMember($username, $start_date, $end_date, $page){
        $getBalanceParams = array('username'=>$username, 'method'=>'lmb', 'start_date'=>$start_date, 'end_date'=>$end_date, 'page'=>$page);
        $result = $this->send_require($getBalanceParams);
        return $result;
	}
	
	/**
	 * 基本上都是大同小异的写法, 如有任何问题请洽 TCG技术群 .... 抱歉小编懒的写了！
	 */
	

    public function get_lottoCode(){
        $getBalanceParams = array('method' => 'glgl');
        $result = $this->send_require($getBalanceParams);
        return $result;
    }
	
    /**
     * 公用发送请求
     * @param $sendParams
     * @return string
     */
    public function send_require($sendParams){
		// var_dump($sendParams);
        $params =  $this->encryptText(json_encode($sendParams),$this->desKey);
        $sign = hash('sha256', $params . $this->signKey);
        $data = array('merchant_code' => $this->merchant_code, 'params' => $params , 'sign' => $sign);
        $options = array(
            'http' => array(
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                'method'  => 'POST',
                'content' => http_build_query($data)
            )
        );
		// var_dump($data);
        $context  = stream_context_create($options);
		// echo $context ;
        $result = file_get_contents($this->url, false, $context);
        return $result;
    }
	
    /**
     * 组建en json参数数组
     * @param $plainText
     * @param $key
     * @return string
     */
    function getMD5Key($random=000) 
    {;
		return md5($this->agentName.$this->apiKey.$random);
    }

    /**
     * 组建dec json参数数组
     * @param $plainText
     * @param $key
     * @return string
     */
    function decryptText($encryptText, $key) {
        $cipherText = base64_decode($encryptText);
        $res = mcrypt_decrypt("des", $key, $cipherText, "ecb");
        $resUnpadded = $this->pkcs5_unpad($res);
        return $resUnpadded;
    }

    function pkcs5_pad ($text, $blocksize)
    {
        $pad = $blocksize - (strlen($text) % $blocksize);
        return $text . str_repeat(chr($pad), $pad);
    }

    function pkcs5_unpad($text)
    {
        $pad = ord($text{strlen($text)-1});
        if ($pad > strlen($text)) return false;
        if (strspn($text, chr($pad), strlen($text) - $pad) != $pad) return false;
        return substr($text, 0, -1 * $pad);
    }
}
