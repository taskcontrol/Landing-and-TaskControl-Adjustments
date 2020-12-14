<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Send project</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->




<form method="post" action="{$smarty.server.PHP_SELF}" name="frmsendProject">
<table width="95%" bgcolor="#ffffff" border="0" align="center">
	<tr>
		<td>
			<table width="90%" border="0"  align="center">
				<tr>
					<td class="bodytextblack" colspan="2"><strong>{$lang.Send_Project} </strong></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<!--<tr>
					<td class="bodytextblack" width="12%"><strong>{$lang.Email} : </strong></td>
					<td class="bodytextblack" width="88%"><input name="email_address" size="40" /></td>
				</tr>-->
				<tr>
						<td width="12%" class="bodytextblack">{$lang.Email} :</td>
						
						
						<td width="88%">
						 <table cellpadding="0" cellspacing="0" border="0">
						   <tr>
						     <td><</td>
								<td height="26" style="background-color:#FFFFFF;"><input name="email_address"  type="text" style="border:1px solid #000000;" tabindex="1" size="40" /></td>
								<td></td>
								<td></td>
						   </tr>
						   </table>
						</td>
						
					
						
						
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="bodytextblack" colspan="2"><strong>{$lang.Comment} :</strong> <br />
					  <br>
				  	<textarea name="Comment" cols="90" rows="10" tabindex="2"></textarea></td>
				</tr>
			</table>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
				   <td width="49%" align="right" class="bodytextblack1"><input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Submit}" onClick="Javascript: return Check_Details(this.form);" tabindex="3"/> <!--onClick="Javascript: return Check_Details(this.form);"-->&nbsp;&nbsp;
				   
				   <input class="login_txt style5" type="submit" id="btnbg" name="Submit" value="{$lang.Button_Close}" tabindex="4" onclick="Javascript: javascript:window.close();"/>
								
				   </td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<input type="hidden" name="Action" value="Send_Mail" />
<input type="hidden" name="project_id" value="{$pro_id}">
</form>