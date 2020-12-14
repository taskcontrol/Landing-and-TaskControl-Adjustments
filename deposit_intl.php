<?

define('IN_SITE', 	true);
define('IN_USER',	true);
include_once("/var/www/taskcontrol.net/web/includes/common.php");

include_once($physical_path['Site_Lang']. 'deposit.php');
include_once($physical_path['DB_Access']. 'Others.php');
include_once($physical_path['DB_Access']. 'Helper.php');

## include_once("/var/www/taskcontrol.net/web/lang/default/deposit.php");
## include_once("/var/www/taskcontrol.net/web/db_access/Others.php");
## include_once("/var/www/taskcontrol.net/web/db_access/Helper.php");

$others 	= new Others();  
$helper         = new Helper();

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : A_VIEW_ALL);
$ret = $others->getUserDetails(md5($_SESSION['User_Name']));

if ( $Action == 'Next_Step' ) {

   	$_SESSION['pay_mehtod'] = $_POST['pay_mehtod'] ? $_POST['pay_mehtod'] : $_SESSION['pay_mehtod'];
   	$_SESSION['amount'] = $_POST['amount'] ? $_POST['amount'] : $_SESSION['amount'];


	if ( $_SESSION['pay_mehtod'] == 'paypal' ) {


         $amountCurrency =$_SESSION['amount'];
         
        ##   echo " amountCurrency: "; echo $amountCurrency;
         
         // CALCULOS FINALES PARA EL DEPOSITO EN EL WALLET DEL USUARIO - ANDAN OK POR EL MOMENTO 23-8-2017
         $percentageCurrency = 0.054;    
         $porcentajeComision= $amountCurrency*$percentageCurrency;
         
       ##   echo "porcentajeComision: "; echo $porcentajeComision;
         
         $comisionPaypal= $porcentajeComision+0.30;
         
          ## echo " comision mas fijo: "; echo $comisionPaypal;
         
         $total= number_format($amountCurrency+$comisionPaypal,2);
    
	   ##  echo " Total a depositar: "; echo $total;
		  
		  
if ( $config[WC_PAYPAL_SENDBOX] == "0" ) {   // transaccion en entorno PRODUCTIVO de Paypal 

          // echo "Entro en entorno productivo";

		 $tpl->assign(array(	"T_Body"		=>  'paypal'. $config['tplEx'],
        				"lang"			=>  $lang,
		        		"paypal_id"		=>  $config[WC_PAYPAL_MAIL],
			    	"sendbox_check"			=>  $config[WC_PAYPAL_SENDBOX],
			    	"final_total"			=>  $total,
			    	"comisionPaypal"                =>  $comisionPaypal,
			    	"requested_amount"		=>  $amountCurrency,
			    	"user_id"          		=>  $_SESSION['User_Id'], 
			    	"user_name"        		=>  $_SESSION['User_Name'],
				    "pay_method"       		=>  $_SESSION['pay_mehtod'],
			         	"item_name"		=> "Deposit in TaskControl Wallet. Username: ".$_SESSION['User_Name'],
			         	"tab"			=>  4,
				    "navigation"		=> '<a href=manage_payments.php class=footerlink>'.$lang['Manage_Payments'].'</a>',
				    "navigation1"		=> '<label class=navigation>'.$lang['Deposit_Money'].'</label>',
			));

}
else {   // transaccion en SANDBOX de Paypal

            ## echo "entro en entorno SANDBOX";

		 $tpl->assign(array(	"T_Body"		=>  'paypal_sandbox'. $config['tplEx'],
        				"lang"			=>  $lang,
		        		"paypal_id"		=>  $config[WC_PAYPAL_MAIL],
			    	"sendbox_check"			=>  $config[WC_PAYPAL_SENDBOX],
			    	"final_total"			=>  $total,
			    	"comisionPaypal"                =>  $comisionPaypal,
			    	"requested_amount"		=>  $amountCurrency,
			    	"user_id"          		=>  $_SESSION['User_Id'], 
			    	"user_name"        		=>  $_SESSION['User_Name'],
				    "pay_method"       		=>  $_SESSION['pay_mehtod'],
			         	"item_name"		=> "Deposit in TaskControl Wallet. Username: ".$_SESSION['User_Name'],
			         	"tab"			=>  4,
				    "navigation"		=> '<a href=manage_payments.php class=footerlink>'.$lang['Manage_Payments'].'</a>',
				    "navigation1"		=> '<label class=navigation>'.$lang['Deposit_Money'].'</label>',
			));
}			
			
		    ## echo "entra 1";
			
	} // Paga con Paypal
}
else {
    
       ##   echo "entra a 2";
  
	 $str = $_SERVER['HTTP_REFERER'];
	 $navigation = '<a href=account.php class=footerlink>'.$lang['My_Account'].'</a>';
	 $navigation1= '<label class=navigation>'.$lang['Deposite_Money'].'</label>';

  	 $tpl->assign(array(	"T_Body"				=>	'deposit_intl'. $config['tplEx'],
					"JavaScript"			=>	array('deposit.js'),    
					"lang"				=>      $lang,
					"fix_amount"			=>	$config[WC_PAYPAL_FIX_AMOUNT],
					"per_amount"			=>	$config[WC_PAYPAL_PERCENTAGE],
					"JS_WC_POST_DEPOSIT"		=>	$config[WC_DEPOSIT_AMOUNT],
					"tab"				=>      4,
					"navigation"			=>	$navigation,
					"navigation1"			=>	$navigation1,
					"navigation2"			=>	$navigation2,
 			));
}

  ##    echo "Saliendo ...";

$tpl->display('default_layout'. $config['tplEx']);
?>
