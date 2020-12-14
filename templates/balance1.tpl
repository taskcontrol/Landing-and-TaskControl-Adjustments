<!--<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Balance</h1>
         </div>
      </div>
   </div>
</header>-->

<div class="col-lg-12">
  <div class="col-lg-12">
    <hr> </div>
  <h2>{$lang.Balance}: {$lang_common.Curreny} {$Total_Amount}</h3>
  <div class="row"><hr class="small-hr"></div>
  <div class="col-md-4 col-sm-4 col-xs-4" style="text-align:center;">
<!--     <div class="form-sign" style="text-align: center;"> -->
      <a href="deposit.php" class="btn btn-success" style="width: 100%;text-align: center;">{$lang.Deposit_Money}</a>
<!--     </div> -->
  </div>
  <div class="col-md-3 col-sm-3 col-xs-3" style="text-align:right;">
<!--     <div class="form-sign" style="text-align: center;"> -->
      <a href="escrow.php" class="btn btn-primary" style="width: 100%;text-align: center;">{$lang.New_Escrow_Payment1}</a>
  </div>
  <div class="col-md-1 col-sm-1 col-xs-1" style="text-align:left;padding: 0;width: 3%;">
      <a href="page_7.html#ppayfaq0"  class="blacklink" style="text-decoration:none;">{$lang.New_Escrow_Payment1_question}</a>
<!--     </div> -->
  </div>
  <div class="col-md-4 col-sm-4 col-xs-4" style="text-align:center;">
<!--     <div class="form-sign" style="text-align: center;"> -->
      <a href="withdraw.php" class="btn btn-info" style="width: 100%;text-align: center;">{$lang.Withdraw_Money}</a>
<!--     </div> -->
  </div>
</div>



<div class="col-xs-12 col-md-12"><hr class="small-hr"></div>



<div class="row">



 <div class="col-xs-3 col-md-3">
<h5>{$lang.Last_Transaction}:</h5>
</div>


 <div class="col-xs-3 col-md-3">
 <h5>{$lang.Amount} ({$lang_common.Curreny}): {$last_trans_type}&nbsp;{$last_amount|string_format:"%.2f"}</h5>
 </div>
 <div class="col-xs-3 col-md-3">
 <h5>Date: {$last_date}</h5>
 </div>
 <div class="col-xs-3 col-md-3">
 <h5><a href="transcation.php"  class="blacklink">{$View_All1}</a></h5>
 </div>
 
{if $Total_Amount > 0.00}
<div class="col-xs-12 col-md-12">
	    {$lang.Description} : {$last_desc|stripslashes}<br>
	    Date : {$last_date} 
		      </div>
	      {/if}

</div>
<div class="col-xs-12"><hr class="small-hr"></div>



