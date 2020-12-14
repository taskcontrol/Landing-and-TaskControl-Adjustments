<?
define('IN_SITE', 	true);
define('IN_USER', 	true);

include_once("/var/www/taskcontrol.net/web/includes/common.php");
include_once("/var/www/taskcontrol.net/web/lang/default/success.php");

## print $_SESSION['User_Id'];
## print $_GET['check_value'];

if ( $_GET['check_value'] == $_SESSION['User_Id'] ||  //  condicion paypal y moneybooker exitosa
     ( $_GET['collection_id'] && $_GET['collection_status'] == "approved" )  || // condicion mercado pago exitosa
	 $_GET['ESTADO'] == 2														// condicion dinero mail exitosa		
		) {
		$msg ='<p style="text-align: center;"><strong>Deposit Succesfully Done! Please check your Email.Thanks!<br /> Click on <span style="color: #3366ff;"><a style="color: #3366ff;" title="My Account" href="https://www.taskcontrol.net/account.php">MyAccount</a>&nbsp;<span style="color: #000000;">Now.</span></span></strong></p>'; 
		
		if ( $_GET['ESTADO'] == 2 )
			$msg .= '</br>The changes may appear in a few minutes.';
	
		    $tpl->assign(array(	"T_Body"			=>	'Msg'. $config['tplEx'],
			     				"msg"		   		=>	$msg,
				    			"lang"				=>	$lang,
					    		"Current_Page"		=>	'seller',
						    	"Submenu_Page"      => 'manage_bids',	
					    		));
}

$tpl->display('default_layout'. $config['tplEx']);					
?>
