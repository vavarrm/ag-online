<?php
	class Transfer_Model extends CI_Model 
	{
		public $page = 1;
		public $limit = 5;
		function __construct()
		{
			parent::__construct();
			$this->link = $this->load->database();
		}
		
		public function getList($ary)
		{
			// var_dump($ary);
			$sql ="";
			if(isset($ary['select']))
			{
				$select =" SELECT ".join(',',$ary['select'])." ";
			}else
			{
				$select =" SELECT * ";
			}
			$nowpage = ($ary['page'] - 1)*$this->limit; 
			if($nowpage <0)
			{
				$nowpage  = 0;
			}
			$limit = "LIMIT ".$nowpage." , ".$this->limit;
			
			$where_str="";
			if(!empty($ary['where']))
			{
				foreach($ary['where'] as $key=> $value)
				{
					$where[] = str_replace("?", mysqli_real_escape_string($this->db->conn_id ,$value),$key);
				}
				$where_str = " WHERE ". join(" AND ", $where);
				
			}
			
			$sql =$select." FROM ".$ary['table'].$ary['from'].$where_str ." ORDER BY id DESC ".$limit;
			// echo $sql;
			$query = $this->db->query($sql);
			$data['list'] = $query->result_array();
			$totalSql ="SELECT COUNT(1) AS total FROM ".$ary['table'].$where_str ;
			$query = $this->db->query($totalSql);
			$count = $query->row_array();
			$data['page_info'] =[
				'totalCount' =>$count['total'],
				'totalPage' =>ceil($count['total']/$this->limit),
			];
			return $data;
		}
		
		public function insert($ary)
		{
			$sql="	INSERT INTO  user_transfer_account 
					(reference_no, add_datetime, action, amount, u_id, u_account,u_balance,third_balance)
					VALUES	(?,NOW(),?,?,?,?,?,?)"	;						
			if($ary['amount']<0)
			{
				$action='IN';
			}else
			{
				$action='OUT';
			}
			$bind = array(
				$ary['reference_no'],
				$action,
				abs($ary['amount']),
				$ary['user']['u_id'],
				$ary['user']['u_account'],
				$ary['u_balance'],
				$ary['third_balance'],
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
		public function getTransferreferenceNo()
		{
			return time().rand(1000,9999);
		}		
	}
?>