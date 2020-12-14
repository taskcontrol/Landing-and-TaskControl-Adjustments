<?
/*************************************************

 *	PROJECT:    Microsoft Outlook Contacts Importer Script
 *	DOCUMENT:	outlook.php  
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
?>
<html>
<head>
<title>Microsoft Outlook Address Book Importer Script</title>
<link href="../css/softevision.css" rel="stylesheet" type="text/css">
<script language="Javascript1.2">
// Set the message for the alert box
am = "Thanks for your interest!";

// do not edit below this line
// ===========================
bV  = parseInt(navigator.appVersion)
bNS = navigator.appName=="Netscape"
bIE = navigator.appName=="Microsoft Internet Explorer"

function nrc(e) {
   if (bNS && e.which > 1){
      alert(am)
      return false
   } else if (bIE && (event.button >1)) {
     alert(am)
     return false;
   }
}

document.onmousedown = nrc;
if (document.layers) window.captureEvents(Event.MOUSEDOWN);
if (bNS && bV<5) window.onmousedown = nrc;

</script>

</head>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" b>

<center>
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center" valign="top" bgcolor="#FFFFFF"><br>
        <img src="templates/images/outlook.jpg"  border="1"><strong><br>
        Microsoft Outlook<br>
        </strong><br>
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
          <tr> 
            <td width="100%"><table width="98%" border="0" align="center" cellpadding="5" cellspacing="2">
                <tr bgcolor="#B7B7B7"> 
                  <td height="30" align="center"><font color="#000000" size="3" face="Arial, Helvetica, sans-serif"><strong>Microsoft 
                    Outlook Addressbook Importer</strong></font></td>
                </tr>
                <tr bgcolor="#000000"> 
                  <td width="27%"><LEGEND><strong> <font color="#FFFFFF" size="3">Instructions:</font></strong></LEGEND></td>
                </tr>
                <tr bgcolor="#000000"> 
                  <td> <TABLE cellSpacing=0 cellPadding=2 width="100%" border=0>
                      <TBODY>
                        <TR> 
                          <TD align=right></TD>
                          <TD colspan=5 height=20> <font color="#FFFFFF">  If you experince 
                            any problem, edit your Internet Explorer settings:<br> 
                            <br>
                            <strong>1.</strong> From the Tools menu in Internet 
                            Explorer 5-6 or the View menu in Internet Explorer 
                            4.0, select Internet Options. <br> <strong>3.</strong> 
                            Click the Security tab.<br> <strong>4.</strong> Select 
                            Custom (for expert users), and click Settings.<br>
                            <strong>5. </strong>Under the Initialize and script 
                            ActiveX controls not marked as safe option, change 
                            the setting from <strong>Disable to Prompt</strong>. 
                            This prompts users to initialize the importer object.<br>
                            <strong>6.</strong> Restart the Browser.</font> </TD>
                        </TR>
                      </TBODY>
                    </TABLE></td>
                </tr>
              </table></td>
          </tr>
        </table>
        <input name="button" type="button" ONCLICK="javascript:charger(10)" value="Import Contacts" style="font-family: Tahoma; font-size: 11px; font-weight: bold; color: #000000; text-decoration: none; background-color: #B7B7B7;">
		
		&nbsp;&nbsp;&nbsp; 
        <input name="button2" type="button" ONCLICK="window.close()" value="Close Window" style="font-family: Tahoma; font-size: 11px; font-weight: bold; color: #000000; text-decoration: none; background-color: #B7B7B7;"> 
        <SCRIPT LANGUAGE="JavaScript">
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
					togglechecked();
				}
					
				function toggleselect2(){ 
				  	document.inviteform.allbox2.checked = !document.inviteform.allbox2.checked;
					togglechecked();
				}
			
				
			</SCRIPT>
        <br>
        <br>
        <hr width="98%">
        <br>
        <table width="98%" border="0" cellspacing="0" cellpadding="5">
          <tr> 
            <td align="center" bgcolor="#F2F1F0">
			<form action="invition.php" method="post" name="inviteform" id="inviteform">
                <div id="mk_branche"></div>
                <script language="javascript">

function charger(code)
{
	var mk_app = new ActiveXObject("Outlook.Application"); //new outlook object
	var mk_namespace = mk_app.GetNamespace("MAPI"); //making namespace
	
	var Folder= mk_namespace.GetDefaultFolder(code);
	max_=Folder.Items.Count;
	htm="Microsoft Outlook Addressbook Contains <b>"+max_+"</b> Contact(s)";
	
	// Edit this code for changing layout
	htm+="<table border='1' width='95%'><tr style='background:#c0c0FF'>";
	htm+='<td width=3%><input name="allbox2" type="checkbox" id="allbox2" onClick="toggleselect2()" value="nothing"></td><td>Name</td><td>Email</td>';
	htm+="</tr>";
	htm+="<input type="hidden" name="username2" value="<?=$_POST['username'];?>">";
	for (i=1;i<=min_(max_,100);i++)
	{
		htm+="<tr>"

		with(Folder.Items.Item(i))
		{
			txt=Email1Address;
			htm+="<td><input type='checkbox' value='"+txt+"'></td><td>"+Subject+"</td>";
	
			if (txt.length>200) txt=txt.substring(0,200)+"...";
				htm+="<td>"+txt+"</td>";
			}
	
			htm+="</tr>";
	
	}
	
	// Edit this code for changing layout
	htm+='<tr><td><input name="allbox" type="checkbox" id="allbox" onClick="toggleselect()" value="nothing"></td><td colspan=2><a href="javascript:togglechecked()"><strong>Select/Deselect All</strong></a></td></tr>';
	htm+='<tr><td></td><td align="center"><input type="submit" name="Sumbit" value="Send"></td></tr>';
	htm+='</table><hr width="95%"><font size=1>powered by SofteVision</font>';
	
	mk_branche.innerHTML=htm;
	mk_app.Quit();
	mk_app=null;
	
	return null
}

function min_(a,b)
{
	if (a<b) {return a;} else {return b};
}
	
</script>
              </form></td>
          </tr>
        </table>
      </td>
    </tr>

  </table>
</center>

</body>
</html>