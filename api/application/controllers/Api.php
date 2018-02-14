<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
class Api extends CI_Controller {
	
	private $request = array();
	private $_user = array();
	private $product_type;
	
	public function __construct() 
	{
		parent::__construct();	
		
		$get = $this->input->get();
		$this->product_type =4;
		$this->load->model('User_Model', 'user');
		$this->load->helper('captcha');
		$this->load->model('Log_Model', 'myLog');
		$this->load->model('Announcemet_Model', 'announcemet');
		$this->load->model('Bank_Model', 'bank');
		$this->load->model('UserAccount_Model', 'account');
		$this->load->model('PhoneCallBack_Model', 'callback');
		$this->load->model('Discount_Model', 'discount');
		$this->load->model('WebConfig_Model', 'webConfig');
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='';
		$gitignore =array(
			'login',
			'logout',
			'registered',
			'test',
			'getCaptcha',
			'addPhonecCallBack',
			'getAnnouncemetList',
			'getGameList',
			'getFooterInfo',
			'reserve',
			'getBanner',
			'payCallBack'
		);		
		try 
		{
			
			if(!in_array($this->uri->segment(2),$gitignore))
			{
				
				if(
					$get['sess']	==""
				){
					$array = array(
						'message' 	=>'reponse 必传参数为空' ,
						'type' 		=>'api' ,
						'status'	=>'002'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
				}	
				
				$encrypt_user_data = $this->session->userdata('encrypt_user_data');
				if(empty($encrypt_user_data)){
					$array = array(
						'message' 	=>'尚未登入' ,
						'type' 		=>'api' ,
						'status'	=>'999'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
				}	
			
				$decrypt_user_data= $this->decryptUser($get['sess'], $encrypt_user_data);
				if(empty($decrypt_user_data))
				{
					$array = array(
						'message' 	=>'無法取得使用者資料' ,
						'type' 		=>'api' ,
						'status'	=>'999'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;	
				}
				$this->_user = $decrypt_user_data;
			}
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->response($output);
			exit;
		}
    }
	
	public function getTableInfo()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='取得每桌资料';
		$output['message'] = '成功';
		try 
		{
			$first=3200000+substr(time(),1,2);
			$second=2800000+substr(time(),2,3);
			$third=2400000+substr(time(),4,5);
			
			$table = array(
				number_format($first, 0, '.', ','),
				number_format($second,0, '.', ','),
				number_format($third,0, '.', ',')
			);
			
			$output['body']=$table;
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function addRechargeFromBank()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='银行汇款充值';
		$output['message'] = '成功';
		try 
		{
			
			if(
				$this->request['rbc_id']	=="" ||
				$this->request['orderid']	=="" 
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	

			if(
				intval($this->request['amount']) <100 ||
				intval($this->request['amount']) >50000 
			){
				$array = array(
					'message' 	=>'充值最小为100,最高为50000' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			
			$ary = array(
				'rbc_id' => $this->request['rbc_id'],
				'orderid' => $this->request['orderid'],
				'amount' => $this->request['amount'],
				'u_id' => $this->_user['u_id'],
			);
			
			$this->account->addRechargeFromBank($ary);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getReceivingBankCardOrderID()
	{
			
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='设定优汇';
		$output['message'] = '成功';
		try 
		{
			
			if(
				$this->request['rbc_id']	=="" 
		
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			$orderid="bank".date('Ymd').$this->request['rbc_id'].substr(time(),-5).sprintf('%02d',rand(1,99));
			$output['body']['orderid']=$orderid ;
			$output['body']['u_account']=$this->_user['u_account'] ;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function addRechargeWechat3()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='微信支付充值';
		$output['message'] = '成功';
		try 
		{
			
			if(
				$this->request['orderid']	=="" 
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			if(
				intval($this->request['amount']) <10 ||
				intval($this->request['amount']) >3000 
			){
				$array = array(
					'message' 	=>'充值最小为10,最高为3000' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			
			$ary = array(
				'orderid' => $this->request['orderid'],
				'amount' => $this->request['amount'],
				'u_id' => $this->_user['u_id'],
			);
			
			$this->account->addRechargeWechat3($ary);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getReceivingWechat3CardOrderID()
	{
			
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='设定优汇';
		$output['message'] = '成功';
		try 
		{
			
			
			$orderid="wechat3".date('Ymd').substr(time(),-5).sprintf('%02d',rand(1,99));
			$output['body']['orderid']=$orderid ;
			$output['body']['u_account']=$this->_user['u_account'] ;
			$rows = $this->webConfig->getList(array('9','11'));
			if(!empty($rows))
			{
				foreach($rows as $value)
				{
					$temp[$value['wc_key']] = $value['wc_value'];
				}
			}
			$output['body']['wechat_account']=$temp['wechat3_pay_account'] ;
			$output['body']['wechat3_pay_QR']=$temp['wechat3_pay_QR'] ;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function addRechargeAlipay()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='支付宝充值';
		$output['message'] = '成功';
		try 
		{
			
			if(
				$this->request['orderid']	=="" 
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			if(
				intval($this->request['amount']) <10 ||
				intval($this->request['amount']) >5000 
			){
				$array = array(
					'message' 	=>'充值最小为10,最高为5000' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			
			$ary = array(
				'orderid' => $this->request['orderid'],
				'amount' => $this->request['amount'],
				'u_id' => $this->_user['u_id'],
			);
			
			$this->account->addRechargeAlipay2($ary);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getReceivingalipay2CardOrderID()
	{
			$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='设定优汇';
		$output['message'] = '成功';
		try 
		{
			
			
			$orderid="alipay2".date('Ymd').substr(time(),-5).sprintf('%02d',rand(1,99));
			$output['body']['orderid']=$orderid ;
			$output['body']['u_account']=$this->_user['u_account'] ;
			$rows = $this->webConfig->getList(array('10','12'));
			if(!empty($rows))
			{
				foreach($rows as $value)
				{
					$temp[$value['wc_key']] = $value['wc_value'];
				}
			}
			$output['body']['alipay2_account']=$temp['alipay2_pay_account'] ;
			$output['body']['alipay2_pay_QR']=$temp['alipay2_pay_QR']  ;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function  getReceivingBankCard()
	{
		
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='设定优汇';
		$output['message'] = '成功';
		try 
		{

			$rows = $this->bank->getReceivingBankCard();
			$output['body']['list'] = 	$rows;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function setDiscount()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='设定优汇';
		$output['message'] = '成功';
		try 
		{
			if(
				$this->request['d_id']	=="" 
		
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			$ary = array(
				'u_id' => $this->_user['u_id'],
				'd_id' => $this->request['d_id']
			);
			
			$affected_rows = $this->discount->setDiscount($ary);
			if($affected_rows ==0)
			{
				$array = array(
					'message' 	=>'新增优汇失败' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getBanner()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
			$output['title'] ='取得banner资料';
			$output['message'] = '成功';
		try 
		{
			$rows= $this->webConfig->getBanner();
			$output['body']['list']=$rows;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function reserve()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
			$output['title'] ='储值';
			$output['message'] = '成功';
		try 
		{
	
			$url = "https://payment.skillfully.com.tw/telepay/pay.aspx";
			$scode = 'CID05101';
			$orderid = '20180209002';
			$paytype = 'unionpay2';
			$amount = '1';
			$productname = 'test';
			$currcode = 'CNY';
			$userid = 'tryion';
			$memo = '测试';
			$callbackurl = 'https://ldyl.co/';
			$key ='/i36Lov/i';
			$sign =$scode."|";
			$sign .=$orderid."&";
			$sign .=$amount."&";
			$sign .=$currcode."|";
			$sign .=$callbackurl."&";
			$sign .=$key ;
			echo $sign ;
			echo "<br>";
			echo md5($sign);
			// $post_ary = array(
				// 'scode'			=>$scode ,
				// 'orderid'		=>$orderid,
				// 'paytype'		=>$paytype ,
				// 'amount'		=>$amount,
				// 'productname'	=>$productname ,
				// 'currcode'		=>$currcode,
				// 'userid'		=>$userid,
				// 'memo'			=>$memo,
				// 'callbackurl'	=>$callbackurl,
				// 'sign'			=>md5($sign),
			// );
			// $ch = curl_init();
			// curl_setopt($ch, CURLOPT_URL, $url);
			// curl_setopt($ch, CURLOPT_POST, true);
			// curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_ary)); 
			// echo curl_exec($ch); 
		
			// echo curl_error($ch);
				// curl_close($ch);
			// echo $sign;
			// echo $output;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		// $this->response($output);
	}
	
	public function getFooterInfo()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
			$output['title'] ='取得footer资料';
			$output['message'] = '成功';
		try 
		{
			$ary = array(
				1,2,3,4
			);
			$rows= $this->webConfig->getList($ary);
			foreach($rows as $value)
			{
				$list[$value['wc_key']] = $value;
			}
			$output['body']['list']=$list;
			
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function setDiscountFrom()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
			$output['title'] ='设定优汇页面';
			$output['message'] = '成功';
		try 
		{
			
			$output['body']['list'] = $this->discount->getDiscountList();
			
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function setAccountLimitInit()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows' =>0
		);
		$output['title'] ='设定充提限制';
		$output['message'] = '成功';
		try 
		{
		
			
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function addPhonecCallBack()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows' =>0
		);
		$output['title'] ='新增电话回拨';
		$output['message'] = '成功';
		try 
		{
			if(
				$this->request['pcb_phone']	==""  ||
				$this->request['pcb_message']	==''
		
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			$output['body']['affected_rows']=$this->callback->add($this->request);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function withdrawal()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows' =>0
		);
		$output['title'] ='取款';
		$output['message'] = '成功';
		try 
		{
			if(
				$this->request['quota']	==""  ||
				$this->request['ub_id']	==''
		
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			if(
				$this->request['quota']	<=0  
			){
				$array = array(
					'message' 	=>'提款额必须大于0' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary = array(
				'u_id' =>$this->_user['u_id'],
				'quota'=>$this->request['quota'],
				'ub_id'	=>$this->request['ub_id']
			);
			$output['body']['affected_rows']=$this->account->withdrawal($ary);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getUserMessageForm()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='站内信表单';
		$output['message'] = '成功';
		try 
		{
			$output['body']['subordinate'] = $this->user->getUserBySuperiorID($this->_user['u_id']);
			$output['body']['superior'] = $this->user->getUserByID($this->_user['u_superior_id']);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getUserMessage()
	{
		$output['status'] = 100;
		$output['body'] =array(
		);
		$output['title'] ='读取站内信';
		$output['message'] = '读取成功';
		try 
		{
			if(
				$this->request['um_id']	==""  
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			$output['body']['row']=$this->user->getUserMessageByID($this->request['um_id'], $this->_user['u_id']);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function sendSuperiorUserMessage()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows'	=>0
		);
		$output['title'] ='传送站内信给上级';
		$output['message'] = '传送成功';
		try 
		{
			if(
				$this->request['title']	==""  ||
				$this->request['content']	==""  
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			if($this->_user['u_superior_id'] == 0)
			{
				$array = array(
					'message' 	=>'总代用互无上级',
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary = array(
				'u_id' =>$this->_user['u_id'],
				'title' =>$this->request['title'],
				'content' =>$this->request['content'],
			);
			$output['body']['affected_rows']=$this->user->addSuperiorUserMmessage($ary);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function sendSubordinateUserMessage()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows'	=>0
		);
		$output['title'] ='传送站内信给下级';
		$output['message'] = '传送成功';
		try 
		{
			if(
				$this->request['send_all_subordinate']	==="" ||  
				$this->request['title']	==""  ||
				$this->request['content']	==""  
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			if($this->request['send_all_subordinate'] ==0)
			{
				$account_ary = array( $this->request['account']);
			
			}else
			{
				$rows= $this->user->getAllSubordinateUser($this->_user['u_id']);
				if(empty($rows))
				{
					$array = array(
					'message' 	=>'无下级用户' ,
					'type' 		=>'api' ,
					'status'	=>'999'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
				}
				foreach ($rows as $row)
				{
					$account_ary[] = $row['u_account'];
				}
			}
			
			
			$affected_rows = $this->user->addSubordinateUserMmessage($this->_user['u_id'], $account_ary ,htmlentities($this->request['title']) , htmlentities($this->request['content']));
			$output['body']['affected_rows']=$affected_rows;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getRegisteredLink()
	{
		$output['status'] = 100;
		$output['title'] ='取得注册连结';
		$output['message'] = '成功取得';
		try 
		{
			$output['body']['list']= $this->user->getRegisteredLink($this->_user['u_id']);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function addRegisteredLink()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows' =>0
		);
		$output['title'] ='新增注册连结';
		$output['message'] = '成功新增';
		try 
		{
			$output['body']= $this->user->addRegisteredLink($this->_user['u_id']);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function setUserBankInfoForm()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='成功取得绑定银行‘卡页面';
		$output['message'] = '成功取得';
		try 
		{
			$output['body']['list']['bank_list'] = $this->bank->getBankList();
			$output['body']['list']['user_bank_list'] = $this->user->getUserBankInfoByID($this->_user['u_id']);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	
	public function setUserBankInfo()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows'	=>0
		);
		$output['title'] ='设定银行卡资料';
		$output['message'] = '设定成功';
		
		try 
		{
			if(
				$this->request['account']	==""||
				$this->request['account_name']	==""||
				$this->request['bank_id']	==""||
				$this->request['province']	==""||
				$this->request['city']	==""||
				$this->request['branch_name']	==""
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			$user = $this->user->getUserById($this->_user['u_id']);
			if($user['u_bank_card_lock'] ==1)
			{
				$array = array(
					'message' 	=>'用戶已鎖定銀行卡' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary = array(
				$this->request['account']
			);
			$bankCardIsBlack = $this->bank->bankCardIsBlack($ary);
			
			if($bankCardIsBlack['total'] ==1)
			{
				$array = array(
					'message' 	=>'此银行卡号已被锁定无法新增' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if (mb_strlen($this->request['province'],"utf-8") == strlen($this->request['province']))
			{
				$array = array(
					'message' 	=>'开户银行省份必須為簡體中文' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if (mb_strlen($this->request['city'],"utf-8") == strlen($this->request['city']))
			{
				$array = array(
					'message' 	=>'开户银行城市必須為簡體中文' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if (mb_strlen($this->request['account_name'],"utf-8") == strlen($this->request['account_name']))
			{
				$array = array(
					'message' 	=>'开户人姓名必須為中文' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if (mb_strlen($this->request['branch_name'],"utf-8") == strlen($this->request['branch_name']))
			{
				$array = array(
					'message' 	=>'支行名称必須為簡體中文' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if (mb_strlen($this->request['branch_name'],"utf-8") <=0 || mb_strlen($this->request['branch_name'],"utf-8") >20)
			{
				$array = array(
					'message' 	=>'支行名称長度為1-20個字符串' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if (!is_numeric($this->request['account']) || strlen($this->request['account']) <16 || strlen($this->request['account']) >19)
			{
				$array = array(
					'message' 	=>'银行卡号为16～19位数字组成' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary['u_id']=$this->_user['u_id'];
			$ary = array_merge($ary,$this->request);
			$output['body']['affected_rows'] = 	$this->user->setBankInfo($ary);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getAnnouncemetList()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得公告列表';
		$output['message'] = '成功取得';
		$ary['limit'] = (isset($get['limit']))?$get['limit']:5;
		$ary['p'] = (isset($get['p']))?$get['p']:1;
		$an_type = (isset($get['type']))?$get['type']:'public';
		$ary['an_type']  = array(
			'operator'	=>'=',
			'value'	=>$an_type ,
		);
		try 
		{
			$ary['order'] = array(
				'an_id' =>'DESC'
			);
			$output['body'] = $this->announcemet->getList($ary);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function getUserMessageList()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得站内讯息列表';
		$output['message'] = '成功取得';
		$ary['limit'] = (isset($get['limit']))?$get['limit']:5;
		$ary['p'] = (isset($get['p']))?$get['p']:1;
		$ary['um_u_id'] = array('value'=>$this->_user['u_id'], 'operator' =>'=');
		$ary['order'] =array(
			'um_id'	=>'DESC'
		);
		try 
		{
			$output['body'] = $this->user->getMessageList($ary);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function setUserPassword()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='設定使用者密碼';
		$output['message'] = '設定成功';
		try 
		{
			if(
				$this->request['passwd']	==""  ||
				$this->request['oldpasswd']	=="" 
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			if($this->request['passwd'] == $this->request['oldpasswd'])
			{
					$array = array(
					'message' 	=>'新密码不能与旧密码相同' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			$passwd= $this->user->getUserByID($this->_user['u_id']);
			if($passwd['u_passwd'] != MD5($this->request['oldpasswd']))
			{
					$array = array(
					'message' 	=>'旧密码不符' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			
			if(strlen($this->request['passwd']) <8 || strlen($this->request['passwd'])>12){
				$array = array(
					'message' 	=>'密碼長度為8~12位' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if($this->_user['u_money_passwd'] ==md5($this->request['passwd']))
			{
				$array = array(
					'message' 	=>'使用者密碼不能與資金密碼相同' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			
			
			$affected_rows = $this->user->setUserPasswd($this->request['passwd'], $this->_user['u_id']);
			if($affected_rows==0)
			{
				$array = array(
					'message' 	=>'密碼未更新' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function lockUserBankCard()
	{
		$output['status'] = 100;
		$output['body'] =array(
			'affected_rows'	=>0
		);
		$output['title'] ='锁定銀行卡';
		$output['message'] = '成功';
		
		try 
		{
			$ary = array(
				'u_id' =>$this->_user['u_id']
			);
			
			$user =$this->user->getUserByID($this->_user['u_id']);
			if($user['u_bank_card_lock'] =='1')
			{
				$array = array(
					'message' 	=>'使用者已锁定过银行卡' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;	
			}
			
			$affected_rows = $this->user->lockUserBankCard($ary);
			
			if($affected_rows ==0)
			{
				$array = array(
					'message' 	=>'锁定失败' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;	
			}
			$output['body']['affected_rows'] = $affected_rows;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function delUserBankCard()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='刪除銀行卡';
		$output['message'] = '成功';
		
		try 
		{
			if(
				$this->request['ub_id']	==""  
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			$user = $this->user->getUserByID($this->_user['u_id']);
			if($user['u_bank_card_lock'] ==1)
			{
				$array = array(
					'message' 	=>'用戶已鎖定銀行卡' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary = array(
				'ub_id' =>$this->request['ub_id'],
				'u_id' =>$this->_user['u_id'],
			);
			
			$bank_card = $this->user->getUserBankCard($ary);
			

			
			if(empty($bank_card))
			{
				$array = array(
					'message' 	=>'用互无绑定此银行卡' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			
			$this->user->delUserBankCard($ary);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function setUserMoneyPassword()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='設定資金密碼';
		$output['message'] = '設定成功';
		try 
		{
			if(
				$this->request['passwd']	==""  
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			
			
			if($this->request['passwd'] == $this->request['oldpasswd'])
			{
					$array = array(
					'message' 	=>'新密码不能与旧密码相同' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$passwd= $this->user->getUserByID($this->_user['u_id']);
			
			if($passwd['u_money_passwd'] != MD5($this->request['oldpasswd']) && $passwd['u_money_passwd']!="")
			{
					$array = array(
					'message' 	=>'旧密码不符' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			if(
				$this->request['oldpasswd']	==""  && $passwd['u_money_passwd'] !=""
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if(strlen($this->request['passwd']) <8 || strlen($this->request['passwd'])>12){
				$array = array(
					'message' 	=>'密碼長度為8~12位' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if($this->_user['u_passwd'] ==md5($this->request['passwd']))
			{
				$array = array(
					'message' 	=>'使用者密碼不能與資金密碼相同' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$affected_rows = $this->user->setUserMoneyPasswd($this->request['passwd'], $this->_user['u_id']);
			if($affected_rows==0)
			{
				$array = array(
					'message' 	=>'密碼未更新' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function report()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='日常记录-提款';
		$output['message'] = '成功';
		$get= $this->input->get();
		$ary['limit'] = (isset($this->request['limit']))?$this->request['limit']:5;
		$ary['p'] = (isset($this->request['p']))?$this->request['p']:1;
		$type= (isset($this->request['type']))?$this->request['type']:'';
		$start_date = (isset($this->request['start_date']))?$this->request['start_date']:'';
		$end_date = (isset($this->request['end_date']))?$this->request['end_date']:'';
		try 
		{
			if(
				$type	==""
			){
					$array = array(
						'message' 	=>'reponse 必传参数为空' ,
						'type' 		=>'api' ,
						'status'	=>'002'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
			}	
			
			$ary['ua_type']=array(
				'value' =>$type,
				'operator' =>'in'
			);
			$ary['ua_u_id']=array(
				'value' =>$this->_user['u_id'],
				'operator' =>'='
			);
			
			$ary['start_date'] = array(
				'value'	=>$start_date,
				'operator' =>'>='
			);
			
			$ary['end_date'] = array(
				'value'	=>$end_date,
				'operator' =>'<='
			);
			
			$ary['order'] =array(
				'ua_id'	=>'DESC'
			);
			
			$output['body'] = $this->account->getReportList($ary);
			
		}
		catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function withdrawalForm()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='提款申请表单';
		$output['message'] = '成功';
		
		try 
		{
			$row = $this->account->getBalance($this->_user['u_id']);
			$output['body']= $row;
			$output['body']['list']['user_bank'] = $this->user->getUserBankInfoByID($this->_user['u_id']);
			$output['body']['u_account']=$this->_user['u_account'];
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	
	public function getuserBalance()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得使用者帳戶餘額';
		$output['message'] = '成功取得';
		
		try 
		{
			
			$row = $this->account->getBalance($this->_user['u_id']);
			// var_dump($row);
			$output['body']= $row;
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function getCaptcha()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得验证码';
		$output['message'] = '成功取得';
		
		try 
		{
			// for($i = 0 ; $i < 6 ; $i++)
			// {
			  // $randomWord .= chr( rand( 97, 122 ) );
			// }
			$randomWord  =sprintf('%06d',rand(1,999999));
			setcookie("captcha", $randomWord, time()+60);

			$vals = array(
					'word'          => $randomWord,
					'img_path'      => './captcha/',
					'img_url'       => $_SERVER['REQUEST_SCHEME']."://".$_SERVER['HTTP_HOST'].'/api/captcha/',
					'img_width'     => '150',
					'img_height'    => 30,
					'expiration'    => 7200,
					'word_length'   => 8,
					'font_size'     => 16,
					'img_id'        => 'Imageid',
					'pool'          => '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
					'colors'        => array(
									'background' => array(255, 255, 255),
									'border' => array(255, 255, 255),
									'text' => array(0, 0, 0),
									'grid' => array(255, 40, 40)
					)
			);

			$cap = create_captcha($vals);
			$output['body'] = $cap;
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	private function decryptUser($rsa_randomKey, $encrypt_user_data)
	{
		$randomKey =  $this->token->privateDecrypt($rsa_randomKey);
		$encrypt_user_data = $this->session->userdata('encrypt_user_data');
		$decrypt_user_data = $this->token->AesDecrypt($encrypt_user_data , $randomKey );
		$user_data = unserialize($decrypt_user_data);
		return $user_data;
	}
	
	public function getUser()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得使用者登入資料';
		$output['message'] = '成功';
		try 
		{
			
			
			$encrypt_user_data = $this->session->userdata('encrypt_user_data');
			
			if(empty($encrypt_user_data)){
				$array = array(
					'message' 	=>'尚未登入' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			
			$decrypt_user_data= $this->decryptUser($get['sess'], $encrypt_user_data);
			unset($this->_user['u_passwd']);
			unset($this->_user['u_money_passwd']);
			unset($this->_user['u_ag_passwd']);
			$row = $this->account->getBalance($this->_user['u_id']);
			$_user = $this->user->getUserByID($this->_user['u_id']);
			if($_user['u_receiving_bank_card_alert'] =='0')
			{
				$this->user->updReceivingBankCardAlert(array('u_id'=>$this->_user['u_id'] , 'change' =>'1'));
			}
			$this->_user['u_receiving_bank_card_alert'] = $_user['u_receiving_bank_card_alert'];
			$this->_user['balance'] = $row['balance'];
			$noReadMessageTotal = $this->user->getNoReadMessageTotal($this->_user['u_id']);
			$this->_user['no_read_message_total'] =$noReadMessageTotal['total'];
			$output['body']['user'] = $this->_user ;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	
	public function  checkMoneyPasswd()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='验证资金密码';
		$output['message'] = '成功';
		try 
		{
			
			if(
				$this->request['passwd']	=="" 
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary = array(
				'u_id' => $this->_user['u_id'],
				'passwd' =>$this->request['passwd'],
			);
			$row = $this->user->checkMoneyPasswd($ary);
			if($row['total'] ==0)
			{
				$array = array(
					'message' 	=>'失敗' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	private function doLogin($row)
	{
		try 
		{
			
			if($row['u_is_lock'] == '1')
			{
				$array = array(
					'message' 	=>'此帐号已被冻结' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$randomKey = $this->token->getRandomKey();
			$rsaRandomKey = $this->token->publicEncrypt($randomKey);

			
			$encrypt_user_data = $this->token->AesEncrypt(serialize($row), $randomKey);
			$this->session->set_userdata('encrypt_user_data', $encrypt_user_data);
			$encrypt_user_data = $this->session->userdata('encrypt_user_data');
			$urlRsaRandomKey = urlencode($rsaRandomKey) ;
			$this->user->addLoginLog($row['u_id']);
			if(!ereg('^[a-z0-9]{4,14}$', $row['ag_u_account']))
			{
				$array = array(
					'message' 	=>'ag帐号长度为4~14位、由小写英文及数字组合' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if(!ereg('^[a-z0-9A-Z]{6,12}$', $row['u_ag_passwd']))
			{
				$array = array(
					'message' 	=>'ag密码长度为6~12位、由大小写英文及数字组合' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if($row['u_ag_is_reg'] ==0)
			{
				$result_json = $this->tcgcommon->create_user($row['ag_u_account'],$row['u_ag_passwd']);
				$json = json_decode($result_json, true);
				if($json['status'] !=0 || empty($json))
				{
					$array = array(
						'message' 	=> $json['error_desc'],
						'type' 		=>'api' ,
						'status'	=>'999'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
				}
				$this->user->updAgIsLogin($row);
			}
			
		
			return $urlRsaRandomKey ;
		}
		catch(MyException $e)
		{
			$this->session->unset_userdata('encrypt_user_data');
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			throw $e;
			
		}
	}
	
	public function login()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='登入';
		$output['message'] = '登入成功';
		
		try 
		{
			if(
				$this->request['account']	==""|| 
				$this->request['passwd']	=="" 
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}	
			$row = $this->user->getUesrByAccount($this->request['account']);
			if(empty($row))
			{
				$array = array(
					'message' 	=>'查無此帳號' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if($row['u_passwd'] !=md5($this->request['passwd']))
			{
				$array = array(
					'message' 	=>'密碼錯誤' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$sess = $this->doLogin($row);
			$output['body'] = array(
				'sess' =>$sess ,
				'bank_card_alert' =>$row['u_receiving_bank_card_alert']
			);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function logout()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='登出';
		$output['message'] = '成功';
		try 
		{
			$this->session->unset_userdata('encrypt_user_data');
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getGameList(){
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得游戏列表';
		$output['message'] = '执行成功';
		$page_size = (isset($get['limit']))?$get['limit']:6;
		$page = (isset($get['p']))?$get['p']:1;
		$product_type = (isset($get['product_type']))?$get['product_type']:4;
		
		$game_type_ary =array(
			'LIVE',
			'RNG'
		);
		$game_type = (in_array($get['game_type'] , $game_type_ary))?$get['game_type']:'';
		
		$platform_ary =array(
			'html5',
			'flash',
			'all'
		);
		$platform = (in_array($get['platform'], $platform_ary))?$get['platform']:'';
		
		$client_type_ary =array(
			'web',
			'phone',
			'pc',
			'html5'
		);
		$client_type = (in_array($get['client_type'],$client_type_ary))?$get['client_type']:'';
	
		
		try 
		{
			if(	
				$game_type  =='' ||
				$platform	=='' ||
				$client_type	==''
			)
			{
				$array = array(
						'message' 	=>'reponse 传入参数有误' ,
						'type' 		=>'api' ,
						'status'	=>'003'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$result_json_str = $this->tcgcommon->getGameList($product_type, $platform, $client_type, $game_type, $page, $page_size);
			$result_ary = json_decode($result_json_str , true);
			if($result_ary['status'] !=0  ||  empty($result_ary['games']) )
			{
				$array = array(
					'message' 	=>'无法取得游戏列表' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			foreach($result_ary['games'] AS $key=> $value)
			{
				if($value['tcgGameCode'] =="A00070")
				{
					$first = $value;
					unset($result_ary['games'][$key]);
					break;
				}
			}
			if(!empty($first))
			{
				array_unshift($result_ary['games'], $first);
			}
			$output['body']['list'] = $result_ary['games'];
			$first=3200000+substr(time(),1,2);
			$second=2800000+substr(time(),2,3);
			$third=2400000+substr(time(),4,5);
			
			$table = array(
				number_format($first, 0, '.', ','),
				number_format($second,0, '.', ','),
				number_format($third,0, '.', ',')
			);
			$output['body']['table'] =$table;
			$output['body']['pageinfo']  = array(
				'total'	=>$result_ary['page_info']['totalCount'],
				'pages'	=>$result_ary['page_info']['totalPage'],
				'p'	=>$result_ary['page_info']['currentPage']
			);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function UserMoneyPasswd()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得资金密码是否设定';
		$output['message'] = '执行成功';
		try 
		{
			$row = $this->user->moneyPassedIsSet($this->_user);
			if($row['u_money_passwd'] !="")
			{
				$output['body']['isSet'] =1;
			}else
			{
				$output['body']['isSet'] =0;
			}
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function test()
	{
		$str='a:13:{s:5:"scode";s:8:"CID05101";s:7:"orderno";s:16:"2018021000002879";s:7:"orderid";s:40:"20180210febb87147b49ee4e7ec4bbae6bc90c48";s:6:"amount";s:1:"1";s:8:"currcode";s:3:"CNY";s:4:"memo";s:0:"";s:8:"resptime";s:19:"2018-02-10 17:57:51";s:6:"status";s:1:"1";s:8:"respcode";s:2:"00";s:7:"paytype";s:9:"unionpay3";s:11:"productname";s:15:"使用者充值";s:7:"rmbrate";s:6:"4.7180";s:4:"sign";s:32:"2faeb115dcb3080f2eb513b53b061742";}';
		var_dump(unserialize($str));
		exit;
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='測試用';
		$output['message'] = '执行成功';

		try 
		{
			
	
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function getThirdBetByUser()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得用户投注列表';
		$output['message'] = '执行成功';
		$page_size = (isset($get['limit']))?$get['limit']:6;
		$page = (isset($get['p']))?$get['p']:1;
		$start_date = (isset($get['start_date']))?$get['start_date']." 00:00:00":date('Y-m-d 00:00:00');
		$end_date = (isset($get['end_date']))?$get['end_date']." 23:59:59":date('Y-m-d 23:59:59');
		try 
		{
			
			$ag_user_name = $this->_user['ag_u_account'];
			$result_json_str = $this->tcgcommon->get_bet_details_member($ag_user_name, $start_date, $end_date, $page);
			$result_ary = json_decode($result_json_str , true);
			if($result_ary['status'] !=0 || empty($result_ary))
			{
				$array = array(
					'message' 	=>'无法取得用户投注列表' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			$output['body']['list'] = $result_ary['details'];
			$output['body']['page_info']['pages'] = $result_ary['page_info']['totalPage'];
			$output['body']['page_info']['total'] = $result_ary['page_info']['totalCount'];
			$output['body']['page_info']['p'] = $result_ary['page_info']['currentPage'];
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function transferToThird ()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='用户额度转入第三方平台';
		$output['message'] = '成功';
		
		$product_type = (isset($get['product_type']))?$get['product_type']:4;
		$amount = (isset($get['amount']))?intval($get['amount']):0;
		
		
		try 
		{
			
			if($amount <=0)
			{
				$array = array(
					'message' 	=>'额度不能小于0' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if( $this->_user['u_ag_game_model'] ==0)
			{
				$array = array(
					'message' 	=>'此帐号为测试帐号无法使用转帐功能' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ag_user_name = $this->_user['ag_u_account'];
			$result_json_str = $this->tcgcommon->get_balance($ag_user_name ,$product_type);
			$result_ary = json_decode($result_json_str , true);
	
			if($result_ary['status'] !=0 || empty($result_ary))
			{
				$array = array(
					'message' 	=>'无法取得使用者馀额' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			
			$ary = array(
				'user' =>$this->_user,
				'fund_type' =>1,
				'amount'  =>$amount,
				'product_type'	=>$product_type,
			);
			
			$this->account->transfer($ary);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function transferToLdyl()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='第三方额度转到平台';
		$output['message'] = '成功';
		
		$product_type = (isset($get['product_type']))?$get['product_type']:4;
		$amount = (isset($get['amount']))?intval($get['amount']):0;
		
		
		try 
		{
			
			if($amount <=0)
			{
				$array = array(
					'message' 	=>'额度不能小于0' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if( $this->_user['u_ag_game_model'] ==0)
			{
				$array = array(
					'message' 	=>'此帐号为测试帐号无法使用转帐功能' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ag_user_name = $this->_user['ag_u_account'];
			$result_json_str = $this->tcgcommon->get_balance($ag_user_name ,$product_type);
			$result_ary = json_decode($result_json_str , true);
	
			if($result_ary['status'] !=0 || empty($result_ary))
			{
				$array = array(
					'message' 	=>'无法取得使用者馀额' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$ary = array(
				'user' =>$this->_user,
				'fund_type' =>2,
				'amount'  =>$amount,
				'product_type'	=>$product_type,
				'ag_balance'	=>$result_ary['balance'],
			);
			
			$this->account->transfer($ary);
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function getThirdBlance()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得第三方用户馀额';
		$output['message'] = '成功';
		$product_type = (isset($get['product_type']))?$get['product_type']:4;
		try 
		{
			$ag_user_name = $this->_user['ag_u_account'];
		
			$result_json_str = $this->tcgcommon->get_balance($ag_user_name ,$product_type);
			$result_ary = json_decode($result_json_str , true);
			if($result_ary['status'] !=0 || empty($result_ary ))
			{
				$array = array(
					'message' 	=>'无法取得取得第三方用户馀额' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$output['body'] =$result_ary;
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	public function  getGameUrl()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得游戏入口';
		$output['message'] = '执行成功';
		
		$game_code = (isset($get['game_code']))?$get['game_code']:'';
		$platform_ary =array(
			'html5',
			'flash',
			'all'
		);
		$platform = (in_array($get['platform'], $platform_ary))?$get['platform']:'';
		
		$product_type = (isset($get['product_type']))?$get['product_type']:4;
		try 
		{
			if(
				$game_code =="" ||
				$platform =="" 
			)
			{
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			$ag_username =$this->_user['ag_u_account'];
			$ag_game_model =$this->_user['u_ag_game_model'];
			$result_json_str = $this->tcgcommon->getLaunchGameRng($ag_username, $product_type, $ag_game_model, $game_code, $platform);
			$result_ary = json_decode($result_json_str , true);
			if($result_ary['status'] !=0 || empty($result_ary))
			{
				$array = array(
					'message' 	=>'无法取得取得游戏入口' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$output['body']['game_url'] =$result_ary['game_url'];
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	
	public function payCallBack()
	{
		$post= $this->input->post();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='付费成功后呼叫';
		$output['message'] = '成功';
		try 
		{
			$scode = ($post['scode'] !="")?$post['scode'] :'';
			$orderid = ($post['orderid'] !="")?$post['orderid'] :'';
			$orderno = ($post['orderno'] !="")?$post['orderno'] :'';
			$paytype = ($post['paytype'] !="")?$post['paytype'] :'';
			$amount = ($post['amount'] !="")?$post['amount'] :0;
			$productname = ($post['productname'] !="")?$post['productname'] :'';
			$currcode = ($post['currcode'] !="")?$post['currcode'] :'';
			$memo = ($post['memo'] !="")?$post['memo'] :'';
			$resptime = ($post['resptime'] !="")?$post['resptime'] :'';
			$status = ($post['status'] !="")?$post['status'] :'';
			$respcode = ($post['respcode'] !="")?$post['respcode'] :'';
			$sign = ($post['sign'] !="")?$post['sign'] :'';
			
			if(
				$scode ==""||
				$orderid ==""||
				$orderno ==""||
				$paytype ==""||
				intval($amount) ==0||
				$productname ==""||
				$currcode ==""||
				$status ==""||
				$respcode ==""
			)
			{
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$this->account->rechargeCallBackLog($post);
			$this->account->recharge($post);
			
			
			
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function getRechargeOrder()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得充值资料';
		$output['message'] = '成功';

		try 
		{
			if(
				$this->request['paytype']	==""|| 
				$this->request['amount']	==""
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$callbackurl =$_SERVER['HTTP_ORIGIN'].'/api/Api/payCallBack';
			
			$ary = array(
				'u_id'			=>$this->_user['u_id'],
				'paytype'		=>$this->request['paytype'],
				'amount'		=>$this->request['amount'],
				'callbackurl'	=>$callbackurl 
			);
			
			
			
			$orderid  = $this->account->getUserRechargeOrder($ary);
			
			$currcode = 'CNY';
			
			$sign =$_SERVER['RECHARGE_PAY_SCODE']."|";
			$sign .=$orderid."&";
			$sign .=$this->request['amount']."&";
			$sign .=$currcode."|";
			$sign .=$callbackurl."&";
			$sign .=$_SERVER['RECHARGE_PAY_KEY'] ;
			
			$ary = array(
				'pay_url'		 =>$_SERVER['RECHARGE_PAY_URL'],
				'scode' 		 =>$_SERVER['RECHARGE_PAY_SCODE'],
				'orderid' 		 =>$orderid,
				'paytype' 		 =>$this->request['paytype'],
				'amount' 		 =>$this->request['amount'],
				'productname' 	 =>'使用者充值',
				'currcode '		 =>$currcode ,
				'userid'		 =>$this->_user['u_id'],
				'memo'		     =>'',
				'callbackurl'	 => $callbackurl,
				'sign'	 		 => md5($sign),
				'u_account'		 =>$this->_user['u_account']
			);
			$output['body'] = $ary;
	
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
			$this->myLog->error_log($parames);
		}
		
		$this->response($output);
	}
	
	public function registered($rl_id='')
	{
		$output['status'] = 100;
		$output['message'] = '註冊成功'; 
		$output['body'] =array();
		$output['title'] ='註冊下級用戶';
		
		try 
		{
			if(
				$this->request['name']	==""|| 
				$this->request['account']	==""|| 
				$this->request['passwd']	=="" ||
				$this->request['captcha']	==""  ||
				$rl_id ==""
			){
				$array = array(
					'message' 	=>'reponse 必传参数为空' ,
					'type' 		=>'api' ,
					'status'	=>'002'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			// var_dump($_COOKIE['captcha'] );
			if($_COOKIE['captcha'] != $this->request['captcha'])
			{
				$array = array(
					'message' 	=>'验证码错误' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if(strlen($this->request['name']) <4 || strlen($this->request['name'])>12){
				$array = array(
					'message' 	=>'昵称长度为4~12位' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if(!ereg('^[a-z0-9]{4,10}$', $this->request['account'])){
				$array = array(
					'message' 	=>'帐号为4~10为小写英文与数字组合' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if(strlen($this->request['passwd']) <6 || strlen($this->request['passwd'])>12){
				$array = array(
					'message' 	=>'密码长度为6~12位' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			if($this->request['name'] == $this->request['account']){
				$array = array(
					'message' 	=>'昵称与用户名不可相同' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$registeredLink =$this->user->getRegisteredLinkByID($rl_id);
			
			if( empty($registeredLink )){
				$array = array(
					'message' 	=>'注册连结无效' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$accountIsExist = $this->user->accountIsExist($this->request['account']);
			if($accountIsExist ==1)
			{
				$array = array(
					'message' 	=>'此帐号已注册' ,
					'type' 		=>'api' ,
					'status'	=>'999'
				);
				$MyException = new MyException();
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$superiorUser = $this->user->getSuperiorUser($registeredLink['u_id']);
			
			$ary =array(
				'superior_id'		=>$registeredLink['u_id'],
				'u_name'			=>$this->request['name'],
				'u_account'			=>$this->request['account'],
				'u_passwd'			=>md5($this->request['passwd']),
				'u_ag_game_model'	=>$superiorUser['u_ag_game_model']
			);
			
			$this->user->insert($ary);
		}catch(MyException $e)
		{
			$parames = $e->getParams();
			$parames['class'] = __CLASS__;
			$parames['function'] = __function__;
			$this->myLog->error_log($parames);
			$output['message'] = $parames['message']; 
			$output['status'] = $parames['status']; 
		}
		
		$this->response($output);
	}
	
	private function response($output)
	{
		
		$output = array(
			'body'		=>$output['body'],
			'title'		=>$output['title'],
			'status'	=>$output['status'],
			'message'	=>$output['message']
		);
		
		header('Content-Type: application/json');
		echo json_encode($output , true);
	}
}
