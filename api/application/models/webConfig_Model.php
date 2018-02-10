<?php
	class WebConfig_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();
			$this->db->query("SET time_zone='+8:00'");
		}
		
		public function getBanner()
		{
			try 
			{
				$sql="SELECT * FROM big_banner  ORDER BY bb_id ASC";
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
		
		public function getList($ary)
		{
			try 
			{
				$in_str = join("','", $ary);
				$sql="SELECT * FROM web_config WHERE wc_id IN('".$in_str."') ORDER BY wc_id ASC";
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