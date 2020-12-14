<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Deposit (Paypal)</h1>
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
	    <td align="center" class="successMsg">
			<!-- <h4><strong>You requested deposit $&nbsp;{$requested_amount} + Paypal Fees & Commissions Total= $&nbsp;{$final_total}</strong></h4> -->
			<h4><strong>You Request to Deposit $&nbsp;{$requested_amount} in Your TaskControl Wallet (Paypal fees will apply) :</strong></h4>
		</td>
	<tr>
		<td height="20"></td>
	</tr>
</table>		


<br>

<table border="0" width="100%" bgcolor="#FFFFFF" cellpadding="2">
	<tr>
		<td align="right">
			<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
				<input type="hidden" name="cmd" value="_xclick">
				<input type="hidden" name="business" value="{$paypal_id}">
				<input type="hidden" name="item_name" value="{$item_name}">
				<input type="hidden" name="amount" value="{$final_total}">
				<input type="hidden" name="comisionPaypal" value="{$comisionPaypal}">
				<input type="hidden" name="no_shipping" value="1">
				<input type="hidden" name="return" value="{$Site_Root}success.php?check_value={$user_id}">
				<input type="hidden" name="cancel_return" value="{$Site_Root}cancel.php">
				<input type="hidden" name="currency_code" value="USD">
				<input type="hidden" name="bn" value="PP-BuyNowBF">
				<input type="hidden" name="page_style" value="TAC">
				<input type="hidden" name="notify_url" value="{$Site_Root}paypalipn.php?check_value={$user_id}&username={$user_name}&amt={$final_total|string_format:'%.2f'}&comision={$comisionPaypal|string_format:'%.2f'}&pay_method={$pay_method}">
				<input type="image" src="{$Templates_Image}img_paywithpaypal.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
			</form>
		</td>
	</tr>
</table>


<table border="0" width="100%" bgcolor="#FFFFFF" cellpadding="2">
	<tr><td height="15"></td></tr>
	<tr>
	<!--	<td align="right"><img  src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" border="0" alt="Paypal Accepted Cards"></td> -->
	</tr>
</table>



</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
					</div>
				</div>
