<?php

$db = mysql_connect("localhost", "gurufree_script","280165");
mysql_select_db("gurufree_script",$db);
$result = mysql_query("SELECT * from project_master ORDER BY project_id DESC LIMIT 1",$db);
while ($myrow = mysql_fetch_row($result)) {
    $linkid=$myrow[0];
    $ce=$myrow[6];
    $link1=str_replace(" ","-",$ce);
    $link2=strtolower($link1);
    
}

$result = '';
for ($i=0; $i<strlen($link2); $i++) {
if (preg_match('([0-9]|[a-z]|_|-)', $link2[$i])) {
$result = $result . $link2[$i];
}
}
$finallink=$result;


$mainlink="http://www.gurufreelancerscript.com/project_".$linkid."_".$finallink.".html";
//print $mainlink;
include "twitter.php";
$twi_user = new Twitter("gurufreelancerscript","280165");
$user_text = "New project posted on www.gurufreelancerscript.com - $ce - $mainlink";
$twi_user->updateStatus($user_text);

?>