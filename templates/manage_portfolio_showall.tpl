<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Manage Portfolio(s)</h1>
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
	var JS_Del				 = '{$JS_Del}';
	var JS_Select			 = '{$JS_Select}';
	var JS_Del_All			 = '{$JS_Del_All}';
</script>
<div id="list_head">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<span class="style9"><font color=black>{$lang.Manage_Portfolio}</font></span>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>	
<form method="post" action="{$Action}" name="frmportfolio">
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
	
	<tr>
		<td height="20"></td>
	</tr>
	{if $succMsg}
    <tr>
		<td valign="top" align="center" class="successMsg">{$succMsg}</td>
	</tr>
	{/if}
	{if $Loop>0}
	<tr>
		<td align="right" ><a href="Javascript: Order_Click('{$usr_id}')" class="footerlink">{$lang.Manage_Order}</a></td>
	</tr>
	{/if}
	<tr>
		<td>
			<table cellpadding="3" cellspacing="4" border="0" width="100%">
			  {if $member_ship == ''}
				<tr>
				  {if $Loop == $free_portfolio }
				    <td class="bodytextblack"><strong> {$lang.New_Portfolio} ({$Loop}/{$free_portfolio})</strong></td>
				  {else}
   					<td class="bodytextblack">
					 <a href="add_portfolio.php" class="footerlink">{$lang.New_Portfolio}</a> <strong>({$Loop}/{$free_portfolio})</strong></td>
				  {/if}
					<td class="bodytextblack" align="right"> {$lang.Post_Upto} {$premium_portfolio} {$lang.Portfolio_sample} {$lang.premium_membeship}</td>
				</tr>
			{else}
				<tr>
				  {if $Loop == $premium_portfolio }
				    <td class="bodytextblack"><strong> {$lang.New_Portfolio} ({$Loop}/{$premium_portfolio})</strong></td>
				  {else}
   					<td class="bodytextblack"> <a href="add_portfolio.php" class="footerlink">{$lang.New_Portfolio}</a> <strong>({$Loop}/{$premium_portfolio})</strong></td>
				  {/if}
					<td class="bodytextblack" align="right"> {$lang.Post_Upto} {$premium_portfolio} {$lang.Portfolio_sample} {$lang.premium_membeship}</td>
				</tr>
			{/if}
			</table>
			{if $Loop>0}
			<table width="100%" border="0" cellspacing="0" cellpadding="3">
				 	<tr bgcolor="#537AB1">
						<td width="2%" align="left" >&nbsp;</td>
						<td align="center" class="bodytextwhite"><strong>{$lang.List_Image}</strong></td>
						<td align="center" class="bodytextwhite" width="30%"><strong>{$lang.List_Description}</strong></td>
						<td align="center" class="bodytextwhite"><strong>{$lang.List_Cost}</strong></td>
						<td align="center" class="bodytextwhite"><strong>{$lang.List_Time}</strong></td>
						<td align="center" class="bodytextwhite"><strong>{$lang.List_Industry}</strong></td>
						<td align="center" class="bodytextwhite"><strong>{$lang.List_Action}</strong></td>
			       </tr>
				 {section name=seller loop=$Loop}
				   	<tr class="{cycle values='list_A, list_B'}">
				      	<td align="center" >
						<input class="stdCheckBox" type="checkbox" name="checkboxgroup[]" value="{$iportfolio[seller].id}" />
						</td>
						
			            <td align="center" class="bodytextblack">
						{if $iportfolio[seller].sample_file != NULL}
							<img src="{$path}{$iportfolio[seller].sample_file}" width="100" height="100"/>
						{else}&nbsp;
			           	{/if}
						</td>
				  	  <td align="left" class="bodytextblack" valign="top"><strong>{$lang.List_Title}</strong> : {$iportfolio[seller].title}<br />
				  	    <br />					    
				      {$iportfolio[seller].desc|truncate:50}</td> 
						<td align="center" class="bodytextblack">{$iportfolio[seller].budget}</td>
						<td align="center" class="bodytextblack">{$iportfolio[seller].time_spent}</td>
						<td align="center" class="bodytextblack">{$iportfolio[seller].industry}</td>
						<td align="center" >
						   <a href="update_portfolio.php?portfolio_id={$iportfolio[seller].id}" ><img src="{$Templates_Image}edit.gif" title="Edit" border="0"/></a>
                           <img src="{$Templates_Image}delete.gif" title="Delete" onclick="javascript: return Delete_Click('{$iportfolio[seller].id}');"/>
						</td>	
	                </tr>
				{/section}
			 </table>
			 {/if}
			 {if $smarty.section.seller.total > 1}
			<table border="0" cellpadding="1" cellspacing="1" width="95%">
				<tr>
					<td class="bodytextblack">
						<img src="{$Templates_Image}arrow_ltr.gif">	
						
						
						<a href="JavaScript: CheckUncheck_Click(document.getElementsByName('checkboxgroup[]'), true);" onMouseMove="window.status='Check All';" onMouseOut="window.status='';" class="footerlinkcommon2">{$lang.Check_All}</a> / 
						<a href="JavaScript: CheckUncheck_Click(document.getElementsByName('checkboxgroup[]'), false);" onMouseMove="window.status='Uncheck All';" onMouseOut="window.status='';" class="footerlinkcommon2">{$lang.Uncheck_All}</a>  &nbsp;&nbsp;					
								
								 {$lang.With_selected} <img src="{$Templates_Image}delete.gif" class="imgAction" title="Delete" onClick="JavaScript: DeleteChecked_Click('{$iportfolio[seller].id}');">
											
						
						 
						 </td>
				</tr>
			</table>
			{/if}
		</td>
	</tr>
</table>
<input type="hidden" name="Action" >
<input type="hidden" name="portfolio_id" />
<input type="hidden" name="port_img"/>
</form>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>

</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>