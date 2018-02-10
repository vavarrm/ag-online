<?php
	class Discount_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->db->query("SET time_zone='+8:00'");
		}
		
		public function setDiscount($ary)
		{
			try
			{
				$sql ="	SELECT 
							*
						FROM  discount
						WHERE 
							d_is_open ='1' AND 
							(
								d_always_open ='1' OR
								DATE_FORMAT(NOW(),'%Y%m%d')  >= DATE_FORMAT(d_start_time,'%Y%m%d') AND 
								DATE_FORMAT(NOW(),'%Y%m%d')  <= DATE_FORMAT(d_end_time,'%Y%m%d')  
							)
							AND d_id =?
						ORDER BY d_id";
				$bind = array(
					$ary['d_id']
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
						'message' 	=>'无法取得优汇' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				if(!method_exists ( $this , $row['d_func']))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'未设定处理方法' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				$ary['d_amount'] = $row['d_amount'];
				$affected_rows =$this->$row['d_func']($ary);
				return $affected_rows;
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
		public function firstReserve($ary)
		{
			
			try
			{
				$sql ="SELECT * FROM user_account WHERE ua_type = 2 AND ua_u_id =?";
				
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
				
				if(!empty($row))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'未达成优汇条件' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$sql = "SELECT *  FROM  user_account WHERE ua_u_id =? AND ua_from_d_id =?";
				$bind = array(
					$ary['u_id'],
					$ary['d_id']
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
				
				if(!empty($row))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'已领取过此优惠' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				
				$sql = "INSERT INTO user_account(ua_value, ua_type, ua_add_datetime, ua_u_id, ua_status, ua_from_d_id)
						VALUES(?, 6, NOW(),?, 'received' , ?)";
				$bind = array(
					$ary['d_amount'] ,
					$ary['u_id'],
					$ary['d_id']
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
		
		public function getDiscountList()
		{
			try
			{
				$sql ="	SELECT 
							*
						FROM  discount
						WHERE 
							d_is_open ='1' AND 
							(
								d_always_open ='1' OR
								DATE_FORMAT(NOW(),'%Y%m%d')  >= DATE_FORMAT(d_start_time,'%Y%m%d') AND 
								DATE_FORMAT(NOW(),'%Y%m%d')  <= DATE_FORMAT(d_end_time,'%Y%m%d')  
							)
						ORDER BY d_id";
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
				
			}catch(MyException $e)
			{
				throw $e;
			}
		}
		
	}
?>