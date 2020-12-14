<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Ln_En}</h1>
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
	var JS_EN_Slogan	 = '{$lang.JS_EN_Slogan}';
	var JS_EN_Desc		 = '{$lang.JS_EN_Desc}';
addLoadEvent(prepareInputsForHints);
</script>



 <section class="banner-login">
	  <div class="container">
	   <div class="row">
	   
	    <main class="main main-signup col-lg-12">
	     <div class="col-lg-6 col-lg-offset-3 text-center">
		  <div class="form-sign">

<form method="post" action="{$smarty.server.PHP_SELF}" name="frmeditbuyer">



<div class="form-body">
			
             <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="en_buyers_slogan" value="{$en_buyers_slogan}" class="field"  placeholder="{$lang.EN_Slogan}">
			  </div>
             </div>

             <div class="form-row">
			  <div class="form-controls">

	  <textarea name="en_buyers_description" class="field"  style="height:150px;" cols="90" rows="10" placeholder="{$lang.EN_Description}" >{$en_buyers_description}</textarea>

			  </div>
             </div>

            


</div><!-- /.form-body -->

  <div class="form-foot">
			    <div class="form-actions">
			    <input class="form-btn" type="submit" id="btnbg2" name="Submit" value="{$lang.Button_Buyer}" onClick="Javascript: return Check_Details(this.form);"  />
			    </div><!-- /.form-actions -->
			 </div><!-- /.form-foot -->
			 <input type="hidden" name="Action" value="Edit">
<input type="hidden" name="User_Id" value="{$User_Id}">
		      </form>
		   </div><!-- /.form-sign -->
		  </div><!-- /.shell -->
		 </main>

	   </div><!-- /.row -->
	  </div><!-- /.container -->
	 </section><!-- /section -->


	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
<!--
<div id="list_head">
					
					
					<div style=" width:819px; clear:both;">
<b class="b1f"></b><b class="b2f"></b><b class="b3f"></b><b class="b4f"></b><div>
<form method="post" action="{$smarty.server.PHP_SELF}" name="frmeditbuyer">
<table width="100%" bgcolor="#FFFFFF" border="0" align="center" cellpadding="0" cellspacing="0">
	
	{if $ERROR}
				<tr>
					<td align="left" class="successMsg" colspan="2">{$ERROR}</td>
				</tr>
				<tr>
					<td align="left" class="successMsg" colspan="2">&nbsp;</td>
				</tr>
	{/if}

					
				</tr>
				<tr><td height="3"></td></tr>
				
				<tr>
					<td class="bodytext">{$lang.EN_Description} :<br><br>
					<textarea name="en_buyers_description" class="textbox" cols="90" rows="10" style="border:1px solid #ABABAB; padding:3px; border-radius: 2px;">{$en_buyers_description}</textarea>	</td>
				</tr>
				<tr><td height="3"></td></tr>
				<tr>
					<td align="center">
					<input class="login_txt style5" type="submit" id="btnbg2" name="Submit" value="{$lang.Button_Buyer}" onClick="Javascript: return Check_Details(this.form);"  /></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<input type="hidden" name="Action" value="Edit">
<input type="hidden" name="User_Id" value="{$User_Id}">
</form>
</div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>-->