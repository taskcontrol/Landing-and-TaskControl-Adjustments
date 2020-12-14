

<script language="javascript">
	var JS_Confirm_Password	 = '{$lang.JS_Confirm_Password}';
	var JS_Old_Password		 = '{$lang.JS_Old_Password}';
	var JS_New_Password		 = '{$lang.JS_New_Password}';

addLoadEvent(prepareInputsForHints);
</script>


<section class="banner-login">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div class="container">
    <div class="row">
      <main class="main main-signup col-lg-12">
        <div class="col-lg-6 col-lg-offset-3 text-center">
          <div class="form-sign">
            <form method="post" action="{$smarty.server.PHP_SELF}" name="frmChangePass" id="frmChangePass" onSubmit="">
              <div class="form-head">
                <h3>{$lang.change_pass_Page}</h3>
              </div>
              <!-- /.form-head -->
              <div class="form-body">
                
                <div class="form-row">
                  <div class="form-controls" style="color: #fff;">
                    <h4>{$succMsg}</h4>
                    <h4>{$Error_Message}</h4>
                    <h4>{$lang.Forgot_Comment}</h4>
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->

                <div class="form-row">
                  <div class="form-controls">
                    <input type="password" name="old_password" placeholder="{$lang.Current_Password}" required="" class="field" type="text">
                    <input type="hidden" name="old_pass_value" value="{$old_pass}">
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                
                <div class="form-row">
                  <div class="form-controls">
                    <input type="password" id="new_password1" name="new_password1" placeholder="{$lang.New_Password}" required="" class="field" type="text">
                    <input type="hidden" name="old_pass_value" value="{$old_pass}">
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                
                
                <div class="form-row">
                  <div class="form-controls">
                    <input type="password" name="new_password2" placeholder="{$lang.Repeat_Password}" required="" class="field" type="text">
                    <input type="hidden" name="old_pass_value" value="{$old_pass}">
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
              </div>
              <!-- /.form-body -->
              <div class="form-foot">
                <div class="form-actions">
    
                  <button type="submit" class="form-btn" name="Submit" value="{$lang.Button_Submit}" onClick="Javascript: return checkNewPass($('#new_password1').val()); return Check_Details(this.form);">
                   Save Password
                  </button>

                  <input type="hidden" name="Action" value="{$Action}"> 
                  <input type="hidden" name="User_Id" value="{$User_Id}">


                </div>
                <!-- /.form-actions -->
                <div class="form-head">
                  <a href="/forgotpasswd.php" class="more-link">Forgot Password?</a>
                </div>
              </div>
              <!-- /.form-foot -->
            </form>
          </div>
          <!-- /.form-sign -->
        </div>
        <!-- /.col-lg-6 -->
      </main>
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
</section>
<!-- /section -->
<script language="javascript" src="/templates/js/changepasswd.js"></script>

