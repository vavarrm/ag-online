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
				'mobile'=>$response['list'][1].$response['token'],
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
        $err = curl_error($curl);
        curl_close($curl);
        if ($err) 
        {
            $output['message'].="cURL Error #:" . $err;
        }
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
	
    private function getMD5Key($random=000) 
    {;
		return md5($this->agentName.$this->apiKey.$random);
    }
	
	public function markReport($list)
	{
	   $random = rand(10,100);
		$MD5Key = $this->getMD5Key($random);
		$request = array(
            "token"=> $MD5Key,
            "random"=>$random,
            "list"=>$list
		);
		$requestJsonStr = json_encode( $request);
		// echo $requestJsonStr;
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => $this->host."/game/markReport/".$this->agentName,
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_POSTFIELDS =>$requestJsonStr  ,
		  CURLOPT_HTTPHEADER => array(
			"Content-Type: application/json",
			"Postman-Token: 637b67e8-d347-40bd-a86a-ceece47fb68b",
			"cache-control: no-cache"
		  ),
		));

		$response = curl_exec($curl);
		// echo $response;
		$response = json_decode($response,true);
		$err = curl_error($curl);

		curl_close($curl);

		if ($err) {
		  // echo "cURL Error #:" . $err;
		} else {
		  return  $response;
		}
	}
}
