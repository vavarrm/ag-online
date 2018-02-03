<?php  
 $ch = curl_init();  
 curl_setopt($ch, CURLOPT_URL, "http://www.connect6play.com/doBusiness.do");  
 curl_setopt($ch, CURLOPT_HEADER, false);  
 // curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果把这行注释掉的话，就会直接输出  
 $result=curl_exec($ch);  
 echo  $result;
 var_dump(curl_error($ch));
 curl_close($ch);  
 ?>  