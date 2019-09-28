<?php
	class Transaction_Model extends CI_Model 
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
				// var_dump($where);
				$where_str = " WHERE ". join(" AND ", $where);
				
			}
			
			$sql =$select." FROM ".$ary['table'].$ary['from'].$where_str ." ORDER BY t_id DESC ".$limit;
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
		
		public function save($data)
		{
			$col = [
				't_id',
				'table_id',
				'shoe_id',
				'play_id',
				'game_type',
				'bet_time',
				'cal_time',
				'win_Loss',
				'bet_points',
				'available_bet',
				'user_name',
				'result',
				'bet_detail',
				'balance_before', 
				'is_revocation',
				'game_id',
			];
			$sql ="INSERT IGNORE INTO `dg_transaction`"."(".join(",",$col).") VALUES ";
			if(!empty($data))
			{
				foreach($data as $row)
				{
					$temp =[
						"'".mysqli_real_escape_string($this->db->conn_id,$row['id'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['tableId'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['shoeId'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['playId'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['gameType'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['betTime'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['calTime'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['winOrLoss'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['betPoints'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['availableBet'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['userName'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['result'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['betDetail'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['balanceBefore'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['isRevocation'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['gameId'])."'"
					];
					
					// var_dump($temp);
					
					$temp = "(".join(",",$temp).")";
					$insert[] = $temp ;
				}
				
				$insert = join(',', $insert);
				
				foreach($col as $list)
				{
					$onDuplacateKey[] = " {$list} = VALUES({$list}) ";
				}
				$onDuplacateKey = join(',', $onDuplacateKey);
				
				$sql = $sql.$insert." ON DUPLICATE KEY UPDATE ".$onDuplacateKey ;
				$query = $this->db->query($sql);
			}
			
			$output = [
				'fetch_count' =>count($data),
				'error'=>mysqli_error($this->db),
			];
			return $output;
		}
		
	}
?>