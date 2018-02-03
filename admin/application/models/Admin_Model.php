<?php
	class Admin_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
		
		public function del($ary  = array())
		{
			try
			{
				$this->db->trans_begin();
				if(count($ary ) == 0)
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'无傳入參數' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$in_id_str = join("','", $ary);
				$sql="DELETE FROM  admin WHERE ad_id IN('".$in_id_str."')";
				$query = $this->db->query($sql);
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
				if($affected_rows   == 0)
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
				
				$sql ="DELETE FROM admin_menu_control WHERE amc_am_id IN('".$in_id_str."')";
				$query = $this->db->query($sql);
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
				
				$affected_rows += $this->db->affected_rows();
				if($affected_rows   == 0)
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
				
				$this->db->trans_commit();
				return $affected_rows;
			}catch(MyException $e)
			{
				$this->db->trans_rollback();
				throw $MyException;
			}
		}
		
		
		public function getMenuList($ary=array())
		{
			try
			{
				if(empty($ary))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'參數有誤' ,
						'type' 		=>'db' ,
						'status'	=>'001'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$sql="SELECT * FROM `admin_menu` WHERE am_id in('".join("','",$ary)."')";
				$query = $this->db->query($sql);
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
				
				$output = array();
				if(!empty($rows))
				{
					foreach($rows as $row)
					{
						$this->getChild($row['am_id'], $output);
					}
				}
				return $output;
			}catch(MyException $e)
			{
				throw $MyException;
			}
		}
		
		private function getChild($am_id,&$ary=array())
		{
			try
			{
				$sql ="SELECT * FROM  `admin_menu` WHERE `am_parent_id` = ?";
				$bind = array($am_id);
				$query = $this->db->query($sql,$bind);
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
				
				if(!empty($rows))
				{
					foreach($rows as $row)
					{
						$ary[] = $row;
						$this->getChild($row['am_id'], $ary);
					}
				}
				
			}catch(MyException $e)
			{
				throw $MyException;
			}
		}
		
		public function adminList($ary = array())
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
			
			if(is_array($ary['order']) && !empty($ary['order']))
			{
				$order =" ORDER BY ";
				foreach($ary['order'] AS $key =>$value)
				{
					$order.=sprintf( '%s %s', $key, $value);
				}
			}
			
			$sql =" SELECT 
						ad.*,
						ar.*
					FROM 
						admin AS ad LEFT JOIN  admin_role AS ar ON ad.ad_role = ar.ar_id";
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
		
		public function getAdminRoleList()
		{
			$sql ="SELECT * FROM admin_role";
			$query = $this->db->query($sql);
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
			return 	$rows  ;
		}
		
		public function accountIsExist($account)
		{
			$sql = "SELECT COUNT(*) as total FROM admin WHERE 	ad_account =?";
			$bind[] = $account;
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
			return 	$row['total'] ;
		}
		
		public function test()
		{
			$this->db->trans_begin();
			$sql ="INSERT INTO admin (ad_account,ad_passwd,ad_role,	ad_add_datetime)
					VALUES(?,md5(12345678),'2',NOW())";
			$bind = array(
				time()
			);
			$this->db->query($sql, $bind);
			
			$sql ="INSERT INTO admin (ad_account,ad_passwd,ad_role,	ad_add_datetime)
					VALUES(?,md5(12345678),'2',NOW())";
			$bind = array(
				'aa'
			);
			$this->db->query($sql, $bind);
			if ($this->db->trans_status() === FALSE)
			{
					$this->db->trans_rollback();
			}
			else
			{
					$this->db->trans_commit();
			}
		}
		
		public function insert($ary)
		{
			try {
				
				$this->db->trans_begin();

				$sql =" INSERT INTO admin (ad_account,ad_passwd,ad_role,	ad_add_datetime)
						VALUES(?,md5(?),?,NOW())";
				$bind = array(
					$ary['ad_account'],
					$ary['ad_passwd'],
					$ary['ad_role'],
				);

				
				$this->db->query($sql ,$bind); 
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
				
				$sql ="SELECT * FROM admin WHERE ad_account=?";
				$bind = array(
					$ary['ad_account'],
				);
				$query = $this->db->query($sql ,$bind); 
				$row = $query->row_array();
				$error = $this->db->error();
				if($error['message'] !="" || empty($row))
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
				$query->free_result();

				$ad_id = $row['ad_id'];
				
				$default = array(
					'2' =>array(1,11,30),
					'3' =>array(1,30),
				);
				if(
					$ary['ad_role'] !="1" &&
					$ad_id !=0 &&
					$affected_rows >0 &&
					!empty($default[$ary['ad_role']])
				)
				{
					
					$list = $this->getMenuList($default[$ary['ad_role']]);
					foreach($list as $value)
					{
						$sql ="INSERT INTO admin_menu_control (amc_ad_id, amc_am_id, amc_add_datetime)
						VALUES( ?, ?, NOW() )";
						$bind = array(
							$ad_id,
							$value['am_id'],
						);
						
						$this->db->query($sql, $bind); 
						
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
						$affected_rows += $this->db->affected_rows();
					}
					
					
				}else
				{
						$MyException = new MyException();
						$array = array(
							'message' 	=>'新增权限失败' ,
							'type' 		=>'db' ,
							'status'	=>'001'
						);
						
						$MyException->setParams($array);
						throw $MyException;
				}
				$this->db->trans_commit();
				return $affected_rows;
			}catch(MyException $e)
			{
				$this->db->trans_rollback();
				throw $MyException;
			}
		}
		
		public function getNodesRow($am_id)
		{
			
			$sql = "SELECT
						am_type AS type,
						am_title AS title,
						am_router AS router,
						am_id AS id
					FROM admin_menu WHERE am_id =?";
			$bind = array(
				$am_id
			);
			$query = $this->db->query($sql, $bind);
			$row = $query->row_array();
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
			return 	$row  ;
		}
		
		public function checkPermissions($ary = array())
		{
			$sql ="	SELECT 
						COUNT(*) 
					FROM admin_menu_control WHERE amc_ap_id = ? AND amc_am_id = ?";
			$bind = array(
				$ary['ap_id'],
				$ary['am_id'],
			);
			$query = $this->db->query($sql, $bind);
			$row = $query->row_array();
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
			return 	$row  ;
		}
		
		public function getActionlist($am_id, $am_type="")
		{
			
			$sql = "SELECT
						am_type AS type,
						am_title AS title,
						am_router AS router,
						am_id AS id,
						am_func AS func
					FROM admin_menu WHERE am_parent_id =?";
					
			$bind = array(
				$am_id
			);
			
			if($am_type !="")
			{
				$am_type = " AND am_type =?";
				$bind[] = $am_type;
			}
			$sql .=$am_type;
			
			$query = $this->db->query($sql, $bind);
			$rows = $query->result_array();
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
			return 	$rows  ;
		}
		
		
		public function getMenu()
		{
			$sql ="	SELECT 
						am_id AS id ,
						am_parent_id AS parent_id, 
						am_router AS router ,
						am_title AS title ,
						am_type AS type
					FROM admin_menu 
					WHERE am_type ='menu' AND am_show ='1'
					ORDER BY parent_id ASC , am_id ASC";
			$query = $this->db->query($sql, $bind);
			$rows = $query->result_array();
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
			return 	$rows  ;
		}
		
		public function getUesrByAccount($account)
		{
			$sql = "SELECT  * FROM admin WHERE ad_account = ?";
			$bind = array(
				$account
			);
			$query = $this->db->query($sql, $bind);
			$row = $query->row_array();
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
			return 	$row ;
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
	}
?>