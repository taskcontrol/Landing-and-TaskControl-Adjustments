<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >
	<form name="frmPrivateMsg" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top" colspan="2">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Private Messages On Project [ {$Action} ]</td>
				</tr>
				<tr>
				    <td>&nbsp;</td>
				</tr>
				<tr><td class="successMsg" align="center">&nbsp;{$SuccMsg}</td></tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="75%">
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Form :</td>
					<td class="fieldLabelLeft">{$form}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">To :</td>
					<td class="fieldLabelLeft">{$to}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Date :</td>
					<td class="fieldLabelLeft">{$date}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Description : </td>
				</tr>
				<tr>
					<td class="fieldlabelRight1" valign="top" colspan="2">{$EN_Page_Editor}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">&nbsp;
							<input type="submit" name="Submit" value="Save" class="stdButton">
							&nbsp;&nbsp;&nbsp;
							<input type="submit" name="Submit" value="Cancel" class="stdButton">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<input type="hidden" name="Action" value="{$Action}" />
	<input type="hidden" name="project_id" value="{$project_id}" />
	<input type="hidden" name="pm_id" value="{$pm_id}" />
	</form>
</table>