<script language="javascript">
	var JS_Storage			 = '{$lang.JS_Storage}';
	var JS_Storage_Check 	 = '{$lang.JS_Storage_Check}';
</script>


<header class="header-login">
   <div class="container">
      <div class="content">
         <div class="row">
            <h1 class="revealOnScroll" data-animation="fadeInDown">Buy Storage</h1>
            <!--<p>New Here? Create Account.</p>-->
         </div>
         <!-- /.row -->
      </div>
      <!-- /.content -->
   </div>
   <!-- /.container -->
</header> <!-- /header -->


 <section class="blogpage jobpost" id="blogpage">
	  <div class="container text-left">
	   <div class="row">
		<div class="col-lg-8 col-lg-offset-2 white-blogpage">

		  <h4>{if $plan_gigas_id != '0'}{else}{$lang.Title}{/if}</h4>
		  
		  <hr class="small-hr">
		  <form name="frmstorage" method="post">
		  {if $plan_gigas_id != '0'}
		       {$lang.Message1} <strong>{$storage_name}</strong> at <strong>{$start_date}</strong>.<br>
	   	       {$lang.Message3}	
		  {else}
		      {$lang.Storage_Msg} 
  		      <!-- <p>&nbsp;</p> -->
          
          
<div class="row">
 
  <div class="col-xs-4">
    <h6>{$lang.Pick}</h6>
  </div>
 
  <div class="col-xs-5">
    <h6>{$lang.Storage_Name}</h6>
  </div>
 
<!--  <div class="col-xs-3">
    <h6> {$lang.Storage_Time}</h6>
  </div>
-->
  
  <div class="col-xs-3">
    <h6>{$lang.Storage_Fees}</h6>
  </div>
 
  <div class="col-xs-12">
    <hr style="margin-top: 0px;margin-bottom: 10px;">
  </div>
</div>



{section name=mem loop=$Loop}
<div class="row rowflex">
  
  <div class="col-xs-4">
      <input type="radio" name="selected_storage[]" id="{$arr_storage[mem].id}" value="{$arr_storage[mem].id}">
  </div>
  
  <div class="col-xs-5">
    <label for="{$arr_storage[mem].id}">{$arr_storage[mem].name}</label>
  </div> 
  
  
 <!-- <div class="col-xs-3">
     <label for="{$arr_storage[mem].id}">{$arr_storage[mem].time}</label>
  </div> 
 -->

  <div class="col-xs-3">
     <label for="{$arr_storage[mem].id}">{$lang_common.Curreny}&nbsp;{$arr_storage[mem].fees}</label>
  </div>

</div>
{/section}


<div class="col-lg-12">
  <input style="left: 0px;margin-top: 23px;" id="btnbg2" type="submit" name="Submit" value="{$lang.Button_Submit}" class="kafe-btn kafe-btn-mint full-width" onClick="javascript: return check_storage(document.frmstorage,'{$Loop}');">
</div>
</form>
{/if}

   <!-- {$lang.Storage_Msg}  -->

      </div>
    </div>
  </div>
</section>

<p>&nbsp;</p>
