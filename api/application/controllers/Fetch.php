<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Fetch extends CI_Controller {
	
	private $gpcommon;
	
	public function __construct() 
	{
		parent::__construct();	
		$this->load->library('MyDgCommon');
		$gpcommonClass = strtolower('MyDgCommon');
        $this->gpcommon = $this->$gpcommonClass;
		$this->load->model('Transaction_Model', 'transaction');
		$this->load->library('MyDgCommon');
        $gpcommonClass = strtolower('MyDgCommon');
        $this->gpcommon = $this->$gpcommonClass;
		
    }
	
	public function getTransaction()
	{
		$response  = $this->gpcommon->getTransaction();
		$result = $this->transaction->save($response['list']);
		$result['time'] = date('Y-m-d H:i:s');
		print_r($result);
	}
	
	public function mark()
	{
		$result = $this->transaction->getMarkList();
		$resultArray = explode(",", $result);
		$response = $this->gpcommon->markReport($resultArray);
		if($response['codeId'] == 0 && count($resultArray) >1 )
		{
			$output['affected_rows'] = $this->transaction->updateMark($result);
		}
		$output['t_id'] = $result;
		$output['time'] = date('Y-m-d H:i:s');
		print_r($output);
	}
	
}
