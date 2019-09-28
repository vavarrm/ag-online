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
    }
	
	public function getTransaction()
	{
		$response  = $this->gpcommon->getTransaction();
		$result = $this->transaction->save($response['list']);
		var_dump($result);
	}
	
}
