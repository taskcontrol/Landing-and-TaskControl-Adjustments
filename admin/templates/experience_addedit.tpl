<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmExper" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Experience Year Management [ {$Action} ]</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center"><strong>{$Action} Experience Year.</strong></td>
				</tr>
				<tr><td height="2"></td></tr>
				<tr><td height="2"></td></tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="75%">
			{if $Action=='Edit'}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Name :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="expe_title" size="40" maxlength="50" value="{$expe_title}" class="textbox">
					</td>
				</tr>
			{else}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Name :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="en_expe_title" size="40" maxlength="50" class="textbox">
					</td>
				</tr>
			{/if}
				<tr>
					<td colspan="2" align="center">&nbsp;
							<input type="submit" name="Submit" value="Save" class="stdButton" onClick="javascript: return Validate_Form_SubCat(document.frmExper);">
							&nbsp;&nbsp;&nbsp;
							<input type="submit" name="Submit" value="Cancel" class="stdButton">
					</td>
				</tr>
			</table>	
			<br>
			<input type="hidden" name="Action" value="{$Action}"/>
			<input type="hidden" name="year_expe_id" value="{$year_expe_id}" />
			<br>
		</td>
	</tr>
	</form>
</table>