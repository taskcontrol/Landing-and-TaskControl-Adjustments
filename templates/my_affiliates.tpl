<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Affilates_Activity}</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->

<section class="folio" id="folio" style="background:#fff;">
  <div class="container">
    <div class="row">
      <div class="job">	
	<div class="col-md-12 col-sm-12 col-xs-12">
	  <div class="col-md-12 col-sm-12 col-xs-12">
	    <h5>
	    <p><a href="affilates_banners.php">{$lang.Promotional_Banners}</a></p>
	    </h5>
	  </div>
	  <div class="col-md-12 col-sm-12 col-xs-12">
	    <hr>
	  </div>
	 <p>
	  {$lang.Your_Affiliate_URL}:
	    <a href="{$Site_Root}signup.php?aff={$smarty.session.User_Name}">{$Site_Root}signup.php?aff={$smarty.session.User_Name}</a>
	  </p>
	  <div class="col-md-12 col-sm-12 col-xs-12">
	    <hr>
	  </div>
	    <p><h4>{$lang.Affilates_Signed}:</h4></p>
	      <hr>
	  <p><h5>{$msg}</h5></p>


{if $Loop > 0}
<form name="frmaffialtes" method="post" enctype="multipart/form-data">
<div class="col-md-12 col-sm-12 col-xs-12">
  <div class="col-md-4 col-sm-4 col-xs-4">
    <p>{$lang.Affilates_Login_Id}</p>
  </div>

  <div class="col-md-4 col-sm-4 col-xs-4">
    <p>{$lang.Affilates_Date}</p>
  </div>

  <div class="col-md-4 col-sm-4 col-xs-4">
    <p>{$lang.Earn_By_Affilation}</p>
  </div>
</div>

{section name=AffList loop=$Loop}
<div class="col-md-12 col-sm-12 col-xs-12">
  <div class="col-md-4 col-sm-4 col-xs-4">
  <p>{$affilated_login_id[AffList]}</p>
  </div>

  <div class="col-md-4 col-sm-4 col-xs-4">
  <p>{$signup_date[AffList]}</p>
  </div>

  <div class="col-md-4 col-sm-4 col-xs-4">
  <p>{$lang.Curreny} {$user_earning[AffList]}</p>
  </div>
</div>
{/section}

<p>&nbsp;</p>

<div class="col-md-12 col-sm-12 col-xs-12">
  <p>{$lang.Tot_Earn_By_Affilation} : {$lang.Curreny}&nbsp;{$total_earning}</p>
</div>

{if $total_earning >= 100}
<div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;">
  <button type="submit" style="margin-top: 23px;" class="kafe-btn-mint" name="Submit" value="Transfer Money in Your Account"> Transfer Money in Your Account </button>
</div>
{/if}
<p>
{$Page_Link}
</p>
  <input type="hidden" name="user_id" value="{$smarty.session.User_Name}" />
              <input type="hidden" name="total_earning" value="{$total_earning}" /> </form>
  {else}
  <div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;"><p><h5>{$lang.No_Affilates_Text}</h5></p></div>
{/if}
	</div>
      </div>
      <p>&nbsp;</p><p>&nbsp;</p>
    </div><hr>
  </div>
</section>

