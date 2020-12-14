<?
define('IN_SITE', 	true);

include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'Seller.php');
include_once($physical_path['DB_Access']. 'Category.php');
include_once($physical_path['DB_Access']. 'Member.php');



$pageSize = 10;
$nro_pagina = $_GET[page];

$tpl->assign(array(	"T_Body"		=>  'login'. $config['tplEx'],
			"lang"			=>  $lang,
			"navigation"		=>  $navigation,
		  ));

// $tpl->display('login'. $config['tplEx']);

$tpl->display('default_layout'. $config['tplEx']);


?>