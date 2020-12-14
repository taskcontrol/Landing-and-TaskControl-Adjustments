<table border="0" cellpadding="0" cellspacing="1" width="95%" class="stdTableBorder" height="97%">
	<form name="frmSiteConfig" action="{$A_Action}" method="post">
	<tr>
		<td valign="top">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td class="pagetitle" width="49%" height="25">Site Config </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td class="varnormal">
						Change your company title, browser title, meta title, keywords & description, copyright text and click <b>Update</b> to save the changes.
						Click <b>Cancel</b> to discard the changes.
					</td>
				</tr>
				<tr><td height="5"></td></tr>
				<tr><td class="successMsg" align="center">{$succMessage}</td></tr>
				<tr><td height="5"></td></tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Currency Related</strong></td>
				</tr>
				<tr>
					<td width="26%" valign="top" class="fieldlabelRight">1 Euro </td>
					<td width="24%" class="fieldlabelLeft"><input type="text" name="euro_dollar" class="textbox" value="{$euro_dollar}" />
					&nbsp;USD</td>
					<td width="23%" valign="top" class="fieldlabelRight">1 USD </td>
					<td width="27%" class="fieldlabelLeft"><input type="text" name="dollar_euro" class="textbox" value="{$dollar_euro}" />&nbsp;Euro</td>
				</tr>
			</table>
			<BR />
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Project Related</strong></td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Project Post Deposite (Refundable)</td>
				  <td class="fieldlabelLeft"><input type="text" name="fees_Taken_for_post_project" class="textbox" value="{$fees_Taken_for_post_project}" />&nbsp;{$Curreny}</td>
					<td class="fieldlabelRight" valign="top">Minimum amount required in wallet to Post Project</td>
				  <td class="fieldlabelLeft"><input type="text" name="project_post_deposite" class="textbox" value="{$project_post_deposite}" />&nbsp;{$Curreny}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Edit Project</td>
					<td class="fieldlabelLeft"><input type="text" name="edit_bid" class="textbox" value="{$edit_bid}" />&nbsp;(times)</td>
					<td class="fieldlabelRight" valign="top">Minimum Amount needed to place Bid </td>
				  <td class="fieldlabelLeft"><input type="text" name="minimum_bid_place" class="textbox" value="{$minimum_bid_place}" />&nbsp;{$Curreny}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Urgent Project Fees</td>
				  <td class="fieldlabelLeft"><input type="text" name="urgent_project_fee" class="textbox" value="{$urgent_project_fee}" />&nbsp;{$Curreny}</td>
					<td class="fieldlabelRight" valign="top">&nbsp; </td>
					<td class="fieldlabelLeft">&nbsp;</td>
				</tr>
			</table>
			<BR />
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Payment and Withdraw Related</strong></td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Minimum Deposite Amount </td>
				  <td class="fieldlabelLeft"><input type="text" name="minimum_deposite_amount" class="textbox" value="{$minimum_deposite_amount}" />&nbsp;{$Curreny}</td>
					<td class="fieldlabelRight" valign="top">Minimum Withdaw Amount </td>
				  <td class="fieldlabelLeft"><input type="text" name="minimum_withdaw_amount" class="textbox" value="{$minimum_withdaw_amount}" />&nbsp;{$Curreny}</td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Escrow Payment</td>
				  <td class="fieldlabelLeft"><input type="text" name="escrow_payment" class="textbox" value="{$escrow_payment}" />&nbsp;{$Curreny}</td>
					<td class="fieldlabelRight" valign="top">&nbsp;</td>
					<td class="fieldlabelLeft">&nbsp;</td>
				</tr>
			</table>
			<BR />
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Commision Related</strong></td>
				</tr>
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Buyers</strong></td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Commission From buyer</td>
					<td class="fieldlabelLeft"><input type="text" name="comm_form_buyer" class="textbox" value="{$comm_form_buyer}" />&nbsp;(in %)</td>
					<td class="fieldlabelRight" valign="top">Minimun Commission From buyer</td>
				  <td class="fieldlabelLeft"><input type="text" name="minimum_comm_buyer" class="textbox" value="{$minimum_comm_buyer}" />&nbsp;{$Curreny}</td>
				</tr>
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Sellers</strong></td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Commission From seller</td>
					<td class="fieldlabelLeft"><input type="text" name="comm_form_seller" class="textbox" value="{$comm_form_seller}" />&nbsp;(in %)</td>
					<td class="fieldlabelRight" valign="top">Minimun Commission From Seller</td>
				  <td class="fieldlabelLeft"><input type="text" name="minimum_comm_seller" class="textbox" value="{$minimum_comm_seller}" />&nbsp;{$Curreny}</td>
				</tr>
			</table>
			<BR />
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Affilations Related</strong></td>
				</tr>
				<tr>
					<td width="26%" valign="top" class="fieldlabelRight">Commission</td>
					<td width="24%" class="fieldlabelLeft"><input type="text" name="comm_for_afflition" class="textbox" value="{$comm_for_afflition}" />&nbsp;(in %)</td>
					<td width="23%" valign="top" class="fieldlabelRight">&nbsp;</td>
					<td width="27%" valign="top" class="fieldlabelLeft">&nbsp;</td>
				</tr>
			</table>
			<br />	
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr>
					<td class="fieldlabelLeft" colspan="4"><strong>Others</strong></td>
				</tr>
				<tr>
					<td class="fieldlabelRight" valign="top">Records Displayed per page at user side</td>
					<td class="fieldlabelLeft"><input type="text" name="user_page_size" class="textbox" value="{$user_page_size}" />&nbsp;</td>
					<td class="fieldlabelRight" valign="top">Premium Project Fees</td>
				  <td class="fieldlabelLeft"><input type="text" name="premium_project_fees" class="textbox" value="{$premium_project_fees}" />&nbsp;{$Curreny}</td>
				</tr>
			</table>
			<table border="0" cellpadding="1" cellspacing="2" width="95%">
				<tr>
					<td class="fieldlabelRight" valign="top">Site Title</td>
					<td class="fieldlabelLeft">
						<textarea name="site_title" rows="2" cols="80" class="textbox">{$site_title}</textarea>
						<br>
						<font class="validationText">Maximum 100 characters </font><br>
					</td>
				</tr>
				
				<tr>
					<td class="fieldlabelRight" valign="top">Site Keyword</td>
					<td class="fieldlabelLeft">
						<textarea name="site_keyword" rows="3" cols="80" class="textbox">{$site_keyword}</textarea>
						<br>
						<font class="validationText">Maximum 1000 characters </font><br>
						<b>Site Keywords</b> - A list of terms and phrases search engines use to find and rank your site. 
						Your keywords should accurately describe your services, features, products, and location. 						
					</td>
				</tr>
			
				<tr>
					<td class="fieldlabelRight" valign="top">Site Description</td>
					<td class="fieldlabelLeft">
						<textarea name="site_description" rows="3" cols="80" class="textbox">{$site_description}</textarea>
						<br>
						<font class="validationText">Maximum 400 characters </font><br>
						<b>Site Description</b> - This text appears in the listing for your site in search engine results 
						(e.g., a brief description of the services and products you offer, as well as your location). 
						Begin this description with your service title, and then include other keywords and/or phrases 
						describing your services. 						
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