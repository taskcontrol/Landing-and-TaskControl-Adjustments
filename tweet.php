<?php

$db = mysql_connect("localhost", "c1taskcontrol","j6BRh3gN65tXnE");
mysql_select_db("c1bairesda_taskcontrol",$db);
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


$mainlink="http://www.goitglobal.com/project_".$linkid."_".$finallink.".html";
//print $mainlink;
include "twitter.php";
$twi_user = new Twitter("goitglobal","jl1pc2gh3rs4");
$user_text = "New project posted on www.goitglobal.com - $ce - $mainlink";
$twi_user->updateStatus(substr($user_text, 0, 140));

?>
