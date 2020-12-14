<header class="header-login">
  <div class="container">
    <div class="content">
      <div class="row">
        <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Transaction_History}</h1>
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
        <div class="col-md-12 col-sm-12 col-xs-12  bg-primary"  style="padding:4px;margin:4px;">
          <div class="col-md-2 col-sm-2 col-xs-2">
            <p>{$lang.Amount}</p>
          </div>
          <div class="col-md-7 col-sm-7 col-xs-7">
            <p>{$lang.Description}</p>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-3">
            <p>{$lang.Date}</p>
          </div>
        </div> {if $Loop != ''} 
        {section name=trac loop=$Loop}
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="col-md-2 col-sm-2 col-xs-2">
            <p>{$atraction[trac].trans_type}{$lang.Curreny}&nbsp;{$atraction[trac].amount|string_format:"%.2f"}</p>
          </div>
          <div class="col-md-7 col-sm-7 col-xs-7">
            <p>{$atraction[trac].description}</p>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-3">
            <p>{$atraction[trac].date}</p>
          </div>
        </div> 
        {/section}
        {else}
        <div class="col-md-12 col-sm-12 col-xs-12">
          <p>{$msg}</p>
        </div> {/if} {if $Page_Link}
        <div class="col-md-12 col-sm-12 col-xs-12"> {$Page_Link} </div> {/if} </form>
      </div>
    </div><p>&nbsp;</p><p>&nbsp;</p>
  </div>
</section>

