<?php 

define('IN_SITE', 	true);

include_once("../includes/common.php");
include_once($physical_path['DB_Access']. 'Security.php');

global $db;
$sql =  "SELECT user_auth_id, user_login_id, user_passwd1 FROM ". AUTH_USER
    . 	" WHERE user_type != 'Admin' ";
$db->query($sql);

$security = new Security();

echo '<b>Init Process</b>' . '<br />' . '<br />';

while($db->next_record())
{
	$sql_update	=	"UPDATE ". AUTH_USER." SET "
					.	" user_passwd1 = '". $security->encrypt($db->f('user_passwd1')) ."' "
					.	" WHERE user_auth_id  = '". $db->f('user_auth_id') . "' ";
	$db1->query($sql_update);

	echo 'User ' . $db->f('user_login_id') . ' has been updated.' . '<br />';
}

echo '<br />' . '<b>End of Process</b>' . '<br />';
exit;

?>