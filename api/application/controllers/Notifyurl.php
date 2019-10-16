<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Notifyurl extends CI_Controller {
	
	
	public function __construct() 
	{
		parent::__construct();	
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->saveNotifyurlLog($this->request);
		$this->load->model('Pay_Model', 'thirdpay');
	}
	
	public function index()
	{
		$provide = ucfirst($_GET['provide']);
		$library_name ="MyPay".$provide;
		if(file_exists( FCPATH."application/libraries/" .$library_name.".php")) 
		{
			$this->load->library($library_name);
			$library_name = strtolower($library_name);
			$this->pay = $this->$library_name;
		}
		
		if(count($this->pay->whitelist) >0)
		{
			$ip = $this->myfunc->getUserIpAddr();
			if(!in_array($ip, $this->pay->whitelist))
			{
				return ;
			}
		}
		
		$signAry = [
			'merid'=>$this->request['merid'] ,
			'userid'=>$this->request['userid'],
			'amount'=>$this->request['amount'],
			'orderid'=>$this->request['orderid'],
			'status'=>$this->request['status'],
			'created'=>$this->request['created'],
			'paid'=>$this->request['paid'],
			'extend'=>$this->request['extend'],
			'paytype'=>$this->request['paytype'],
		];
		
		$sign = $this->pay->getSign($signAry);
		
		if($sign ==$this->request['sign'])
		{
			if($this->request['status'] !="verified")
			{
				return ;
			}
			
			$ary=[
				'arrivalAmount'=>$this->request['amount'],
				'orderNumber'=>$this->request['orderid'],
			];
			$affected = $this->thirdpay->setOrderNumberVerified($ary);
			if($affected==1)
			{
				echo "success";
			}
		}
	}
	
	public function saveNotifyurlLog($request)
	{
		$directoryName = FCPATH."application".DIRECTORY_SEPARATOR."logs".DIRECTORY_SEPARATOR."notifyurl";
		if(!is_dir($directoryName)){
			mkdir($directoryName, 0775, true);
		}
		$provide = ucfirst($_GET['provide']);
		$fileName = date('Y-m-d')."_".$provide.".log";
		$ary[$provide] = $request;
		$log = fopen($directoryName.DIRECTORY_SEPARATOR.$fileName , "a+");
		chmod($directoryName.DIRECTORY_SEPARATOR.$fileName,'0775'); 
		fwrite($log, json_encode($ary)."\n"); 
		fclose($myfile);
	}
}
