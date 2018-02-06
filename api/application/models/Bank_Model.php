<?php
	class Bank_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
		}
		
		public function getBankList()
		{
			try 
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
			}catch(MyException $e)
			{
				throw $e;
				return false;
			}
		}
		
		public function bankCardIsBlack($ary)
		{
			try 
			{
				$sql="SELECT COUNT(*) AS total FROM bank_black_list WHERE 	bbl_account=? ";
				$bind = array(
					'bbl_account' => $ary['account']
				);
				$query = $this->db->query($sql, $bind );

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
		
	}
?>