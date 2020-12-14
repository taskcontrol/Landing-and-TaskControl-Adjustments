<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Deposit_Money}</h1>
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
	var JS_Amount	 	= '{$lang.JS_Amount}';
	var JS_Amount_gra 	= '{$lang.JS_Amount_gra}';
	var JS_Amount_no 	= '{$lang.JS_Amount_no}';
	var JS_Amount_Too_Big   = '{$lang.JS_Amount_Too_Big}';
	var JS_WC_MAX_DEPOSIT   = '{$WC_MAX_DEPOSIT}';
	var JS_WC_POST_DEPOSIT	= '{$JS_WC_POST_DEPOSIT}';
	addLoadEvent(prepareInputsForHints);
</script>


<div id="list_head">

<section class="overview" id="overview">
  
   <div class="container" style="background-color:#fff;">
    <div class="row">
      <div class="form-sign">
        <div class="form-head">
          <h3 style="color:#000;">{$lang.Deposit}</h3>
        </div>
        <div class="col-xs-12 col-md-12">
          <hr>
	</div>
	
	
        <div class="col-xs-12 col-md-12 bg-primary" style="padding:4px;">
          <div class="col-xs-3 col-md-3" style="text-align:center;">
            <p style="color:#fff !important;"><b>{$lang.Payment_Method}</b>
            </p>
          </div>
        
          <div class="col-xs-2 col-md-2" style="text-align:center;">
            <p style="color:#fff !important;"><b>{$lang.Cost}</b>
            </p>
          </div>
          <div class="col-xs-7 col-md-7"> </div>
        </div>
        
        <div class="col-xs-12 col-md-12">
          <hr> 
        </div>
        
        <form method="post" action="{$smarty.server.PHP_SELF}?Action=Next_Step" name="frmPayPal">
          <div class="col-xs-12 col-md-12">
            <div class="col-xs-3 col-md-3">
              <p style="">
                <input type="radio" id="pay_method_pp" name="pay_mehtod" value="paypal" checked="checked" style="float: left;">
                <label style="display: inline;margin-left: 5px;" for="pay_method_pp">{$lang.PayPal} / {$lang.Credit_Card}</label>
              </p>
            </div>
			<div class="col-xs-2 col-md-2">
              <p style="">{$per_amount}% + {$fix_amount} {$lang.Currency}</p>
            </div>
         
            <div class="col-xs-7 col-md-7" style=""> <img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg" BORDER="0" ALT="Login at Paypal and start to accept payment & credit cards" /> </div>
           
          <div class="col-xs-12 col-md-12">
            <hr> </div>
			

        <div class="logos Estilo5">
           <p><span class="Estilo6"><strong>We can also accept payments from the following payment processors</span><span class="Estilo6">:</strong></span><br>
             <br>
              <img style="height: 50px;margin-right: 50px;" src="/templates/images/logos/skrill-chkout_int_220x103.png" >
              <img style="height: 50px;margin-right: 50px;" src="/templates/images/logos/LogoPayoneer.png" >
		      <img style="height: 50px;margin-right: 50px;" src="/templates/images/logos/logo-mercadopago.png" >
		      <img style="height: 50px;margin-right: 50px;" src="/templates/images/logos/logo-neteller.png" >
           </p>
           <p><span class="Estilo6"><strong>Please Contact Us to proceed with the payment in such a cases</span><span class="Estilo6">:</strong></span><br>
        </div>
            
          <!-- <href="mailto:contactus@taskcontrol.co" style="margin-right: 20px;" -->
          
	   <div class="col-xs-12 col-md-12" ></div>
        
        
        <br><br>
        
        <div class="input-group">
		    <div class="input-group-addon"><strong>{$lang.Deposit_Amount}: {$lang.Currency}</strong></div>
		    <input type="text" name="amount" class="form-control" style="width:200px;" />
	    </div>
	  
	    </p></h4> </div>
        
    
         <div class="form-foot">
            <div class="form-actions">
              <div class="col-xs-12 col-md-12" style="text-align:center;">
                <button id="btnbg" type="submit" class="form-btn" name="Submit" value="{$lang.Button_Ctn}" onclick="javascript:return Check_Details(this.form);" style="width:300px;margin:30px 0px;"> {$lang.Button_Ctn} </button>
              </div>
            </div>
          </div>
      </div>
      </form>
         
         
      </div>
      </form>
    </div>
  </div>
</section>

