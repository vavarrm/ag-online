<?php
	class PhoneCallBack_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->db->query("SET time_zone='+8:00'");
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
		
		
		
		public function add($ary = array())
		{
			try
			{
				
				$sql =" SELECT
							timestampdiff(second,NOW(),pcb_add_datetime) AS diff
						FROM 
							phone_call_back WHERE pcb_ip=? 
						ORDER BY pcb_add_datetime DESC LIMIT 1";
				$bind = array($this->getIP());
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
				if($row['diff']<=3 && !empty($row))
				{
					$MyException = new MyException();
					$array = array(
						'message' 	=>'请勿重覆发送' ,
						'type' 		=>'db' ,
						'status'	=>'999'
					);
					
					$MyException->setParams($array);
					throw $MyException;
				}
				
				
				$sql ="INSERT INTO phone_call_back(	pcb_phone, pcb_message, pcb_add_datetime,pcb_ip) VALUES(?,?,NOW(),?)";
				$bind = array(
					$ary['pcb_phone'],
					$ary['pcb_message'],
					$this->getIP()
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
				return $affected_rows;
			}catch(MyException $e)
			{
				throw $MyException;
			}
		}
		
		public function getBankList()
		{
			$sql="SELECT * FROM bank_info  ORDER BY bi_id ASC";
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
		
	}
?>