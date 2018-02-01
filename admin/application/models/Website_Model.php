<?php
	class Website_Model extends CI_Model 
	{
		public $CI ;
		function __construct()
		{
			
			parent::__construct();
			$this->CI =&get_instance();
			$this->load->database();
		}
		
		public function changePhoneCallBackStatus($ary =array())
		{
			try
			{
				$sql ="	UPDATE   phone_call_back 	
						SET 
							pcb_status= ?  ,
							pcb_remarks =?
						WHERE pcb_id =?";
				$bind = array(
					$ary['pcb_status'],
					$ary['pcb_remarks'],
					$ary['pcb_id'],
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
				
				$affected_rows = $this->db->affected_rows();
				
				
				if($affected_rows ==0)
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
				return 	$affected_rows ;
			}	
			catch(MyException $e)
			{
				throw $MyException;
				return 0;
			}
		}
		
		public function getPhoneCallBackList($ary=array())
		{
			$where .=" WHERE 1 = 1";
			$gitignore = array(
				'limit',
				'p',
				'order'
			);
			$limit = sprintf(" LIMIT %d, %d",abs($ary['p']-1)*$ary['limit'],$ary['limit']);

			if(is_array($ary))
			{
				foreach($ary as $key => $value)
				{
					if(in_array($key, $gitignore) ||  $value['value'] ==="" )	
					{
						continue;
					}
					if($key =="start_time" || $key=="end_time"  )
					{
						if($value['value']!='')
						{
							$where .=sprintf(" AND DATE_FORMAT(`pcb_add_datetime`, '%s') %s ?", '%Y-%m-%d', $value['operator']);					
							$bind[] = $value['value'];
						}
					}else
					{
						$where .=sprintf(" AND %s %s ?", $key, $value['operator']);					
						$bind[] = $value['value'];
					}
				}
			}
			
			if(is_array($ary['order']) && count($ary['order']) >0)
			{
				$order =" ORDER BY ";
				foreach($ary['order'] AS $key =>$value)
				{
					$order.=sprintf( ' %s %s ', $key, $value);
				}
			}
			
			$sql =" SELECT 
						*,
						CASE pcb_status 
							WHEN 'processing' THEN '处理中'
							WHEN 'close' THEN '以结案'
						END 
						AS 	pcb_status_str
					FROM 
						phone_call_back";
			$search_sql = $sql.$where.$order.$limit ;
			$query = $this->db->query($search_sql, $bind);
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
				throw $MyException;
			}
			return 	$output  ;
		}
		
		public function setValue($ary)
		{
			try
			{
				$affected_rows = 0;
				if(!is_array($ary) || count($ary)==0)
				{
					$array = array(
						'message' 	=>'参数传递错误' ,
						'type' 		=>'api' ,
						'status'	=>'002'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$this->db->where('wc_id', $ary['wc_id']);
				$this->db->update('web_config', array('wc_value'=> $ary['wc_value']));
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
				return $affected_rows;
			}catch(MyException $e)
			{
				throw $MyException;
			}

		}
		
		
		public function getListByGroup($group)
		{
			$output= array('list' =>array());
			try
			{
				
				$sql ="SELECT * FROM web_config WHERE 	wc_group =?";
				$query = $this->db->query($sql, array($group));
				$rows = $query->result_array();

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
				
				$query->free_result();
				$output['list'] = $rows;
				
			}catch(MyException $e)
			{
				$this->db->trans_rollback();
				throw $MyException;
				return false;
			}
			return $output;
		}
		
		public function getListByKey($ary = array())
		{
			$output= array('list' =>array());
			try
			{
				if(!is_array($ary) || count($ary)==0)
				{
					$array = array(
						'message' 	=>'参数传递错误' ,
						'type' 		=>'api' ,
						'status'	=>'002'
					);
					$MyException = new MyException();
					$MyException->setParams($array);
					throw $MyException;
				}
				
				$in_ary= array();
				
				foreach($ary  as  $key =>$value)
				{
					$in_ary[] = $value ;
				}
				
				$in_str = join("','", $in_ary);
				
				$sql =sprintf("SELECT * FROM web_config WHERE wc_key IN ('%s')", $in_str);
				$query = $this->db->query($sql);
				$rows = $query->result_array();

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
				
				$query->free_result();
				$output['list'] = $rows;
				
			}catch(MyException $e)
			{
				$this->db->trans_rollback();
				throw $MyException;
				return false;
			}
			return $output;
		}
		
		public function updFooter($ary)
		{
			$affected_rows = 0;
			$this->db->trans_start();
			try
			{
				$sql = "UPDATE web_config SET wc_value =? WHERE wc_key ='wechat_account'";
				
				$bind = array(
					$ary['wechat_account']
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
				
				$affected_rows += $this->db->affected_rows();
				
				if ($_FILES["wechat_qr_image"]["error"] == 0)
				{
					$filename ='wechat_qr_image' ;
					$config['file_name'] = md5($filename);
					$config['upload_path'] = FCPATH.'../images/webconfig/';
					$config['allowed_types'] = 'gif|jpg|png|jpeg';
					$config['max_size']	= '2048';
					$config['max_width']  = '200';
					$config['max_height']  = '200';
					$config['overwrite']  = true;
					$this->CI->load->library('upload',$config);
					if(!$this->CI->upload->do_upload('wechat_qr_image'))
					{
						$array = array(
							'message' 	=>'上传失败',
							'type' 		=>'api' ,
							'status'	=>'002'
						);
						$MyException = new MyException();
						$MyException->setParams($array);
						throw $MyException;
					}
					$image= $this->CI->upload->data();
				
					$sql = "UPDATE web_config SET wc_value =? WHERE wc_key ='wechat_qr_image'";
			
					$bind = array(
						$image['file_name']
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
					$affected_rows += 1;
				}
			
				
				$sql = "UPDATE web_config SET wc_value =? WHERE wc_key ='qq_account'";
				$bind = array(
					$ary['qq_account']
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
				
				$affected_rows += $this->db->affected_rows();
				
				if ($_FILES["qq_qr_image"]["error"] == 0)
				{
					$filename ='qq_qr_image' ;
					$config['file_name'] = md5($filename);
					$config['upload_path'] = FCPATH.'../images/webconfig/';
					$config['allowed_types'] = 'gif|jpg|png|jpeg';
					$config['max_size']	= '2048';
					$config['max_width']  = '200';
					$config['max_height']  = '200';
					$config['overwrite']  = true;
					$this->CI->load->library('upload',$config);
					if(!$this->CI->upload->do_upload('qq_qr_image'))
					{
						$array = array(
							'message' 	=>'上传失败',
							'type' 		=>'api' ,
							'status'	=>'002'
						);
						$MyException = new MyException();
						$MyException->setParams($array);
						throw $MyException;
					}

					$image= $this->CI->upload->data();
				
					$sql = "UPDATE web_config SET wc_value =? WHERE wc_key ='qq_qr_image'";
			
					$bind = array(
						$image['file_name']
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
					$affected_rows += 1;
				}
				$this->db->trans_complete();
				return $affected_rows ;
			}
			catch(MyException $e)
			{
				$this->db->trans_rollback();
				throw $MyException;
			}
		}
	}
?>