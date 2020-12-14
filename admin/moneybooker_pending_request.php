<?php


//*******************************************************************************//
//Here is where the list of pending request is shown*****************************//
//*******************************************************************************//
//*******************************************************************************//
//*******************************************************************************//

#====================================================================================================
#	Include required files
#----------------------------------------------------------------------------------------------------
define('IN_SITE', 	true);
define('IN_ADMIN', 	true);
include_once("../includes/common.php");
include_once($physical_path['DB_Access'].'Email.php');
include_once($physical_path['DB_Access'].'Pending.php');
include_once($physical_path['DB_Access'].'Payment.php');
include_once($physical_path['DB_Access'].'Helper.php');
include_once($physical_path['Site_Lang'].'/common.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : 'ViewAll');


$pays 		= new Pending();
$payment 	= new Payment();
$emails 	= new Email();
$helper     = new Helper();

#-----------------------------------------------------------------------------------------------------------------------------
#	Cancel
#-----------------------------------------------------------------------------------------------------------------------------
if ($_POST['Submit'] == 'Cancel')
{
	header("location: moneybooker_pending_request.php");
	exit();
}

#----------------------------------------------------------------------------------------------------
# Add Country
#----------------------------------------------------------------------------------------------------

elseif($Action == 'Edit' && $_POST['Submit']=='Save')
{
	if($_POST['with_status'] == 1)
	{
	    global $mail2;
		$mail2 = '';
		$mail2 = new htmlMimeMail();
	
		$tpl2 = new Smarty;
		$tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
	
		$sendinfo = $emails->GetEmailDetails1(DEPOSIT_MONEY);
		 
	
		$mail2->setFrom($sendinfo->email_adress);
		$mail2->setSubject($sendinfo->email_subject);
		
		$tpl2->assign(array("amount"				=>	$_POST['amount'],
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
		
		$recevier = GetEmailAddress($_POST['user_auth_id']);

		$result = $mail2->send(array($recevier));	
		
		/////Entery into Moneybooker Master

		$desc = $lang["Deposite_moneybooker"];
		$pays->InsertPendingInMoneybooker($_POST,$desc);
		
		/// Update user account
		$wallet = $helper->ParseNumeric(Select_wallet_sum($_POST['user_auth_id']));
		$new_wallet = $wallet + $helper->ParseNumeric($_POST['amount']);
		Update_wallet_sum($_POST['user_auth_id'],$new_wallet); 
		
		/// Entery into Site Earing deposite
		$total1	=	($helper->ParseNumeric($_POST['amount']) * $helper->ParseNumeric($config[WC_MONEYBOOKER_PERCENTAGE_DEPOSIT])) / 100 ;
		$total2	=	$helper->ParseNumeric($_POST['amount']) + $total1;
		$total	=	$helper->ParseNumeric($config[WC_MONEYBOOKER_FIX_AMOUNT_DEPOSIT]) + $total2;
		$earning = $total - $helper->ParseNumeric($_POST['amount']);
		
		$payment_gateway = "MoneyBooker";
		$payment->Insert_Earning_depost($_POST['user_auth_id'],$_POST['user_name'], $helper->ParseNumeric($_POST['amount']), $total,$earning,$payment_gateway);

		$pays->Delete_Moneybooker($_POST['mpd_id']);
	}	
	header("location: moneybooker_pending_request.php?edit=true");
	exit();
}
#=======================================================================================================================================
#											RESPONSE CREATING CODE
#---------------------------------------------------------------------------------------------------------------------------------------

if($Action == 'ViewAll' || $Action == '')
{
	if($_GET['edit']==true)
		$succMessage = "Moneybooker pending request has been updated successfully!!";
	
	$pays->All_moneybooker_Pending();
	$rscnt = $db->num_rows();
	$i=0;
	while($db->next_record())
	{
	   	$arr_pending_details[$i]['id']				= $db->f('mpd_id');
		$arr_pending_details[$i]['user_auth_id']	= $db->f('user_auth_id');
		$arr_pending_details[$i]['user_name']		= $db->f('user_login_id');
		$arr_pending_details[$i]['amount']			= $db->f('amount');
		$arr_pending_details[$i]['description']		= $db->f('description');
		$arr_pending_details[$i]['pending_date']	= $db->f('pending_date');
		$i++;
	}
	$tpl->assign(array( "T_Body"			=>	'moneybooker_pending_showall'. $config['tplEx'],
						"JavaScript"	    =>  array("pending.js"),
						"A_Action"		    =>	"moneybooker_pending_request.php",
						"succMessage"	    =>	$succMessage,
						"pendingmoney"	   	=>	$arr_pending_details,
						"Loop"				=>	$rscnt,
						"PageSize_List"		=>	$utility->fillArrayCombo($lang['PageSize_List'], $_SESSION['page_size']),						

						));
								
   	if($_SESSION['total_record'] > $_SESSION['page_size'])
	{
		$tpl->assign(array('Page_Link' =>	$utility->showPagination($_SESSION['total_record'])
						));
	}
					
}	
elseif($Action == 'Edit')
{
   	$ret = $pays->GetPending_Request_Money($_POST['mpd_id']);
	$tpl->assign(array("T_Body"					=>	'moneybooker_pending_addedit'. $config['tplEx'],
						"JavaScript"		=>  array("pending.js"),
						"Action"		=>	$Action,
						"user_name"		=>	$ret->user_login_id,
						"pending_date"		=>	$ret->pending_date,
						"amount"		=>	$ret->amount,
						"with_status"		=>	($ret->status == 1)?'checked':'',
						"user_auth_id"		=>	$ret->user_auth_id, 
						"description"		=>	$ret->description,
					    "mpd_id"			=>	$_POST['mpd_id'],
				));

}				
$tpl->display('default_layout'. $config['tplEx']);
?>