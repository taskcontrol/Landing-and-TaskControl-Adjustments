<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Find_Project}</h1>
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
							<span class="style9"><font color=black>{$lang.Find_Project}</font></span>
						</div>

					<div style="float:right; padding-top:10px; width:415px; margin-right:-10px; ">
						<div class="style5" style="display:inline;">
							<div style="float:left; display:inline;"><img src="{$Templates_Image}bopen.png" /></div>
							<div class="headtop">{$lang.Open}</div>
							<div style="float:left; display:inline;"><img src="{$Templates_Image}bclose.png" /></div>
							<div class="headtop">{$lang.close}</div>
							<div style="float:left; display:inline;"><img src="{$Templates_Image}project_freezed.gif" /></div>
							<div class="headtop">{$lang.Freezed}</div>
							<div style="float:left; display:inline;"><img src="{$Templates_Image}bcancel.png" /></div>
							<div class="headtop">{$lang.close_for_bid}</div>
						</div>
					</div>

					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<table width="100%" bgcolor="#537AB1" border="0" align="center" cellpadding="0" cellspacing="0">
	
	<tr>
		<td height="20"></td>
	</tr>
</table>
{if $Loop > 0}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="4" cellspacing="0">
	<tr>
		<td width="10" height="25" bgcolor="#537AB1" class="bodytextwhite" align="left">&nbsp;</td>
		<td width="230" height="25" bgcolor="#537AB1" class="bodytextwhite" align="left"><strong>{$lang.Project}</strong></td>
		<td width="64" bgcolor="#537AB1" class="bodytextwhite" align="center"><strong>{$lang.Average}</strong></td>
		<td width="45" bgcolor="#537AB1" class="bodytextwhite" align="center"><strong>#{$lang.Bid}</strong></td>
		<td width="339" bgcolor="#537AB1" class="bodytextwhite" align="left"><strong>{$lang.Category}</strong></td>
		<td width="70" bgcolor="#537AB1" class="bodytextwhite" align="center"><strong>{$lang.Started}</strong></td>
		<td width="69" bgcolor="#537AB1" class="bodytextwhite" align="center"><strong>{$lang.Status}</strong></td>
	</tr>
	{section name=ProList loop=$Loop}
	{if $view_project[ProList].premium_project == 1}
	<tr style="background-color:#FDF8D4;" class="styletr" >
	{else}
	<tr class="{cycle values='list_B style3, list_A style3'}">
	{/if}
		<td width="10" height="25"  align="left">
			{if $view_project[ProList].premium_project == 1}
			  <img src="{$Templates_Image}premium_project.gif" border="0" />
			{elseif $view_project[ProList].membership_id != 0}
				<img src="{$Templates_Image}vip_member.gif" border="0" />
			{else}&nbsp;{/if}
		</td>
		<td width="230" height="25"><a href="project_{$view_project[ProList].id}_{$view_project[ProList].clear_title|stripslashes}.html" ><strong>{$view_project[ProList].title|stripslashes}</strong></a>
		&nbsp;{if $view_project[ProList].urgent_project == 1} <strong><font color="#BA0403">({$lang.Urgent})</font></strong> {/if}
		</td>
		<td width="64"  align="center">
			{if $view_project[ProList].bid == 0}
			{$lang_common.Curreny}&nbsp;0.00
			{else}
			{$lang_common.Curreny}&nbsp;{$view_project[ProList].Ave_Bid1}
			{/if}		</td>
		<td width="45"  align="center">{$view_project[ProList].bid}</td>
		
		<td width="339" >{$view_project[ProList].category}</td>
		<td width="70"  align="center">{$view_project[ProList].project_date}</td>
		<td width="62"  align="center">
			{if $view_project[ProList].status == 1}<img src="{$Templates_Image}bopen.png" border="0" />{/if}
			{if $view_project[ProList].status == 2}<img src="{$Templates_Image}project_freezed.gif" border="0" />{/if}
			{if $view_project[ProList].status == 3}<img src="{$Templates_Image}bcancel.png" border="0" />{/if}
 			{if $view_project[ProList].status == 4}<img src="{$Templates_Image}bclose.png" border="0" />{/if}
			{if $view_project[ProList].status == 5}<img src="{$Templates_Image}bclose.png" border="0" />{/if}
			{if $view_project[ProList].status == 7}<img src="{$Templates_Image}bclose.png" border="0" />{/if}
		</td>
	</tr>
{/section}
	<tr>
	    <td colspan="8">&nbsp;</td>
 	</tr>

	<tr class="style2">
		<td height="22" align="center" class="style8" colspan="8">{$Page_Link}</td>
    </tr>

</table>
{else}
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td width="50%" align="center" class="successMsg">
			 {$lang.No_Project_Text}		
		</td>
	</tr>
</table>
{/if}
	</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
				<div id="more_link">
						
						
						
					</div>
				</div>
				</div>
				
