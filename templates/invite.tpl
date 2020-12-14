<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Join your Colleagues!</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->


<section class="overview" id="overview">
  <div class="container">
  
  
  <div class="row" style="background:#fff;">
  
  
      <div class="col-xs-12 successMsg">
    <h3>{$msg11}</h3>
    </div>




    <form name="frmInvitation" method="post" action="{$smarty.server.PHP_SELF}">
    <div class="col-xs-12 col-md-6">
    
    <textarea name="mail_ids" cols="40" rows="5" placeholder="{$lang.Email_Addresses}"></textarea>
    <br>
    {$lang.Comment}{$lang.Example}
    <br><br>
    <a href="javascript:openImportWindow( 'hotmail')" class="btn btn-primary" style="margin-bottom: 5px;width:170px">&nbsp;{$lang.Improt_Hotmail}</a>
                <a href="javascript:openImportWindow( 'outlook')" class="btn btn-primary" style="margin-bottom: 5px;width:170px">&nbsp;{$lang.Improt_OutLook}</a><br />
                <a href="javascript:openImportWindow( 'yahoo')" class="btn btn-primary" style="margin-bottom: 5px;width:170px">&nbsp;{$lang.Improt_Yahoo}</a>
                <a href="javascript:openImportWindow( 'gmail')" class="btn btn-primary" style="margin-bottom: 5px;width:170px">&nbsp;{$lang.Improt_Gmail}</a>

                <br><br>
    {$lang.Invite1}:<br>
    <textarea name="notes" cols="40" rows="5" placeholder="{$lang.Invite1}">{$lang.Text}.</textarea>
<br><br>

<a href="Javascript: Preview_Invition()" class="btn btn-primary" style="width:150px;">{$lang.Preview}</a> 

     <input id="btnbg" type="submit" name="Submit" value="{$lang.Button_Send}" class="btn btn-success" onClick="Javascript: return Check_Details(this.form);" style="width:150px;">
     <p>&nbsp;</p>
    </div>

     <div class="col-xs-12 col-md-6">

      <strong>{$lang.Invite}</strong><br />
          {$lang.Address_check}:
<br><br>

<a href="javascript:openImportWindow( 'hotmail')"><img src="{$Templates_Image}hotmail.png"  border="1" style="border-color:#FFFFFF" height="45px"/></a>
<br><br>

<a href="javascript:openImportWindow( 'outlook')"><img src="{$Templates_Image}outlook.jpg"  border="1" style="border-color:#FFFFFF"  height="40px" /></a>
<br><br>
<a href="javascript:openImportWindow( 'yahoo')"><img src="{$Templates_Image}yahoo.png"  border="1" style="border-color:#FFFFFF" height="30px;"/></a>
<br><br>
<a href="javascript:openImportWindow( 'gmail')"><img src="{$Templates_Image}gmail.png"  border="1" style="border-color:#FFFFFF" height="40px;"/></a>
<br><br>
<strong>{$lang.Desc}. </strong>
<br>
{$lang.Desc1}.
<br><br>

{*if $skip == 'Yes'*}
<a href="account.php" class="footerlink">{$Skip_Now}</a>

{*/if*}


</div></div>
    </div>
    </form>
</div>
</section>
