<?php  
// $url ="http://www.connect6play.com/doBusiness.do";
// $url ="http://www.google.com.tw/";
$url ="http://connect6bo.com/tac/#/login/";
 $ch = curl_init();  
 curl_setopt($ch, CURLOPT_URL, $url);  
 curl_setopt($ch, CURLOPT_HEADER, false);  
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果把这行注释掉的话，就会直接输出  
 $result=curl_exec($ch);  
  var_dump(curl_error($ch));
 echo  $result;

 // curl_close($ch);  
 ini_set("user_agent","Mozilla/4.0 (compatible; MSIE 5.00; Windows 98)");
$data_content = file_get_contents( $url );
 echo $data_content;
 echo "D";
 // $ch = curl_init();

// $url="http://www.connect6play.com/doBusiness.do"; 
// $url="http://connect6bo.com/tac/#/login"; 
// curl_setopt($ch,CURLOPT_URL,$url);
// curl_setopt($ch,CURLOPT_RETURNTRANSFER,true); 
// curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,false); //////我錯過了這一行。
// $response = curl_exec($ch); 
// echo $response;
// var_dump(curl_error($ch));
// curl_close($ch);

 
 ?>  
 <iframe width="100%" height="100%" src="<?php echo $url;?>"></iframe>