<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmEmailNewsletter" action="{$smarty.server.PHP_SELF}" method="post" >
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Email Newsletter [ {$Action} ]</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center"><strong>{$Action} Send Emails.</strong></td>
				</tr>
				<tr>
					<td align="center"><strong>{$en_message}</strong></td>
				</tr>				
				<tr><td height="2"></td></tr>
				<tr><td height="2"></td></tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="75%">
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Email Subject :</td>
					<td class="fieldLabelLeft">
						<input type="text" name="en_email_subject" size="40" maxlength="50" value="{$en_email_subject}" class="textbox">
					</td>
				</tr>
			
			<!-- 	
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Email Sending :</td>
					<td class="fieldLabelLeft"></td>
				</tr>
			-->
			
			<!--
			     <tr>
					<td class="fieldlabelRight" valign="top" width="30%"></td>
					<td class="fieldLabelLeft">
						<input type="checkbox" id="email_receiver_buyer" name="email_receiver_buyer" value="1"/>
						<span>Buyers</span>
					</td>
				</tr>
			
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%"></td>
					<td class="fieldLabelLeft">
						<input type="checkbox" id="email_receiver_seller" name="email_receiver_seller" value="1"/>
						<span>Sellers</span>
					</td>
				</tr>
			-->
			
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%">Areas:</td>
					<td class="fieldLabelLeft">{$categoryList}</td>
				</tr>
				{section name=CatList loop=22}
				<tr>
					<td class="fieldlabelRight" valign="top" width="30%"></td>
					<td class="fieldLabelLeft">
						<input type="checkbox" id="email_areas[]" name="email_areas[]" value="{$arr_cat[CatList].id}"/>
						<span>{$arr_cat[CatList].name}</span>
					</td>
				</tr>
				{/section}
				<tr>
					<td class="fieldLabelRight">Email Content:</td>
					<td class="fieldLabelLeft" width="50%">&nbsp;</td>
				</tr>
				<tr>
					<td class="fieldLabelLeft" colspan="2" align="center">
						{$Page_Editor}
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">&nbsp;
						<input type="submit" name="Submit" value="Save" class="stdButton" onClick="javascript: return Validate_Form(document.frmEmailNewsletter);">
						&nbsp;&nbsp;&nbsp;
						<input type="submit" name="Submit" value="Cancel" class="stdButton">
					</td>
				</tr>
			</table>	
			<br>
			<input type="hidden" name="Action" value="Send"/>
			<br>
		</td>
	</tr>
	</form>
</table>