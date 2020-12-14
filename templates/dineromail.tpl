<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Deposit (DineroMail)</h1>
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
			<strong>You are requested $&nbsp;{$requested_amount} amount for deposit in GoItGlobal through DineroMail and after including your payment gateway commission your requested amount is: $&nbsp;{$final_total}.</strong>
		</td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>		
<table border="0" width="100%" bgcolor="#FFFFFF" cellpadding="2">
	<tr>
		<td align="center">
			<form action="https://checkout.dineromail.com/CheckOut" method="post" >
                <!-- MERCHANT VARIABLES -->
                <input type="hidden" name="merchant" value="{$dineromail_id}" />
                <input type="hidden" name="country_id" value="1" />
                <input type="hidden" name="seller_name" value="GoItGlobal" />
                <input type="hidden" name="currency" value="usd" />
                <input type="hidden" name="ok_url" value="{$Site_Root}success.php?ESTADO=2" />
                <input type="hidden" name="error_url" value="{$Site_Root}cancel.php" />
                <input type="hidden" name="transaction_id" value="{$transaction_id}" />

                <!-- PAYMENT METHOD VARIABLE -->
                <input type="hidden" name="payment_method_available" value="ar_dm" />
                <input type="hidden" name="payment_method_1" value="ar_dm" />
                
                <!-- PRODUCT/ITEM VARIABLE -->
                <!-- Item 1 -->
                <input type="hidden" name="item_name_1" value="{$item_name}" />
                <input type="hidden" name="item_quantity_1" value="1" />
                <input type="hidden" name="item_ammount_1" value="{$final_total}" />
                <input type="hidden" name="item_currency_1" value="usd" />
                <!-- BUYER VARIABLE -->
                <input type="hidden" name="buyer_name" value="{$user_name}" />
                <input type="hidden" name="buyer_email" value="{$pay_from_email}" />
                <input type="hidden" name="buyer_number" value="{$user_id}" />
                <!-- DESIGN VARIABLES -->
                <input type="hidden" name="header_image" value="http://goitglobal.com/templates/images/logos/goITglobal_logo_small.png"/>
                <input type="hidden" name="header_width" value="1" />
                <input type="hidden" name="expanded_step_PM" value="0" />
                <input type="hidden" name="expanded_step_AD" value="0" />
                <input type="hidden" name="expanded_step_SC" value="0" />
                <input type="hidden" name="expanded_sale_detail" value="1" />
                <input type="hidden" name="step_color" value="F6F6F6" />
                <input type="hidden" name="hover_step_color" value="E8FFD3" />
                <input type="hidden" name="links_color" value="669900" />
                <input type="hidden" name="font_color" value="666666" />
                <input type="hidden" name="border_color" value="999999" />
                <input type="hidden" name="button_color" value="7DBE0B" />
                <input type='image' src='https://argentina.dineromail.com/import/img/payment-button-ar.png?dmbypayu' border='0' name='submit' alt='Pagar con DineroMail'>
         	</form>
		</td>
	</tr>
</table>
</div></div><b class="b4f"></b><b class="b3f"></b><b class="b2f"></b><b class="b1f"></b><br>
</div>
					
					<div id="more_link">
						
						
						
					</div>
				</div>