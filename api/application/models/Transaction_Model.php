<?php
	class Transaction_Model extends CI_Model 
	{
		public $p = 1;
		public $limit = 5;
		function __construct()
		{
			parent::__construct();
			$this->link = $this->load->database();
		}
		
		public function getList($ary)
		{
			$sql ="
			SELECT
				T.u_id,
				T.u_account,
				T.bet_points,
				T.available_bet,
				T.win_loss,
				T.groupindex,
				T.tree,
				bet_time,
				cal_time
			FROM
				(
				SELECT
					U.u_id,
					U.u_account,
					U.tree,
					IFNULL(TR.bet_points,0) AS bet_points,
					IFNULL(TR.available_bet,0) AS available_bet,
					IFNULL(TR.win_loss,0) AS win_loss,
					-- count(1) AS bet_count,
					SUBSTRING_INDEX(U.tree,',',".$ary['level'].") AS groupindex,
					U.root_u_account,
					TR.bet_time,
					TR.cal_time
				FROM
					`user` AS U
					INNER   JOIN `dg_transaction` AS TR ON TR.user_name = U.u_account
					WHERE
					  U.root_u_account =?
					  -- AND U.tree LIKE ?
					  -- AND  U.tree !='0,1,2,0'
					-- GROUP BY U.u_id
				) T 
			    -- GROUP BY T.groupindex
				-- ORDER BY T.u_id
			";
			$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$this->limit,$this->limit);
			if(is_array($ary['order']))
			{
				$order =" ORDER BY ";
				foreach($ary['order'] AS $key =>$value)
				{
					$order.=sprintf( '%s %s', $key, $value);
				}
			}
			
			$where_str=" WHERE 1=1 ";
			$tree = substr($ary['tree'], 1, -1);
			$tree ="%".$tree."%" ;
			$bind = [
				$ary['rootUAccount'],
				$tree
			];
			if(!empty($ary['where']))
			{
				foreach($ary['where'] as $key=> $value)
				{
					$where[] = str_replace("?", mysqli_real_escape_string($this->db->conn_id ,$value),$key);
				}
				$where_str = " WHERE ". join(" AND ", $where);
				
			}
			
			// $group = "GROUP BY T.groupindex";
			$search_sql = $sql.$where_str.$group.$limit ;
			// echo $search_sql;
			// var_dump($bind);
			// $search_sql = $sql.$where.$order.$limit ;
			// $sql =$select." FROM ".$ary['table'].$ary['from'].$where_str ." ORDER BY t_id DESC ".$limit;

			$query = $this->db->query($search_sql,$bind);
			$data['list'] = $query->result_array();
			$totalSql ="SELECT COUNT(1) AS total FROM (".$search_sql.") AS T" ;
			$query = $this->db->query($totalSql,$bind);
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
				'win_loss',
				'payout',
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
					$winOrLoss = mysqli_real_escape_string($this->db->conn_id,$row['winOrLoss']);
					$betPoints = mysqli_real_escape_string($this->db->conn_id,$row['betPoints']);
					$payout = $winOrLoss;
					$winOrLoss = $winOrLoss -  $betPoints ;
					$temp =[
						"'".mysqli_real_escape_string($this->db->conn_id,$row['id'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['tableId'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['shoeId'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['playId'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['gameType'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['betTime'])."'",
						"'".mysqli_real_escape_string($this->db->conn_id,$row['calTime'])."'",
						"'".$winOrLoss."'",
						"'".$payout."'",
						"'".$betPoints."'",
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
		
		public function getMarkList()
		{
			$sql = "SELECT GROUP_CONCAT(t_id) AS t_id_list FROM dg_transaction WHERE return_mark=0  ORDER BY t_id ASC LIMIT 25";
			$query = $this->db->query($sql);
			$row =   $query->row_array();
			return $row['t_id_list'];
		}
		
		public function updateMark($t_id)
		{
			$sql ="UPDATE dg_transaction SET return_mark=1 WHERE t_id IN(%s)";
			$sql =sprintf($sql,$t_id);
			$query = $this->db->query($sql);
			return mysqli_affected_rows($this->db->conn_id);
		}
	}
?>