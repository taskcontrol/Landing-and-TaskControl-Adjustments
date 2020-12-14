<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmSiteConfig" action="{$A_Action}" method="post">
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Google Ad Code Management </td>
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
					<td class="fieldlabelRight" valign="top">Google Adsense Code (Size 468 X 60)</td>
					<td class="fieldlabelLeft">
						<textarea name="google_adsense" rows="3" cols="80" class="textbox">{$google_adsense}</textarea>
					</td>
				</tr>
				
				<tr>
					<td class="fieldlabelRight" valign="top">Google Adsense Code (Size 125 X 125)</td>
					<td class="fieldlabelLeft">
						<textarea name="google_adsense_125" rows="3" cols="80" class="textbox">{$google_adsense_125}</textarea>
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
		</td>
	</tr>
	</form>
</table>