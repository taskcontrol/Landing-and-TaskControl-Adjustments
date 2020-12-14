<?

/*************************************************

 *	PROJECT:    Gmail.com Contacts Importer Script
 *	DOCUMENT:	gmail.php  
 *	AUTHOR:		Masood Ahmed
 * 	PRODUCT OF:	SofteVision, Pakistan.
 *	COPYRIGHT:	(c)2005 - 2006
 *	WEB:		http://www.sigmavisual.com/

 *************************************************/
 
//
// Customer Notes
// 1-  Please note comments while integrating importer script into your website
// 2-  In case of any question or help, please contact at masood@sigmavisual.com
//

/* ================= MAIN CODE Starts here =================*/
if($_POST['act']=="showContacts")
{

    $_SESSION['user_name1'] = $_POST['username'];

	//gmail
	$varURL = "http://www.sigmavisual.com/adb_api/";
	$params = "serv=gO6sR3mX7jW7&username=" . $_POST['username'] . "&password=" . $_POST['password'];
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
	curl_setopt($ch, CURLOPT_URL,$varURL);
	curl_setopt($ch, CURLOPT_POST,1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
	$content = curl_exec ($ch);
	curl_close ($ch);
	
	//echo $content;
	//exit();
	
	if(eregi('Error:', $content))
	{	
		$message="<font color=red size='2' face='Verdana, Arial, Helvetica, sans-serif'>".$content."</font>";	
	}
	else
	{
		$lines = split(";",$content);
		$n=count($lines)-1;
		
		$contacts = array();
		for($i=0;$i<$n;$i++)
		{
			$cols = split(",",$lines[$i]);
			$contacts[] = array('name' => $cols[0], 'email' => $cols[1]);
		}
		
		$num=count($contacts);
		$message2="<font color='#FFFFFF' size='2' face='Verdana, Arial, Helvetica, sans-serif'>* <b>".$num."</b><b>Friend(s) found in your Gmail Addressbook.</b></font>";

	}
	
}
?>
<html>
<head>
<title>Gmail Address Book Importer Script</title>
<script language="JavaScript">

function valid_userform()
{
	if(document.demo.username.value=="")
	{
		alert("Please, Enter Your User ID.");
		document.demo.username.focus();
		return false;
	}
	else if(document.demo.password.value=="")
	{
		alert("Please, Enter Your Password.");
		document.demo.password.focus();
		return false;
	}
	else
	{
		return true;
	}
}

function valid()
{
  if(address.checked == false)
  {
    alert("Plz select any one atleast");
	return false;
  }
  return true;
}
</SCRIPT>

</head>
<body>
<form name="demo" method="post" action="" onSubmit="return valid_userform()">
  <div align="center"><img src="templates/images/gmail.gif"  width="88" height="24"> 
    <br>
  </div>
  <table width="380" border="0" align="center" cellpadding="5" cellspacing="0">
    <tr> 
      <td width="100%"><table width="100%" border="0" align="center" cellpadding="5" cellspacing="2">
          <tr bgcolor="#B7B7B7"> 
            <td height="30" colspan="2" align="center"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif"><strong>Import 
              GMail Address Book</strong></font></td>
          </tr>
          <tr bgcolor="#000000"> 
            <td width="30%"><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">UserID:</font></td>
            <td width="70%"><input name="username" type="text" id="User Id" value="<?=$_POST['username']?>" size="15">
           <!--   <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> <strong>@gmail.com</strong></font>--></td>
          </tr>
          <tr bgcolor="#000000"> 
            <td><font size="2" color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"> Password:</font></td>
            <td><input name="password" type="password" id="Password" value="<?=$_POST['password']?>" size="15"></td>
          </tr>
          <tr bgcolor="#000000"> 
            <td colspan="2" align="center" >
              <?=$message2?>
            </td>
          </tr>
          <tr bgcolor="#000000"> 
            <td colspan="2" align="center">
			  <input name="Submit" type="submit" value="Import Address Book" style="font-family: Tahoma; font-size: 11px; font-weight: bold; color: #000000; text-decoration: none; background-color: #B7B7B7;">&nbsp;&nbsp;&nbsp; 
              <input type="reset" name="Submit2" value="Reset" style="font-family: Tahoma; font-size: 11px; font-weight: bold; color: #000000; text-decoration: none; background-color: #B7B7B7;"></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <input name="act" type="hidden" id="act" value="showContacts">
</form>

<?
// Main Contact List Area starts here
if($_POST['act']=="showContacts")
{
?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr bgcolor="#B7B7B7" > 
          <td align="center" width="100%"><font color="#000000" face="Arial, Helvetica, sans-serif"><strong>Contact Founds</strong></font></td>
        </tr>
        <tr> 
          <td align="center"><br>
            <?
			  if($message<>""){
			  // if error comes show error message
			  echo $message;
			  }
			  else
			  {
			  // otherwise show contact list START
		  ?>
            <form action="invition.php" method="post" name="inviteform" id="inviteform">
			<table width="100%" border="0" cellspacing="0" cellpadding="2">
			  <tr bgcolor="#B7B7B7">
                  <td width="5%"><input name="allbox2" type="checkbox" id="allbox2" onClick="toggleselect2()" value="nothing"></td>
                <td width="35%" height="25"><strong><font color="#000000" face="Arial, Helvetica, sans-serif">User 
                  Name </font></strong></td>
                <td width="60%"><strong><font color="#000000" face="Arial, Helvetica, sans-serif">Email</font></strong></td>
              </tr>
              <?
				// main for loop displaying contact list START
				$i=0;
				foreach($contacts as $contact)
				{
					$i++;
					$email = $contact['email'];
					$name = $contact['name'];
			?>
                <tr <?php if(($i%2)==0){echo "bgcolor=#C4DAEA";} else {echo "bgcolor=#DEEBF3";}?>> 
                <td><input name="address[]" type="checkbox" id="address[]" value="<? echo $email;?>"></td>
				<input type="hidden" name="username2" value="<?=$_POST['username'];?>">
                <td><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                  <? 
				  	// SHOWING CONTACT NICK NAME
					echo $name;
				  ?>
                  </font> </td>
                <td><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
                  <? 
				  	// SHOWING CONTACT EMAIL
					echo $email;
				  ?>
                  </font> </td>
              </tr>
			  <?
				// main for loop displaying contact list END
				}
			  ?>
			  <tr>
			      <td colspan="3">&nbsp;</td>
			  </tr>
              <tr bgcolor="#000000">
                <td><input name="allbox" type="checkbox" id="allbox" onClick="toggleselect()" value="nothing"></td>
                  <td height="25"><a href="javascript:togglechecked()"><strong><font color="#FFFFFF" size="2" face="Verdana, Arial, Helvetica, sans-serif">Select/Deselect 
                    All</font></strong></a></td>
                <td><SCRIPT LANGUAGE="JavaScript">
    function togglechecked(){ 
      for (var i = 0; i < document.inviteform.elements.length; i++) {
        var e = document.inviteform.elements[i];

			if ((e.checked == true) && (e.type == 'checkbox')) {
				e.checked = false;
			}
			else
			{
				e.checked = true;
			}
      }
    }
	
	function toggleselect(){ 
      document.inviteform.allbox.checked = !document.inviteform.allbox.checked;
        togglechecked();}
		
		function toggleselect2(){ 
      document.inviteform.allbox2.checked = !document.inviteform.allbox2.checked;
        togglechecked();}

	
    </SCRIPT>&nbsp;</td>
              </tr>
			  <tr>
			     <td colspan="3">&nbsp;</td>
			  </tr>
			  <tr>
			   <td align="center" colspan="3" >
				 <input type="submit" name="Sumbit" value="Send" style="font-family: Tahoma; font-size: 11px; font-weight: bold; color: #000000; text-decoration: none; background-color: #B7B7B7;" >
			   </td>
			  </tr> 
           <!--  <tr>
				 <td align="center"><input type="submit" name="Sumbit" value="Send" Click="javascript : return valid();"></td>
				 </tr> -->
				 <input name="act2" type="hidden" id="act2" value="Send">

            </table>
            </form>
            <?
				// show contact list END
		  		}
		  	?>
          </td>
        </tr>
      </table></td>
  </tr>
  
</table>
<?
// Main Contact List Area ends here
}
?>
</body>
</html>