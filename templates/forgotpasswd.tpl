

<script language="javascript">
	var JS_User_ID		 = '{$lang.JS_User_ID}';
	var JS_Valid_Mail 	 = '{$lang.JS_Valid_Mail}';
</script>				

	
	
	 <section class="banner-login">
	   <p>&nbsp;</p>
  <p>&nbsp;</p>
	  <div class="container">
	   <div class="row">
	   <form method="post" action="{$smarty.server.PHP_SELF}" name="frmForgotpasswd">
	    <main class="main main-signup col-lg-12">
	     <div class="col-lg-6 col-lg-offset-3 text-center">
		  <div class="form-sign">
<!--		    <div class="form-head">
			 <h3>Login</h3>
			</div>-->
			<!-- /.form-head -->
            <div class="form-body">


			 <div class="form-row">
			  <div class="form-controls">
			<h4 style="color:#fff;">{$lang.Forgot_Comment}</h4>
			 </div><!-- /.form-controls -->
			 </div><!-- /.form-row -->


			 <div class="form-row">
			  <div class="form-controls">
			<h4 style="color:#fff;">{$msg}</h4>
			 </div><!-- /.form-controls -->
			 </div><!-- /.form-row -->

			 <div class="form-row">
			  <div class="form-controls">
			   <input id="mem_email" name="mem_email"  placeholder="{$lang.Email_Address}" class="field" type="text">
			  </div><!-- /.form-controls -->
			 </div><!-- /.form-row -->

			 
		    </div><!-- /.form-body -->

			<div class="form-foot">
			 <div class="form-actions">					
		  
			  <input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Submit}" class="form-btn" onClick="Javascript: return Check_Details(this.form);">
			  
			  
			 </div><!-- /.form-actions -->

			</div><!-- /.form-foot -->
		   
		  </div><!-- /.form-sign -->
	     </div><!-- /.col-lg-6 -->
        </main>
        
        <input type="hidden" name="Action" value="{$Action}">
        
		</form>
	   </div><!-- /.row -->
	  </div><!-- /.container -->
     </section><!-- /section -->
     
     
     
     
	
	
	
	
	