<?php

//*******************************************************************************//
//This is the file where PayPal process the movement of money                    //
//*******************************************************************************//

define('IN_SITE', 	true);
define('IN_USER', 	true);

include_once("/var/www/taskcontrol.net/web/includes/common.php");
include_once($physical_path['DB_Access']. 'Payment.php');
include_once($physical_path['DB_Access']. 'Email.php');
include_once($physical_path['Site_Lang']. 'success.php');
include_once($physical_path['DB_Access']. 'Helper.php');

## include_once("/var/www/taskcontrol.net/web/Payment.php");
## include_once("/var/www/taskcontrol.net/web/Email.php");
## include_once("/var/www/taskcontrol.net/web/lang/default/success.php");
## iinclude_once("/var/www/taskcontrol.net/web/db_access/Helper.php");

$pays   	= new Payment();
$emails 	= new Email();
$helper         = new Helper();

$logStr = "";
$logFd = fopen("/var/www/clients/client1/web4/web/paypal_ipn_log.txt", "a");

//var_dump("PayPalIPN");
//exit();

fwrite($logFd, "********************************** TX STARTING ******************************************\n");

// STEP 0: Read POST data
// $logStr = "llega hasta step 0";
// fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");


if ( array_key_exists("txn_id", $_POST) ) {
	$logStr = "Received IPN,  TX ID : " . htmlspecialchars($_POST["txn_id"]);
	fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
} 
else {
	$logStr = "IPN Listener received an HTTP request without a Transaction ID.";
	fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
}

// STEP 1: Read POST data
// $logStr = "llega hasta step 1";
// fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
 
// read the post from PayPal system and add 'cmd'
$req = 'cmd=_notify-validate';

foreach ($_POST as $key => $value) {
	$value = urlencode(stripslashes($value));
	$req .= "&$key=$value";
}

$postFieldsAr = explode("&", $req);
$logStr = "Sending IPN values:\n" . implode("\n", $postFieldsAr);
fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");

// $logStr = "llega hasta step 2";
// fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");

// STEP 2: Post IPN data back to paypal to validate

 if ( $config[WC_PAYPAL_SENDBOX] == "0" ) {
   	$ch = curl_init("https://www.paypal.com/cgi-bin/webscr");  
 	$logStr = "llega hasta step 2-1";
 	fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
 }
 else {
  	 $ch = curl_init("https://www.sandbox.paypal.com/cgi-bin/webscr");

	 /*
         if($errno = curl_errno($ch)) {
          $error_message = curl_strerror($errno);
          ## echo "cURL error ({$errno}):\n {$error_message}";
          $logStr = $error_message;
          fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
        }
	 */

  	// $logStr = "llega hasta step 2-2";
  	// fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
}

curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: Close'));

// In wamp like environments that do not come bundled with root authority certificates,
// please download 'cacert.pem' from "http://curl.haxx.se/docs/caextract.html" and set the directory path 
// of the certificate as shown below.

 // curl_setopt($ch, CURLOPT_CAINFO, dirname(__FILE__) . '/certtemp/cacert.pem'); // original: no se porque no funciona  13-9-2017
 //  curl_setopt($ch, CURLOPT_CAINFO, "/public_html/plugins/curl/cacert.pem");  
 curl_setopt($ch, CURLOPT_CAINFO, "/var/www/clients/client1/web4/web/libs/cacert.pem");  

 if ( !($res = curl_exec($ch)) ) {
          // error_log("Got " . curl_error($ch) . " when processing IPN data");
          ////// curl_close($ch);
	fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] Got " . curl_error($ch) . " when processing IPN data\n");
 	 curl_close($ch);
 	fclose($logFd);
 	exit;
 }
 curl_close($ch);

// STEP 3: Inspect IPN validation result and act accordingly

fwrite($logFd, "------------ IPN VALIDATION ----------\n");
$logStr = "IPN Post Response: ".$res."\n";
fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");

if ( strcmp ($res, "VERIFIED") == 0 ) {   
    fwrite($logFd, "---------- PAYER STATUS VALIDATION ----------\n");
    $logStr = "Payer status = Verified OK\n"; 
    fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");

    // check whether the payment_status is Completed
    // check that txn_id has not been previously processed
    // check that receiver_email is your Primary PayPal email
    // check that payment_amount/payment_currency are correct
    // process payment
 
    // assign posted variables to local variables
	$payment_amount       = $_POST['mc_gross'];
	$payment_status       = $_POST['payment_status'];
	$payment_type         = $_POST['payment_type'];
	$payment_date         = $_POST['payment_date'];
	$custom               = $_POST['custom'];   // Any custom data
	$receiver_email       = $_POST['receiver_email'];
	$first_name           = $_POST['first_name'];
	$last_name            = $_POST['last_name'];
	$payer_business_name  = $_POST['payer_business_name'];
	$payer_email          = $_POST['payer_email'];
  
  
	/////////////////////////////////////////////////////////////////////
	// 						Procesamiento propio
	/////////////////////////////////////////////////////////////////////
	
	if ( $payment_status == "Pending" ) {
	    
	      // echo " entro en estado pending ";
	    
	    fwrite($logFd, "-------- PAYMENT STATUS PENDING ------------\n");
            $logStr = "Payment status: Pending!:\n"; 
            fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
	    
	    $desc = $lang['Deposite_Pending'];
	    $pays->Pending_Insert_Paypal($_GET['check_value'],$_GET['username'],$_GET['amt'],$desc);
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
		
		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
		
		$sendinfo = $emails->GetEmailDetails1(PENDING_REQUEST);
		$mail2->setFrom($sendinfo->email_adress);
		$mail2->setSubject($sendinfo->email_subject);
		  
			
		$tpl2->assign(array("amount"	    =>$_GET['amt'],
				    "customer_name" =>$_GET['username'],
				    "comision"      =>$_GET['comision']));
							
		$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
		$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
		$mail_content_reg =    $tpl2->fetch("email_template:".PENDING_REQUEST);	
		
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
	}
	elseif ( $payment_status == "Completed" ) {
	    
	fwrite($logFd, "-------- PAYMENT STATUS COMPLETED  ----------\n");
        $logStr = "Payment Status: Completed OK\n"; 
        fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
	    
	    
	  //  echo "Actualiza monedero del usuario q acaba de depositar";

		$wallet = Select_wallet_sum($_GET['check_value']);
		$Neto = number_format( ($_GET['amt']-0.30) / 1.054, 2); // le resto la comision y el fee de Paypal para obtener el Neto a depositar
		$new_wallet = $wallet + $Neto; 
		Update_wallet_sum($_GET['check_value'], $new_wallet); 
	
		
		// Inserto los movimientos del cliente en PAYPAL_MASTER table
               $desc = $lang['Deposite_Msg'];
               $pays->Insert_PP($_GET['check_value'],$_GET['username'],$Neto,$desc,$_GET['amt']);
			
			
		// 23-8-2017 RFG: Elimino esto ya que TaskControl no tiene ganancia por el deposito en los wallet de los usuarios
		/// Entery into Site Earning deposite
		// $total1	=	($_GET['amt'] * $config[WC_PAYPAL_PERCENTAGE]) / 100 ;
		// $total2	=	$_GET['amt'] + $total1;
		// $total	=	$config[WC_PAYPAL_FIX_AMOUNT] + $total2;
		// $earning = $total - $_GET['amt'];
		// $payment_gateway = "Paypal";
		// $pays->Insert_Earning_depost($_GET['check_value'],$_GET['username'],$_GET['amt'],$total,$earning,$payment_gateway);		


	        // echo "Manda Mail del Deposito al usuario ////////////////////////////////////////";

		global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
		
		$tpl2 = new Smarty;
		$tpl2->compile_dir= $physical_path['Site_Root']. 'templates_c/';
		
		$sendinfo = $emails->GetEmailDetails1(DEPOSIT_MONEY);
			 
		$mail2->setFrom($sendinfo->email_adress);
		$mail2->setSubject($sendinfo->email_subject);
		  
			
		// $tpl2->assign(array("amount" =>	$_GET['amt'],));
		
		
		$tpl2->assign(array("amount"	=>	$_GET['amt']-$_GET['comision'],));
							
							
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
		
		// Si se necesita enviar recibo desde Taskcontrol descomentar lo siguiente
		// hasta $resultado
		// Fijarse bien, si esto es necesario porque ya Paypal envia su recibo al cliente
		//
$logStr = "Genera recibo y manda .pdf";
fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
		
	        // $Numero=strftime("%d%m%Y%H%M%S");
	  	// $User_ID=$_GET['username'];
		// $Company_ID=$_GET['username'];
		// $from="billing@taskcontrol.net";
		// $to=$recevier;
		// $Descripcion="1 x Deposit in TaskControl Wallet";
		// $FechaDesde=strftime("%d %b %Y %H:%M:%S ");
		// $FechaHasta=strftime("%d %b %Y %H:%M:%S ");
		// $Tax="0.00";
		// $Importe=$Neto;
		// $Total=$Neto;
		// $Tipo="1"; // Factura "E" (los Recibo "C" son para Argentina y los ingreso y envio manualmente por la pagina del AFIP)
		// $resultado=Send_Pdf($Numero,$User_ID,$Company_ID,$to,$from,$to,$Descripcion,$FechaDesde,$FechaHasta,$Tax,$Importe,$Total,$Tipo);
	}
   
}
 elseif ( strcmp ($res, "INVALID") == 0 ) { // Response contains INVALID - reject notification

        fwrite($logFd, "----------- PAYER NOT VERIFIED -----------\n");
        $logStr = "Payer is not verified. Please contactus@taskcontrol.net\n"; 
        fwrite($logFd, strftime("%d %b %Y %H:%M:%S ") . "[paypalipn.php] $logStr\n");
	    
    	$recevier = GetEmailAddress($_GET['check_value']);
			
	// Send an email announcing the IPN message is INVALID
	$mail_To = $recevier;
	$mail_from = 'billing@taskcontrol.net';
	$mail_Subject = "PayPal IPN Invalid";
	$mail_Body = "IPN Invalid, please contact Paypal to verify.";
	mail($mail_To, $mail_Subject, $mail_Body,$mail_from);
}

## echo "sale de paypalipn.php..."

fclose($logFd);
?>
