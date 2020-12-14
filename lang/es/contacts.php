<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> 
 
<head> 
	<title></title> 
	<meta http-equiv="content-type" content="text/html;charset=utf-8" /> 
	<meta http-equiv="Content-Style-Type" content="text/css" /> 
	<meta name="robots" content="noindex, nofollow" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script> 
<script src="http://www.gurufreelancerscript.com/jquery.validate.pack.js" type="text/javascript"></script> 
 
<script type="text/javascript"> 
$(document).ready(function(){
	$("#contactform").validate();
});
</script> 
	
<style type="text/css"> 
body {
	font-family:Arial;
	font-size:12px;
}
#contact-wrapper { 
	width:430px; 
	border:0px solid #e2e2e2; 
 
	padding:0px;
}
#contact-wrapper div { 
	clear:both; 
	margin:1em 0;
}
#contact-wrapper label { 
	display:block; 
	float:none; 
	font-size:12px; 
	width:auto; 
}
form#contactform input { 
	border-color:#B7B7B7 #E8E8E8 #E8E8E8 #B7B7B7; 
	border-style:solid; 
	border-width:1px; 
	padding:5px; 
	font-size:12px; 
	color:#333; 
}
form#contactform textarea { 
	font-family:Arial, Tahoma, Helvetica, sans-serif; 
	font-size:100%; 
	padding:0.6em 0.5em 0.7em; 
	border-color:#B7B7B7 #E8E8E8 #E8E8E8 #B7B7B7; 
	border-style:solid; 
	border-width:1px;
}
</style> 
</head> 
 
<body> 
	<div id="contact-wrapper"> 
	
	<?php
	$contactname=$_REQUEST['contactname'];
	$email=$_REQUEST['email'];
	$subject=$_REQUEST['subject'];
	$message=$_REQUEST['message'];
	if (($contactname!="")||($email!="")||($subject!="")||($message!=""))
	{
	print "<br><br>Thank you <b>$contactname</b> for your message.";
	
	

require_once('class.phpmailer-lite.php');

$mail             = new PHPMailerLite(); // defaults to using php "Sendmail" (or Qmail, depending on availability)

$body             = "$contactname<br>$email<br>$subject<br>$message";
$body             = eregi_replace("[\]",'',$body);

$mail->SetFrom('info@gurufreelancerscript.com', 'gurufreelancerscript');

$address = "paul@days.ro";
$mail->AddAddress($address, "Paul");

$mail->Subject    = "Contact from $contactname - subject $subject";

$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

$mail->MsgHTML($body);

if(!$mail->Send()) {
  echo "Mailer Error: " . $mail->ErrorInfo;
} else {
  echo "";
}

	}
	else{
	?>	
	
	<form method="post" action="contacts.php" id="contactform">					
		<div> 
		    <label for="name"><strong>Name:</strong></label> 
			<input type="text" size="50" name="contactname" id="contactname" value="" class="required" /> 
		</div> 
		
		<div> 
			<label for="email"><strong>Email:</strong></label> 
			<input type="text" size="50" name="email" id="email" value="" class="required email" /> 
		</div> 
		
		<div> 
			<label for="subject"><strong>Subject:</strong></label> 
			<input type="text" size="50" name="subject" id="subject" value="" class="required" /> 
		</div> 
							
		<div> 
			<label for="message"><strong>Message:</strong></label> 
			<textarea rows="4" cols="50" name="message" id="message" class="required"></textarea> 
		</div> 
	    <input type="submit" value="Send Message" name="submit" /> 
	</form>
	<?php
	}
	?>
	</div> 
</body> 
</html>