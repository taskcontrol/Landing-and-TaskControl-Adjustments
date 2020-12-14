<?php

## print "entro a functions";

date_default_timezone_set('UTC'); //added this at 10-05-2013 because otherwise gave us timezone errors on several pages...RFG

## print "en functions despues del date_default_timezone_set";

#====================================================================================================
#	Function Name		:	encode_ip
#----------------------------------------------------------------------------------------------------
function encode_ip($dotquad_ip)
{
	$ip_sep = explode('.', $dotquad_ip);
	return sprintf('%02x%02x%02x%02x', $ip_sep[0], $ip_sep[1], $ip_sep[2], $ip_sep[3]);
}

#====================================================================================================
#	Function Name		:	decode_ip
#----------------------------------------------------------------------------------------------------
function decode_ip($int_ip)
{
	$hexipbang = explode('.', chunk_split($int_ip, 2, '.'));
	return hexdec($hexipbang[0]). '.' . hexdec($hexipbang[1]) . '.' . hexdec($hexipbang[2]) . '.' . hexdec($hexipbang[3]);
}

#====================================================================================================
#	Function Name		:	redirect
#----------------------------------------------------------------------------------------------------
function getPageSize()
{
	global $data;
	return $_POST['page_size'] ? $_POST['page_size'] : ($_COOKIE['page_size'] ? $_COOKIE['page_size']:key($data['PageSize']));
}

function getPageSizeUser()
{
	global $data;
	return $_POST['user_page_size'] ? $_POST['user_page_size'] : ($_COOKIE['user_page_size'] ? $_COOKIE['user_page_size']:key($data['user_page_size']));
}

#====================================================================================================
	#	Function Name	:   getYearCombo
	#   Admin Side	
	#----------------------------------------------------------------------------------------------------
	function getYearCombo($selected)
	{
		$CurrYear = date('Y');
		
		//$Combo = '<option value="">Select</option>';
		
		for($i=2008;$i<=$CurrYear;$i++)
		{
			if($i == $selected)
				$Combo .='<option selected value="'.$i.'">'.$i.'</option>';
			else
				$Combo .='<option value="'.$i.'">'.$i.'</option>';
		}
		
		return $Combo;
		
	}
	
	#====================================================================================================
	#	Function Name	:   getLastDayOfMonth
	#   Admin Side	
	#----------------------------------------------------------------------------------------------------
	function getLastDayOfMonth($month,$year)
	{
		$lday = 31;
		while(!checkdate($month, $lday, $year)) 
		{
		   $lday--;
		}
		return $lday;
	}
	
function redirect($url)
{
	global $db;
	if (!empty($db))
	{
		$db->db_close();
	}
	$server_protocol = ($board_config['cookie_secure']) ? 'https://' : 'https://';
	$server_name = preg_replace('#^\/?(.*?)\/?$#', '\1', trim($board_config['server_name']));
	$server_port = ($board_config['server_port'] <> 80) ? ':' . trim($board_config['server_port']) : '';
	$script_name = preg_replace('#^\/?(.*?)\/?$#', '\1', trim($board_config['script_path']));
	$script_name = ($script_name == '') ? $script_name : '/' . $script_name;
	$url = preg_replace('#^\/?(.*?)\/?$#', '/\1', trim($url));
	// Redirect via an HTML form for PITA webservers
	if (@preg_match('/Microsoft|WebSTAR|Xitami/', getenv('SERVER_SOFTWARE')))
	{
		header('Refresh: 0; URL=' . $server_protocol . $server_name . $server_port . $script_name . $url);
		echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><meta http-equiv="refresh" content="0; url=' . $server_protocol . $server_name . $server_port . $script_name . $url . '"><title>Redirect</title></head><body><div align="center">If your browser does not support meta redirection please click <a href="' . $server_protocol . $server_name . $server_port . $script_name . $url . '">HERE</a> to be redirected</div></body></html>';
		exit;
	}
	// Behave as per HTTP/1.1 spec for others
	header('Location: ' . $server_protocol . $server_name . $server_port . $script_name . $url);
	exit;
}
function formatDate($dateValue, $formate='d-M-Y')
{
	ereg ("([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})", $dateValue, $datePart);
	return makeDate($datePart[3], $datePart[2], $datePart[1], $formate);
}

function makeDate($intDay, $intMonth, $intYear, $formate='d-M-Y')
{
	return date ($formate, mktime (0,0,0,$intMonth, $intDay, $intYear));
}

////change the date to standard format // input yyyy-mm-dd
function standard_dateformat($in_date) 
{
	global $lang;
	$pattern = "([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})";
	ereg( $pattern, $in_date, $submitdate);
	$out_date = $submitdate[3]." ".$lang['DateTime1'][$submitdate[2]].", ".$submitdate[1];
	return $out_date;
}
#====================================================================================================
#	Function Name		:	readFileContent
#----------------------------------------------------------------------------------------------------
function readFileContent($filename)
{
   
	if(!file_exists($filename))
		return "File does not exists !!";
	$fd = fopen ($filename, "r"); 
	$contents = fread ($fd, filesize($filename));
	//print $contents; 
	fclose ($fd); 
	return $contents;
}
#====================================================================================================
#	Function Name		:	writeFileContent
#----------------------------------------------------------------------------------------------------
function writeFileContent($filename, $contents)
{
	$fd = fopen ($filename, "w+"); 
	$ret = fwrite($fd, $contents, strlen($contents)); 
	fclose ($fd); 
	return $ret;
}
#====================================================================================================
#	Function Name		:	fillArrayCombo
#----------------------------------------------------------------------------------------------------
function fillArrayCombo($arrName, $selected='')
{
	$strHTML = "";
	reset($arrName);
    while(list($key,$val) = each($arrName))
    {
    	$strHTML .= "<option value=\"". $key. "\"";
    	if($selected == $key)
        	$strHTML .= " selected ";
		$strHTML .= ">".$val. "</option>";
    }
	return $strHTML;
}
#====================================================================================================
#	Function Name		:	fillDbCombo
#----------------------------------------------------------------------------------------------------
function fillDbCombo($arrName, $key, $val, $selected='')
{
 	global $db;
	$strHTML = "";
	$i = 0;
    while($i < $db->num_rows())
    {
		$db->next_record();
    	$strHTML .= "<option value=\"". $db->f($key). "\"";
		if($selected == $db->f($key))
        	$strHTML .= " selected ";
		if(is_array($val))
			$strHTML .= ">".$db->f($val[0])." ".$db->f($val[1])." </option>";
		else
			$strHTML .= ">".$db->f($val). "</option>";
		$i++;
	}
	$db->free();
	return $strHTML;
}
#====================================================================================================
#	Function Name		:	fileUpload
#----------------------------------------------------------------------------------------------------
function fileUpload($File, $Upload_Type, $Dir_Path='')
{
	global $physical_path;
    $retVal 	= '';
    $destPath   = '';
    $destFile   = '';
	if(is_array($File))
    {
		switch($Upload_Type)
		{
			case ATTACHMENT:
				$destPath = $physical_path['Attachments'].$Dir_Path."/";
				break;
			case SELLER:
	            $destPath = $physical_path['Seller_Logo'];
	            break;
            case PORTFOLIO:
	            $destPath = $physical_path['Portfolio'];
	            break;   
			case CONTACT:
	            $destPath = $physical_path['Contact'];
	            break;	
			case PROJECT:
	            $destPath = $physical_path['Project'];
	            break;	
            case PRIVATE_MESSAGE:
	            $destPath = $physical_path['Private_Message'];
	            break;
			 case TEMP:
	            $destPath = $physical_path['Temp'];
	            break;										 					
			default:
	            $destPath = $Dir_Path."/";
	            break;
	    }
		$destFile 	= getUniqueFilePrefix(). strtolower(ereg_replace("[^[:alnum:].]", "", $File['name'])); 
	    $retVal 	= move_uploaded_file($File['tmp_name'], $destPath. $destFile); 
		@chmod($destPath. $destFile, 0744);
        if($retVal)
			return $destFile;
        else
        	return '';
    }
    else
    {
    	return '';
    }
}
function fileCopy($File,$Old_Dir_Path,$New_Dir_Path)
{
	global $physical_path;
    $retVal 	= '';
    $destPath   = '';
    $destFile   = '';
	$oldfile=$Old_Dir_Path.$File;
	$oldfilethumb=$Old_Dir_Path.'thumb_'.$File;
	//$file = substr($File,25);
	$file = substr(strstr($File, '_') , 1); 
	$destFile 	= getUniqueFilePrefix(). strtolower(ereg_replace("[^[:alnum:].]", "", $file));
	$retVal 	= copy($oldfile,$New_Dir_Path.$destFile );
	$retVal 	= copy($oldfilethumb,$New_Dir_Path.'thumb_'.$destFile );
	@chmod($New_Dir_Path.$destFile, 0744);
	if($retVal)
		return $destFile;
	else
		return '';
}

function getUniqueFilePrefix()
{
    list($usec, $sec) = explode(" ",microtime());
	list($trash, $usec) = explode(".",$usec);
    return (date("YmdHis").substr(($sec + $usec), -10).'_');
}

function getActivationStatus()
{
    list($usec, $sec) = explode(" ",microtime());
	list($trash, $usec) = explode(".",$usec);
    return (date("YmdHis").substr(($sec + $usec), -10).'');
}
#====================================================================================================
#	Function Name	:   getCheckBox
#====================================================================================================
function getCheckBox($arrName,$checkBoxName,$key, $val,$rowSize = 3,$selected=array(0))
{
	global $db;
	$strHTML = "";
	$i = 0;
	$j = 0;
		for($i=0; $i<$db->num_rows();)
		{
			$strHTML .= "<tr> ";
			$j = 0;
			  while($j < $rowSize && $db->next_record())
			   {
			   	 		if(in_array($db->f($key),$selected))
							$chk = "checked";
						else
							$chk = "";
						if($i == $db->num_rows())
						{
							break;
						}
					$strHTML .= "<td> ";
					$strHTML .= "<input type=\"checkbox\" class=\"stdCheckBox\" name=\"".$checkBoxName."[]\" value=\"".$db->f($key)."\"".$chk.">";
					$strHTML .= "&nbsp;".$db->f($val);
					$strHTML .= "</td> ";
					$j++;
				    $i++;
			   }
			$strHTML .= "</tr> ";
		}
	$db->free();
	return $strHTML;
}


#====================================================================================================
#	Function Name	:   getUniqueKey
#----------------------------------------------------------------------------------------------------
function getUniqueKey()
{
	return (mktime (date('G'),date('i'),date('s'),date('m'),date('d'),date('Y')));
}	

function deleteDirectory($file)
{
	@chmod($file,0777);
	if (is_dir($file))
	{
		$handle = opendir($file);
		while($filename = readdir($handle))
		{
			if ($filename != "." && $filename != "..")
			{
				unlink($file."/".$filename);
			}
 		}
		closedir($handle);
		rmdir($file);
	}
	else
	{
		@unlink($file);
	}
}

function recursive_remove_directory($directory, $empty=FALSE)
{
	// if the path has a slash at the end we remove it here
	if(substr($directory,-1) == '/')
	{
		$directory = substr($directory,0,-1);
	}
	if(!file_exists($directory) || !is_dir($directory))
	{
		// ... we return false and exit the function
		return FALSE;
		// ... if the path is not readable
	}
	elseif(!is_readable($directory))
	{
		// ... we return false and exit the function
		return FALSE;
		// ... else if the path is readable
	}
	else
	{
		// we open the directory
		$handle = opendir($directory);
		// and scan through the items inside
		while (FALSE !== ($item = readdir($handle)))
		{
			// if the filepointer is not the current directory
			// or the parent directory
			if($item != '.' && $item != '..')
			{
				// we build the new path to delete
				$path = $directory.'/'.$item;
				// if the new path is a directory
				if(is_dir($path)) 
				{
					// we call this function with the new path
					recursive_remove_directory($path);
					// if the new path is a file
				}
				else
				{
					// we remove the file
					unlink($path);
				}
			}
		}
		// close the directory
		closedir($handle);
		// if the option to empty is not set to true
		if($empty == FALSE)
		{
			// try to delete the now empty directory
			if(!rmdir($directory))
			{
				// return false if not possible
				return FALSE;
			}
		}

		// return success
		return TRUE;
	}
}
#====================================================================================================
#	Function Name	:   RandomPassword
#====================================================================================================
function RandomPassword($num_letters) 
{ 
	$array = array( 
					 "a","b","c","d","e","f","g","h","i","j","k","l", 
					 "m","n","o","p","q","r","s","t","u","v","w","x","y", 
					  "z","1","2","3","4","5","6","7","8","9" 
					 ); 
	$uppercased = 3; 
	mt_srand ((double)microtime()*1000000); 
	for($i=0; $i<$num_letters; $i++) 
		$pass .= $array[mt_rand(0, (count($array) - 1))]; 

	for($i=1; $i<strlen($pass); $i++) 
	{ 
		if(substr($pass, $i, 1) == substr($pass, $i-1, 1)) 
			$pass = substr($pass, 0, $i) . substr($pass, $i+1); 
	} 
	for($i=0; $i<strlen($pass); $i++) 
	{ 
		if(mt_rand(0, $uppercased) == 0) 
			$pass = substr($pass,0,$i) . strtoupper(substr($pass, $i,1)) . 
			substr($pass, $i+1); 
	} 
	$pass = substr($pass, 0, $num_letters); 
	return($pass); 
}

function getCategoryLinkPath($category_id,$i=0)
{
	global $db,$db1;
	$sql = " SELECT * FROM ".CATEGORY_MASTER
		 . " WHERE cat_id = '".$category_id."'";
	
	$db->query($sql);
	$rscnt = $db->num_rows();
	if($rscnt > 0)
	{
		$db->next_record();
		$navigation = getCategoryLinkPath($db->f('cat_parent_id'),$i+1);
		
		if($i != 0)
		{
			$sql1 = " SELECT * FROM ".CATEGORY_MASTER
				 . " WHERE cat_id = '".$category_id."'";
			$db1->query($sql1);
			$db1->next_record();
			$navigation .= ' :: <a href="category.php?cat_parent_id='.$category_id.'" class="actionLink"><strong>'.$db1->f('cat_name').'</strong></a>';
		}
		else
		{
			$sql1 = " SELECT * FROM ".CATEGORY_MASTER
				 . " WHERE cat_id = '".$category_id."'";
			$db1->query($sql1);
			$db1->next_record();
			$navigation .= ' :: <font class=varnormal>'.$db1->f('cat_name').'</font>';
		}
	}
	else
	{
		if($i != 0)
			$navigation = '<a href="category.php?cat_parent_id=0" class="actionLink"><strong>Path</strong></a>';
	}
	return $navigation;
}
function getLinkPath1($category_id,$i=0)
{
	global $db,$db1;
	$sql = " SELECT * FROM ".CATEGORY_MASTER
		 . " WHERE cat_id = '".$category_id."'";
	
	$db->query($sql);
	$rscnt = $db->num_rows();
	if($rscnt > 0)
	{
		$db->next_record();
		$navigation = getLinkPath1($db->f('cat_parent_id'),$i+1);
		
		if($i != 0)
		{
			$sql1 = " SELECT * FROM ".CATEGORY_MASTER
				 . " WHERE cat_id = '".$category_id."'";
			$db1->query($sql1);
			$db1->next_record();
			$navigation .= ' <a href="category_'.$category_id.'.html" class="footerlink">'.$db1->f('cat_name').'</a>'.' ::';
		}
		else
		{
			$sql1 = " SELECT * FROM ".CATEGORY_MASTER
				 . " WHERE cat_id = '".$category_id."'";
			
			$db1->query($sql1);
			$db1->next_record();
			$navigation .= '<label class=navigation>'.$db1->f('cat_name').'</label>';
		}
	}
	else
	{
		if($i != 0)
			$navigation = '';
	}
	
	return $navigation;
}
function getCategoryLinkPath_11($category_id,$i=0)
{
	global $db,$db1;
	$sql = " SELECT * FROM ".CATEGORY_MASTER
		 . " WHERE cat_id = '".$category_id."'";
	$db->query($sql);
	$rscnt = $db->num_rows();
	if($rscnt > 0)
	{
		$db->next_record();
		$navigation = getCategoryLinkPath_11($db->f('cat_parent_id'),$i+1);
		if($i != 0)
		{
			$sql1 = " SELECT * FROM ".CATEGORY_MASTER
				 . " WHERE cat_id = '".$category_id."'";
			$db1->query($sql1);
			$db1->next_record();
			$navigation .= ' <a href="category_'.$db1->f('cat_id').'.html" class="footerheader"><strong>'.$db1->f('cat_name').'</strong></a>';
		}
	}
	else
	{
		if($i != 0)
			$navigation = '<a href="index.html" class="footerheader"><strong>Home ::</strong></a> <a href="all_projects.php" class="footerheader"><strong>All Projects :: </strong></a>';
	}
	return $navigation;
}

function badWordDetect($Message)
{
	global $db;
	$sql = " SELECT * FROM ".BADWORD_MASTER;
	$db->query($sql);
	while($db->next_record())
	{
		$pattern = "/\b".$db->f('badword_value')."\b/i";
		$Message = preg_replace($pattern, "------", $Message);
	}
	return($Message);
}
function TotalAmount_Of_Traction($user_id)
{
	global $db;
	$total = 0;
	$sql = "SELECT * FROM ".PAYPAL_MASTER
		." WHERE user_auth_id = '".$user_id."'";	
	$db->query($sql);
	while($db->next_record())
	{
		if($db->f('trans_type') == '+')
			$total = $total + $db->f('amount') ;
		if($db->f('trans_type') == '-')
		   $total = $total - $db->f('amount') ;
	}
	if($total > 0.01)
	{
		$total = "+".$total;
	}
	if($total < 0)	
	{
		$total = $total;
	}
	return $total;
}
function Last_Traction($user_id)
{
	global $db;
		// This query must be the same to the Payment:ViewAll()
		$sql = "
				SELECT 
					*
				FROM (
						(
							SELECT 
								pp_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . PAYPAL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION
						(
							
							SELECT 
								mb_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . MONEYBOOKER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								mp_id, user_auth_id, user_login_id, usdAmount as amount, status, description, trans_type, date
							FROM 
								" . MERCADOPAGO_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION 
						(
							SELECT 
								dm_id, user_auth_id, user_login_id, usdAmount as amount, status, description, trans_type, date
							FROM 
								" . DINEROMAIL_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
						UNION
						(
							SELECT 
								nt_id, user_auth_id, user_login_id, amount, status, description, trans_type, date
							FROM 
								" . NETELLER_MASTER . "
							WHERE 
								user_auth_id = '" . $user_id . "'
						)
					) AS todas
				ORDER BY 
					date DESC"; 
	$db->query($sql);
	return($db->fetch_object(MYSQL_FETCH_SINGLE));
}


function Select_wallet_sum($user_auth_id)
{
		global $db;
		
		$sql = " SELECT * FROM ".MEMBER_MASTER." WHERE user_auth_id  = '".$user_auth_id."'";
		
		$db->query($sql);
		
		$db->next_record();
		
			if($db->f('wallet_sum') > 0.01)
			{
				$total = "+".$db->f('wallet_sum');
			}
			else
			{
				$total = $db->f('wallet_sum');
			}
		
		return $total;
}


function Update_wallet_sum($user_auth_id,$wallet_total)
{
		global $db;
	    
	    // actualizo el wallet del usuario con el neto
		$sql="UPDATE ".MEMBER_MASTER
		    ." SET "
			." wallet_sum = '".$wallet_total."' "
			." WHERE user_auth_id ='".$user_auth_id."'"; 
		$db->query($sql);
}


function Get_Cat_Names_Project($string)
	{
		global $db2;
		$new_string = "";
		$broken_string = explode(",",$string);
		
		foreach($broken_string as $key => $val)
		{
			$sql_cat = "SELECT * FROM ".CATEGORY_MASTER
					." WHERE cat_id= '".$val."' ";
			$db2->query($sql_cat);
			$db2->next_record();
			$new_string = $new_string.$db2->f("cat_name").",";
		}
		return (substr($new_string,0,-1));
	}
 function GetBid1($project_id) 
   {
	  global $db1;
	  $sql = "SELECT count(*) as cnt FROM ".BID_MASTER." WHERE project_id = '".$project_id."'"; 
	  $db1->query($sql);
	  $db1->next_record();
	  return ($db1->f('cnt'));
   }
function Get_Bids_By_Id1($pro_id)
	{
		global $db2;
		$sql= " SELECT count(*) AS Cnt ,SUM(bid_amount) AS Average_Bid ,SUM(delivery_within) AS Bid_Average_Time  FROM ".BID_MASTER 
			  ." WHERE project_id = '".$pro_id." ' AND decline = 1 AND bid_status = 1";
		$db2->query($sql);
		$db2->next_record();
		
		$cnt = $db2->f('Cnt');
		$db2->free();
		return ($db2->f('Cnt').",".$db2->f('Average_Bid').",".$db2->f('Bid_Average_Time'));
	}			   
	################################################################################################################
	# Function		: GetEmailAddress($user_auth_id)
	# Purpose		: This function is used to get details of user
	# Return		: value according to condition
	# Used At 		: accept_project.php,contact.php,edit_project.php,invite.php,private_message.php,private_message_from_user.php,
	#				  send_project.php,success.php,withdraw.php
	#(Admin side)	: withdraw_paypal.php
	# Parameters	
	# 1. $user_auth_id =>  user auth id
	# 2. $old_password =>  old password
	# 3. $user_password =>  new password
	################################################################################################################
	function GetEmailAddress($user_auth_id)
	{
		global $db;
		$sql =  "SELECT * "
			.   " FROM ". MEMBER_MASTER
			. 	" WHERE user_auth_id  = '". $user_auth_id. "'";
		$db->query($sql);
		$db->next_record();
		return ($db->f('mem_email'));
	}

	################################################################################################################
	# Function		: getActivationCode()
	# Purpose		: This function is used to generate activation code
	# Return		: value according to condition
	# Used At 		: signup process
	################################################################################################################
	function getActivationCode()
	{
		list($usec, $sec) = explode(" ",microtime());
		list($trash, $usec) = explode(".",$usec);
		return (date("YmdHis").substr(($sec + $usec), -10).'');
	}
   ################################################################################################################
	# Function		: Get_Sender_Name($user_auth_id)
	# Purpose		: This function is used to get details of user
	# Return		: value according to condition
	# Used At 		: account.php
	# Parameters	
	# 1. $user_auth_id =>  user auth id
	################################################################################################################
	function Get_Sender_Name($user_auth_id)
	{
		global $db;
		$sql =  "SELECT * "
			.   " FROM ". MEMBER_MASTER
			. 	" WHERE user_auth_id  = '". $user_auth_id. "'";
		$db->query($sql);
		$db->next_record();
		return ($db->f('user_login_id'));
	}
	
	################################################################################################################
	# Function		: Update_User_Rating($user_name,rate)
	# Purpose		: This function is used to upadting user rating
	# Used At 		: rating_to_user.php
	################################################################################################################
	function Seller_Rating($user_name)
	{
		global $db;
		$sql =  "SELECT count(*) as cnt "
			.   " FROM ". SELLER_RATING_MASTER
			. 	" WHERE rating_to_user  = '". $user_name. "'";
		$db->query($sql);	
		$db->next_record();
		return ($db->f('cnt'));
	}
	################################################################################################################
	# Function		: Sellect_Earning_Wallet($user_name)
	# Purpose		: This function is used to upadting user rating
	# Used At 		: 
	################################################################################################################
	function Sellect_Earning_Wallet($user_auth_id)
	{
			global $db;
			$sql = " SELECT * FROM ".MEMBER_MASTER." WHERE user_auth_id  = '".$user_auth_id."'";
			$db->query($sql);
			$db->next_record();
			return ($db->f('earn_by_site'));
   }
   ################################################################################################################
	# Function		: Sellect_Earning_Wallet($user_name)
	# Purpose		: This function is used to upadting user rating
	# Used At 		: 
	################################################################################################################
   function Update_earning_wallet($user_auth_id,$wallet_total)
	{
			global $db;
			$sql="UPDATE ".MEMBER_MASTER
				." SET "
				." earn_by_site = '".$wallet_total."' "
				." WHERE user_auth_id ='".$user_auth_id."'"; 
			return($db->query($sql));
	}
	
	function Get_Budget_Name($budget_id)
	{
		global $db;
		
		$sql = "SELECT * FROM ".DEVELOPMENT_COST
			 ." WHERE development_id= '".$budget_id."' ";
			 
		$db->query($sql);
		$db->next_record();
		return ($db->f("development_title"));
	}
    ################################################################################################################
	# Function		: Get_VIP($user_name)
	################################################################################################################
	
	function Get_VIP($project_post_to)
	{
	    global $db;
		$sql=" SELECT * FROM ".PROJECT_MASTER." AS PM "
		     ." LEFT JOIN ".MEMBER_MASTER." AS MM ON PM.project_post_to = MM.user_login_id "
  		     ." WHERE PM.project_post_to = '".$project_post_to."' ";
		$db->query($sql);
		$db->next_record();
		return ($db->f("membership_id"));
    }
	################################################################################################################
	# Function		: Get_VIP1($user_name)
	################################################################################################################
	
	function Get_VIP1($project_posted_by)
	{
	    global $db;
		$sql=" SELECT * FROM ".PROJECT_MASTER." AS PM "
		     ." LEFT JOIN ".MEMBER_MASTER." AS MM ON PM.project_posted_by = MM.user_login_id "
  		     ." WHERE PM.project_posted_by = '".$project_posted_by."' ";
		$db->query($sql);
		$db->next_record();
		return ($db->f("membership_id"));
    }
	
	################################################################################################################
	# Function		: Check_Vip_User($user_name)
	################################################################################################################
	
	function Check_Vip_User($user_login_id)
	{
	    global $db;
		/// return 0 for no vip
		/// return 1 for vip status
		$sql=" SELECT * FROM ".MEMBER_MASTER
  		     ." WHERE user_login_id = '".$user_login_id."' ";
		$db->query($sql);
		$db->next_record();
		if($db->f("membership_id") != 0)
		{
			/// check for status here from date.
//			$sql = "SELECT * FROM ".MEMBER_MASTER
//	  		      ." WHERE user_login_id = '".$user_login_id."'  AND " 
//				  ." DATEDIFF(now(),membership_finish_date) < 0";
//			$db->query($sql);
			return (1);
			
		}
		else
		{	
			return (0);
		}
    }

	################################################################################################################
	# Function		: Check_Vip_User($user_name)
	################################################################################################################
	
	function Check_Special_User($user_login_id)
	{
	    global $db;
		$sql=" SELECT * FROM ".MEMBER_MASTER
  		     ." WHERE user_login_id = '".$user_login_id."' ";
		$db->query($sql);
		$db->next_record();
		if($db->f("special_user") == 1)
		{
			return (1);
		}
		else
		{	
			return (0);
		}
    }
	
	################################################################################################################
	# Function		: Clean_Url($url)
	################################################################################################################
	
	
	function clean_url($text)
	{
		$text=strtolower($text);
		$code_entities_match = array(' ','--','&quot;','!','@','#','$','%','^','&','*','(',')','_','+','{','}','|',':','"','<','>','?','[',']','\\',';',"'",',','.','/','*','+','~','`','=');
		$code_entities_replace = array('-','-','','','','','','','','','','','','','','','','','','','','','','','','');
		$text = str_replace($code_entities_match, $code_entities_replace, $text);
		return $text;
	} 
	#====================================================================================================
	#	Function Name	:   ViewAllHomePageContent
	#   Admin Side	
	#----------------------------------------------------------------------------------------------------
    function ViewAllHomePageContent()
    {
		global $db;
		$sql = " SELECT * FROM ".HOMEPAGE_MASTER." ORDER BY home_id";

		# Show debug info
		$db->query($sql);
		return ($db->fetch_object());
    }



## print "sale de functions";

?>
