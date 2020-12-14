<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Extend Project</h1>
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
					
					
					<div style=" width:819px; clear:both;">
	<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div>
									
<form method="post" action="{$smarty.server.PHP_SELF}" name="frmextendProject">
<table width="100%" bgcolor="#FFFFFF" border="0" align="center">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr><td colspan="2" align="center" class="successMsg">
	 {if $succ_msg != ''} 
		{$succ_msg}&nbsp;{$days_extend_by}&nbsp;{$lang.days}
	 {/if}	
	</td></tr>		
	<tr>
		<td class="bodytext">{$lang.Extend_Project} <strong>{$pro_title|stripslashes}</strong> {$lang.By} <select name="days" style="width:40px; height:20px; border:1px solid #bcbcbc;">
					{$extend_days}
					</select>&nbsp; {$lang.Days_Open}	</td>
	</tr>
</table>
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
	   <td width="10%" align="right" class="bodytextblack">
	   <input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Submit}" class="login_txt style5">
	   &nbsp;&nbsp;
		<a href="manage_buyers.php" class="footerlinkcommon2">
		<input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Cancel}" class="login_txt style5">
		</a>&nbsp;&nbsp;
	   </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<input type="hidden" name="Action" value="Extend">
<input type="hidden" name="project_id" value="{$id}">
<input type="hidden" name="project_days_open" value="{$project_days_open}">

</form>
</div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
	<div id="more_link">
		
	</div>
</div>