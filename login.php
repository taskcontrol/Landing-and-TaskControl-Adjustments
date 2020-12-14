<?
define('IN_SITE', 	true);
include_once("includes/common.php");

if($_POST['Submit'] == $lang['Login'])
{
    $check_user = $user->Check_User_ID($_POST['user_id']);
	if($check_user == 0)
	 {
			$res = $user->Get_Password($_POST['user_id']);
			if($res->user_status == 0)
			{
				$error_msg = $lang['Login_Status'];
			}
			if($res->user_status == 1)
			{ 
				if( $user->IsValidLogin($_POST['user_id'],$_POST['password'],1) )
				{

					$path_parts = pathinfo($_SERVER['HTTP_REFERER']);
					if($path_parts['basename'] == 'signup.php' || $path_parts['basename'] == 'login.php')
					{
						$new_str = "account.php";
						
					}
					else
					{
						if(strpos($_SERVER['HTTP_REFERER'],"login_error=true") > 0)
						{
							$pos = strpos($_SERVER['HTTP_REFERER'],"login_error=true");
							$new_str = substr_replace($_SERVER['HTTP_REFERER'], '', ($pos - 1));
						}
						else
						{
							$new_str = $_SERVER['HTTP_REFERER'];
							
							
						}
					}
					header("location: ".$new_str);	
					exit();
				}
				else
				{
					
					if(strpos($_SERVER['HTTP_REFERER'],"login_error=true") > 0)
					{
						$new_str = $_SERVER['HTTP_REFERER'];
					}
					else
					{
						$pos = strpos($_SERVER['HTTP_REFERER'],"?");
						if($pos > 0)
						{
							$new_str = $_SERVER['HTTP_REFERER']."&login_error=true";
						}
						else
						{
							$new_str = $_SERVER['HTTP_REFERER']."?login_error=true";
						}
					}
					header("location: ".$new_str);	
					exit();
				}
			}
	 }
	else
	 {
		if(strpos($_SERVER['HTTP_REFERER'],"login_error=true") > 0)
		{
			$new_str = $_SERVER['HTTP_REFERER'];
		}
		else
		{
			$pos = strpos($_SERVER['HTTP_REFERER'],"?");
			
			if($pos > 0)
			{
				$new_str = $_SERVER['HTTP_REFERER']."&login_error=true";
			}
			else
			{
				$new_str = $_SERVER['HTTP_REFERER']."?login_error=true";
			}
			
		}
		header("location: ".$new_str);	
		exit();
	 } 			
}
$tpl->display('default_layout'. $config['tplEx']);
?>