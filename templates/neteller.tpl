<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Deposit (Neteller)</h1>
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

 <table border="0" width="100%" bgcolor="#ffffff" cellpadding="2">
<table border="0" bgcolor="#FFFFFF" width="100%" cellpadding="2">
	<tr>
		<td height="20"></td>
	</tr>
	<tr>
		<td align="center" class="successMsg">
			<strong>You are requested $&nbsp;{$requested_amount} amount for deposit in GoitGlobal through Neteller and after including your payment gateway commission your requested amount is: $&nbsp;{$final_total}.</strong>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>		
	<tr>
		<td align="center"> 
			<center> <form action="../netellerPayment.php" method="post" id="frmPago">
				<input type="hidden" name="pay_to_email" value="{$neteller_id}">
				<input type="hidden" name="pay_from_email" value="{$pay_from_email}">
				<input type="hidden" name="return_url" value="{$Site_Root}success.php?check_value={$user_id}">
				<input type="hidden" name="cancel_url" value="{$Site_Root}cancel.php">
				<input type="hidden" name="language" value="EN">
				<input type="hidden" name="merchant_fields" value="user_id">
				<input type="hidden" name="user_id" value="{$user_id}">
				<input type="hidden" name="amount" value="{$final_total|string_format:'%.2f'}">
				<input type="hidden" name="currency" value="USD">
				<input type="hidden" name="return" value="{$Site_Root}success.php?check_value={$user_id}">
				<input type="hidden" name="cancel_return" value="{$Site_Root}cancel.php">
				<input type="hidden" name="recipient_description" value="GoItGlobal">
				<input type="hidden" name="return_url_text" value="Return to GoItGlobal">
                <input type="hidden" name="status_url" value="http://goitglobal.com/netellerIPN.php"/>  
				<input type="hidden" name="detail1_description" value="{$item_name}">
                <img src="/img/skrill-payby-border_en_85x47.png" onclick="document.getElementById('frmPago').submit()" alt="Click here for the secure payment form" style="cursor:pointer">
                <!--
                Skrill Payment Gateway Integration Guide ----- pagina 17 para ver como implementar IPN
                <input type="submit" id="btnbg" border="0" name="Submit" value="Pay!" class="login_txt style5" style="float:none"/>-->
			</form></center>
		</td>
	</tr>
</table>
 </div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>