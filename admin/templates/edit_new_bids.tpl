<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" >
	<form name="frmNewBid" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top" colspan="2">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Bid Place On Project [ {$Action} ]</td>
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
					<td class="fieldlabelRight" valign="top" width="30%">User Name :</td>
					<td class="fieldLabelLeft">{$user_name}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Amount :</td>
					<td class="fieldLabelLeft">{$Curreny}&nbsp;{$bid}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Delivery (in days) :</td>
					<td class="fieldLabelLeft">{$delivery}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Description : </td>
				</tr>
				<tr>
					<td class="fieldlabelRight1" valign="top" colspan="2">{$EN_Page_Editor}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Make Bid Visible: </td>
					<td class="fieldLabelLeft">
						<input type="checkbox" name="bid_visible" value="1" class="stdCheckBox" {$bid_status}>	
					</td>
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
	<input type="hidden" name="bid_id" value="{$bid_id}" />
	<input type="hidden" name="bid_amount" value="{$bid}" />
	<input type="hidden" name="notification_alert" value="{$notification_alert}" />
	<input type="hidden" name="user_name" value="{$user_name}" />
	</form>
</table>