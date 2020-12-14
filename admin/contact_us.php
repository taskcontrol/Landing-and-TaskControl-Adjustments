<?php
define('IN_ADMIN', 	true);
define('IN_SITE', 	true);

include_once("../includes/common.php");
include_once($physical_path['DB_Access']. 'Contact_Us.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');
$contact  = new Contact_Us();

if ($_POST['Submit']=='Cancel')
{
	header("location: contact_us.php");
	exit();
}

#----------------------------------------------------------------------------------------------------
# Add Country
#----------------------------------------------------------------------------------------------------
elseif($Action == 'Add' && $_POST['Submit']=='Save')
{
    $contact->Insert($_POST);
	header("location: contact_us.php?add=true");
	exit();
}
#----------------------------------------------------------------------------------------------------
# Edit Country
#----------------------------------------------------------------------------------------------------
elseif($Action == 'Edit' && $_POST['Submit']=='Save')
{
    $contact->Update($_POST);
	header("location: contact_us.php?edit=true");
	exit();
}
#----------------------------------------------------------------------------------------------------
# Delete selected Country
#----------------------------------------------------------------------------------------------------
elseif($Action=='Delete' && $_POST['contact_id'])
{
	$contact->Delete($_POST['contact_id']);
	header("location: contact_us.php?del=true");
	exit();
}

#----------------------------------------------------------------------------------------------------
# Delete all selected Countries
#----------------------------------------------------------------------------------------------------
elseif($Action=='DeleteSelected')
{
	foreach($_POST['cat_prod'] as $key=>$val)
	{
		$contact->Delete($val)?'true':'false';
	}

	header("location: contact_us.php?del=true");
	exit();
}

elseif($Action == 'Order' && $_POST['Submit'] == 'Save')
{
	// Split the link order	
	$display_order = split(":", $_POST['display_order']);
	// Update the link position
	for($i=0; $i<count($display_order); $i++)
	{
		$contact->DisplayOrder_Contact($display_order[$i], $i);
	}
	header("location: contact_us.php");
	exit;
}

#----------------------------------------------------------------------------------------------------
# Listing all Countries	
#----------------------------------------------------------------------------------------------------
if($Action == '' || $Actopm == 'ShowAll')
{
	if ($_GET['add']=='true')
		$msg="Contact added successfully";
	elseif ($_GET['del']=='true')
		$msg="Contact deleted successfully";
	elseif ($_GET['edit']=='true')
		$msg="Contact updated successfully";
	
	
	$contact->ViewAll();
	$rscnt = $db->num_rows();
	
	$i=0;
	while($db->next_record())
	{
		$arr_contact[$i]['contact_id']		= $db->f('contact_id');
		$arr_contact[$i]['contact_country']	= $db->f('contact_country');
		$arr_contact[$i]['phone']			= $db->f('phone');
		$arr_contact[$i]['fax']				= $db->f('fax');
		$i++;
	}
	
	$tpl->assign(array("T_Body"					=>	'contact_showall'. $config['tplEx'],
						"JavaScript"			=>  array("contact.js"),
						"succMessage"			=>	$msg,
						"PageSize_List"	 		=>	$utility->fillArrayCombo($lang['PageSize_List'], $_SESSION['page_size']),
						"Loop"					=>	$rscnt,						
						"arr_contact"			=>	$arr_contact,
						));	
			
	if($_SESSION['total_record'] > $_SESSION['page_size'])
	{
		$tpl->assign(array('Page_Link' =>	$utility->showPagination($_SESSION['total_record'])
						));
	}
}

#----------------------------------------------------------------------------------------------------
# Add / Edit Country
#----------------------------------------------------------------------------------------------------

elseif($Action == 'Add')
{
	$tpl->assign(array("T_Body"					=>	'contact_addedit'. $config['tplEx'],
						"JavaScript"			=>  array("contact.js"),
						"Action"				=>	$Action,
						));

}
elseif($Action == 'Edit')
{
   	$ret = $contact->GetContact($_POST['contact_id']);

	$tpl->assign(array( "T_Body"				=>	'contact_addedit'. $config['tplEx'],
						"JavaScript"			=>  array("contact.js"),
						"Action"				=>	$Action,
						"contact_country"		=>	$ret->contact_country,
						"phone"					=>	$ret->phone,
						"fax"					=>	$ret->fax,
						"contact_id"			=>	$_POST['contact_id'],
						));

}
elseif($Action=='Order')
{
	$tpl->assign(array("T_Body"					=>	'contact_order'. $config['tplEx'],
						"JavaScript"			=>  array("contact.js"),
						"ACTION"				=>  'Order',
						));
						
	$contact->View_Development_Order();
	$rscnt = $db->num_rows();
	
	$i=0;
	while($db->next_record())
	{
	   
		$arr_contact_id[$i]			= $db->f('contact_id');
		$arr_contact_country[$i]	= $db->f('contact_country');
		$i++;
	}
	$tpl->assign(array(	"contact_id"			=>	$arr_contact_id,
						"contact_country"		=>	$arr_contact_country,
						"Loop"					=>	$rscnt,
				));
					
						
}

$tpl->display('default_layout'. $config['tplEx']);
?>