<?php
	 class Pay_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->db->query("SET time_zone='+8:00'");
			$this->db->query("SET sql_mode = ''");
		}
		
		public function  getCategory()
		{
			$sql="SELECT
					category_name,
					category_code
					FROM  pay_method 
					GROUP BY category_code 
				";
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
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function  getCodeKeyBycategoryCode()
		{
			$sql="SELECT
						category_code,
						provide_code,
						code,
						name,
						type,
						min,
						max
					FROM  pay_method 
				";
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
			$rows =  $query->result_array();
			$output = [];
			foreach($rows as $row)
			{
				$output[$row['category_code']][] = $row;
			}
			$query->free_result();
			return $output;
		}
		
		public function add($ary)
		{
			$sql="	INSERT INTO pay_recharge
						(
							order_number
							,verification_code
							,provide_code
							,method_code
							,amount
							,user_account
							,create_at
							,category_code
						)
					VALUES(?,?,?,?,?,?,NOW(),?)   
				";
			$bind = [
				$ary['orderNumber'],
				$ary['verificationCode'],
				$ary['provideCode'],
				$ary['method'],
				$ary['amount'],
				$ary['userAccount'],
				$ary['categoryCode'],
			];
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
		
		public function getList($ary = array())
		{
			$where .=" WHERE 1 = 1";
			$gitignore = array(
				'limit',
				'p',
				'order'
			);
			$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);
			if(is_array($ary['where']))
			{
				foreach($ary['where'] as $key => $value)
				{
					$where.=sprintf( " AND %s %s  ?", $key,  $value['operator']);
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
						PR.id
						,PR.create_at
						,PR.settle_at
						,PR.amount
						,
						CASE 
							WHEN PR.status ='pending'  THEN '待处理'
							WHEN PR.status ='timeout'  THEN '超时'
							WHEN PR.status ='cancel'  THEN '取消'
							WHEN PR.status ='done'  THEN '完成'
							ELSE ''	
						END AS status
						,PR.user_account
						,PR.provide_code
						,PM.category_name
						,PM.name
						,PR.order_number
					FROM 
						pay_recharge AS PR LEFT JOIN pay_method AS PM
						ON 
							PR.method_code = PM.code
							AND PR.provide_code = PM.provide_code
							AND PR.provide_code = PM.provide_code
							AND PR.category_code = PM.category_code
							";
			$search_sql = $sql.$where.$order.$limit ;
			$query = $this->db->query($search_sql, $bind);
			$rows = $query->result_array();
			
			$total_sql = sprintf("SELECT COUNT(*) AS total FROM(%s) AS t",$sql.$where) ;
			$query = $this->db->query($total_sql, $bind);
			$row = $query->row_array();
			
			$query->free_result();
			$output['list'] = $rows;
			$output['page_info']  = array(
				'total'	=>$row['total'],
				'totalPage'	=>ceil($row['total']/$ary['limit']),
				'p' =>$ary['p']
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
		
		public function setOrderNumberVerified($ary)
		{
			$sql =" UPDATE pay_recharge 
					SET  
						arrival_amount = ?
						,status='verified'
					WHERE order_number =? AND status='pending'";
			$bind=[
				$ary['arrivalAmount'],
				$ary['orderNumber'],
			];
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
			return 	$this->db->affected_rows() ;
		}
		
		public function getVerifiedList($nextid)
		{
			$sql = "SELECT 
						id,
						user_account, 
						arrival_amount ,
						order_number
					FROM pay_recharge 
					WHERE status='verified'
					AND id > ?
					ORDER BY id ASC LIMIT 5";
			$bind = [
				$nextid,
			];
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
			
			return $query->result_array();
		}
		
		public function  setTimeout()
		{
			$this->db->trans_begin();
			
			$sql = "SELECT id FROM pay_recharge WHERE status ='pending' AND TIMESTAMPDIFF(hour,create_at,NOW()) >= 6  FOR UPDATE";
			$bind  = [
				$id
			];
			$query = $this->db->query($sql, $bind);
			
			if($error['message'] !="")
			{
				$this->db->trans_rollback();
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'type' 		=>'db' ,
					'status'	=>'001'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			
			$sql = "UPDATE 
						pay_recharge SET status = 'timeout' , 
						settle_at=NOW() 
						WHERE status ='pending' AND TIMESTAMPDIFF(hour,create_at,NOW()) >= 6";
			$bind  = [
				$id
			];
			$query = $this->db->query($sql, $bind);
			if($error['message'] !="")
			{
				$this->db->trans_rollback();
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
			return $affected_rows;
		}
		
		public function  updateUserBalance($account, $amount,$id)
		{
			$this->db->trans_begin();
			
			$sql = "SELECT id FROM pay_recharge WHERE id = ? FOR UPDATE";
			$bind  = [
				$id
			];
			$query = $this->db->query($sql, $bind);
			
			if($error['message'] !="")
			{
				$this->db->trans_rollback();
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'type' 		=>'db' ,
					'status'	=>'001'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$sql = "SELECT u_id FROM user WHERE u_account = ? FOR UPDATE";
			$bind  = [
				$account
			];
			$query = $this->db->query($sql, $bind);
			
			if($error['message'] !="")
			{
				$this->db->trans_rollback();
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'type' 		=>'db' ,
					'status'	=>'001'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$sql = "UPDATE user SET u_balance = (u_balance + ?) WHERE u_account = ?";
			$bind  = [
				$amount,
				$account
			];
			// echo $sql;
			// $query = $this->db->query($sql, $bind);
			if($error['message'] !="")
			{
				$this->db->trans_rollback();
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'type' 		=>'db' ,
					'status'	=>'001'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			$affected_rows =  	$this->db->affected_rows() ;
			
			if($affected_rows<=0)
			{
				$this->db->trans_rollback();
				$MyException = new MyException();
				$array = array(
					'message' 	=>$error['message'] ,
					'type' 		=>'db' ,
					'status'	=>'001'
				);
				
				$MyException->setParams($array);
				throw $MyException;
			}
			
			$sql = "UPDATE pay_recharge SET status = 'settle' , settle_at=NOW() WHERE id = ?";
			$bind  = [
				$id
			];
			$query = $this->db->query($sql, $bind);
			if($error['message'] !="")
			{
				$this->db->trans_rollback();
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
			return $affected_rows;
		}
	}
?>