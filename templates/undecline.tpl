<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Undecline</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<form method="post" action="{$smarty.server.PHP_SELF}" name="frmundecline">
<table width="98%" border="0" align="center">
	<tr>
		<td>
			<table width="90%" border="0" align="center">
				<tr>
					<td class="white_cont" colspan="2"><strong>{$lang.Decline_Bid}</strong></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="white_cont">{$lang.Decline_Msg}. </td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="white_cont" colspan="2"><strong>{$lang.Provider_Name} : &nbsp;&nbsp;<a target="_blank" href="buyer_profile_{$provider_name}.html" class="footerLink">{$provider_name}</a></strong></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td class="white_cont"><strong>{$lang.Reason} :</strong>&nbsp;&nbsp;&nbsp;
						<select name="reasons" class="textbox">
						{$reasons}
						</select>
				  </td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td width="49%" align="center" class="white_cont"><input type="submit" name="Submit" value="{$lang.Button_Cancel}" class="Button" onclick="Javascript: window.close();">&nbsp;&nbsp;
						<input type="submit" name="Submit" value="{$lang.Button_Decline_Bid}" class="Button" />					
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<input type="hidden" name="provider_name" value="{$provider_name}" />
<input type="hidden" name="project_id" value="{$project_id}" />
<input type="hidden" name="bid_id" value="{$bid_id}" />
<input type="hidden" name="id" value="{$id}" />
</form>