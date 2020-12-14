<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h2 class="revealOnScroll" data-animation="fadeInDown">{$lang.Money_Withdrawal}</h2>
            <h4>{$lang.Withdraw}</h4>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->


<!--
http://192.168.1.129/withdraw.php
-->


<script language="javascript">
	var JS_Amount_withdarw		 = '{$lang.JS_Amount_withdarw}';
	var JS_Amount_no_withdarw	 = '{$lang.JS_Amount_no_withdarw}';
	var JS_Amount_gra_withdarw	 = '{$lang.JS_Amount_gra_withdarw}';
	var JS_Valid_Mail	 		 = '{$lang.JS_Valid_Mail}';
	var JS_WC_WITHDRAW_AMOUNT	 = '{$lang.JS_WC_WITHDRAW_AMOUNT}';

	addLoadEvent(prepareInputsForHints);
</script>


<section class="overview" id="overview">
  <div class="container" style="background-color:#fff;">
    <div class="row">
    
    {if $totalamount1 < 0.00}
     {$msg}

    
    {else}
    
    <div class="col-sm-12 col-xs-12 col-md-12">
    <p>&nbsp;</p>
   <p><b>{$lang.Notice}</b></p>
    <p><b>{$lang.Notice1}</b></p>
   
   <p>{$lang.line1}</p>
   <p>{$lang.line2}</p>
   <p>{$lang.line3}</p>
   <p>{$lang.line4}</p>
   <p>{$lang.line5}</p>
   <p>{$lang.line6}</p>
   <p>{$lang.line7}</p>
   <p>{$lang.line8}</p>
   <p>{$lang.line9} {$min} {$lang.Curreny}</p>
   <p>{$lang.line10}</p>
   <p>{$lang.line11}</p>
   <p>{$lang.line12}</p>
   <p>{$lang.line13}</p>
   <p>{$lang.line14}</p>
   <p>{$lang.line15}</p>
   <p>{$lang.line16}</p>
   <p>{$lang.line17}</p>
   
   {if $amount_msg}
	<p>
	  <h3>{$amount_msg}</h3>
	</p>
    {/if}
    
    </div>
    
    
    <form method="post" action="{$smarty.server.PHP_SELF}?Action=Next_Step1" name="frmWithdraw">

    

    <div class="col-md-12 col-sm-12 col-xs-12 bg-primary  white-2" style="padding:4px;">
      <div class="col-sm-3 col-xs-3 col-md-3" style="text-align:center;">
	    <p style="color:#fff !important;"><b>{$lang.Payment_Method}</b></p>
      </div>
      <div class="col-sm-3 col-xs-3 col-md-3" style="text-align:center;">
	    <p style="color:#fff !important;"><b>{$lang.Cost}</b></p>
      </div>
      <div class="col-sm-6 col-xs-6 col-md-6" style="text-align:center;">
	    <p>&nbsp;</p>
      </div>
      
    </div>
    
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="col-sm-3 col-xs-3 col-md-3">
      <p style="line-height: 70px;"><input type="radio" name="pay_mehtod" value="paypal" checked="checked" onclick="document.getElementById('metodo').innerHTML = 'PayPal'" /> 
	{$lang.PayPal}</p>
      </div>
      <div class="col-sm-3 col-xs-3 col-md-3">
	<p style="line-height: 70px;">{$per_amount_deposit}% + {$fix_amount_deposit} {$lang.Curreny}</p>
      </div>
      <div class="col-sm-6 col-xs-6 col-md-6">
	<p style="line-height: 70px;"><img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" BORDER="0" ALT="Login at Paypal and start to accept payment & credit cards"/></p>
      </div>
    </div>
    
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="col-sm-3 col-xs-3 col-md-3">
      <p style="line-height: 70px;"><input type="radio" name="pay_mehtod" value="moneybooker" onclick="document.getElementById('metodo').innerHTML = 'MoneyBooker'" />
	      {$lang.Money_Booker}</p>
      </div>
      <div class="col-sm-3 col-xs-3 col-md-3">
	<p style="line-height: 70px;">{$per_amount_deposit}% + {$fix_amount_deposit} {$lang.Curreny}</p>
      </div>
      <div class="col-sm-6 col-xs-6 col-md-6">
	<p style="line-height: 70px;"><img src="{$Templates_Image}skrill-chkout_int_160x75.gif" BORDER="0"/></p>
      </div>
    </div>
    
    
    
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="col-sm-3 col-xs-3 col-md-3">
      <p style="line-height: 70px;"><input type="radio" name="pay_mehtod" value="dineromail" onclick="document.getElementById('metodo').innerHTML = 'DineroMail'" />
	      DineroMail</p>
      </div>
      <div class="col-sm-3 col-xs-3 col-md-3">
	<p style="line-height: 70px;">{$per_amount_deposit}% + {$fix_amount_deposit} {$lang.Curreny}</p>
      </div>
      <div class="col-sm-6 col-xs-6 col-md-6">
	<p style="line-height: 70px;"><img src="{$Templates_Image}728x90-4.gif" title="DineroMail - Medios de pago" alt="DineroMail - Medios de pago" width="468" height="60"/></p>
      </div>
    </div>
    
    
    
    
    <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="col-sm-3 col-xs-3 col-md-3">
      <p style="line-height: 70px;"><input type="radio" name="pay_mehtod" value="mercadopago" onclick="document.getElementById('metodo').innerHTML = 'MercadoPago'" />
	MercadoPago</p>
      </div>
      <div class="col-sm-3 col-xs-3 col-md-3">
	<p style="line-height: 70px;"> {$per_amount_deposit}% + {$fix_amount_deposit} {$lang.Curreny}</p>
      </div>
      <div class="col-sm-6 col-xs-6 col-md-6">
	<p style="line-height: 70px;"><img src="http://imgmp.mlstatic.com/org-img/banners/ar/medios/468X60.jpg" title="MercadoPago - Medios de pago" alt="MercadoPago - Medios de pago" width="468" height="60"/></p>
      </div>
    </div>
    


 <div class="col-md-12 col-sm-12 col-xs-12">
      <div class="col-sm-3 col-xs-3 col-md-3">
      <p style="line-height: 70px;"><input type="radio" name="pay_mehtod" value="neteller" onclick="document.getElementById('metodo').innerHTML = 'Neteller'" />
	Neteller</p>
      </div>
      <div class="col-sm-3 col-xs-3 col-md-3">
	<p style="line-height: 70px;"> {$per_amount_deposit}% + {$fix_amount_deposit} {$lang.Curreny}</p>
      </div>
      <div class="col-sm-6 col-xs-6 col-md-6">
	<p style="line-height: 70px;"><img src="http://imgmp.mlstatic.com/org-img/banners/ar/medios/468X60.jpg" title="Neteller Payment" alt="Neteller - Payment" width="468" height="60"/></p>
      </div>
    </div>    
    
 

      <div class="col-md-12 col-sm-12 col-xs-12">
	<p><b> {$lang.Your_Balance}: {$lang.Curreny}&nbsp;{$totalamount1}</b>
	</p>
      </div>
      <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;">
	<div class="input-group">
	  <div class="input-group-addon">{$lang.Withdraw_Amount}: {$lang.Curreny}</div>
	  <input type="text" name="withdraw_amount" class="form-control" style="width:200px" /> </div>
      </div>
      <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;">
	<div class="input-group">
	  <div class="input-group-addon">E-mail to:</div>
	  <input type="text" name="email_to" class="form-control" size="30" style="width:200px;" /> </div>
      </div>

       <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom:10px;">
      <center> <input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Ctn}" class="btn btn-success"  onclick="javascript : return Check_Details(this.form);" style="width:200px;">
       </center>
       </div>
<input type="hidden" name="amount" value="{$totalamount1}" />
      </form>
      {/if}
      <p>&nbsp;</p>
    </div>
  </div>
</section>

<p>&nbsp;</p>





