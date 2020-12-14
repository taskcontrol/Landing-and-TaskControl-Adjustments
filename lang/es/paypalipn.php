<?php
define('IN_SITE', 	true);
define('IN_USER', 	true);

include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'Payment.php');
include_once($physical_path['DB_Access']. 'Email.php');
include_once($physical_path['Site_Lang'].'success.php');

$pays 		= new Payment();
$emails 	= new Email();

/*$mail_To = "rupali.kintu@hotmail.com";
$mail_Subject = "PayPal Ipn run directly";
$mail_Body = "userid:".$_POST["userid"]."amt:".$_POST["amount"];
mail($mail_To, $mail_Subject, $mail_Body);*/

// read the post from PayPal system and add 'cmd'
$req = 'cmd=_notify-validate';

foreach ($_POST as $key => $value) {
	$value = urlencode(stripslashes($value));
	$req .= "&$key=$value";
}

// post back to PayPal system to validate
$header .= "POST /cgi-bin/webscr HTTP/1.0\r\n";
$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
$header .= "Content-Length: " . strlen($req) . "\r\n\r\n";

if($config[WC_PAYPAL_SENDBOX] == "0")
	{
		$fp = fsockopen ('www.paypal.com', 80, $errno, $errstr, 30); 
	}	
	else
	{
		//If testing on Sandbox use:
		//$fp = fsockopen ('ssl://www.sandbox.paypal.com', 443, $errno, $errstr, 30);
		$fp = fsockopen ('www.sandbox.paypal.com', 80, $errno, $errstr, 30); 
	}

//$fp = fsockopen ('ssl://www.paypal.com', 443, $errno, $errstr, 30);
//$fp = fsockopen ('www.paypal.com', 80, $errno, $errstr, 30);             // <- Use this line for real use
//$fp = fsockopen ('www.sandbox.paypal.com', 80, $errno, $errstr, 30);   // <- Use this line when testing in SandBox

// assign posted variables to local variables
$item_name            = $_POST['item_name'];
$item_number          = $_POST['item_number'];
$quantity             = $_POST['quantity'];
$payment_amount       = $_POST['mc_gross'];
$fee                  = $_POST['mc_fee'];
$tax                  = $_POST['tax'];
$payment_currency     = $_POST['mc_currency'];
$exchange_rate        = $_POST['exchange_rate'];
$payment_status       = $_POST['payment_status'];
$payment_type         = $_POST['payment_type'];
$payment_date         = $_POST['payment_date'];
$txn_id               = $_POST['txn_id'];
$txn_type             = $_POST['txn_type']; // 'cart', 'send_money' or 'web_accept' (manual page 46)
$custom               = $_POST['custom'];   // Any custom data
$receiver_email       = $_POST['receiver_email'];
$first_name           = $_POST['first_name'];
$last_name            = $_POST['last_name'];
$payer_business_name  = $_POST['payer_business_name'];
$payer_email          = $_POST['payer_email'];
$address_street       = $_POST['address_street'];
$address_zip          = $_POST['address_zip'];
$address_city         = $_POST['address_city'];
$address_state        = $_POST['address_state'];
$address_country      = $_POST['address_country'];
$address_country_code = $_POST['address_country_code'];
$residence_country    = $_POST['residence_country'];

if (!$fp) {
	// HTTP ERROR
} else {
	fputs ($fp, $header . $req);
	while (!feof($fp)) {
		
		$res = fgets ($fp, 1024);
		
	
		
		
		if (strcmp ($res['payer_status'], "verified") == 0) {
		
		echo "The response from IPN was: <b>" .$res ."</b><br><br>";

//loop through the $_POST array and print all vars to the screen.
		foreach($_GET as $key => $value){

        echo $key." = ". $value."<br>";
		$all_value .= $key." = ". $value."<br>";
		

         }
		 
		 foreach($_POST as $key => $value){

        echo $key." = ". $value."<br>";
		$post_value .= $key." = ". $value."<br>";
		

         }

		/*$mail_To = "rupali.kintu@hotmail.com";
		$mail_Subject = "PayPal Ipn run directly Verified ".$res." -- ".$config[WC_PAYPAL_SENDBOX];
		$mail_Body = $all_value."<br>".$post_value;
		mail($mail_To, $mail_Subject, $mail_Body);*/

			$payment_verified = true;
			
		} else if (strcmp ($res, "INVALID") == 0) {
			
			
	
			$payment_verified = false;
		}
	}//while loop close
 fclose ($fp);
}//else loop close

	if(is_array($_POST) && count($_POST) > 0)
	{



		
			if($_POST['payer_status'] == 'verified')
			{ 		
			
				$payment_verified = true;
			
			}else{
			
			    $payment_verified     = false;
			}
		
	

	}

if ($payment_verified) {
	// check the payment_status is Completed
	// check that txn_id has not been previously processed
	// check that receiver_email is your Primary PayPal email
	// check that payment_amount/payment_currency are correct
	// process payment
	
	if($payment_status == "Pending")
	{
	        $desc = $lang['Deposite_Pending'];
			$pays->Pending_Insert($_GET['check_value'],$_GET['username'],$_GET['amt'],$desc);
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			global $mail2;
			$mail2 = '';
			$mail2 = new htmlMimeMail();
		
			$tpl2 = new Smarty;
			$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
		
			$sendinfo = $emails->GetEmailDetails1(PENDING_REQUEST);
			 
		
			$mail2->setFrom($sendinfo->email_adress);
			$mail2->setSubject($sendinfo->email_subject);
		  
			
			$tpl2->assign(array(    "amount"				=>	$_GET['amt'],
									"customer_name"			=>	$_GET['username'],
								));
							
			$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
			$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
			
			$mail_content_reg = $tpl2->fetch("email_template:".PENDING_REQUEST);	
			$mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
							<tr>
								<td>".$mail_content_header."</td>
							</tr>
							<tr>
								<td>".$mail_content_reg."</td>
							</tr>
							<tr>
								<td>".$mail_content_footer."</td>
							</tr>
						</table>";
			$mail2->setHtml($mail_html);
			
			$recevier = GetEmailAddress($_GET['check_value']);
			
			$result = $mail2->send(array($recevier));
			
			$_GET['amt'] = 0.0;
			$_GET["pay_method"] = "";
			
			//header("location: pending_request.php");
			//exit(0);
	}
	if($payment_status == "Completed")
	{   
	

	        $desc = $lang['Deposite_Msg'];
			$pays->Insert($_GET['check_value'],$_GET['username'],$_GET['amt'],$desc);
			
			$total1	=	($_GET['amt'] * $config[WC_PAYPAL_PERCENTAGE]) / 100 ;
			$total2	=	$_GET['amt'] + $total1;
			$total	=	$config[WC_PAYPAL_FIX_AMOUNT] + $total2;
			$earning = $total - $_GET['amt'];
				
			$wallet = Select_wallet_sum($_GET['check_value']);
			$new_wallet = $wallet + $_GET['amt'];
			Update_wallet_sum($_GET['check_value'],$new_wallet,2); 
			
			$payment_gateway = "Paypal";
			$pays->Insert_Earning_depost($_GET['check_value'],$_GET['username'],$_GET['amt'],$total,$earning,$payment_gateway);		

	
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			global $mail2;
			$mail2 = '';
			$mail2 = new htmlMimeMail();
		
			$tpl2 = new Smarty;
			$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
		
			$sendinfo = $emails->GetEmailDetails1(DEPOSIT_MONEY);
			 
		
			$mail2->setFrom($sendinfo->email_adress);
			$mail2->setSubject($sendinfo->email_subject);
		  
			
			$tpl2->assign(array("amount"				=>	$_GET['amt'],
								));
							
			$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
			$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
			
			$mail_content_reg = $tpl2->fetch("email_template:".DEPOSIT_MONEY);	
			$mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
							<tr>
								<td>".$mail_content_header."</td>
							</tr>
							<tr>
								<td>".$mail_content_reg."</td>
							</tr>
							<tr>
								<td>".$mail_content_footer."</td>
							</tr>
						</table>";
			$mail2->setHtml($mail_html);
			
			$recevier = GetEmailAddress($_GET['check_value']);
			
			$result = $mail2->send(array($recevier));	
			

				
				//header("location: completed.php");
				//exit(0);
						
   }
}

else if (!$payment_verified) { // log for manual investigation

			$recevier = GetEmailAddress($_GET['check_value']);
			

			$mail_To = $recevier;
			$mail_from = 'info@goitglobal';
			$mail_Subject = "PayPal Ipn run directly Invalid";
			$mail_Body = "There may be some problem , so please contact paypal administrator ";
			mail($mail_To, $mail_Subject, $mail_Body,$mail_from);
	
}

?>