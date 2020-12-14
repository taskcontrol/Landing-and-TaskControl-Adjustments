<div id="list_head">

					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>

<form method="post" action="{$smarty.server.PHP_SELF}" name="frmWithdrawconfirm">
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
    <tr>
		<td>&nbsp;</td>
    </tr>
    <tr>
	    <td align="left" class="headingblack">{$Confirm}Confirm Withdrawal</td>
	</tr>
    <tr>
		<td valign="top">
			<table cellpadding="3" cellspacing="4" border="0" width="79%">
				<tr>
					<td width="28%" class="bodytextblack"><strong>{$method|ucfirst} Email: </strong></td>
					<td width="72%" class="bodytextblack">{$email_to}</td>
				</tr>
				<tr>
					<td class="bodytextblack"><strong>{$lang.Withdraw_Amount}: </strong></td>
					<td class="bodytextblack">{$lang.Curreny}&nbsp;{$with_amount}</td>
				</tr>
				<tr>
					<td class="bodytextblack"><strong>{$lang.Fee_Taken}: </strong></td>
					<td class="bodytextblack">{$lang.Curreny}&nbsp;{$total}</td>
				</tr>
				<tr>
					<td class="bodytextblack"><strong>{$lang.Amount_Received}: </strong></td>
					<td class="bodytextblack">{$lang.Curreny}&nbsp;{$rec_amount}</td>
				</tr>
		  </table>
		</td>
	</tr>
</table>
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="49%" class="bodytextblack" align="right">
		<input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Back}" class="login_txt style5"></td>
		<td>&nbsp;</td>
		<td width="49%" class="bodytextblack" align="left">
		<input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Submit}" class="login_txt style5">
		</td>
	</tr>
</table>

<input type="hidden" name="total" value="{$total}">
<input type="hidden" name="rec_amount" value="{$rec_amount}">
<input type="hidden" name="email_to" value="{$email_to}">
<input type="hidden" name="requested_date" value="{$requested_date}">
<input type="hidden" name="etimate_date1" value="{$etimate_date1}">
<input type="hidden" name="etimate_date2" value="{$etimate_date2}">
</form>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
	<div id="more_link">
		
	</div>
</div>
