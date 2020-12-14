<?php

#====================================================================================================
#	File Name		:	siteconfig.php
#----------------------------------------------------------------------------------------------------
#	Include required files
#----------------------------------------------------------------------------------------------------

define('IN_SITE', 	true);
define('IN_ADMIN', 	true);

include_once("../includes/common.php");

#-----------------------------------------------------------------------------------------------------------------------------
#	Update Config information
#-----------------------------------------------------------------------------------------------------------------------------

if($_POST['Submit'] == "Update")

{
/*    if($_SESSION['Admin_Perm'] == 'Admin')
	{
	  $webConf->Set(WC_GOOGLE_ADSENSE,		$_POST[WC_GOOGLE_ADSENSE]);
	}
*/	$webConf->Set(WC_EURO_DOLLAR,			$_POST[WC_EURO_DOLLAR]);
	$webConf->Set(WC_DOLLAR_EURO,			$_POST[WC_DOLLAR_EURO]);
	
	$webConf->Set(WC_USER_PAGESIZE,			$_POST[WC_USER_PAGESIZE]);

	$webConf->Set(WC_SITE_TITLE, 			$_POST[WC_SITE_TITLE]);
	$webConf->Set(WC_SITE_KEYWORD, 			$_POST[WC_SITE_KEYWORD]);
	$webConf->Set(WC_SITE_DESCRIPTION, 		$_POST[WC_SITE_DESCRIPTION]);
		
	$webConf->Set(WC_POST_DEPOSIT,			$_POST[WC_POST_DEPOSIT]);
	$webConf->Set(WC_BID_DEPOSIT,			$_POST[WC_BID_DEPOSIT]);
	$webConf->Set(WC_DEPOSIT_AMOUNT,		$_POST[WC_DEPOSIT_AMOUNT]);
	$webConf->Set(WC_WITHDRAW_AMOUNT,		$_POST[WC_WITHDRAW_AMOUNT]);
	$webConf->Set(WC_FEES_OF_POST_PROJECT,	$_POST[WC_FEES_OF_POST_PROJECT]);
	$webConf->Set(WC_ESCROW_PAYMENT,		$_POST[WC_ESCROW_PAYMENT]);
	$webConf->Set(WC_EDIT_BID,				$_POST[WC_EDIT_BID]);
	$webConf->Set(WC_COMM_FORM_SELLER,		$_POST[WC_COMM_FORM_SELLER]);
	$webConf->Set(WC_COMM_FORM_BUYER,		$_POST[WC_COMM_FORM_BUYER]);
	$webConf->Set(WC_MINIMUM_COMM_SELLER,	$_POST[WC_MINIMUM_COMM_SELLER]);
	$webConf->Set(WC_MINIMUM_COMM_BUYER,	$_POST[WC_MINIMUM_COMM_BUYER]);
	$webConf->Set(WC_PREMIUM_PROJECT,		$_POST[WC_PREMIUM_PROJECT]);
	$webConf->Set(WC_URGENT_PROJECT,		$_POST[WC_URGENT_PROJECT]);
	$webConf->Set(WC_COMM_FOR_AFFILATION,	$_POST[WC_COMM_FOR_AFFILATION]);

	header('location: siteconfig.php?update=true');
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

$tpl->assign(array("T_Body"			=>	'siteconfig'. $config['tplEx'],
					"JavaScript"	=>  array("siteconfig.js"),
					"A_Action"		=>	"siteconfig.php",
					"succMessage"	=>	$succMessage,
					));


$tpl->assign(array( WC_SITE_TITLE 			=>	$config[WC_SITE_TITLE],
					WC_SITE_KEYWORD 		=>	$config[WC_SITE_KEYWORD],
					WC_SITE_DESCRIPTION 	=>	$config[WC_SITE_DESCRIPTION],
//					WC_GOOGLE_ADSENSE		=>	$config[WC_GOOGLE_ADSENSE],

					WC_EURO_DOLLAR			=>	$config[WC_EURO_DOLLAR],
					WC_DOLLAR_EURO			=>	$config[WC_DOLLAR_EURO],
					
					WC_POST_DEPOSIT			=>	$config[WC_POST_DEPOSIT],
					WC_BID_DEPOSIT			=>	$config[WC_BID_DEPOSIT],
					WC_DEPOSIT_AMOUNT		=>	$config[WC_DEPOSIT_AMOUNT],
					WC_WITHDRAW_AMOUNT		=>	$config[WC_WITHDRAW_AMOUNT],
					
					WC_FEES_OF_POST_PROJECT	=>	$config[WC_FEES_OF_POST_PROJECT],
					
					WC_ESCROW_PAYMENT		=>	$config[WC_ESCROW_PAYMENT],
					
					WC_EDIT_BID				=>	$config[WC_EDIT_BID],
					
					WC_USER_PAGESIZE		=>	$config[WC_USER_PAGESIZE],
					
					WC_COMM_FORM_SELLER		=>	$config[WC_COMM_FORM_SELLER],
					WC_COMM_FORM_BUYER		=>	$config[WC_COMM_FORM_BUYER],
					
					WC_MINIMUM_COMM_SELLER 	=>	$config[WC_MINIMUM_COMM_SELLER],
					WC_MINIMUM_COMM_BUYER 	=>	$config[WC_MINIMUM_COMM_BUYER],
					WC_PREMIUM_PROJECT	 	=>	$config[WC_PREMIUM_PROJECT],
					WC_URGENT_PROJECT	 	=>	$config[WC_URGENT_PROJECT],
					
					WC_COMM_FOR_AFFILATION	=>	$config[WC_COMM_FOR_AFFILATION],
	  ));

$tpl->display('default_layout'. $config['tplEx']);

?>