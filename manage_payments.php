<?

define('IN_SITE', 	true);
define('IN_USER',	true);
include_once("/var/www/taskcontrol.net/web/includes/common.php"); 
include_once($physical_path['Site_Lang'].'/manage_payments.php');
include_once($physical_path['DB_Access']. 'Payment.php');
include_once($physical_path['DB_Access']. 'Escrow.php');
include_once($physical_path['DB_Access']. 'Helper.php');
include('balance.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : 'ViewAll');
$pays 		= new Payment();
$escrow		= new Escrow();
$helper     = new Helper();

if($Action == 'success')
{
	$Action = 'ViewAll';
}
if($Action == 'ViewAll')
{
	$result = $pays->ViewAll($_SESSION['User_Id']);
	$rscnt = $db->num_rows();
	$i=0;
		while($db->next_record())
		{
			$arr_traction[$i]['amount']			= $db->f('amount');
			$arr_traction[$i]['description']	= $db->f('description');
			$arr_traction[$i]['trans_type']		= $db->f('trans_type');
			$arr_traction[$i]['date']			= substr($db->f('date'), 0, 10) . " at " . substr($db->f('date'), 11, 5);
			$i++;
		}
		
		$tpl->assign(array(	"T_Body"			=>	'manage_payments'. $config['tplEx'],
							"Site_Title"		=>	$config[WC_SITE_TITLE]." - ".$lang['Payment'],
							"Loop"				=>	$rscnt,
							"atraction"         =>  $arr_traction,
							"tab"			 	=>  4,
							"navigation"		=>	'<label class=navigation>'.$lang['Manage_Payments'].'</label>'
							));
	
		$tpl->assign(array( "T_Balance1"	=>	'balance1'. $config['tplEx'],
							));
	$result = $pays->ViewAllwithdarw($_SESSION['User_Id']);
	$rscnt_withdraw = $db->num_rows();
	$i=0;
		while($db->next_record())
		{
			$arr_withdraw[$i]['requested_date']	= $db->f('requested_date');
			$arr_withdraw[$i]['description']	= $db->f('details');
			$arr_withdraw[$i]['withdraw_type']	= $db->f('withdraw_type');
			$arr_withdraw[$i]['amount']			= $db->f('amount');
			$arr_withdraw[$i]['trans_type']		= $db->f('trans_type');
			$arr_withdraw[$i]['status']			= $db->f('status');
			$i++;
		}
		
		$tpl->assign(array(	
							"Loop1"				=>	$rscnt_withdraw,
							"awithdarw"         =>  $arr_withdraw,
							"lang"				=>  $lang,
							"tab"			 	=>  4,
							));							
	
			
		$tpl->assign(array( "Escrow_Out_List"	=>	$escrow->Escrow_Out($_SESSION['User_Name']),
							"Escrow_In_List"	=>	$escrow->Escrow_In($_SESSION['User_Name']),
							));		
							
										

}
$tpl->display('default_layout'. $config['tplEx']);
?>
