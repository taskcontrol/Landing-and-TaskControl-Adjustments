<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmPage" action="{$smarty.server.PHP_SELF}" method="post">
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" background="{$Templates_Image}title_bg.gif" height="25">Condition Manager</td>
					<td class="pagetitle" width="51%" height="25" align="right"><a href="JavaScript: HELP('condition');" class="graylink"><strong>Help</strong></a>&nbsp;&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
			    <tr>
					<td class="fieldLabelRight2" valign="top" colspan="2">Condition Content:</td>
				</tr>
				<tr>
					<td align="center" colspan="2" class="fieldLabelRight2"><textarea name="en_content" cols="100" rows="15">{$en_content}</textarea></td>
				</tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td class="divider" colspan="4"></td></tr>
				<tr>
					<td align="left" colspan="2">
						<input type="submit" name="Submit" value="Save" class="stdButton">
						<input type="submit" name="Submit" value="Cancel" class="stdButton">
						<input type="hidden" name="Action" value="Update">
					</td>
				</tr>
			</table>	
			<br>
		</td>
	</tr>
	</form>
</table>