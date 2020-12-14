<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmSiteConfig" action="{$A_Action}" method="post">
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Premium and Common Membership Settings</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr><td height="5"></td></tr>
				<tr><td class="successMsg" align="center">{$succMessage}</td></tr>
				<tr><td height="5"></td></tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
		
				<tr>
					<td class="fieldlabelRight" valign="top" width="35%">Portfolio available In Free </td>
					<td class="fieldlabelLeft">
						<input type="text" name="free_portfolio" class="textbox" value="{$free_portfolio}" />
					</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Portfolio available In Premium </td>
					<td class="fieldlabelLeft">
						<input type="text" name="premium_portfolio" class="textbox" value="{$premium_portfolio}" />
					</td>
				</tr>
			
				<tr><td class="divider" colspan="2"></td></tr>
				<tr>
					<td align="left" colspan="2">
						<input type="submit" name="Submit" value="Update" class="button" onclick="javascript: return Form_Submit(document.frmSiteConfig);">
						<input type="submit" name="Submit" value="Cancel" class="button">
					</td>
				</tr>
			</table>	
			<br>
		</td>
	</tr>
	</form>
</table>