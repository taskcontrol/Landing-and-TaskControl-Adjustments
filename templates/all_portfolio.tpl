<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Find_Portfolio}</h1>
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
					<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div>
							<span class="style9"><font color=black>{$lang.Find_Portfolio}</font></span>
					</div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<table width="100%" bgcolor="#ffffff" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td height="20"></td>
	</tr>
</table>
{if $Loop > 0}
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
	<tr>
		<td width="230" height="25" bgcolor="#537AB1" class="bodytextwhite" align="left">&nbsp;</td>
	</tr>
	{section name=Portfolios loop=$Loop}
	<tr class="{cycle values='list_B, list_A'}">
		<td class="bodytextblacka">
			<table width="100%" cellpadding="3" cellspacing="3" border="0">
				<tr>
					<td colspan="3" width="70%">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								{foreach name=files_name from=$files[Portfolios] item=files_name}
									<td width="33%"><a href="javascript:OpenImage('{$files_name->sample_file}')"><img src="{$img_path}{$files_name->sample_file}" border="0" height="140" width="140" /></a></td>
								{/foreach}
								{if $smarty.foreach.files_name.total == 2}
									<td width="33%" class="bodytextblack">&nbsp;</td>
								{/if}
								{if $smarty.foreach.files_name.total == 1}
									<td width="33%" class="bodytextblack">&nbsp;</td>
									<td width="33%" class="bodytextblack">&nbsp;</td>
								{/if}
							</tr>
						</table>
					</td>
					<td width="30%">
						<table width="100%" cellpadding="3" cellspacing="3" border="0">
							<tr>
								<td class="bodytextblack"><strong>{$lang.User}</strong></td>
								<td class="bodytext">{$user_login_id[Portfolios]}</td>
							</tr>
							<tr>
								<td class="bodytextblack" valign="top"><strong>{$lang.Rating}</strong></td>
								
								<td class="bodytext">
								{if $rating[Portfolios] == 0.00}
									{$lang.No_feedback}{else}	
								    <img src="{$Templates_Image}{$rating[Portfolios]|intval}.gif" width="120"><br />
								    <a href="{$user_login_id[Portfolios]}_feedback.html" class="footerlink">({$reviews[Portfolios]} reviews)</a>
								{/if}	
							  </td>
							</tr>
							<tr>
								<td class="bodytextblack"><strong>{$lang.Earning}</strong></td>
								<td class="bodytext">
								{if $earning[Portfolios] == 0.00}
									{$lang.Curreny} 0.00
								{else}
									{$Curreny}&nbsp;{$earning[Portfolios]}
								{/if}
								</td>
							</tr>
							<tr>
								<td class="bodytextblack"><strong>{$lang.Location}</strong></td>
								<td class="bodytext">
								{if $location_1[Portfolios] != ''}
									{$location[Portfolios]}
								{else}
									{$location_2[Portfolios]}
								{/if}	
								</td>
							</tr>
						</table>
					</td>
				</tr>	
				<tr>
					<td colspan="3" class="bodytextblack"><a href="seller_profile_{$user_login_id[Portfolios]}.html" class="footerlinkcommon2">{$lang.Profile}</a> | <a href="{$user_login_id[Portfolios]}_feedback.html" class="footerlinkcommon2">{$lang.Feedback}</a> | <a href="seller_portfoilo_{$user_login_id[Portfolios]}.html" class="footerlinkcommon2">{$lang.Portfolio}</a> | <a href="contact_{$user_login_id[Portfolios]}.html" class="footerlinkcommon2" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');">{$lang.Contact} {$user_login_id[Portfolios]}</a> | <a href="post_project_{$user_login_id[Portfolios]}.html" class="footerlinkcommon2" onClick="Javascript: return chk_user('{$smarty.session.User_Id}');">{$lang.Post_Project_to} {$user_login_id[Portfolios]}</a></td>
					<td class="bodytextblack" align="center">{$user_portfolio_count[Portfolios]} {$lang.Sample_Match} </td>
				</tr>
			</table>
		</td>
	</tr>
	{/section}
	 <tr>
	    <td>&nbsp;</td>
	</tr> 
	<tr class="style2">
		<td height="22" align="center" class="style8">{$Page_Link}</td>
	</tr>
	<tr>
	    <td>&nbsp;</td>
	</tr> 
</table>
{else}
<table width="100%" bgcolor="#000000" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="50%" align="center" class="successMsg" >
			 {$No_Text}</td>
	</tr>
	
</table>
{/if}
	</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
						
					</div>
</div>