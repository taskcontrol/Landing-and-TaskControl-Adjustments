<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Authorize</h1>
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
<table border="0" bgcolor="#FFFFFF" width="100%" cellpadding="2">
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td align="center" class="successMsg">
			<strong>You are requested $&nbsp;{$requested_amount} amount for deposit in GoitGlobal through Authorize.Net and after including tax your requested amount is: $&nbsp;{$final_total}.</strong>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>		
<table border="0" width="100%" bgcolor="#FFFFFF" cellpadding="2">
	<tr>
		<td align="center">
            <!--<form method='post' action="https://secure.authorize.net/gateway/transact.dll">-->
            <form method='post' action="https://test.authorize.net/gateway/transact.dll">
                <input type='hidden' name="x_login" value="{$api_login_id}" />
                <input type='hidden' name="x_version" value="3.1">
                <input type='hidden' name="x_amount" value="5.99" />
                <input type='hidden' name="x_show_form" value="payment_form">
                <input type='hidden' name="x_relay_response" value="true">
                <input type='hidden' name="x_delim_data" value="false">

                <input type='hidden' name="x_fp_hash" value="{$fingerprint}" />
                <input type='hidden' name="x_fp_timestamp" value="{$fp_timestamp}" />
                <input type='hidden' name="x_fp_sequence" value="{$fp_sequence}" />
                <input type='hidden' name="x_test_request" value="false" />
                <input type='hidden' name="x_method" value="cc">
                <input type='hidden' name="x_relay_url" value="http://goitglobal.com/authorizeIPN.php">
                <!--<input type='hidden' name="x_currency_code" value="USD">-->
                <input type='hidden' name="x_description" value="{$item_name}">
                <input type='hidden' name="x_cust_id" value="{$user_id}">
                <!--<img src="//testcontent.authorize.net/images/buy-now-blue.gif" onclick="document.getElementById('frmPago').submit()" alt="Click here for the secure payment form" style="cursor:pointer">-->
                <input type='submit' value="Click here for the secure payment form">
            </form>
        </td>
	</tr>
</table>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>