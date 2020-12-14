<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmproject_mail" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Project Mail [ {$Action} ]</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="90%">
				<tr>
					<td width="24%" valign="top" class="fieldlabelRight">UserID :</td>
					<td width="25%" valign="top" class="fieldlabelLeft">{$user_mail_id} </td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Subject :</td>
					<td class="fieldlabelLeft" valign="top">Notification about your project</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Content :</td>
					<td class="fieldlabelLeft" valign="top">
					<textarea name="content" cols="50" rows="5">Hello, This is a notification about your project : {$project_name}. This project is not valid according to our Terms of service.Please read the terms and correct project details</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="left"><input type="submit" name="Submit" value="Back" class="stdButton">&nbsp;&nbsp;
                      &nbsp;&nbsp;<input type="submit" name="Submit" value="Send" class="stdButton" onClick="Javascript: return Check_Details(this.form);"></td>
				</tr>
			</table>	
			<br>
			<input type="hidden" name="Action" value="{$Action}"/>
			<input type="hidden" name="user_mail_id" value="{$user_mail_id}"/>
			<input type="hidden" name="project_id" value="{$project_id}"/>
			<br>
		</td>
	</tr>
	</form>
	</table>