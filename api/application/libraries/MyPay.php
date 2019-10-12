<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MyPay
{
	private $CI ;
	private $obj;
	public function __construct() 
	{
		$this->obj = $obj;
		$this->CI =& get_instance();
	}
	
	public function payRedirection($provide, $ary)
	{
		$provide = ucfirst(strtolower($provide));
		$this->CI->load->library('MyPay'.$provide);
		$payObjName = strtolower('MyPay'.$provide);
		$this->payObj = $this->CI->$payObjName;
		return $this->payObj->payRedirection($ary);
	}
}