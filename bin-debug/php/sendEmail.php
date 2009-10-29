<? 

$xmlContents = $_POST['xmlContent'];
	
$file = fopen($_POST['fileName'] . ".xml","wb");
	
$to = $_POST['friendEmail'];

$from = $_POST['yourEmail'];

$replyTo = "";

$prescript = "Video Survey Completed";

$headers = 'From: '. $from . "\r\n" . 'Reply-To: '. $replyTo . "\r\n" . 'Content-Type: text/html; charset=ISO-8859-1';

$bericht = "

<html>

<head>

</head>

<body background='images/pattern_136.gif'>

<table name='BodyBackground' width='100%' align='center' cellspacing='0' cellpadding='10' border='0' bgcolor='#FFFFFF' ><tr ><td >

<table width='100%' align='center' cellspacing='10' cellpadding='20' border='0' bgcolor='#FFFFFF' ><tr><td bgcolor='#EBEBEB' >

<font face='Arial' color='#000000' style='font-size:30px;'><b>A new survey has been completed for ".$_POST['vid']."</b></font>

<br>
 
<br>
 
<font face='Arial' style='font-size:12px;'>".$_POST['daMessage']."</font>
 
<br>
 
<br>

<a href='".$_POST['link']."'>Click Here to view the survey results, dude</a><br>
 

</td></tr></table> 

</td></tr></table> 

<div align=center style='font-family:sans-serif; font-size:10; color:gray;'></div>
    
	
</body>
    
</html>

";

# Send the email notification
mail($to,$prescript,$bericht,$headers);

# Strip out backslashes
$lastBackslashPos = strpos ($xmlContents, "\\");

while($lastBackslashPos >0){
$xmlContents = substr($xmlContents,0,$lastBackslashPos)

.substr($xmlContents,$lastBackslashPos+1,strlen($xmlContents));

$lastBackslashPos = strpos ($xmlContents, "\\");

}

# Write the XML Document
fwrite($file, $xmlContents);
	
fclose($file);

echo("COMPLETE");

?>