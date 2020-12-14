<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Search_Project</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<!-- LIST HEAD STARTS HERE -->
				<div id="list_head">
				<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>

							<span class="style9"><font color=black>{$lang.Search_Project}</font></span>
						</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>

					<table width="100%" border="0" align="center" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">
	
					
					<tr>
						<td>
							<table  width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="4" cellspacing="0">
								<tr class="style10 lh_bg">
									<td width="10" height="25"  class="bodytextwhite" align="left">&nbsp;</td>
									<td width="230" height="25"   align="left" class="bodytext"><strong>{$lang.Project}</strong></td>
									<td width="64"  class="bodytext" align="center"><strong>{$lang.Average}</strong></td>
									<td width="70"  class="bodytext" align="center"><strong>{$lang.Bids}</strong></td>
									<td width="330"  class="bodytext" align="left"><strong>{$lang.Category}</strong></td>
									<td width="120"  class="bodytext" align="center"><strong>{$lang.Started}</strong></td>
									<td width="62" class="bodytext" align="center"><strong>{$lang.Status}</strong></td>
								</tr>
								{section name=ProList loop=$Loop}
								 {if $view_project[ProList].premium_project == 1}
								<tr style="background-color:#FDF8D4;" class="styletr tdheight">
								 {else}
								<tr class="style3 tdheight">
								 {/if}
									<td width="10" height="25" class="bodytextblack" align="left">
									{if $view_project[ProList].premium_project == 1}
										   <img src="{$Templates_Image}premium_project.gif" border="0" />
									{elseif $view_project[ProList].membership_id !=0}
										<img src="{$Templates_Image}vip_member.gif" border="0" />
									{else}
										&nbsp;
									{/if}
									</td>
									<td width="230" height="25"><a href="project_{$view_project[ProList].id}_{$view_project[ProList].clear_title|stripslashes}.html" ><strong>{$view_project[ProList].title|stripslashes}</strong></a>
									&nbsp;{if $view_project[ProList].urgent_project == 1} <strong><font color="#BA0403">({$lang.Urgent})</font></strong> {else} &nbsp; {/if}					</td>
									<td width="64" align="center">
									{if $view_project[ProList].bid == 0}
										{$lang_common.Curreny}&nbsp;0.00
									{else}
										{$lang_common.Curreny}&nbsp;{$view_project[ProList].Ave_Bid1}
									{/if}		</td>
									<td width="70"  align="center">{$view_project[ProList].bid}</td>
								
									<td width="330">{$view_project[ProList].category}</td>
									<td width="120"  align="center">{$view_project[ProList].project_date}</td>
									<td width="62" align="center">
									{if $view_project[ProList].status == 1}<img src="{$Templates_Image}open.gif" border="0" />{/if}
									{if $view_project[ProList].status == 2}<img src="{$Templates_Image}project_freezed.gif" border="0" />{/if}
									{if $view_project[ProList].status == 3}<img src="{$Templates_Image}cancel.gif" border="0" />{/if}
									{if $view_project[ProList].status == 5}<img src="{$Templates_Image}Closed.gif" border="0" />{/if}
									</td>
								</tr>
							{sectionelse}
								<tr>
									<td align="center" class="bodytextblack" colspan="7"><strong>{$lang.Sorry}</strong></td>
								</tr>
							{/section}
						</table>
					 </td>
				  </tr>
				</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
		<td>&nbsp;</td>
	</tr>  
	<tr class="style2">
		<td height="22" align="center" class="style8">{$Page_Link}</td>
	</tr>
</table>
						</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>

				  	</div>
					
					
				</div>
				<!-- LIST HEAD ENDS HERE -->