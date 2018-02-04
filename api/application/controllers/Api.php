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
		$this->load->model('phoneCallBack_Model', 'callback');
		$this->load->model('Discount_Model', 'discount');
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='';
		$gitignore =array(
			'login',
			'logout',
			'registered',
			'test',
			'getCaptcha'
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
			$output['body']['superior'] = $this->user->getUsetByID($this->_user['u_superior_id']);
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
				$this->request['account']	=="" ||
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
		try 
		{
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
		$ary['limit'] = (isset($get['limit']))?$get['limit']:5;
		$ary['p'] = (isset($get['p']))?$get['p']:1;
		$type= (isset($get['type']))?$get['type']:'';
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
			for($i = 0 ; $i < 6 ; $i++)
			{
			  $randomWord .= chr( rand( 97, 122 ) );
			}
			setcookie("captcha",$randomWord);
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
			
			if($row['u_ag_is_reg'] ==0 && $row['u_ag_game_model'] !='0')
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
				'sess' =>$sess 
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
			
			$output['body']['list'] = $result_ary['games'];
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
	
	public function getThirdBetByUser()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='取得用户投注列表';
		$output['message'] = '执行成功';
		$page_size = (isset($get['limit']))?$get['limit']:6;
		$page = (isset($get['p']))?$get['p']:1;
		$start_date = (isset($get['start_date']))?$get['start_date']:date('Y-m-d 00:00:00');
		$end_date = (isset($get['end_date']))?$get['end_date']:date('Y-m-d 23:59:59');
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
	
	public function transferToThird()
	{
		$get= $this->input->get();
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='转帐至第三方平台';
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
		$output['title'] ='第三方平台转入';
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
	
	public function registered($rl_id='')
	{
		$output['status'] = '100';
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
			
			$ary =array(
				'superior_id'	=>$registeredLink['u_id'],
				'u_name'		=>$this->request['name'],
				'u_account'		=>$this->request['account'],
				'u_passwd'		=>md5($this->request['passwd']),
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
