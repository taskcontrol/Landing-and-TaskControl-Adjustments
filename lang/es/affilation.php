<?
define('IN_SITE', 	true);
define('IN_USER',	true);

// including related database and language files
include_once("includes/common.php");

//**********************   Checking of Affilate user    ******************************//
		//checked here user is Affilated or not???
		$aff_or_not = $affilate->Check_User_Is_Afflilated($_SESSION['User_Name']);

		// if user is affilated then go in side
		if($aff_or_not == 0)
		{
			//Getting user details
			//if user is VIP or Special then go in according to loop
			if($seller_flag == 2)
			{
				$affilate_parent = $affilate->Get_Affilate_Parent($_SESSION['User_Name']);
				$affiliation_earning = '5';
				$commision = "Fixed";
				$new_seller_wallet = '0.00';
				$affilate->Insert_Affilation_Comm($_POST,$affilate_parent,$_SESSION['User_Name'],$commision,$new_seller_wallet,$affiliation_earning);
			}
			if(($seller_flag == 1 && $buyer_flag == 1) || ($seller_flag == 1 && $buyer_flag = 2 && $buyer_flag_no_commision == 0) /*|| ($seller_flag == 1 && $buyer_flag_no_commision = 0 && $buyer_flag = 0)*/)
			{
			//	print "hihih";print $amount_available_buyer;die;
				$affilate_parent = $affilate->Get_Affilate_Parent($_SESSION['User_Name']);
				$affiliation_earning = ($new_seller_wallet * $config[WC_COMM_FOR_AFFILATION])/100;
				$affilate->Insert_Affilation_Comm($_POST,$affilate_parent,$_SESSION['User_Name'],$config[WC_COMM_FOR_AFFILATION],$new_seller_wallet,$affiliation_earning);
			}
		}

?>