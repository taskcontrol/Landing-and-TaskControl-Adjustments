<?php
/*print_r($_SERVER['HTTP_REFERER']);
print_r($_SERVER['HTTP_COOKIE']);
print "Get Data <br>";
print_r($_GET);
print "Post Data <br>";
print_r($_POST);die;
session_start();

*/

if($_SERVER['HTTP_REFERER'] == true)
{
	if($_POST['check'] == '1')
	{
		$a = setcookie("URL",$_POST['send'], time() + 2592000);
		header("location: ".$_POST['send']."");
		exit();
	}
	else
	{
		if($_POST['send'] != '')
		{
			header("location: ".$_POST['send']."");
			exit();
		}
		else
		{
			header("location: home.html");
			exit();
		}
	}
}

if(isset($_COOKIE['URL']))
{
	$last = $_COOKIE['URL'];
	header("location: ".$last."");
	exit();
}
else if ($_POST['Submit'] == 'GO')
{
	if($_POST['check'] == '1')
	{
		$a = setcookie("URL",$_POST['send'], time() + 2592000);
		header("location: ".$_POST['send']."");
		exit();
	}
	else
	{
		header("location: ".$_POST['send']."");
		exit();
	}
}
else
{
	header("location: home.html");
	exit();
}
?>
