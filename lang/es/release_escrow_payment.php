<?
define('IN_SITE', 	true);
define('IN_USER',	true);
include_once("includes/common.php");
include_once($physical_path['Site_Lang'].'/project.php');
include_once($physical_path['DB_Access']. 'Escrow.php');
include_once($physical_path['DB_Access']. 'Email.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : A_VIEW_ALL);

$escrow		= new Escrow();
$emails 	= new Email();


$details = $escrow->Get_Details($_GET['id']);
	//Depost amount form Buyer Account  
	
	$escrow->Insert_Escrow_Form_buyer($details->from_user_auth_id,$details->from_user_login_id,$details->amount,$details->to_user_login_id,$details->project_title);

    //Depost amount form Seller Account  
	
	$wallet_seller = Select_wallet_sum($details->to_user_auth_id);
			  
	$new_wallet1 = $wallet_seller + ($details->amount);
	
	Update_wallet_sum($details->to_user_auth_id,$new_wallet1); 
	
	$escrow->Insert_Escrow_Form_Seller($details->to_user_auth_id,$details->to_user_login_id,$details->amount,$details->from_user_login_id,$details->project_title);
    
	//updateing status of payment like relase or not
	$escrow->Update($_GET['id']);
	
	
	if($details->payment_type == 1 || $details->payment_type == 3)
	{
		//updateing status of project
		$escrow->Complete_Project($details->project_id);
	}
	//earning by the user
	
	$Earning_wallet_seller = Sellect_Earning_Wallet($details->to_user_auth_id);
	
	$new_earning_wallet = $Earning_wallet_seller + ($details->amount);
	
	Update_earning_wallet($details->to_user_auth_id,$new_earning_wallet); 
	
	//email to buyer

	global $mail2;
	$mail2 = '';
	$mail2 = new htmlMimeMail();
	
	$tpl2 = new Smarty;
	$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
	
	$sendinfo = $emails->GetEmailDetails1(ESCROW_PAYMENT_RELE);
	
	$mail2->setSubject($sendinfo->email_subject);
	$mail2->setFrom($sendinfo->email_adress); 
	
	$tpl2->assign(array(
						"cancle_user"           =>  $details->to_user_login_id,
						"amount"                =>  number_format($details->amount,2),
						"project_title"         =>  $details->project_title,
						"flag"                  =>  0,
					));
	
						
	$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
	$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
	$mail_content_reg = $tpl2->fetch("email_template:".ESCROW_PAYMENT_RELE);
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

	$send_to = GetEmailAddress($details->from_user_auth_id);
	
	$result = $mail2->send(array($send_to));
				
	//////////////////////////
	
//email to seller

	global $mail2;
	$mail2 = '';
	$mail2 = new htmlMimeMail();
	
	$tpl2 = new Smarty;
	$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
	
	$sendinfo = $emails->GetEmailDetails1(ESCROW_PAYMENT_RELE);
		
	$mail2->setSubject($sendinfo->email_subject);
	$mail2->setFrom($sendinfo->email_adress); 
	
	$tpl2->assign(array("buyer_id"           	=>  $details->from_user_login_id,
						"amount"                =>  number_format($details->amount,2),
						"project_title"         =>  $details->project_title,
						"flag"                  =>  1,
					));
	
						
	$mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
	$mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
	$mail_content_reg = $tpl2->fetch("email_template:".ESCROW_PAYMENT_RELE);
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

	$send_to = GetEmailAddress($details->to_user_auth_id);
	
	$result = $mail2->send(array($send_to));
	header("location: manage_payments.php");
	exit();

$tpl->display('default_layout'. $config['tplEx']);
?>