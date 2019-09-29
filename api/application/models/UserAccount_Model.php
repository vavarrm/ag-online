<?php
	class UserAccount_Model extends CI_Model 
	{
		public $CI;
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->CI =& get_instance();
			$this->db->query("SET time_zone='+8:00'");
			$this->CI->load->model('Transfer_Model', 'transfer');
		}
		
		
		public function getUserRechargeOrder($ary)
		{
			try
			{
				
				
				$orderid = date('Ymd').md5(time().rand(1,999));
				
				$sql ="INSERT INTO user_recharge_order(uro_orderid, uro_u_id, 	uro_paytype, uro_amount, uro_add_datetime, uro_callbackurl)
						VALUES(?,?,?,?,NOW(),?)";
				$bind = array(
					$orderid,
					$ary['u_id'],
					$ary['paytype'],
					$ary['amount'],
					$ary['callbackurl'],
				);
				
				$query = $this->db->query($sql, 	$bind );
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				return 	$orderid ;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		
		public function addRechargeFromBank($ary)
		{
			try
			{
				$this->db->trans_begin();
				
				$sql="SELECT COUNT(*) AS total FROM user_recharge_order WHERE uro_orderid=?";
				$bind = array($ary['orderid']);
				$query = $this->db->query($sql,$bind);
				$row = $query->row_array();
				
				if($row['total']>0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'订单号重覆，请重新取得' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql ="INSERT INTO  user_recharge_order (uro_orderid, uro_u_id, uro_paytype,uro_amount,uro_add_datetime,uro_respcode)
					  VALUES(?,?,'bank_transfer',?,NOW(),98)";
				$bind = array(
					$ary['orderid'],
					$ary['u_id'],
					$ary['amount'],
				);
				$query = $this->db->query($sql,$bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$uro_id = $this->db->insert_id();
				
				$sql ="INSERT INTO user_account(ua_value, ua_type, ua_add_datetime, ua_u_id, ua_uro_id,ua_rbc_id)
						VALUES(?,2,NOW(),?,?,?)";
				$bind = array(
					$ary['amount'],
					$ary['u_id'],
					$uro_id ,
					$ary['rbc_id'] ,
				);
				
				$query = $this->db->query($sql,$bind );
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$affected_rows = $this->db->affected_rows();
				
				$this->db->trans_commit();
				
				return $affected_rows;
				
			}catch(MyException $e)
			{
			   $this->db->trans_rollback();
			   throw $e;
			}
		}
		
		public function addRechargeWechat3($ary)
		{
			try
			{
				$this->db->trans_begin();
						
				$sql="SELECT COUNT(*) AS total FROM user_recharge_order WHERE uro_orderid=?";
				$bind = array($ary['orderid']);
				$query = $this->db->query($sql,$bind);
				$row = $query->row_array();
				
				if($row['total']>0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'订单号重覆，请重新取得' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql ="INSERT INTO  user_recharge_order (uro_orderid, uro_u_id, uro_paytype,uro_amount,uro_add_datetime,uro_respcode)
					  VALUES(?,?,'wechat3',?,NOW(),98)";
				$bind = array(
					$ary['orderid'],
					$ary['u_id'],
					$ary['amount'],
				);
				$query = $this->db->query($sql,$bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$uro_id = $this->db->insert_id();
				
				$sql ="INSERT INTO user_account(ua_value, ua_type, ua_add_datetime, ua_u_id, ua_uro_id)
						VALUES(?,2,NOW(),?,?)";
				$bind = array(
					$ary['amount'],
					$ary['u_id'],
					$uro_id ,
				);
				
				$query = $this->db->query($sql,$bind );
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$affected_rows = $this->db->affected_rows();
				
				$this->db->trans_commit();
				
				return $affected_rows;
				
			}catch(MyException $e)
			{
			   $this->db->trans_rollback();
			   throw $e;
			}
		}
		
		public function addRechargeAlipay2($ary)
		{
			try
			{
				$this->db->trans_begin();
						
				$sql="SELECT COUNT(*) AS total FROM user_recharge_order WHERE uro_orderid=?";
				$bind = array($ary['orderid']);
				$query = $this->db->query($sql,$bind);
				$row = $query->row_array();
				
				if($row['total']>0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'订单号重覆，请重新取得' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql ="INSERT INTO  user_recharge_order (uro_orderid, uro_u_id, uro_paytype,uro_amount,uro_add_datetime,uro_respcode)
					  VALUES(?,?,'alipay2',?,NOW(),98)";
				$bind = array(
					$ary['orderid'],
					$ary['u_id'],
					$ary['amount'],
				);
				$query = $this->db->query($sql,$bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$uro_id = $this->db->insert_id();
				
				$sql ="INSERT INTO user_account(ua_value, ua_type, ua_add_datetime, ua_u_id, ua_uro_id)
						VALUES(?,2,NOW(),?,?)";
				$bind = array(
					$ary['amount'],
					$ary['u_id'],
					$uro_id ,
				);
				
				$query = $this->db->query($sql,$bind );
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$affected_rows = $this->db->affected_rows();
				
				$this->db->trans_commit();
				
				return $affected_rows;
				
			}catch(MyException $e)
			{
			   $this->db->trans_rollback();
			   throw $e;
			}
		}
		
		public function rechargeCallBackLog($ary)
		{
			try
			{
				
				$sql ="INSERT INTO user_recharge_callback_log(urcl_post_str,urcl_add_datetime)
						VALUES(?,NOW())";
				$bind = array(
					serialize($ary),
				);
				
				$query = $this->db->query($sql, 	$bind );
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function recharge($ary)
		{
			try
			{
				$sql = "SELECT COUNT(*) AS total FROM user_recharge_lock WHERE url_u_id =? ";
				$bind = array(
					$ary['u_id']
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$row =  $query->row_array();
				$query->free_result();
				if($row['total'] >0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'充值交易遭鎖定' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				
				
				
				
				$sql ="SELECT * FROM user_recharge_order WHERE uro_orderid =?";
				$bind=array(
					$ary['orderid']
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$row =  $query->row_array();
				$query->free_result();
				if(empty($row))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'查无此订单' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql="SELECT COUNT(*) AS  total FROM user_account WHERE ua_uro_id =?";
				$bind=array(
					$row['uro_id']
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$isRecharge =  $query->row_array();
				$query->free_result();
				if($isRecharge['total'] >0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'此订单已入帐' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql="INSERT INTO user_recharge_lock (url_u_id,url_add_datetime) VALUES(?,NOW())";
				$bind=array(
					$row['uro_u_id']
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$query = $this->db->query($sql, $bind);
					$MyException = new MyException();
					$array = array(
						'message' 	=>'无法执行锁定' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$check_sign=$_SERVER['RECHARGE_PAY_SCODE']."|";
				$check_sign.=$ary['orderno']."&";
				$check_sign.=$row['uro_orderid']."&";
				$check_sign.=$ary['amount']."|";
				$check_sign.="CNY&";
				$check_sign.=$ary['status']."&";
				$check_sign.=sprintf("%02d",$ary['respcode'])."|";
				$check_sign.=$_SERVER['RECHARGE_PAY_KEY'];
				$check_sign = md5($check_sign);
	
				if(	$check_sign !=$ary['sign'])
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'资料验证失败' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$post_ary = array(
					'scode'			=>$_SERVER['RECHARGE_PAY_SCODE'] ,
					'orderid'		=>$row['uro_orderid'],
					'sign'			=>md5($_SERVER['RECHARGE_PAY_SCODE']."|".$row['uro_orderid'].'&'.$_SERVER['RECHARGE_PAY_KEY']),
				);
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, $_SERVER['RECHARGE_CHECKORDER_URL']);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
				curl_setopt($ch, CURLOPT_POST, true);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER , true);
				curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($post_ary)); 
				$json = curl_exec($ch); 
		
				if($json  === false)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>curl_error($ch) ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				curl_close($ch);
				
				$json_ary = json_decode($json,true);
				
				if($json_ary['status'] !='1' || $ary['status'] !='1')
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'交易查询失败' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				
				
				
				$this->db->trans_begin();
				
				$sql="	UPDATE  user_recharge_order 
						SET 
							uro_orderno=? ,
							uro_status =?,	
							uro_respcode =?,
							uro_reply =1,
							uro_resptime =?
						WHERE uro_orderid=?";
				$bind= array(
					$ary['orderno'],
					$ary['status'],
					$ary['respcode'],
					$ary['resptime'],
					$ary['orderid'],
				);
				
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql="INSERT INTO user_account (ua_value,ua_type,ua_add_datetime,ua_u_id,ua_uro_id,ua_status)
					  VALUES(?,2,NOW(),?,?,'received')";
				$bind= array(
					$ary['amount'],
					$row['uro_u_id'],
					$row['uro_id'],
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$this->db->trans_commit();
			}catch(MyException $e)
			{
				$this->db->trans_rollback();
				$sql="DELETE  FROM user_recharge_lock WHERE url_u_id =?";
				$bind=array(
					$row['uro_u_id']
				);
				$query = $this->db->query($sql, $bind);
				throw $e;
			}
		}
		
		public function getTransferreferenceNo($fund_type)
		{
			return time().rand(1000,9999);
		}
			
		
		public function transfer($ary)
		{
			try
			{
				
				if( abs($ary['amount']) ==0)
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
				
				if( $ary['user']['u_ag_game_model'] ==0)
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
		
				$_ary = [
					'username'	=>$ary['user']['u_account']
				];
				$result_ary = $this->gpcommon->getBalanceApi($_ary);
				
				
				if($result_ary['code'] !=100 || empty($result_ary))
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
				
				/*捡查转帐交易是否锁定*/
				$sql = "SELECT COUNT(*) AS total FROM ag_lock WHERE ag_u_id =? AND ag_is_lock='1'";
				$bind = array(
					$ary['user']['u_id']
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$lock_row = $query->row_array(); 
				$query->free_result();
				if($lock_row['total'] >0 )
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'转帐交易遭锁定' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				/*锁定转帐交易*/
				$sql="	INSERT INTO ag_lock (ag_u_id, ag_add_datetime)
						VALUES(?, NOW())";
				$bind = array(
					$ary['user']['u_id']
				);
				
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$ag_id =  $this->db->insert_id();
	
				/*交易开始*/
				$this->db->trans_begin();			
				$balance = $this->getBalance($ary['user']['u_id']);
				if($ary['fund_type'] ==1 && ($balance['balance'] <=0 || $ary['amount'] > $balance['balance']))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'用户馀额不足' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				if($ary['fund_type'] ==2 && $result_ary['member']['balance'] <$ary['amount'] )
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'第三方馀额不足' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$reference_no = $this->CI->transfer->getTransferreferenceNo();
				$param = [
					'username'=>$ary['user']['u_account'],
					'amount'=>$ary['amount'],
					'reference_no'=>$reference_no,
				];
				
				$result = $this->gpcommon->transferAPI($param);
				// var_dump($result);
				if(empty($result) || $result['code'] != 100)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'交易失败' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				
				$sql="UPDATE ag_lock SET ag_is_lock ='0' WHERE id =?";
				$bind = array(
					$ag_id
				);
				
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql="UPDATE user SET u_balance =u_balance - ".$ary['amount']." WHERE u_id =?";
				$bind = array(
					$ary['user']['u_id']
				);
				
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$balance = $this->getBalance($ary['user']['u_id']);
				
				$ary['reference_no'] = $reference_no;
				$ary['u_balance'] = $balance['balance'];
				$ary['third_balance'] = $result['member']['balance'];
				$this->CI->transfer->insert($ary);
				
				$output = [
					'userBalance' =>$balance['balance'],
					'thirdBalance' =>$result['member']['balance'],
				];
				$this->db->trans_commit();
				return $output;
			}catch(MyException $e)
			{
			   $this->db->trans_rollback();
			   if($ag_id !="")
			   {
				   $sql="DELETE  FROM ag_lock WHERE id =?";
				   $bind=array(
						$ag_id
				   );
				   $query = $this->db->query($sql, $bind);
			   }
			   throw $e;
			}
	
		}
		
		public function getBalance($u_id)
		{
			try 
			{
				$sql ="
						SELECT FORMAT(u_balance,2)   AS balance FROM user WHERE u_id =?";
				$bind = array(
					$u_id,
				);
				$query = $this->db->query($sql, $bind);
				// echo $this->db->last_query();
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$row =  $query->row_array();
				$query->free_result();
				$row['balance'] = str_replace(',', '', $row['balance']);
				return $row;
				
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		
		public function getBankInfoByIDAndUId($ub_id,$u_id)
		{
			try 
			{
				
				$sql ="SELECT * FROM  user_bank_info WHERE 	ub_id =? AND ub_u_id = ?";
				$bind = array(
					$ub_id,
					$u_id
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$row =  $query->row_array();
				$query->free_result();
				return $row;
				
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function getAccountLimit()
		{
			try {
				$sql ="SELECT * FROM web_config WHERE wc_group ='account'";
				$query=$this->db->query($sql);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw  $MyException;
				}
				$rows = $query->result_array();
				$query->free_result();

				
				if(empty($rows))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'无法取到充提限制' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw  $MyException;
				}
				
				foreach($rows as $value)
				{
					$output[$value['wc_key']] = $value;
				}
				return $output;
			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function getWithdrawal($u_id)
		{
			try 
			{

						
				$sql =" SELECT 
								(
									SELECT COUNT(*) 
									FROM  
										user_account 
									WHERE 
										ua_u_id = ua.ua_u_id  AND 
										DATE_FORMAT(NOW(),'%Y-%m-%d') =  DATE_FORMAT(ua_add_datetime,'%Y-%m-%d') 
										AND ua_status = 'audit'
										AND ua_type in('3')
								) AS today_audit_number,
								(
									SELECT COUNT(*) 
									FROM  
										user_account 
									WHERE 
										ua_u_id = ua.ua_u_id  AND 
										DATE_FORMAT(NOW(),'%Y-%m-%d') =  DATE_FORMAT(ua_add_datetime,'%Y-%m-%d') 
										AND ua_status = 'payment'
										AND ua_type in('3')
								) AS today_payment_number,
								(
									SELECT IFNULL(SUM(ua_value),0) 
									FROM  
										user_account 
									WHERE 
										ua_u_id = ua.ua_u_id  AND 
										DATE_FORMAT(NOW(),'%Y-%m-%d') =  DATE_FORMAT(ua_add_datetime,'%Y-%m-%d') 
										AND ua_status = 'payment'
										AND ua_type in('3')
								) AS today_payment_value
								FROM 
									 user_account AS ua
								WHERE 
								ua.ua_u_id =?
								AND DATE_FORMAT(NOW(),'%Y-%m-%d') =  DATE_FORMAT(ua.ua_add_datetime,'%Y-%m-%d') 
								";
				$bind = array(
					$u_id
				);
				$query = $this->db->query($sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$row =  $query->row_array();
				$query->free_result();
				return $row;
				
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function withdrawal($ary)
		{
			try 
			{
				
				$balance = $this->getBalance($ary['u_id']);

				if($ary['quota']>$balance['balance'])
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'馀额不足' ,
						'type' 		=>'system' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$bankInfo = $this->getBankInfoByIDAndUId($ary['ub_id'], $ary['u_id']);
				
				if(empty($bankInfo))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'尚未绑定银行卡' ,
						'type' 		=>'system' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$withdrawal= $this->getWithdrawal($ary['u_id']);
				$accountLimit =$this->getAccountLimit();
				
				// if( $withdrawal['today_audit_number']  >= $accountLimit['withdrawal_time_max']['wc_value'])
				// {
					// $MyException = new MyException();
					// $array = array(
						// 'message' 	=>'每日提款次数上限为'.$accountLimit['withdrawal_time_max']['wc_value'] ,
						// 'type' 		=>'system' ,
						// 'status'	=>'999'
					// );
					
					// $MyException->setParams($array);
					// throw $MyException;
				// }
				
				// if( $withdrawal['today_payment_number']  >= $accountLimit['withdrawal_time_max']['wc_value'])
				// {
					// $MyException = new MyException();
					// $array = array(
						// 'message' 	=>'每日提款次数上限为'.$accountLimit['withdrawal_time_max']['wc_value'] ,
						// 'type' 		=>'system' ,
						// 'status'	=>'999'
					// );
					
					// $MyException->setParams($array);
					// throw $MyException;
				// }
				
				if( $withdrawal['today_payment_value']  >= $accountLimit['withdrawal_value_max']['wc_value'])
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'每日提款额度上限为'.$accountLimit['withdrawal_value_max']['wc_value'] ,
						'type' 		=>'system' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql ="INSERT INTO user_account(ua_value, ua_type, ua_add_datetime,ua_u_id, ua_ub_id)
					   VALUE(?,3,NOW(),?,?)";
				$bind = array(
					$ary['quota'],
					$ary['u_id'],
					$ary['ub_id']
				);
				$query = $this->db->query($sql, $bind);
				$affected_rows =  $this->db->affected_rows();
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				return $affected_rows ;
				
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function getReportList($ary = array())
		{
			try 
			{
				$where .=" WHERE 1 = 1";
				$gitignore = array(
					'limit',
					'p',
					'order'
				);
				$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);

				if(is_array($ary))
				{
					foreach($ary as $key => $value)
					{
						if(in_array($key, $gitignore) ||  $value ==='' || $value['value'] ==="")	
						{
							continue;
						}
						if($key =="start_date" || $key=="end_date"  )
						{
							if($value['value']!='')
							{
								$where .=sprintf(" AND DATE_FORMAT(`ua_add_datetime`, '%s') %s ?", '%Y-%m-%d', $value['operator']);					
								$bind[] = $value['value'];
							}
						}
						elseif($value['operator'] == 'in')
						{
							
							$where .=sprintf(" AND %s IN (%s) ", $key, $value['value']);					
						}
						else{
							$where .=sprintf(" AND %s %s ?", $key, $value['operator']);					
							$bind[] = $value['value'];
						}
					}
				}
				
				if(is_array($ary['order']))
				{
					$order =" ORDER BY ";
					foreach($ary['order'] AS $key =>$value)
					{
						$order.=sprintf( '%s %s', $key, $value);
					}
				}
				
				$sql =" SELECT 
							*,
							CASE
								WHEN  ua_status = 'audit' THEN '审核中'
								WHEN  ua_status = 'payment' THEN '已出款'
								WHEN  ua_status = 'received' THEN '已到帐'
								WHEN  ua_status = 'stopPayment' THEN '拒绝出款'
								WHEN  ua_status = 'noAllowed' THEN '拒绝'
								WHEN  ua_status = 'transfer_out' THEN '转出'
								WHEN  ua_status = 'transfer_in' THEN '转入'
								WHEN  ua_status = 'chargeback' THEN '系统扣款'
								ELSE ua_status 
							END   AS ua_status_str,
							CASE 
								WHEN ua_type ='1' THEN '系统充值'
								WHEN ua_type ='2' THEN '用户充值'
							END
							AS 	ua_type_1
						FROM 
							user_account AS ua 
								LEFT JOIN  user_account_type AS uat ON uat.uat_id = ua.ua_type
								LEFT JOIN  discount d ON ua.ua_from_d_id = d.d_id
								LEFT JOIN user_recharge_order AS uro ON uro.uro_id = ua.ua_uro_id";
				$search_sql = $sql.$where.$order.$limit ;
				// echo $search_sql;
				$query = $this->db->query($search_sql, $bind);
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$rows = $query->result_array();
				
				$total_sql = sprintf("SELECT COUNT(*) AS total FROM(%s) AS t",$sql.$where) ;
				$query = $this->db->query($total_sql, $bind);
				$row = $query->row_array();
				
				$query->free_result();
				$output['list'] = $rows;
				$output['pageinfo']  = array(
					'total'	=>$row['total'],
					'pages'	=>ceil($row['total']/$ary['limit'])
				);
				
				$error = $this->db->error();
				if($error['message'] !="")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>$error['message'] ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				return 	$output  ;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
	}
?>