<?php
	class User_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->db->query("SET time_zone='+8:00'");
		}
		
		public function updReceivingBankCardAlert($ary)
		{
			try
			{
				$sql ="UPDATE user  SET	u_receiving_bank_card_alert = ?  WHERE u_id =?";
				$bind = array(
					$ary['change'],
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
				$affected_rows=$this->db->affected_rows();
				return $affected_rows;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function lockUserBankCard($ary)
		{
			try
			{
				$sql ="UPDATE user  SET	u_bank_card_lock = '1'  WHERE u_id =?";
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
				$affected_rows=$this->db->affected_rows();
				return $affected_rows;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function addLoginLog($u_id)
		{
			$this->db->query("set time_zone = '+8:00';");
			$query = $this->db->query("SELECT NOW()");
			$sql ="INSERT user_login_log (	ull_ip, ull_add_datetime, ull_u_id) VALUES(?,NOW(),?)";
			$bind = array(
				$this->getIP(),
				$u_id,
			);
			$query = $this->db->query($sql, $bind);
		}
		
		public function moneyPassedIsSet($user)
		{
			try
			{
				$sql ="SELECT 	u_money_passwd FROM user WHERE u_id =?";
				$bind = array(
					$user['u_id']
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
		
	
		
		public function delUserBankCard($ary)
		{
			try
			{
				$sql ="DELETE  FROM user_bank_info WHERE 	ub_id=? AND ub_u_id=?";
				$bind = array(
					$ary['ub_id'],
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
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function checkMoneyPasswd($ary)
		{
			try
			{
				$sql ="SELECT 	count(*) AS total FROM user WHERE u_id =? AND  u_money_passwd=MD5(?)";
				$bind = array(
					$ary['u_id'],
					$ary['passwd'],
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
		
		public function getIP(){
			 if(!empty($_SERVER["HTTP_CLIENT_IP"])){
				$cip = $_SERVER["HTTP_CLIENT_IP"];
			 }
			 elseif(!empty($_SERVER["HTTP_X_FORWARDED_FOR"])){
				$cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
			 }
			 elseif(!empty($_SERVER["REMOTE_ADDR"])){
				$cip = $_SERVER["REMOTE_ADDR"];
			 }
			 else{
				$cip = "无法取得ip位址";
			 }
			 return $cip;
		}
		
		public function unLockBankCard($ary)
		{
			try 
			{
				$sql="UPDATE user  SET 	u_bank_card_lock = 1 WHERE u_id=?";
				$bind = array(
					$ary['u_id'],
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
				
				return $this->db->affected_rows();
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
		}
		
		public function getMessageList($ary)
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
					$where.=sprintf( " AND %s%s?", $key,  $value['operator']);
					$bind[] = $value['value'];
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
						um.*
					FROM 
						user_message  AS um INNER JOIN user AS u ON u.u_id = um.um_from_u_id ";
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
		
		public function getSuperiorUser($u_superior_id)
		{
			$sql = "SELECT * , 'false' AS `show` FROM user WHERE u_id = ?";
			$bind = array(
				$u_superior_id
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
			return $row    ;
		}
		
		public function getRegisteredLinkByID($rl_id)
		{
			$sql="
				SELECT 
					RL.u_id, 
					U.tree,
					U.real_user
				FROM 
					registered_link AS RL	
				INNER JOIN user AS U ON U.u_id = RL.u_id
				WHERE 
					RL.rl_id = ?
					AND U.agent=1";
			$bind = array(
				$rl_id
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
			

			$tree = $row['tree'];
			$tree = explode(",",$tree);
			$row['level'] = count($tree)-2;
			$root = $this->getUserByID($tree[1]);
			$row['rootAccount'] = $root['u_account'];
			$query->free_result();
			return $row;
		}
		
		public function getRegisteredLink($u_id)
		{
			$sql="SELECT * FROM registered_link WHERE u_id = ?";
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
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function getUserBankCard($ary)
		{
			try 
			{
				$sql="SELECT * FROM user_bank_info  WHERE ub_id=? AND ub_u_id=?";
				$bind = array(
					$ary['ub_id'],
					$ary['u_id'],
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
				$row =  $query->row_array();
				$query->free_result();
				return $row;
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
		}
		
		public function addRegisteredLink($u_id)
		{
			$output = array(
				'affected_rows'	=>0,
				'rl_id'	=>''
			);
			try 
			{
				$user = $this->getUserByID($u_id);
				if(empty($user))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'使用者不存在' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
			$rl_id =  date('s').rand(1000,9999);
			
			$sql="INSERT INTO registered_link (u_id, rl_id) VALUES(?,?)";
			$bind = array(
				$u_id,
				$rl_id
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
			$insert_id = $this->db->insert_id();
			$output['rl_id'] = $rl_id;
			$output['affected_rows'] = $this->db->affected_rows() ;
			return $output;
		}
		
		public function setBankInfo($ary=array())
		{
			
			try 
			{
				if(!is_array($ary) || count($ary) == 0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'參數輸入有誤' ,
						'type' 		=>'system' ,
						'status'	=>'003'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
			
				$user = $this->getUserByID($ary['u_id']);
				if(empty($user))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'使用者不存在' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$account = $this->getUserBankInfoByAccount($ary['account']);
				if(!empty($account))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'此銀行帳號已被綁定' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$bank = $this->getBankInfoByID($ary['bi_id']);
				
				if(!empty($bank))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'此銀行帳號不存在' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
			
		 
			$sql="INSERT INTO user_bank_info(ub_u_id, ub_account, ub_account_name, ub_bank_id,ub_province,ub_city,ub_branch_name,ub_add_datetime)
				 VALUES(?,?,?,?,?,?,?,NOW())";
			$bind = array(
				$ary['u_id'],
				$ary['account'],
				$ary['account_name'],
				$ary['bank_id'],
				$ary['province'],
				$ary['city'],
				$ary['branch_name'],
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
		}
		
		public function getBankInfoByID($bi_id)
		{
			$sql="SELECT * FROM bank_info WHERE bi_id = ?";
			$bind = array(
				$bi_id
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
		}
		
		public function getUserBankInfoByAccount($account)
		{
			$sql="SELECT * FROM user_bank_info WHERE ub_account = ?";
			$bind = array(
				$account
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
		}
		
		
		
		public function getUserBankInfoByID($u_id)
		{
			$sql="SELECT * FROM user_bank_info WHERE ub_u_id = ?";
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
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function getNoReadMessageTotal($uid)
		{
			try{
				$sql ="SELECT COUNT(*) AS total FROM user_message WHERE um_u_id =? AND um_is_read='0' ";
				$bind = array(
					$uid
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
		
		public function getBalance($uid)
		{
			$sql ="SELECT IFNULL(SUM(ua_value),0) as balance FROM user_account WHERE ua_u_id =?";
			$bind = array(
				$uid
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
		}
		
		public function setUserPasswd($passwd, $uid)
		{
			$sql = "UPDATE user SET u_passwd = ? WHERE u_id=?";
			$bind = array(
				md5($passwd),
				$uid
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
		}
		
		public function setUserMoneyPasswd($passwd, $uid)
		{
			$sql = "UPDATE user SET u_money_passwd= ? WHERE u_id=?";
			$bind = array(
				md5($passwd),
				$uid
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
		}
		
		public function getUserByID($u_id)
		{
			$sql = "SELECT *   FROM user WHERE u_id = ?";
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
		}
		
		public function getAllSubordinateUser($u_superior_id)
		{
			$sql = "SELECT *   FROM user WHERE u_superior_id = ?";
			$bind = array(
				$u_superior_id
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
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function  getUserBySuperiorID($id)
		{
			$sql = "SELECT *  FROM  user WHERE u_superior_id =?";
			$bind = array(
				$id,
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
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function getUserMessageByID($id, $u_id)
		{
			$sql = "SELECT 
						um.*,
						u.u_account  
					FROM 
						user_message AS um	INNER JOIN  user AS u ON um.um_from_u_id = u.u_id					
					WHERE um_id= ? AND um_u_id =?
						";
			$bind = array(
				$id,
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
			
			if(!empty($row) && $row['um_is_read'] ==0)
			{
				$sql ="UPDATE user_message set 	um_is_read ='1' WHERE um_id =? AND um_u_id=?"; 
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
			
			return $row;
		}
		
		public function  addSuperiorUserMmessage($ary=array())
		{
			try 
			{
				
				$user = $this->getUserByID($ary['u_id']);
				if(empty($user))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'无此使用者' ,
						'type' 		=>'api' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				if($user['u_superior_id'] === 0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'总代用互无上级',
						'type' 		=>'api' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				
				$sql =" INSERT INTO user_message(um_u_id, um_title, um_content, um_add_datetime, um_from_u_id)
				        VALUES(?,?,?,NOW(),?)";
				
				$bind = array(
					$user['u_superior_id'],
					$ary['title'],
					nl2br($ary['content']),
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

				return $this->db->affected_rows() ;
				
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function  addSubordinateUserMmessage($u_superior_id, $u_account=array(), $title, $content)
		{
			try 
			{
				if(!is_array($u_account) || count($u_account) == 0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'參數輸入有誤' ,
						'type' 		=>'system' ,
						'status'	=>'003'
					);
					
					$MyException->setParams($array);
					throw $MyException;
					
				}
				
				
				$subordinateUser= $this->getSubordinateUserByAccount($u_superior_id, $u_account);
				if(empty($subordinateUser))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'无此下级使用者' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$this->db->trans_start();

				foreach( $subordinateUser as $value)
				{
					$sql ="INSERT INTO user_message (um_u_id, um_title, um_content ,um_from_u_id, um_add_datetime)
						VALUES(?,?,?,?,NOW())";
					$bind = array(
						$value['u_id'],
						$title,
						nl2br($content),
						$u_superior_id
					);

;
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
						break;
					}
					$affected_rows += $this->db->affected_rows() ;
					
				}
				$this->db->trans_complete();
				
				if($affected_rows==0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'新增站内讯息失败' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				return $affected_rows;
				
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
		}
		
		public function getSubordinateUserByAccount($u_superior_id, $u_account)
		{
			
			try 
			{
				if(!is_array($u_account) || count($u_account) == 0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'參數輸入有誤' ,
						'type' 		=>'system' ,
						'status'	=>'003'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
			
			
			$u_account_str = join("','", $u_account);
			
			$sql = sprintf("SELECT *  FROM user WHERE u_superior_id =? AND u_account IN ('%s')", $u_account_str);
			// echo $sql;
			$bind = array(
				$u_superior_id
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
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function  updAgIsLogin($ary)
		{
			try 
			{
				$sql="UPDATE user SET u_ag_is_reg =? WHERE u_id =?";
				$bind = array(
					'1',
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
				
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
		}
		
		public function getUesrByAccount($account)
		{
			$sql = "SELECT * ,CONCAT('ldyl',u_account) AS ag_u_account FROM user WHERE u_account = ?";
			$bind = array(
				$account
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
		}
		
		public function accountIsExist($account)
		{
			
			$sql = "SELECT COUNT(*) as isExist FROM user WHERE u_account = ?";
			$bind = array(
				$account
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
			return $row['isExist'];
		}
		
		public function insert($ary)
		{
			// var_dump($ary);
			
			if($ary['real_user'] != 1)
			{
				$ary['real_user'] = 0;
			}
			
			if($ary['tree'] =="")
			{
				$ary['isRoot'] = 1;
			}else
			{
				$ary['isRoot'] =0;
			}
			
			if($ary['rootAccount'] =="")
			{
				$ary['rootAccount'] = $ary['u_account'];
			}
			
			$sql="	INSERT INTO user(
						u_name,
						u_account,
						u_passwd,
						u_add_datetime,
						real_user,
						is_root,
						root_u_account
						)
					VALUES(?,?,?,NOW(),?,?,?)";
			$bind = array(
				$ary['u_name'],
				$ary['u_account'],
				$ary['u_passwd'],
				$ary['real_user'],
				$ary['isRoot'],
				$ary['rootAccount'],
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
			
			$insert_id = $this->db->insert_id();
			if($ary['tree'] == "")
			{
				$tree="0,".$insert_id.",0";
			}else
			{
				$tree = str_replace(",0",",".$insert_id.",0",$ary['tree']);
			}
			$this->updateTree($insert_id,$tree);
		}
		
		public function updateTree($u_id, $tree){
			$sql="	UPDATE  user
					SET tree=?
					WHERE u_id=?";
			$bind = array(
				$tree,
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
		}
	}
?>