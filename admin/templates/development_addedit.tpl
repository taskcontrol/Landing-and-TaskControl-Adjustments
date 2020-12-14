<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmDevelopment" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Development Cost Management [ {$Action} ]</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center"><strong>{$Action} Development Cost.</strong></td>
				</tr>
				<tr><td height="2"></td></tr>
				<tr><td height="2"></td></tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="75%">
			{if $Action=='Edit'}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Name :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="development_title" size="40" maxlength="50" value="{$development_title}" class="textbox">
					</td>
				</tr>
			{else}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%"> Name :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="en_development_title" size="40" maxlength="50" class="textbox">
					</td>
				</tr>
			{/if}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%"> Devlopment Max Amount :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="dev_max_amount" size="40" maxlength="50" class="textbox" value="{$dev_max_amount}">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">&nbsp;
							<input type="submit" name="Submit" value="Save" class="stdButton" onClick="javascript: return Validate_Form_SubCat(document.frmDevelopment);">
							&nbsp;&nbsp;&nbsp;
							<input type="submit" name="Submit" value="Cancel" class="stdButton">
					</td>
				</tr>
			</table>	
			<br>
			<input type="hidden" name="Action" value="{$Action}"/>
			<input type="hidden" name="development_id" value="{$development_id}" />
			<br>
		</td>
	</tr>
	</form>
</table>