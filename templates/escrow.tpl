<header class="header-login">
  <div class="container">
    <div class="content">
      <div class="row">
        <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Transfer_Money_Escrow}</h1>
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
var JS_Amount = '{$JS_Amount}';
var JS_TAC_User = '{$JS_TAC_User}';
var JS_Amount_Check = '{$JS_Amount_Check}';
var WC_ESCROW_PAYMENT = '{$WC_ESCROW_PAYMENT}';
addLoadEvent(prepareInputsForHints);
</script>
<section class="overview" id="overview">
  <div class="container">
    <form method="post" action="{$smarty.server.PHP_SELF}" name="frmescrow">
      <div class="col-lg-8 col-lg-offset-2" style="background-color:#fff;">
        <hr>
        <h4>{$lang.Escrow_Note}</h4>
        <hr> <strong>{$lang.Balance} : {$lang.Curreny}&nbsp;{$totalamount1}</strong>
        <hr> <strong>{$lang.Fill_escrow}</strong>
        <br>
        <br> {$lang.Reason}
        <br>
        <br>
        <input type="radio" name="payment" id="payment777" value="1" onclick="show_FullPay()"> &nbsp;
        <label for="payment777">{$lang.Full}</label>
        <br>
        <input type="radio" name="payment" id="payment778" value="2" onclick="show_PartialPay()"> &nbsp;
        <label for="payment778">{$lang.Partial}</label>
        <br>
        <input type="radio" name="payment" id="payment779" value="3" onclick="show_PartialCompletePay()"> &nbsp;
        <label for="payment779">{$lang.Partial_Complete} </label>
        <br>
        <hr> <span id="fullpay" style="display:none;">
      <div class="col-lg-12">
	<div class="col-lg-6">
	  <p>{$lang.Project_Post}</p>
	</div>
	<div class="col-lg-6">
	  <select name="project_list" class="textbox" onchange="showHint(document.frmescrow.project_list.value)">
	    <option value="0">{$lang.Choose_Project}</option>
	    {$Project_Listing_For_Full}
	  </select>
	</div>
      </div>
      <div class="col-lg-12">
	  <div class="col-lg-6">
	   <p> {$lang.TAC_username}</p>
	  </div>
	  <div class="col-lg-6">
	   <p> <span id="txtHint"></span> </p>
      </div>
  </div>
  <div class="col-lg-12">
    <div class="col-lg-6">
      <p>{$lang.Amount_Head}</p>
    </div>
    <div class="col-lg-6">
      <p> {$lang.Curreny}<span id="txtHint_1"></span> </p>
    </div>
  </div>
  </span> <span id="partialpay" style="display:none;">
   <div class="col-lg-12">
	  <div class="col-lg-6">
	    <p>{$lang.Project_Post}</p>
	  </div>
	  <div class="col-lg-6">
	    <select name="project_listing" class="textbox" onchange="showHint_Partial(document.frmescrow.project_listing.value)">
		    <option value="0">{$lang.Choose_Project}</option>
		    {$Project_Listing_For_Partial}
	    </select>
	  </div>
      </div>
    <div class="col-lg-12">
	  <div class="col-lg-6">
	    <p>{$lang.TAC_username}</p>
	  </div>
	  <div class="col-lg-6">
	    <p> <span id="txtHint_2"></span> </p>
  <input type="hidden" name="max_amount" id="max_amount" /> </div>
  </div>
  <div class="col-lg-12">
    <div class="col-lg-6">
      <p>{$lang.Amount_Head}</p>
    </div>
    <div class="col-lg-6">
      <p>{$lang.Curreny}&nbsp;
        <input type="text" name="send_amount_partially" /> </p>
    </div>
  </div>
  </span> <span id="partialpay_Complete" style="display:none;">
    <div class="col-lg-12">
      <div class="col-lg-6">
	<p>{$lang.Project_Post}</p>
      </div>
      <div class="col-lg-6">
	<select name="project_lists" class="textbox" onchange="showHint_Partial_Complete(document.frmescrow.project_lists.value)">
	  <option value="0">{$lang.Choose_Project}</option>
	  {$Project_Listing_For_Partial}
	</select>
      </div>
    </div>
    <div class="col-lg-12">
      <div class="col-lg-6">
	<p>{$lang.TAC_username}</p>
      </div>
      <div class="col-lg-6">
	<p><span id="txtHint_3"></span> </p>
  </div>
  </div>
  <div class="col-lg-12">
    <div class="col-lg-6">
      <p>{$lang.Remaining_Amount}</p>
    </div>
    <div class="col-lg-6">
      <p>{$lang.Curreny}&nbsp;<span id="txtHint_4"></span> </p>
    </div>
  </div>
  </span>
  <div class="col-lg-12">
    <div class="form-foot">
      <div class="row">
        <div class="form-actions">
          <button id="btnbg2" type="submit" name="Submit" value="{$lang.Button_Submit}" class="form-btn" onclick="javascript : return Check_Details(this.form)" style="width:300px;margin:30px 0px;"> {$lang.Button_Submit} </button>
        </div>
      </div>
    </div>
  </div>
  </div>
  <input type="hidden" name="user_name" id="user_name" />
  <input type="hidden" name="send_amount" id="send_amount" />
  <input type="hidden" name="amount" value="{$totalamount1}" />
  <input type="hidden" name="type" id="type" />
  <input type="hidden" name="total_max_amount" id="total_max_amount" />
  <input type="hidden" name="remaing_amount" id="remaing_amount" /> </form>
  <p>&nbsp;</p>
  </div>
</section>