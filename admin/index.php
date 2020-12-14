<?php
define('IN_SITE', 	true);
define('IN_ADMIN', 	true);

include_once("../includes/common.php");
include_once($physical_path['DB_Access']. 'Others.php');
$others = new Others();

$tpl->assign(array(	"T_Body"					   =>	'index'. $config['tplEx'],
					"reg_users"					   =>  $others->Count_Users(),
					"vip_users"          		   =>  $others->Count_VIP_Users(),
					"normal_users"      		   =>  $others->Count_Normal_Users(),
					"portfolio"    				   =>  $others->Count_Portfolio(),
					"project"					   =>  $others->Count_Project(),
					"buyer"					       =>  $others->Count_Buyer(),
					"seller"				       =>  $others->Count_Seller(),
					"special"				       =>  $others->Count_Special_Users(),
					"special_Vip"			       =>  $others->Count_VIP_SPEC_Users(),
					"bid_pending"			       =>  $others->Count_Bid_Pending(),
					"withdraw_money_paypal"	       =>  $others->Count_Withdraw_Money_Form_Paypal(),
					"withdraw_money_moneybooker"   =>  $others->Count_Withdraw_Money_Form_Moneybooker(),
					"withdraw_money_mercadopago"   =>  $others->Count_Withdraw_Money_Form_MercadoPago(),
					"withdraw_money_dineromail"    =>  $others->Count_Withdraw_Money_Form_DineroMail(),
					"withdraw_money_neteller"      =>  $others->Count_Withdraw_Money_Form_Neteller(),
					"deposite_money_paypal"	       =>  $others->Count_Deposite_Money_Form_Paypal(),
					"deposite_money_moneybooker"   =>  $others->Count_Deposite_Money_Form_Moneybooker(),
					"deposite_money_mercadopago"   =>  $others->Count_Deposite_Money_Form_MercadoPago(),
					"deposite_money_dineromail"    =>  $others->Count_Deposite_Money_Form_DineroMail(),
					"deposite_money_neteller"      =>  $others->Count_Deposite_Money_Form_Neteller(),
					"last_week"					   =>  $others->Count_Last_Week_Project(date('Y-m-d', mktime(0,0,0,date("m"),date("d")-7,date("y"))),date('Y-m-d')),
				));

$tpl->display('default_layout'. $config['tplEx']);

?>