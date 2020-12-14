{if $smarty.session.User_Name}

<script>
window.location.replace("/account.php");
</script>

{/if}


<section class="banner-login">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <div class="container">
    <div class="row">
      <main class="main main-signup col-lg-12">
        <div class="col-lg-6 col-lg-offset-3 text-center">
          <div class="form-sign">
            <form name="frmLogin" method="post" action="login.php">
              <div class="form-head">
                <h3>{$lang_common.Mem_login}</h3>
              </div>
              <!-- /.form-head -->
              <div class="form-body">
                {if $smarty.get.login_error}
                <div class="form-row">
                  <div class="form-controls" style="color: #fff;">
                    <h4>{$lang_common.Login_Error}</h4>
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                {/if}
                <div class="form-row">
                  <div class="form-controls">
                    <input name="user_id" placeholder="Username" required="" id="username" class="field" type="text">
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
                <div class="form-row">
                  <div class="form-controls">
                    <input name="password" type="password" placeholder="Password" required="" id="password" class="field">
                  </div>
                  <!-- /.form-controls -->
                </div>
                <!-- /.form-row -->
              </div>
              <!-- /.form-body -->
              <div class="form-foot">
                <div class="form-actions">
                  <button type="submit" class="form-btn" name="Submit" value="{$lang_common.Login}">
                   Login
                  </button>
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
