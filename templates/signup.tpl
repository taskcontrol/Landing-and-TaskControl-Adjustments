<script language="javascript">
	var JS_User_ID				 = 'Please enter User Name.';
	var JS_Fname 				 = 'Please enter First Name.';
	var JS_Lname				 = 'Please enter Last Name.';
	var JS_Passwd 				 = 'Please enter Password.';
	var JS_Re_Passwd			 = 'Please enter Password Again.';
	var JS_Confirm 				 = 'Please confirm your new password.';
	var JS_City					 = 'Please enter City.';
	var JS_Valid_Mail		 	 = 'Please enter valid mail id.';
	var JS_Terms				 = 'Please Agree to our Terms.';
	var JS_Country				 = 'Please Select Country.';
	var JS_Employee              = 'Please enter number of Employees.';
	var JS_Check_User_Login		 = 'User ID must be from 3 to 16 characters long';
	var JS_Check_User_Lenght	 = 'User ID must contain letters.';
	var JS_Check_Special_Cha	 = 'Your username has special characters. These are not allowed.Please remove them and try again.';
	var JS_Role					 = 'Please Select at least one role.';
	var JS_Areas				 = 'Please Select atleast one Areas of Interest/Expertise.';
	var JS_Phone				 = 'Please enter Phone.';
	var JS_Address				 = 'Please enter Address.';
	var JS_Zipcode				 = 'Please enter Zipcode.';
	var JS_Valid_Phone			 = 'Please enter valid Phone.';
	var JS_Valid_Mobile			 = 'Please enter valid Mobile.';
	var passwordCheckMsg = 'Password should contain at least 2 lowercase letters, 2 caps letters, 2 digits and 2 special symbols (!@#$%^&*, etc)';
	addLoadEvent(prepareInputsForHints);	
</script>

<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Register</h1>
            <p>New Here? Create Account.</p>
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->

     <!-- ==============================================
     Form Section
     =============================================== -->
	 <section class="banner-login">
	  <div class="container">
	   <div class="row">
	   
	    <main class="main main-signup col-lg-12">
	     <div class="col-lg-6 col-lg-offset-3 text-center">
		  <div class="form-sign">
		  
	
		   <form method="post" action="{$smarty.server.PHP_SELF}" name="frmSignup" id="frmSignup">
		    <div class="form-head">
			 <h3>SIGN UP</h3>
			</div>
			
	
            <div class="form-body">
			
             <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="user_id" value="{$smarty.post.user_id}" class="field"  placeholder="{$lang.User_ID} (First letter in Uppercase)">
			   
			  </div>
			  <div id="user_checking"></div>
             </div>

		    
		     <div class="form-row">
			  <div class="form-controls">
			     <input type="text" id="mem_company" name="mem_company" value="{$smarty.post.mem_company}" class="field"  placeholder="{$lang.Company} (ie. MyCompanyName) (WITHOUT SPACES)">
			   </div>
             </div>
             
             
              <div class="form-row">
			   <div class="form-controls">
	  		     <input type="text" id="mem_fname" name="mem_fname" value="{$smarty.post.mem_fname}"  class="field"  placeholder="{$lang.First_Name}">
			   </div>
             </div>
             
             
             <div class="form-row">
			  <div class="form-controls">
			   <input type="text" id="mem_lname" name="mem_lname" value="{$smarty.post.mem_lname}" class="field"  placeholder="{$lang.Last_Name}">
			   
			  </div>
             </div>
             
            
              <div class="form-row">
			  <div class="form-controls">
		      <div style="color:#fff;" id="pswdHint"><script>$('#pswdHint').html(passwordCheckMsg);</script></div>

			   <input type="password" name="password" value="{$smarty.post.password}" class="field"  placeholder="{$lang.Password}">
			  </div>
             </div>

             <div class="form-row">
			  <div class="form-controls">
			   <input type="password" name="password_retype" value="{$smarty.post.password_retype}" class="field"  placeholder="{$lang.Password_Retype}">
			   
			  </div>
             </div>
             
             
             
             <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="mem_phone" value="{$smarty.post.mem_phone}" class="field"  placeholder="{$lang.Phone} (Only numbers)">
			   
			  </div>
             </div>
             
             
             <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="mem_mobile" value="{$smarty.post.mem_mobile}" class="field"  placeholder="{$lang.Mobile} (Optional)">
			   
			  </div>
             </div>
             
             
             <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="mem_address" value="{$smarty.post.mem_address}" class="field"  placeholder="{$lang.Address}">
			   
			  </div>
             </div>
             
             
              <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="mem_city" value="{$smarty.post.mem_city}" class="field"  placeholder="{$lang.City}">
			   
			  </div>
             </div>
             
             
              <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="mem_zipcode" value="{$smarty.post.mem_zipcode}" class="field"  placeholder="{$lang.Zip_Code}">
			   
			  </div>
             </div>



             <div class="form-row">
			  <div class="form-controls">
			   <input type="text" name="mem_state" value="{$smarty.post.mem_state}" class="field"  000 placeholder="{$lang.State_Province}">
			  </div>
             </div>



             <div class="form-row">
			  <div class="form-controls">
			   <select name="mem_country" class="field" placeholder="{$lang.Country} (Optional)">
			      <option value="0">-Select a Country-</option>
			      {$country_List}
			    </select>
    	 	  </div>
             </div>



             <div class="form-row">
                  <div class="form-controls">
                    <select name="mem_emp" class="field" placeholder="{$lang.Employees}"> 
                      <option value="1">-Select Number of Employees-</option>
                      {$employee_list}
                    </select>
                  </div>
             </div>
           
            
                
	        <div class="form-row">
			  <div class="form-controls">
			      <input type="text" name="mem_email" value="{$smarty.post.mem_email}" class="field"  placeholder="{$lang.Email_Address} (Notifications Will Be Sent to This Email Address)">
			  </div>
            </div>


		    <div class="form-head">
		      <h3>{$lang.Areas}</h3>
		    </div>


          <div class="form-row" style="clear: both;padding-top: 20px;padding-bottom: 20px;">
    	       {assign var="col" value=3}
		    {section name=prod loop=$Loop}
	    	   {if $smarty.section.prod.iteration|mod:$col==1}
		       {/if}
			  
			  <div class="form-controls form-controls-checkbox">
			    <input type="checkbox" id="{$catid[prod]}" name="cat_prod[]" value="{$catid[prod]}" {if $catid[prod]|in_array:$checked_cat}checked{/if} style='margin-right: 10px;float: left;'>
			    <label for="{$catid[prod]}" style="color:#fff;float: left;">{$catname[prod]}</label>
			  </div>

		      {if $smarty.section.prod.iteration|mod:$col==0}
		      {/if}
		    {/section}
	      </div>



	    <div class="form-head">
	      <h3>{$lang.Options}</h3>
	    </div>


	    <div class="form-row" style="clear: both;padding-top: 20px;padding-bottom: 20px;">
	      <div class="form-controls form-controls-checkbox">
	     	<input type="checkbox" id="check" name="check" style='margin-right: 10px;float: left;' checked="checked">
    		<label for="check" style="color:#fff;float: left;">{$lang.Notify}</label>
	      </div>
	    </div>
	 
	    
	    <div class="form-row" style="clear: both;padding-top: 20px;padding-bottom: 20px;">
	      <div class="form-controls form-controls-checkbox" style="text-align:left;color:#fff;">
		  <ul style="list-style: outside;">
		    <li>{$lang.Options1}</li>
		    <li>{$lang.Options2}</li>
		  </ul>
	      </div>
	    </div>
	 
	    
	    <div class="form-row" style="clear: both;padding-top: 20px;padding-bottom: 20px;">
	      <div class="form-controls">
		    <input type="checkbox" id="agree" name="agree" style='margin-right: 10px;float: left;'>
		    <label for="agree" style="color:#fff;float: left;">{$lang.Agree1} 
		    <a href="Javascript: View_Terms()" style="color: #fff;text-decoration: underline;">{$lang.Agree2}</a></label>
	      </div>
        </div>
     
             
        <div class="form-row" style="clear: both;padding-top: 20px;padding-bottom: 20px;">
	      <div class="form-controls form-controls-checkbox" style="text-align:left;color:#fff;">
		  <ul style="list-style: outside;">
		    <li>{$lang.Agree11}.</li>
		    <li>{$lang.Agree12}</li>
		    <li>{$lang.Agree13}</li>
		    <li>{$lang.Agree14}</li>
		    <li>{$lang.Agree15}</li>
		    <li>{$lang.Agree17}</li>
		  </ul>
	      </div>
	    </div>
             
             
	    <div class="form-row" style="clear: both;padding-top: 20px;padding-bottom: 20px;">
	      <div class="form-controls form-controls-checkbox" style="text-align:left;color:#fff;">
	      
             <img id="captcha" src="/securimage/securimage_show.php" alt="CAPTCHA Image" />
		  <input type="text" name="captcha_code" size="10" maxlength="6" style="color:#000;" />
		  <a href="#" onclick="document.getElementById('captcha').src = '/securimage/securimage_show.php?' + Math.random(); return false"><img src="/securimage/images/refresh.png" alt="Reload Image" height="32" width="32" onclick="this.blur()" align="bottom" border="0" /></a>
             </div>
	    </div>
            
			 </div><!-- /.form-body -->

		      {if $ERROR}
			    <div style="background:#fff;color:#f00;">{$ERROR}</div>
		      {/if}
       
              <input type="hidden" name="Action" value="Signup">
	          <input type="hidden" name="aff_user" value="{$aff}">
	
			  <div class="form-foot">
			    <div class="form-actions">
			      <input value="{$lang.Button_Submit}" class="form-btn" type="submit" onClick="Javascript: return Check_Details(frmSignup);">
			    </div><!-- /.form-actions -->
			 </div><!-- /.form-foot -->

			</form>
		   </div><!-- /.form-sign -->
		  </div><!-- /.shell -->
		 </main>

	   </div><!-- /.row -->
	  </div><!-- /.container -->
	 </section><!-- /section -->
	 