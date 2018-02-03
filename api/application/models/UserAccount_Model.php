<?php
	class UserAccount_Model extends CI_Model 
	{
		public $CI;
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->CI =& get_instance();
		}
		
		
		public function getTransferreferenceNo($fund_type)
		{
			try
			{
				$sql ="	SELECT 
							uta_id 
						FROM  user_transfer_account 
						WHERE 
							DATE_FORMAT(NOW(), '%Y') = DATE_FORMAT(uta_add_datetime, '%Y') AND
							uta_ag_fund_type =?
						ORDER BY uta_id DESC LIMIT 1";
				$bind = array(
					$fund_type
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
					$reference_no = date('Ymd',time()).$fund_type.sprintf('%06d',1);
				}else
				{
					$reference_no = date('Ymd',time()).$fund_type.sprintf('%06d',$row['uta_id']+1);
				}
				
				return "ldyl".$reference_no;
				
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		
		
		public function transfer($ary)
		{
			try
			{
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
				
				$this->db->trans_begin();
				
				
				$balance = $this->getBalance($ary['user']['u_id']);
				if($ary['fund_type'] ==1 && ($balance['balance'] <=0 || $ary['amount'] > $balance['balance']))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'平台馀额不足' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				if($ary['fund_type'] ==2 && $ary['ag_balance'] <$ary['amount'] )
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'第三方馀额不足' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$this->CI->load->library('MyTcgCommon','tcgcommon');
			
				
				$reference_no = $this->getTransferreferenceNo($ary['fund_type']);
				$ag_username = $ary['user']['ag_u_account'];
				$result_json = $this->CI->tcgcommon->user_transfer($ag_username , $ary['product_type'], $ary['fund_type'] , $ary['amount'], $reference_no);
				$result = json_decode($result_json , true);
				
				
				sleep(3);
				$result_json = $this->CI->tcgcommon->check_transfer($ary['product_type'], $reference_no);
				$result = json_decode($result_json , true);
				
				if(empty($result) || $result['status'] != 0 || $result['transaction_status'] !="SUCCESS")
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'交易失败' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$user_account_insert_ary = array(
					1 =>array('type'=>4,'status'=>'transfer_out'),
					2 =>array('type'=>5,'status'=>'transfer_in'),
				);
				$sql ="	INSERT INTO  user_account
							(ua_value, ua_type , ua_add_datetime ,ua_u_id, ua_status ,ua_from_third,ua_upd_date,ua_order_id, ua_remarks)
						VALUES(?,?,NOW(),?,?,?,NOW(),?,?)";
						
				$bind = array(
					$ary['amount'],
					$user_account_insert_ary[$ary['fund_type']]['type'],
					$ary['user']['u_id'],
					$user_account_insert_ary[$ary['fund_type']]['status'],
					'AG',
					$reference_no,
					$result['transaction_status']
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
				
				$sql="INSERT INTO  user_transfer_account 
								(uta_reference_no, uta_add_datetime, uta_remarks,uta_ag_fund_type)
						VALUES	(?,NOW(),?,?)"	;						
							
				$bind = array(
					$reference_no,
					$result['transaction_status'],
					$ary['fund_type'],
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
				
				$sql="UPDATE ag_lock SET ag_is_lock ='0' WHERE ag_id =?";
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
				
				$this->db->trans_commit();
			}catch(MyException $e)
			{
			   $this->db->trans_rollback();
			   if($ag_id !="")
			   {
				   $sql="DELETE  FROM ag_lock WHERE ag_id =?";
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
						SELECT   IFNULL(SUM(Balance),0)  AS balance FROM  (
							SELECT ua_id , IFNULL(ua_value,0) AS Balance FROM user_account WHERE ua_u_id = ? AND ua_status = 'received'
							UNION
								SELECT 
									ua.ua_id , IFNULL(ua.ua_value,0) AS Balance FROM user_account AS ua  INNER JOIN user_transfer_account AS uta ON  ua.ua_order_id = uta.uta_reference_no
								WHERE 
									ua_u_id = ? AND ua_status = 'transfer_in'
							UNION
							SELECT ua_id , IFNULL(ua_value,0)*-1  AS Balance FROM user_account WHERE  ua_u_id = ? AND ua_status = 'payment'
							UNION
								SELECT 
									ua.ua_id , IFNULL(ua.ua_value,0)*-1 AS Balance FROM user_account AS ua INNER JOIN user_transfer_account AS uta ON  ua.ua_order_id = uta.uta_reference_no
								WHERE 
									ua_u_id = ? AND ua_status = 'transfer_out' 
						) AS t";
				$bind = array(
					$u_id,
					$u_id,
					$u_id,
					$u_id,
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
				
				if( $withdrawal['today_audit_number']  >= $accountLimit['withdrawal_time_max']['wc_value'])
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'每日提款次数上限为'.$accountLimit['withdrawal_time_max']['wc_value'] ,
						'type' 		=>'system' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				if( $withdrawal['today_payment_number']  >= $accountLimit['withdrawal_time_max']['wc_value'])
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'每日提款次数上限为'.$accountLimit['withdrawal_time_max']['wc_value'] ,
						'type' 		=>'system' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
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
					if($key =="start_time" || $key=="end_time"  )
					{
						if($value['value']!='')
						{
							$where .=sprintf(" AND DATE_FORMAT(`an_datetime`, '%s') %s ?", '%Y-%m-%d', $value['operator']);					
							$bind[] = $value['value'];
						}
					}
					elseif($value['operator'] == 'in')
					{
						$where .=sprintf(" AND %s IN (%s) ?", $key, $value);					
						$bind[] = $value['value'];
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
						*
					FROM 
						user_account";
			$search_sql = $sql.$where.$order.$limit ;
			// echo $search_sql;
			$query = $this->db->query($search_sql, $bind);
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
		}
	}
?>