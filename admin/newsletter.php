<?php

#====================================================================================================
#	Include required files
#----------------------------------------------------------------------------------------------------
define('IN_SITE', 	true);
define('IN_ADMIN', 	true);

include_once("../includes/common.php");
include_once($physical_path['DB_Access']. 'Newletter.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : 'ViewAll');


$newsletter = new Newletter();
#-----------------------------------------------------------------------------------------------------------------------------
#	Cancel
#-----------------------------------------------------------------------------------------------------------------------------
if ($_POST['Submit2'] == 'Cancel')
{
	header("location: newsletter.php");
	exit();
}
#----------------------------------------------------------------------------------------------------
# Add Newsletter
#----------------------------------------------------------------------------------------------------
elseif($Action == 'Add' && $_POST['Submit'] == 'Save')
{
    $newsletter->Insert($_POST);
	header("location: newsletter.php?add=true");
	exit();
}
elseif($Action == 'Edit' && $_POST['Submit']=='Save')
{
    $newsletter->Update($_POST);
	header("location: newsletter.php?edit=true");
	exit();
}
elseif($Action=='Delete')
{
	$newsletter->Delete($_POST['news_id']);
	header("location: newsletter.php?del=true");
	exit();
}
elseif($Action=='DeleteSelected')
{
	foreach($_POST['cat_prod'] as $key=>$val)
	{
			$val = $newsletter->Delete($val)?'true':'false';			
	}

	header("location: newsletter.php?delall=true");
	exit();
}

#=======================================================================================================================================
#											RESPONSE CREATING CODE
#---------------------------------------------------------------------------------------------------------------------------------------

if($Action == 'ViewAll' || $Action == '')
{
	if($_GET['edit']==true)
		$succMessage = "Newsletter has been updated successfully!!";
	elseif($_GET['add']==true)
		$succMessage = "Newsletter has been added successfully!!";
	elseif($_GET['del']==true)
		$succMessage = "Newsletter has been deleted successfully!!";	
    elseif($_GET['delall']==true)
		$succMessage = "All newsletters has been deleted successfully!!";		
	
	
	$tpl->assign(array( "T_Body"			=>	'newsletter_showall'. $config['tplEx'],
						"JavaScript"	    =>  array("newsletter.js"),
						"A_Action"		    =>	"newsletter.php",
						"succMessage"	    =>	$succMessage,
						"PageSize_List"		=>	$utility->fillArrayCombo($lang['PageSize_List'], $_SESSION['page_size']),						

						));
								
    $newsletter->ViewAll();
	$rscnt = $db->num_rows();
	
	$i=0;
	while($db->next_record())
	{
	   	$arr_newsletter[$i]['id']		= $db->f('news_id');
		$arr_newsletter[$i]['title']	= $db->f('news_title');
		$arr_newsletter[$i]['desc']		= $db->f('news_description');
		$arr_newsletter[$i]['date']		= $db->f('Submitted_date');
		$i++;
	}
	$tpl->assign(array(	"newsletter"	   	=>	$arr_newsletter,
						"Loop"				=>	$rscnt,
						"news_id"           =>  $db->f('news_id'),
				));
	
					
	if($_SESSION['total_record'] > $_SESSION['page_size'])
	{
		$tpl->assign(array('Page_Link' =>	$utility->showPagination($_SESSION['total_record'])
						));
	}
		
				
}	

elseif($Action == 'Add')
{
	$tpl->assign(array("T_Body"					=>	'newsletter_addedit'. $config['tplEx'],
						"JavaScript"			=>  array("newsletter.js"),
						"Action"				=>	$Action,
						));

}
elseif($Action == 'Edit')
{
    $ret = $newsletter->Getnewsletter($_POST['news_id']);
	
	
	$tpl->assign(array("T_Body"						=>	'newsletter_addedit'. $config['tplEx'],
						"JavaScript"				=>  array("newsletter.js"),
						"Action"					=>	$Action,
						"title"						=>	$ret->news_title,
						"desc"						=>	$ret->news_description,
						"news_id"					=>	$ret->news_id,
					));

}	
$tpl->display('default_layout'. $config['tplEx']);
?>
