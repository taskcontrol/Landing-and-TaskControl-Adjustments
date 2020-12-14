<html>
<head>
	<title>{$Site_Title}</title>
	<meta name="title" 			content="{$Meta_Title}">
	<meta name="description" 	content="{$Meta_Description}">
	<meta name="keywords" 		content="{$Meta_Keyword}">
	<link href="{$Templates_CSS}style.css" rel="stylesheet" type="text/css">
	<script language="javascript" src="{$Templates_JS}validate.js"></script>
	<script language="javascript" src="{$Templates_JS}functions.js"></script>
    {section name=FileName loop=$JavaScript}
    <script language="javascript" src="{$Templates_JS}{$JavaScript[FileName]}"></script>
	{/section}
</head>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30%" height="199" class="norepet">&nbsp;</td>
    <td width="30%" align="center" valign="bottom" class="norepet"></td>
    <td width="30%" align="right" class="norepet"></td>
  </tr>
  <tr>
    <td height="199" class="norepet">&nbsp;</td>
    <td align="center" class="norepet"><table width="267" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="49" background="{$Templates_Image}login_bg01.gif" class="border1"><table width="231" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="38"><img src="{$Templates_Image}administrator_icon.gif" width="38" height="38"></td>
            <td align="right"><img src="{$Templates_Image}administrator_hed.gif" width="184" height="14"></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="267" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="167" background="{$Templates_Image}login_bg.gif" class="border">
		<form name="frmLogin" action="{$A_Login}"  method="post" onSubmit="JavaScript: return Form_Submit(this);">
		<table width="95%" border="0" align="center" cellpadding="6" cellspacing="0">
          <tr>
            <td width="40%" align="right" class="bodytextgray"><strong>USERNAME:</strong></td>
            <td width="60%"><input type="text" class="text"  name="username"  value="{$smarty.post.username}" size="18" maxlength="25" tabindex="1"></td>
          </tr>
          <tr>
            <td width="40%" align="right" class="bodytextgray"><strong>PASSWORD:</strong></td>
            <td width="60%"><input  type="password" class="text" name="password"  maxlength="15" size="18" tabindex="2"></td>
          </tr>
			<tr><td class="bodytextgray" colspan="2" height="5"></td></tr>
          <tr>
            <td align="center" class="bodytextgray" colspan="2">
			<input  type="submit" name="Submit" value="Login" class="button" onClick="javascript: return Form_Submit(document.frmLogin);" tabindex="3">
				<br>
					<br><a href=http://www.goitglobal.com/contact.php>Contact us for admin username and password</a>
			</td>
          </tr>
        </table>
		</form>
		</td>
      </tr>
    </table></td>
    <td class="bodytextgray" align="right">
	
	
    </td>
  </tr>
</table>
</body>
</html>
