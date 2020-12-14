<?php


//*******************************************************************************//
//Here is where the PayPal process is configured ********************************//
//*******************************************************************************//
//*******************************************************************************//
//*******************************************************************************//

#====================================================================================================
#	File Name		:	siteconfig.php
#----------------------------------------------------------------------------------------------------
#	Include required files
#----------------------------------------------------------------------------------------------------

define('IN_SITE', 	true);
define('IN_ADMIN', 	true);

include_once("/var/www/taskcontrol.net/web/includes/common.php");
#-----------------------------------------------------------------------------------------------------------------------------
#	Update Config information
#-----------------------------------------------------------------------------------------------------------------------------

if($_POST['Submit'] == "Update")

{

	if($_SESSION['Admin_Perm'] == 'Admin')
	{
	     
	$webConf->Set(WC_PAYPAL_MAIL,			$_POST[WC_PAYPAL_MAIL]);
	$webConf->Set(WC_PAYPAL_SENDBOX,		$_POST[WC_PAYPAL_SENDBOX]);
	}
	
	$webConf->Set(WC_PAYPAL_FIX_AMOUNT, 		$_POST[WC_PAYPAL_FIX_AMOUNT]);
	$webConf->Set(WC_PAYPAL_PERCENTAGE, 		$_POST[WC_PAYPAL_PERCENTAGE]);
	
	$webConf->Set(WC_PAYPAL_DEPOSIT,		$_POST[WC_PAYPAL_DEPOSIT]);
	$webConf->Set(WC_PAYPAL_FIX_AMOUNT_DEPOSIT,	$_POST[WC_PAYPAL_FIX_AMOUNT_DEPOSIT]);
	$webConf->Set(WC_PAYPAL_PERCENTAGE_DEPOSIT,	$_POST[WC_PAYPAL_PERCENTAGE_DEPOSIT]);
	header('location: paypal.php?update=true');
	exit();

}

#-----------------------------------------------------------------------------------------------------------------------------
#	Cancel
#-----------------------------------------------------------------------------------------------------------------------------
else if($_POST['Submit'] == "Cancel")
{
	header('location: index.php');
	exit();
}
#=======================================================================================================================================
#											RESPONSE CREATING CODE
#---------------------------------------------------------------------------------------------------------------------------------------
if($_GET['update']==true)
{
	$succMessage = "Site configuration has been updated successfully!!";
}
else
{
	$succMessage = "";
}

$tpl->assign(array("T_Body"			=>	'paypal'. $config['tplEx'],
//			"JavaScript"	=>  array("siteconfig.js"),
//			"A_Action"	=>	"siteconfig.php",
			"succMessage"	=>	$succMessage,
			));


$tpl->assign(array( WC_PAYPAL_MAIL 		=>	$config[WC_PAYPAL_MAIL],
		WC_PAYPAL_SENDBOX 		=>	$config[WC_PAYPAL_SENDBOX],
		WC_PAYPAL_FIX_AMOUNT 		=>	$config[WC_PAYPAL_FIX_AMOUNT],
		WC_PAYPAL_PERCENTAGE		=>	$config[WC_PAYPAL_PERCENTAGE],
				
		WC_PAYPAL_DEPOSIT 		=>	$config[WC_PAYPAL_DEPOSIT],
		WC_PAYPAL_FIX_AMOUNT_DEPOSIT	=>	$config[WC_PAYPAL_FIX_AMOUNT_DEPOSIT],
		WC_PAYPAL_PERCENTAGE_DEPOSIT=>	$config[WC_PAYPAL_PERCENTAGE_DEPOSIT],
	  ));

$tpl->display('default_layout'. $config['tplEx']);

?>
