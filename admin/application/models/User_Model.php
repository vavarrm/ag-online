<?php
	class User_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->db->query("SET time_zone='+8:00'");
		}
		
	
		public function lockUserBankCard($ary)
		{
			try
			{
				$user = $this->getUserByID($ary['u_id']);
				if($user['u_bank_card_lock'] ==0)
				{
					
					$MyException = new MyException();
					$array = array(
						'message' 	=>'使用者未锁动绑定银行卡' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$sql ="UPDATE   user SET u_bank_card_lock =0  WHERE 	u_id=? ";
				$bind = array(
					$ary['u_id'],
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
				return $this->db->affected_rows();
			}catch(MyException $e)
			{
				throw $e;
			}
		}
			
		public function lock($ary)
		{
			try
			{
				$sql= "UPDATE user SET 	u_is_lock =? WHERE u_id =?";
				$bind = array(
					$ary['lock'],
					$ary['u_id'],
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
				$affected_rows = $this->db->affected_rows();
				return $affected_rows ;
			}	
			catch(MyException $e)
			{
				throw $MyException;
				return 0;
			}
		}
	
		public function getLoginList($ary)
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
						if(in_array($key, $gitignore) ||  $value['value'] ==="" )	
						{
							continue;
						}
						if($key =="start_time" || $key=="end_time"  )
						{
							if($value['value']!='')
							{
								$where .=sprintf(" AND DATE_FORMAT(`ull_add_datetime`, '%s') %s ?", '%Y-%m-%d', $value['operator']);					
								$bind[] = $value['value'];
							}
						}else
						{
							$where .=sprintf(" AND %s %s ?", $key, $value['operator']);					
							$bind[] = $value['value'];
						}
					}
				}
				
				if(is_array($ary['order']) && count($ary['order']) >0)
				{
					$order =" ORDER BY ";
					foreach($ary['order'] AS $key =>$value)
					{
						$order_ary[]=sprintf( '%s %s ', $key, $value);
					}
						$order.=join(',',$order_ary);
				}
				
				$sql =" SELECT 
							*
						FROM 
							 user_login_log AS ull LEFT JOIN user AS u ON ull.ull_u_id = u.u_id";
				$search_sql = $sql.$where.$order.$limit ;
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
			catch(MyException $e)
			{
				throw $MyException;
				return 0;
			}
		}
		
		public function setMoneyPasswd($ary= array())
		{
			$sql ="UPDATE user SET u_money_passwd =md5(?) WHERE u_id =?";
			$bind = array(
				$ary['u_passwd'],
				$ary['u_id'],
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
			
			if($this->db->affected_rows()   == 0)
			{
				$MyException = new MyException();
				$array = array(
					'message' 	=>'无资料更新' ,
					'type' 		=>'db' ,
					'status'	=>'999'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			return 	true   ;	
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
							UNION
								SELECT ua_id , IFNULL(ua_value,0)*-1  AS Balance FROM user_account WHERE  ua_u_id = ? AND ua_status = 'chargeback'
						) AS t";
				$bind = array(
					$u_id,
					$u_id,
					$u_id,
					$u_id,
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
		
		public function getUserAccountInfo($uid)
		{
			$sql ="	SELECT 
						u_account ,
						(
							SELECT IFNULL(SUM(ua_value),0) as u_balance
							FROM user_account 
							WHERE 
								ua_u_id = u.u_id
								AND ua_status ='allowed'
						)  AS u_balance
					FROM user  AS u
					WHERE u_id =?
	
					";
			$bind = array(
				$uid
			);
			$query = $this->db->query($sql, $bind);
			$row =  $query->row_array();
			$query->free_result();
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
			return $row;
		}
		
		public function setUserPasswd($ary= array())
		{
			$sql ="UPDATE user SET u_passwd =md5(?) WHERE u_id =?";
			$bind = array(
				$ary['u_passwd'],
				$ary['u_id'],
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
			
			if($this->db->affected_rows()   == 0)
			{
				$MyException = new MyException();
				$array = array(
					'message' 	=>'无资料更新' ,
					'type' 		=>'db' ,
					'status'	=>'999'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			return 	true   ;
		}
		
		public function getUserListBySuperiorId($u_superior_id)
		{
			$sql = "SELECT * , 'false' AS `show` FROM user WHERE u_superior_id = ?";
			$bind = array(
				$u_superior_id
			);
			$query = $this->db->query($sql, $bind);
			$rows = $query->result_array();
			$query->free_result();
			
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
			$output = array(
				'list' =>$rows
			);
			return 	$output   ;
		}
		
		public function setAccountLimit($ary)
		{
			try {
				$sql ="	UPDATE 
							user 
						SET 
							u_payment_number_limit =? ,
							u_payment_value_limit =? ,
							u_received_number_limit =? ,
							u_received_value_limit =? 
						WHERE u_id =?";
				$bind = array(
					$ary['u_payment_number_limit'],
					$ary['u_payment_value_limit'],
					$ary['u_received_number_limit'],
					$ary['u_received_value_limit'],
					$ary['u_id']
				);
				$query=$this->db->query($sql, $bind );
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
				$affected_rows = $this->db->affected_rows();
				return $affected_rows;

			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function getUserByID($u_id)
		{
			$sql = "SELECT 
						*
					FROM user WHERE u_id = ?";
			$bind = array(
				$u_id
			);
			$query = $this->db->query($sql, $bind);
			$row = $query->row_array();
			$query->free_result();
			
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
	
			return 	$row   ;
		}
		
		public function getList($ary = array())
		{
			$where .=" WHERE 1 = 1";
			$gitignore = array(
				'limit',
				'p'
			);
			$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);
			if(is_array($ary))
			{
				foreach($ary as $key => $value)
				{
					if(in_array($key, $gitignore) || $value==='' )	
					{
						continue;
					}
					$where.=sprintf( " AND %s=?", $key);
					$bind[] = $value;
				}
			}
			$sql =" SELECT 
						u.u_id,
						u.u_superior_id,
						u.u_account,
						u2.u_account AS superior_account,
						'' AS nodes,
						'false' AS `show`,
						(SELECT COUNT(*)  FROM user u3 WHERE u.u_id = u3.u_superior_id) AS u_have_child,
						CASE 	u.u_is_lock
							WHEN '1' THEN '已冻结'
							WHEN '0' THEN '未冻结'
						END AS u_is_lock_str,
						u.u_is_lock,
						CASE 	u.u_bank_card_lock
							WHEN '1' THEN '已锁定'
							WHEN '0' THEN '未锁定'
						END AS u_bank_card_lock_str
					FROM 
						user AS u LEFT JOIN  user u2 ON u.u_superior_id =  u2.u_id";
			$search_sql = $sql.$where.$limit ;
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
		
		public function accountIsExist($account)
		{
			
			$sql = "SELECT COUNT(*) as isExist FROM user WHERE u_account = ?";
			$bind = array(
				$account
			);
			$query = $this->db->query($sql, $bind);
			$row =  $query->row_array();
			$query->free_result();
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
			return $row['isExist'];
		}
		
		public function insert($ary)
		{
			$sql="	INSERT INTO user(u_superior_id,u_name,u_account,u_passwd,u_add_datetime)
					VALUES(?,?,?,?,NOW())";
			$bind = array(
				$ary['superior_id'],
				$ary['u_name'],
				$ary['u_account'],
				$ary['u_passwd']
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
		}
		
	}
?>