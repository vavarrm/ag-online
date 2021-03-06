<?php
	class Bank_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->db->query("SET time_zone='+8:00'");
		}
		
		public function doDeleteReceivingBankCard($ary)
		{
				try {
				$sql="DELETE FROM receiving_bank_card WHERE rbc_id=?";
				$bind = array(
					$ary['rbc_id'],
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
					throw  $MyException;
				}
				return $affected_rows;
			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function addReceivingBankCard($ary)
		{
			try {
				$sql="INSERT INTO receiving_bank_card (rbc_bank_name, rbc_bank_account, rbc_bank_user_name,	rbc_add_datetime, rbc_branch_name) VALUES(?,?,?,NOW(),?)";
				$bind = array(
					$ary['rbc_bank_name'],
					$ary['rbc_bank_account'],
					$ary['rbc_bank_user_name'],
					$ary['rbc_branch_name'],
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
					throw  $MyException;
				}
				return $affected_rows;
			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function editReceivingBankCard($ary)
		{
			try {
				$sql="	UPDATE 
							receiving_bank_card 
						SET 	
							rbc_bank_name  = ?  ,
							rbc_bank_account  = ?  ,
							rbc_bank_user_name	  = ? , 
							rbc_branch_name	  = ?  
						WHERE rbc_id =?";
				$bind = array(
					$ary['rbc_bank_name'],
					$ary['rbc_bank_account'],
					$ary['rbc_bank_user_name'],
					$ary['rbc_branch_name'],
					$ary['rbc_id'],
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
					throw  $MyException;
				}
				$affected_rows= $this->db->affected_rows();
				if($affected_rows >0)
				{
					$sql="UPDATE user SET u_receiving_bank_card_alert =0";
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
						throw  $MyException;
					}
				}
				return $affected_rows;
			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function getReceivingBankCardByID($rbc_id)
		{
			try {
				$sql="SELECT * FROM receiving_bank_card WHERE rbc_id =?";
				$bind = array(
					$rbc_id
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
					throw  $MyException;
				}
				$row = $query->row_array();				
				$query->free_result();
				return $row;
			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function receivingBankCardList($ary)
		{
			try {
				$where =" WHERE 1=1 ";
				$order="";
				$gitignore = array(
					'limit',
					'p',
					'order'
				);
				$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);
				if(is_array($ary))
				{
					foreach($ary as $key =>$row)
					{
					
						if(in_array($key, $gitignore) || $row['value']==='' )	
						{
							continue;
						}

						
						if($row['logic'] =="")
						{
							$logic =" AND "; 
						}else{
							$logic = $row['logic'];
						}
						
						if($key =="start_time" || $key=="end_time"  )
						{
							$where .=sprintf(" %s DATE_FORMAT(`ub_add_datetime`, '%s') %s ?",$logic  ,'%Y-%m-%d', $row['operator']);					
							$bind[] = $row['value'];
						}else if($row['operator'] =='in')
						{
							$where .=sprintf(" AND %s IN (%s) ", $logic, $key, $row['value']);
						}
						else{
							$where .=sprintf(" %s %s %s ?", $logic, $key, $row['operator']);					
							$bind[] = $row['value'];
						}
					}
				}
				
				if(is_array($ary['order']) && !empty($ary['order']))
				{
					$order =" ORDER BY ";
					foreach($ary['order'] AS $key =>$value)
					{
						$order_ary[]=sprintf( '%s %s ', $key, $value);
					}
					$order.=join(',',$order_ary);
				}
				
				$sql = "SELECT 
							* 
						FROM  
							receiving_bank_card
						";
				$search_sql = $sql.$where.$order.$limit ;
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
					throw  $MyException;
				}
				$rows = $query->result_array();
				
				
				$total_sql = sprintf("SELECT COUNT(*) AS total FROM(%s) AS t",$sql.$where) ;
				$query = $this->db->query($total_sql, $bind);
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
					throw  $MyException;
				}
				return $output;
			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function getList($ary = array())
		{
			$where =" WHERE 1=1 ";
			$order="";
			$gitignore = array(
				'limit',
				'p',
				'order'
			);
			$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);
			if(is_array($ary))
			{
				foreach($ary as $key =>$row)
				{
				
					if(in_array($key, $gitignore) || $row['value']==='' )	
					{
						continue;
					}

					
					if($row['logic'] =="")
					{
						$logic =" AND "; 
					}else{
						$logic = $row['logic'];
					}
					
					if($key =="start_time" || $key=="end_time"  )
					{
						$where .=sprintf(" %s DATE_FORMAT(`ub_add_datetime`, '%s') %s ?",$logic  ,'%Y-%m-%d', $row['operator']);					
						$bind[] = $row['value'];
					}else if($row['operator'] =='in')
					{
						$where .=sprintf(" AND %s IN (%s) ", $logic, $key, $row['value']);
					}
					else{
						$where .=sprintf(" %s %s %s ?", $logic, $key, $row['operator']);					
						$bind[] = $row['value'];
					}
				}
			}
			
			if(is_array($ary['order']) && !empty($ary['order']))
			{
				$order =" ORDER BY ";
				foreach($ary['order'] AS $key =>$value)
				{
					$order_ary[]=sprintf( '%s %s ', $key, $value);
				}
				$order.=join(',',$order_ary);
			}
			
			$sql = "SELECT 
						* 
					FROM  
						user_bank_info AS ubi 
							INNER JOIN user AS u ON u.u_id = ubi.ub_u_id
							INNER JOIN bank_info AS bi ON bi.bi_id = ubi.ub_bank_id
					";
			$search_sql = $sql.$where.$order.$limit ;
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
				throw  $MyException;
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
				throw  $MyException;
			}
			return $output;
		}
		
		public function addBankBlack($ary)
		{
			try {
				
				
				$sql ="INSERT INTO bank_black_list(bbl_account, bbl_ad_id, 	bbl_add_datetime)
					  VALUES(?,?,NOW())"; 
				$bind =array(
					$ary['account'],
					$ary['ad_id'],
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
					throw  $MyException;
				}
				return $this->db->affected_rows();
			}
			catch (Exception $e) {
				throw $e;
			}
		}
		
		public function getBlackList($ary = array())
		{
			try {
				$where =" WHERE 1=1 ";
				$order="";
				$gitignore = array(
					'limit',
					'p',
					'order'
				);
				$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);
				if(is_array($ary))
				{
					foreach($ary as $key =>$row)
					{
					
						if(in_array($key, $gitignore) || $row['value']==='' )	
						{
							continue;
						}

						
						if($row['logic'] =="")
						{
							$logic =" AND "; 
						}else{
							$logic = $row['logic'];
						}
						
						if($key =="start_time" || $key=="end_time"  )
						{
							$where .=sprintf(" %s DATE_FORMAT(`ub_add_datetime`, '%s') %s ?",$logic  ,'%Y-%m-%d', $row['operator']);					
							$bind[] = $row['value'];
						}else if($row['operator'] =='in')
						{
							$where .=sprintf(" AND %s IN (%s) ", $logic, $key, $row['value']);
						}
						else{
							$where .=sprintf(" %s %s %s ?", $logic, $key, $row['operator']);					
							$bind[] = $row['value'];
						}
					}
				}
				
				if(is_array($ary['order']) && !empty($ary['order']))
				{
					$order =" ORDER BY ";
					foreach($ary['order'] AS $key =>$value)
					{
						$order_ary[]=sprintf( '%s %s ', $key, $value);
					}
					$order.=join(',',$order_ary);
				}
				
				$sql = "SELECT 
							* 
						FROM  
							bank_black_list AS  bbl LEFT JOIN admin AS ad ON bbl.bbl_ad_id = ad.ad_id
						";
				$search_sql = $sql.$where.$order.$limit ;
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
					throw  $MyException;
				}
				$rows = $query->result_array();
				
				
				$total_sql = sprintf("SELECT COUNT(*) AS total FROM(%s) AS t",$sql.$where) ;
				$query = $this->db->query($total_sql, $bind);
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
					throw  $MyException;
				}
				return $output;
			}
			catch (Exception $e) {
				throw $e;
			}
		}
	}
?>