<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Manage portfolio order</h1>
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
	var JS_Move				 = '{$lang.JS_Move}';
</script>
<div id="list_head">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<span class="style9"><font color=black>{$lang.Manage_Order_Portfolio}</font></span>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div class="contentf"><div>
<table border="0" cellpadding="0" cellspacing="1" width="100%" bgcolor="#FFFFFF" class="stdTableBorder">
	<form name="frmPortfolio" action="{$smarty.server.PHP_SELF}" method="post">
	
	<tr>
		<td valign="top" align="center">
			<table border="0" cellpadding="0" cellspacing="1" width="27%">
				<tr><td colspan="2">&nbsp;</td></tr>
				<tr>
					<td width="25%">
						<select name="category" style="width:200px;" size="10">
							{section name=Opt loop=$Loop}
								<option value="{$portf_id[Opt]}">{$portf_tilte[Opt]}</option>
							{/section}
						</select>
						<input type="hidden" name="display_order">
					</td>
					<td width="2%">&nbsp;</td>
					<td align="left">
						<img src="{$Templates_Image}top.gif" style="cursor:hand" border="0" onClick="JavaScript: UpDown_Click(-1);"><br><br>
						<img src="{$Templates_Image}bottom1.gif" style="cursor:hand" border="0" onClick="JavaScript: UpDown_Click(1);">
					</td>
				</tr>
				<tr>
					<td height="20"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
												
						<input id="btnbg" type="submit" name="Submit" value="{$lang.Save}" class="login_txt style5" onClick="javascript: Button_Click(this);">
						&nbsp;&nbsp; 
						
						<input id="btnbg" type="submit" name="Submit" value="{$lang.Cancel}" class="login_txt style5" onclick="JavaScript: return cancel();">
						
									
						<input type="hidden" name="Action" value="{$ACTION}">
						<input type="hidden" name="user_id" value="{$user_id}">
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<br><br>
			<br><br>
		</td>
	</tr>
	</form>
</table>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>

</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>