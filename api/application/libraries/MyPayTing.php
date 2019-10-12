<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MyPayTing
{
	private $CI ;
	private $obj;
	
	const URL = 'https://www.istmys.com/tingapi/';
	const CID = '2326';
	const APIKEY = 'AcMDaB1u9ogIIM7cFIOo41FUYST7Lis1H3B0QjB86T9hQKhLnUWeKjWa7XPCZ3MG';
	
	const KEY ="8VuXoV5nxVu2Dx60";
	const IV ="YL0NtO15";
	
	const NOTIFYURL="http://boyin360.me/notifyurl?provide=ting";
	
	public $whitelist ;
	
	public function __construct() 
	{
		$this->whitelist = [
			"52.196.133.147",
			"13.115.67.208",
			"52.197.107.110",
			"209.58.188.208",
			"127.0.0.1"
		];

		$this->CI =& get_instance();
		$this->CI->load->model('Pay_Model', 'thirdpay');
	}
	
	public function payRedirection($ary)
	{
		$orderNumber = $this->getOrderNumber();
		$ary['orderNumber'] = $orderNumber;
		$ary['verificationCode']= $this->myCrypt($ary['orderNumber'] );
		$this->CI->thirdpay->add($ary);
		$singAry = [
			'merid'=>self::CID,
			'userid'=>$ary['u_id'],
			'amount'=>$ary['amount'],
			'orderid'=>$ary['orderNumber'],
			'userip'=>$this->getUserIpAddr(),
			'notifyurl'=>self::NOTIFYURL,
			'extend'=>$ary['verificationCode'],
			'paytype'=>$ary['type'],		
			'bankflag'=>$ary['code']
		];
		$sing = $this->getSign($singAry);
		$item = $singAry ;
		$item['sign'] = $sing;
		$output= [
			'item' =>$item,
			'url'  =>self::URL."jump",
		];
		return $output;
	}
	
	private function getOrderNumber()
	{
		return date('Ymdhis').rand(1000,9999);
	}
	
	private function getVerificationCode($orderNumber)
	{
		return date('Ymdhis').rand(1000,9999);
	}
	
	private function myCrypt($data) //加密
	{
		$str =  openssl_encrypt ($data, 'des-cbc', self::KEY, 0, self::IV);
		return base64_encode($str);
	}
	 
	private function myDecrypt($data) //解密
	{
		$data = base64_decode($data);
		return openssl_decrypt ($data, 'des-cbc', self::KEY, 0, self::IV);
	}
	
	public function getSign($data)
	{
		ksort($data);
		// var_dump($data);
		$str = '';
		foreach ($data as $key => $val) 
		{
			$strAry[]=$key."=".$val;
		}
		$strAry[]="key=".self::APIKEY;
		return md5(join('&',$strAry));
	}
	
	
	public function getUserIpAddr(){
		if(!empty($_SERVER['HTTP_CLIENT_IP'])){
			$ip = $_SERVER['HTTP_CLIENT_IP'];
		}elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
			$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
		}else{
			$ip = $_SERVER['REMOTE_ADDR'];
		}
		return $ip;
	}
}