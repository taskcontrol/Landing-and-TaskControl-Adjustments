<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">
            {if $User_Id != $Recevier_id}
					   {if $new_user_name == 0}
					{$lang.Add_Portfolio_En}
						{/if}
					{/if}	
					</h1>
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header>
<!-- /header -->



<script language="javascript">
	var JS_en			 = '{$lang.JS_en}';

	addLoadEvent(prepareInputsForHints);
</script>


<section class="folio" id="folio" style="background:#fff;">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <br>
        <form method="post" action="{$smarty.server.PHP_SELF}" name="frmcontact" enctype="multipart/form-data"> {if $succMsg}
          <h4>{$succMsg}</h4>
          <hr> {/if} {if $User_Id != $Recevier_id} {if $new_user_name == 1} {$lang.view_contact_msg} {/if} {if $new_user_name == 0}
          <div class="form-group"> {$lang.Msg} </div>
          <div class="form-group">
            <p>
              <input name="en_service" type="text" maxlength="50" style="width:80%;" placeholder="{$lang.En_Service}" class="form-control" /> </p>
          </div>
          <div class="form-group">
            <p>
              <textarea name="en_service_desc" class="form-control" rows="10" style="width:80%;" placeholder="{$lang.En_Service_Desc}"></textarea>
            </p>
          </div>
          <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12">
              <p>{$lang.Sample_File}</p>
              <p>
                <input type="file" name="upload_file" class="textbox"> </div>
            </p>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <p>{$lang.Dev_cost} :</p>
              <p>
                <select name="dev" class="form-control" style="width:250px;"> {$Development_List} </select>
              </p>
            </div>
          </div>
          <p>&nbsp;</p>
          <div class="form-group" style="text-align:center;">
            <input class="btn btn-success" type="submit" style="width:200px;" id="btnbg" name="Submit" value="{$lang.Submit1}" onClick="Javascript: return Check_Details(this.form);" /> </div>
          <p>&nbsp;</p> {/if} {/if}
          <input type="hidden" name="Action" value="{$Action}">
          <input type="hidden" name="User_Id" value="{$User_Id}">
          <input type="hidden" name="user_name" value="{$user_name}"> </form>
      </div>
    </div>
  </div>
</section>

