<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Seller activity</h1>
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
							<span class="style9"><font color=black>{$smarty.session.User_Name}{$lang.Seller_Activites}</font></span>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<form method="post" name="frmselleractivity" >
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
    
	<tr>
		<td colspan="2">&nbsp;</td>	  
	</tr>
	<tr>
		<td class="bodytextblack"><strong><font size="3">{$lang.Project_win_close}</font></strong></td>
	</tr>
	<tr>
	    <td>
			<table width="100%" border="0">
				<tr>
					<td colspan="2">&nbsp;</td>	  
				</tr>
				{if $Loop1 > 0}
				<tr>
					<td colspan="2">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr bgcolor="#537AB1" >
								<td class="bodytextwhite" align="center" width="32%" height="20"><strong>{$lang.My_Selling_Activity}</strong></td>
								<td class="bodytextwhite" align="center" width="32%" height="20"><strong>{$lang.Description}</strong></td>
							</tr>
							{section name=seller_project_name loop=$Loop1}
							<tr class="{cycle values='list_A, list_B'}">
								<td align="left" class="bodytextblack" width="32%" height="20"><a href="project_{$aseller_win[seller_project_name].id}_{$aseller_win[seller_project_name].clear_title}.html" class="footerlinkcommon2">{$aseller_win[seller_project_name].Project_Title|stripslashes}</a></td>
								<td align="center" class="bodytextblack">
									{if $aseller_win[seller_project_name].project_status == 3}<strong>{$lang.Accepted}</strong>{/if}
									{if $aseller_win[seller_project_name].project_status == 5}<strong>{$lang.Completed}</strong>{/if}
									{if $aseller_win[seller_project_name].project_status == 6}<strong>{$lang.Project_Finished}</strong>{/if}
									{if $aseller_win[seller_project_name].project_status == 7}<strong>{$lang.Project_Finished}</strong>{/if}								
								</td>
							</tr>
							{/section}
						</table>
					</td>
				</tr>
				{else}
				<tr>
					<td colspan="2" class="bodytextblack" align="center"><strong>{$lang.No_recorded}</strong></td>	  
				</tr>
				{/if}
				<tr>
					<td colspan="2">&nbsp;</td>	  
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<!--<td><a href="seller_project_bid.php" class="footerlink">Bid Wise</a></td>-->
		<td class="bodytextblack"><strong><font size="3">{$lang.Bid_Wise}</font></strong></td>
	</tr>
	<tr>
	    <td>
			<table width="100%" border="0">
				<tr>
					<td colspan="2">&nbsp;</td>	  
				</tr>
				{if $Loop_bid > 0}
				<tr>
					<td colspan="2">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr bgcolor="#537AB1">
								<td class="bodytextwhite" align="center" width="32%" height="20"><strong>{$lang.My_Selling_Activity}</strong></td>
								<td class="bodytextwhite" align="center" width="32%" height="20"><strong>{$lang.Description}</strong></td>
							</tr>
							{section name=seller_project_name1 loop=$Loop_bid}
							<tr class="{cycle values='list_A, list_B'}">
								<td align="left" class="bodytextblack" width="32%" height="20"><a href="project_{$aseller_bid[seller_project_name1].id}_{$aseller_bid[seller_project_name1].clear_title}.html" class="footerlinkcommon2">{$aseller_bid[seller_project_name1].Project_Title|stripslashes}</a></td>
								<td align="center" class="bodytextblack">
								
								{if  $aseller_bid[seller_project_name1].project_post_to == $user}
									{if $aseller_bid[seller_project_name1].project_status == 3}<strong>{$lang.Project_win}</strong>{/if}
									{if $aseller_bid[seller_project_name1].project_status == 2}<strong>{$lang.Awarded_you}</strong> &nbsp;<strong>( <a href="accept_project_{$aseller_bid[seller_project_name1].id}_{$aseller_bid[seller_project_name1].clear_title}.html" class="footerlinkcommon2"> {$lang.Accept_Deny} </a>)</strong>{/if}
								{elseif $aseller_bid[seller_project_name1].project_post_to != $user && $aseller_bid[seller_project_name1].project_status == 2}<strong>{$lang.Bid_Lost}</strong>{else}
<!--									{if $aseller_bid[seller_project_name1].project_post_to != $user}<strong>{$Bid_Placed}</strong>&nbsp;&nbsp;<strong><a href="cancel_bid?bid_id={$aseller_bid[seller_project_name1].bid_id}" class="footerlink" >( Cancel Bid )</a></strong>{/if}
-->									{if $aseller_bid[seller_project_name1].project_post_to != $user}
										{if $aseller_bid[seller_project_name1].project_status == 1}		
											{if $aseller_bid[seller_project_name1].bid_status == 0}
												<strong>{$lang.Your_bid_is_in_pending}</strong>
											{/if}
											{if $aseller_bid[seller_project_name1].bid_status == 1}
												<strong>{$lang.Bid_Placed}</strong>&nbsp;&nbsp;
												<strong>(<a href="JavaScript: Delete_Click('{$aseller_bid[seller_project_name1].bid_id}');" class="footerlinkcommon2" > {$lang.Cancel_Bid} </a>)</strong>
											{/if}
										{/if}
									{/if}
								{/if}								</td>
							</tr>
						{/section}
						</table>
					</td>
				</tr>
				{else}
				<tr>
					<td colspan="2" class="bodytextblack" align="center"><strong>{$lang.No_recorded}</strong></td>	  
				</tr>
				{/if}
				<tr>
					<td colspan="2">&nbsp;</td>	  
				</tr>
			</table>
		</td>
	</tr>
</table>
<input name="bid_id" type="hidden" />
<input type="hidden" name="Action" />
</form>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>

</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>