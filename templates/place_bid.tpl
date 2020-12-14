<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Place bid</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<script language="javascript">
	var min_bid_amount		 	 = '{$lang.min_bid_amount}';
	var JS_Bid_Amount			 = '{$lang.JS_Bid_Amount}';
	var JS_Confirm_Bid			 = '{$lang.JS_Confirm_Bid}';
	var JS_Days					 = '{$lang.JS_Days}';
	var JS_English				 = '{$lang.JS_English}';
	var JS_Days1				 = '{$lang.JS_Days1}';
	var JS_bid				 	 = '{$lang.JS_bid}';
	var JS_Bid1				 	 = '{$lang.JS_Bid1}';
</script>
<div id="list_head">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>

							{if $status!= 1}<span class="style9"><font color=black>{$lang.Bid_on_Project} : {$project_title}</font></span>
							{/if}
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<form method="post" action="{$smarty.server.PHP_SELF}" name="frmBid" enctype="multipart/form-data">
{if $SuccMsg}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
	<tr>
		<td valign="top" align="center" class="successMsg">{$SuccMsg}</td>
	</tr>
</table>
{/if}
{if $premium_msg}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
	<tr>
		<td valign="top" align="center" class="successMsg">{$premium_msg}</td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
	</tr>
</table>
{/if}
{if $status!= 1}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
	<tr>
		<td align="center" class="successMsg" height="100">{$msg}</td>
	</tr>
</table>
{else}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
    
	<tr>
	    <td height="20"></td>
	</tr>
	<tr>
		<td align="center">
			<table cellpadding="3" cellspacing="4" border="0" width="98%">
				<tr bgcolor="#537AB1">
					<td width="50%" class="">&nbsp;<strong>{$lang.Bid_Amount} </strong></td>
					<td width="50%" class="">&nbsp;<strong>{$lang.Delivery_Time}</strong> </td>
				</tr>
			
				
				<tr>
					<td class="" valign="top">$&nbsp;<input type="text" class="textbox" name="bid_amount" value="{$bid_amount}" size="3" />&nbsp;{$lang.Note3}.</td>
					<td class="" valign="top"><input type="text" class="textbox" name="delivery_within" value="{$delivery_within}" size="5" />&nbsp;{$lang.Note4} ?</td>
				</tr>
				<tr bgcolor="#537AB1">
					<td colspan="2" class="bodytextwhite">&nbsp;<strong>{$lang.Provide_Bid} :</strong>&nbsp;{$lang.Bid_Note} <a href="Javascript: View_Terms()" class="footerlinkcommon21"><strong>{$lang.Term1}</strong></a>.</td>
				</tr>
				<tr class="english">
				  <td colspan="2" class="bodytextwhite"><textarea name="en_bid_desc" cols="90" rows="10" class="textbox">{$en_bid_desc}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="justify" class="">{$lang.IMPORTANT}</td>
				</tr>
				<tr bgcolor="#537AB1">
					<td colspan="2" class="bodytextwhite">&nbsp;<strong>{$lang.Notification_Option} :</strong></td>
				</tr>
				<tr>
				  <td colspan="2" class=""><input type="checkbox" name="notification_status" value="1" {$chechked}/>&nbsp;&nbsp;{$lang.Notify}</td>
				</tr>
				<tr>
				    <td colspan="2" align="right" class="">
				
				<input id="btnbg2" type="submit" name="Submit" value="{$lang.Place_Bid}" class="login_txt style5" onclick="javascript: return Check_Bidding(document.frmBid);" >
				</tr>
			</table>
		</td>
	</tr>
</table>
{/if}
<input type="hidden" name="project_id" value="{$project_id}" />
<input type="hidden" name="amount" value="{$amount}" />
</form>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
	<div id="more_link">
		
	</div>
</div>