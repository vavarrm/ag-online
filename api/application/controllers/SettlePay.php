<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class SettlePay extends CI_Controller 
{
	public function __construct() 
	{
		parent::__construct();	
		$this->load->model('Pay_Model', 'thirdpay');
	}
	
	public function run()
	{
		$nextid = 0 ;
		while (true)
		{
			$output = [];
			$verifiedList =$this->thirdpay->getVerifiedList($nextid);
			if(!empty($verifiedList))
			{
				foreach($verifiedList as $row)
				{	
					$affected = $this->thirdpay->updateUserBalance($row['user_account'], $row['arrival_amount'],$row['id']);
					if($affected >0)
					{
						$output[]= [
							'orderNumber'=>$row['order_number'],
							'userAccount'=>$row['user_account'],
							'arrivalAmount'=>$row['arrival_amount'],
							'id'=>$row['id'],
							'time'=>time()
						];
					}
					$nextid = $row['id'];
				}
				print_r($output);
			}else
			{
				$nextid = 0;
				$output['id']=$nextid ;
				$output['time']= time();
				print_r($output);
				sleep(2);
			}
		}
	}
	
	public function timeout()
	{
		$this->thirdpay->setTimeout();
	}
}
