<?php
define('IN_SITE', 		true);
define('IN_USER', 		true);
include_once("includes/common.php");

$user->Destroy();
	
	header("location: index.php");
	exit();
?>