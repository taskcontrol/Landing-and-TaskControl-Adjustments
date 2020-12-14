<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Close project</h1>
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
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>										
<table width="100%" bgcolor="#FFFFFF" border="0">
    <tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td> 
			{if $error == 1}
			<table width="95%" border="0">
				<tr>	
					<td width="50%" align="center" class="successMsg">{$lang.Close_Project_Err}</td>
				</tr>
				<tr>	
					<td width="50%" align="center" class="bodytextblack">&nbsp;</td>
				</tr>
			</table>
			{else}
			<form method="post" action="{$smarty.server.PHP_SELF}">
			<table width="95%" border="0">
				<tr>	
					<td width="50%" align="center" class="bodytextblack">{$lang.Close_Project} <strong>{$project_name}</strong> ?</td>
				</tr>
				<tr>	
					<td width="50%" align="center" class="bodytextblack">&nbsp;<input type="hidden" name="project_id" value="{$project_id}"></td>
				</tr>
				<tr>	
					<td width="50%" align="center" class="bodytextblack">
					 <input id="btnbg" type="submit" name="Submit" value="{$lang.Close_Yes}" class="login_txt style5">
					&nbsp;&nbsp;
					
					<input id="btnbg" type="submit" name="Submit" value="{$lang.Close_No}" class="login_txt style5"></td>
				</tr>
			</table>
			</form>
			{/if}
		</td>
	</tr>
</table>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
	<div id="more_link">
		
	</div>
</div><!--<a href="../../tac_en/lang/default/all_sller_profiles.php">all_sller_profiles.php</a>-->