<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Pick_a_Software_Coder}</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<div id="list_head">
						<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
					 {if $Loop > 0 }
							<span class="style9">{$lang.Pick_a_Software_Coder}</span>	
					{/if}	
						</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
{if $error == 1}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
    <tr>
		<td>&nbsp;</td>
	</tr> 
	<tr>	
		<td width="50%" align="center" class="successMsg">{$lang.Award_Project_Err}</td>
	</tr>
	<tr>	
		<td width="50%" align="center" class="bodytextblack">&nbsp;</td>
	</tr>
</table>
{else}
  {if $Loop > 0 }
		<form method="post" action="{$smarty.server.PHP_SELF}" name="frmAward">
		<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
			
			<tr>	
				<td height="20"></td>
			</tr>
			{if $succMsg}
			<tr>
				<td colspan="2" align="center" class="successMsg">{$succMsg}</td>
			</tr>
			<tr>	
				<td height="20"></td>
			</tr>
			{/if}
			<tr>
				<td colspan="2" class="bodytextblack"><font size="2">{$lang.Project_Title}: <strong>{$project_name}</strong></font></td>	  
			</tr>
			<tr>	
				<td height="20"></td>
			</tr>
			<tr>
				<td colspan="2" class="bodytext">{$lang.Award_Text}</td>	  
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>	  
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr bgcolor="#537AB1">
							<td class="bodytextwhite" align="center" width="10%" height="20">&nbsp;<strong>{$lang.Pick}</strong></td>
							<td class="bodytextwhite" align="left" width="20%" height="20"><strong>{$lang.Provider}</strong></td>
							<td class="bodytextwhite" align="center" width="15%" height="20"><strong>{$lang.Bid}</strong></td>
							<td class="bodytextwhite" align="center" width="20%" height="20"><strong>{$lang.Delivery_Within}</strong></td>
							<td class="bodytextwhite" align="center" width="20%" height="20"><strong>{$lang.Time_of_Bid}</strong></td>
							<td class="bodytextwhite" align="center" width="15%" height="20"><strong>{$lang.Reviews}</strong></td>
						</tr>
						{section name=bids loop=$Loop}
						<tr class="{cycle values='list_B style3, list_A style3'}">
							<td  align="center"><input type="radio" name="selected_user[]" value="{$arr_bids[bids].bid_by_user}"><!--<input type="checkbox" name="selected_user[]" value="{$arr_bids[bids].bid_by_user}">--></td>
							<td align="left">&nbsp;<a href="seller_profile_{$arr_bids[bids].bid_by_user}.html" >{$arr_bids[bids].bid_by_user}</a></td>
							<td align="center">$ {$arr_bids[bids].bid_amount}</td>
							<td  align="center">{$arr_bids[bids].delivery_within} day(s)</td>
							<td  align="center">{$arr_bids[bids].date_2}</td>
							<td  align="center">
							{if $arr_bids[bid].rating == 0.00}
							   No Feedback yet
							{else}
								<img src="{$Templates_Image}{$arr_bids[bid].rating|intval}.gif" width="120"><br />&nbsp;<a href="{$arr_bids[bid].bid_by_user}_feedback.html" >({$arr_bids[bid].reviews} reviews)</a>
							{/if}   
							
							</td>
						</tr>
						{/section}
					</table>
				</td>
			</tr>
			<tr>
				<td height="20"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input id="btnbg" type="submit" name="Submit" value="{$lang.Select}" class="login_txt style5" onClick="javascript: return check_award(document.frmAward,'{$Loop}');">
				</td>
			</tr>
		</table>
		<input type="hidden" name="project_id" value="{$project_id}" />
		</form>
	{else}	
		<table width="100%" bgcolor="#FFFFFF" border="0">
				<tr><td height="6"></td></tr>
				<tr>
					<td colspan="2" align="center" class="successMsg">{$lang.Text1} <strong>{$project_name}</strong> {$lang.Text2} <strong>{$project_name}</strong> {$lang.Text3} </td>
				</tr>
				<tr><td height="6"></td></tr>
		</table>		
	{/if}	
{/if}
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
	<div id="more_link">
		
	</div>
</div>