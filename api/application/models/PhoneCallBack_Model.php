<?php
	class PhoneCallBack_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
		
		public function add($ary = array())
		{
			try
			{
				$sql ="INSERT INTO phone_call_back(	pcb_phone, pcb_message, pcb_add_datetime) VALUES(?,?,NOW())";
				$bind = array(
					$ary['pcb_phone'],
					$ary['pcb_message']
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