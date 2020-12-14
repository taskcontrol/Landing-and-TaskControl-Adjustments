<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Accept_Deny_Project}</h1>
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
							<span class="style9"><font color=black>{$lang.Accept_Deny_Project}</font></span>
					</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
						<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
{if $smarty.session.User_Name}
	{include file = "$T_seller_submenu"}
{/if}
    <!--<div class="find_head"><img alt="" title="" src="{$Templates_Image}img_seller_activity.gif" style="margin:46px 0 0 20px;" />
	  <div class="find">{$lang.Accept_Deny_Project}</div>
</div>-->

<!--<img alt="" title="" style="z-index:0;" src="{$Templates_Image}border_top.gif" />-->
<form method="post" action="{$smaty.server.PHP_SELF}">
<div class="find_container">			
	<div>				
		<!--<img alt="" title="" style="margin:0 0 0 11px;" src="{$Templates_Image}border_white_top.gif" />			-->	
		<div class="el_white_row">			
			<div align="center">				
				<table width="100%" bgcolor="#FFFFFF" cellspacing="0" cellpadding="0" border="0">
					{if $error == 1}
					<tr><td height="6"></td></tr>
					<tr>
						<td align="center" class="successMsg">{$lang.Accept_Project_Err}</td>
					</tr>
					<tr><td height="6"></td></tr>
					{else}
					<tr>
						<td align="center" class="bodytextblack" colspan="2"><strong>{$lang.Accept_Project_Text_2} <font size="2">{$project_name}</font> {$lang.Project}.</strong></td>
					</tr>
					<tr><td height="6"></td></tr>
					<tr>	
						<td align="right" class="bodytextblack" width="50%">
						<select name="accept_deny" style="width:70px; border:1px solid #bcbcbc; margin-top:4px;">
							{$Accept_Deny}
						</select>
						&nbsp;&nbsp;<input type="hidden" name="project_id" value="{$project_id}" />
						<input type="hidden" name="auth_id_of_post_by" value="{$auth_id_of_post_by}" />						
						</td>
						<td align="left"><input id="btnbg" type="submit" name="Submit" value="{$lang.Accept_Submit}" class="login_txt style5" /></td>
					</tr>
					<tr><td height="6"></td></tr>
					{/if}
				</table>										
			</div>
		</div>		
		<!--<img alt="" title="" style="margin:0 0 0 11px;" src="{$Templates_Image}border_white_bottom.gif" />	-->			
	</div>
	</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
</form>
<div id="more_link">
						
						
						
					</div>
				</div></div>
<!--<img alt="" title="" src="{$Templates_Image}border_bottom.gif" />-->