<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">{$lang.Seller_Activity}</h1>
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
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
      
      <div id="sidebar" class="col-lg-4">
        <div class="list">
          <div class="list-group">

            <a href="seller_profile_{$user_name}.html" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.View_Seller}
            </a>
            <a href="editsellerprofile.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Edit_Seller}
            </a>
            <a href="manage_portfolio.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Manage_Portfolio}
            </a>
	    <a href="seller_activity.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.View_Seller_Activity}
            </a>
            <a href="rating_to_buyer.php" class="list-group-item cat-list">
              <em class="fa fa-fw fa-align-justify"></em>&nbsp;&nbsp;&nbsp;{$lang.Rating_Buyer}
            </a>
            
          </div>
          <!-- ./.list-group -->
        </div>
        <!-- ./.list -->
</div>

<div class="col-lg-8 white-2">
{if $succMsg}
<h4>{$succMsg}</h4>
<hr>
{/if}
{include file="$T_Balance"}



{if $Loop1>0}

<p>{$lang.Recently_Awarded_Project}</p>
<hr>
 <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="col-md-5 col-sm-5 col-xs-5">
 <p>{$lang.Project}</p>
    </div>
    <div class="col-md-2 col-sm-2 col-xs-2">
 <p>{$lang.My_Bids}</p>
    </div>
    <div class="col-md-3 col-sm-3 col-xs-3">
 <p>{$lang.Delivery_Time}</p>
    </div>
    <div class="col-md-2 col-sm-2 col-xs-2">
    </div>
 </div>
 
 
 {section name=project_name loop=$Loop1}
 <div class="col-md-12 col-sm-12 col-xs-12">
      
      <div class="col-md-5 col-sm-5 col-xs-5"><a href="project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$post_project[project_name].Project_Title|stripslashes}</a></div>
      <div class="col-md-2 col-sm-2 col-xs-2">{$lang_common.Curreny}&nbsp;{$post_project[project_name].bid_amount}</div>
      <div class="col-md-3 col-sm-3 col-xs-3">{$post_project[project_name].delivery_within} {$lang.Day}</div>
      <div class="col-md-2 col-sm-2 col-xs-2"><a href="accept_project_{$post_project[project_name].id}_{$post_project[project_name].clear_title}.html" class="footerlinkcommon2">{$lang.Accept_Deny} </a></div>
 </div>
{/section}



{/if}


</div>

      </div>
    </div>
  </div>
</section>

