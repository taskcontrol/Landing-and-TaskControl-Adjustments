<?
define('IN_SITE', 	true);

include_once("includes/common.php");
include_once($physical_path['DB_Access'].'Page.php');

include_once($physical_path['Site_Lang'].'/rss_pages.php');

$page = new Page();


	 $str = $_SERVER['HTTP_REFERER'];
	
	 $str1 = substr(strrchr($str,'/'),1);
		
	if($str1 == 'account.php')
	{
		$navigation = '<a href=account.php class=footerlink>'.$lang['My_Account'].'</a>';
		$navigation1= '<label class=navigation>'.$lang['RSS'].'</label>';
	}

$tpl->assign(array(	"T_Body"			=>	'rss_pages'. $config['tplEx'],
					"lang"				=>  $lang,
					"navigation"		=>	$navigation,
					"navigation1"		=>	$navigation1,
					"navigation2"		=>	$navigation2,
					));

 	#language 					
			

$tpl->display('default_layout'. $config['tplEx']);
?>