<?
define('IN_SITE', 	true);
define('IN_USER',	true);
include_once("includes/common.php");
include_once($physical_path['DB_Access'].'Member.php');
include_once($physical_path['Site_Lang'].'buystorage.php');
include_once($physical_path['DB_Access'].'Email.php');
include_once($physical_path['DB_Access'].'Pending.php');
include_once($physical_path['DB_Access'].'Payment.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : A_VIEW_ALL);

$member = new Member();
$emails	= new Email();
$pays   = new Payment();

// echo " ingreso ";

if($_POST['Submit2'] == $lang['Button_Cancel'])
{
   // echo "dio Cancel";
   header("location: account.php");
   exit(0);
}
elseif($_POST['Submit'] == $lang['Button_Submit'])
{
    
  $storage_id = $_POST['selected_storage'][0];	
  
  // echo "storage_id seleccionado: "; echo $storage_id;
  
  $plan_details = $member->GetMemberStorage($storage_id);
  
  // echo "plan_details_name: "; echo $plan_details->storage_name;
  
  $user_storage_details = $member->GetMemberStorageDetails($_SESSION['User_Id']);
  
  // echo "user_storage_details->plan_gigas_id: "; echo $user_storage_details->plan_gigas_id;
  
  $totalamount1 = Select_wallet_sum($_SESSION['User_Id']);
  $test  = substr($totalamount1,1);
  $test2 = str_replace(",","",$test);


  if ($user_storage_details->membership_id < 1) { // Si el usuario NO esta subscripto a ningun plan NO LO DEJA CONTRATAR STORAGE
   
        // echo "el usuario no esta subscripto a ningun plan, no lo deja contratar storage";
  
     	$tpl->assign(array(	"T_Body"	=>	'Msg'. $config['tplEx'],
								"msg"       =>   $lang['Message5'],
								"tab"	 	=>  4,
								"navigation"	=>  '<label class=navigation>'.$lang['Storage'].'</label>'
							));	
        header("location: account.php");
        exit(0);
  }
  
  
  if ($user_storage_details->plan_gigas_id > 0) { // chequea si el usuario ya esta suscripto a un plan de storage
  
       // echo "el usuario ya esta subscripto a un plan de storage, contact us";
       
     	$tpl->assign(array(	"T_Body"	=>	'Msg'. $config['tplEx'],
								"msg"       =>   $lang['Message4'],
								"tab"	 	=>  4,
								"navigation"	=>  '<label class=navigation>'.$lang['Storage'].'</label>'
							));	
        header("location: account.php");
        exit(0);
  }

 
  if($test2 >= ($plan_details->storage_fees)) // chequea si tiene saldo suficiente en su wallet para comprar este storage plan
  {
          
          // echo " test2-1";
          
          // echo " le pasa storage_id: "; echo $storage_id;
          // echo " le pasa storage_name: "; echo $plan_details->storage_name; 
    
	      $tpl->assign(array(	"T_Body"		  =>  'storage_confirm'. $config['tplEx'],
		                        "msg_confirm"     =>  $lang['Message_Confirm'], 
								"lang"			  =>  $lang,
								"storage_id"      =>  $storage_id,
								"storage_name"    =>  $plan_details->storage_name,
								"tab"			  =>  4,
								"navigation"	  =>  '<label class=navigation>'.$lang['Storage'].'</label>'
							));	
	  }
  else
	  {
		
		    // echo "test2-2";
		
			$tpl->assign(array(	"T_Body"	=>	'Msg'. $config['tplEx'],
								"msg"       =>   $lang['Message'],
								"tab"	 	=>  4,
								"navigation"	=>  '<label class=navigation>'.$lang['Storage'].'</label>'
							));	
	  }
}
elseif($_POST['Submit1'] == $lang['Button_Submit'])
{
    
    // echo "dio submit va a hacer la transaccion!! ";
    
    $storage_id = $_POST['storage_id'];
    
    // echo " storage_id elegido: "; echo $storage_id; 
    
    $plan_details = $member->GetMemberStorage($storage_id);
    
    // echo "plan_details->storage_fees: "; echo $plan_details->storage_fees;
    
    $totalamount1 = Select_wallet_sum($_SESSION['User_Id']);
    $new_wallet1 = $totalamount1 - $plan_details->total_price;
	
    // Updating Buyer Wallet	    
	Update_wallet_sum($_SESSION['User_Id'],$new_wallet1); 

	// Inserta esta transaccion del usuario
	$transcation_id = $member->Insert_Member_Paypal($_SESSION['User_Id'],$_SESSION['User_Name'],$plan_details->storage_fees,$plan_details->storage_name);
    
    //	$finished_date = date('Y-m-d ', mktime(0,0,0,date("m")+$plan_details->membership_time,date("d"),date("y")) );
	// $finished_date= date('Y-m-d',mktime(0,0,0,date('d')+$plan_details->membership_time));
	
	$finished_date = date('Y-m-d', strtotime('+30 day'));
	// echo $finished_date;

	
	 // echo "va a updatear la tabla member_master, user_id es: "; echo $_SESSION['User_Id'];
	$member->Update_Member_Storage_details($_SESSION['User_Id'], $transcation_id, $plan_details->storage_id);

	
     // echo " va a Insertar la historia en la tabla member_membership_history";
    $member->Insert_History($_SESSION['User_Id'],$_SESSION['User_Name'],$plan_details->storage_id,$plan_details->storage_name,$plan_details->storage_time,$plan_details->storage_fees,$finished_date);


    // echo "Inserto la ganancia neta en la tabla site_earning_deposite";
    
    // echo "Monto Total Pagado: "; echo $plan_details->total_price;
	$costo_plan	= number_format($plan_details->add_giga_cost*$plan_details->storage_id,2);
	// echo "  Costo_plan: ";echo $costo_plan;
	$earning    = $plan_details->total_price - $costo_plan;
	// echo "  Earning: "; echo $earning;
    $payment_gateway = "Paypal";
	$pays->Insert_Earning_depost($_SESSION['User_Id'],$_SESSION['User_Name'],$plan_details->total_price,$plan_details->total_price,$earning,$payment_gateway);	

    
    // echo "va a insertar la trx pendiente para el admin";
    // Inserto la transaccion como pendiente en la tabla Paypal_Pending_Deposite para el admin ASAP!!
    // $desc = $_SESSION['User_Name'] . " Plan: ". $plan_details->membership_name . " Price: " . $plan_details->membership_fees . " Expiration Date: " . $finished_date;
	// $pays->InsertInPaypalPending($_POST,$desc);


    // echo "va a enviar un mail";
    
  // Se le envia un mail agradeciendo su compra y con los datos basico de su plan..
    ////////////////////////////////////////////////////////////////////////////
    global $mail2;
    $mail2 = '';
    $mail2 = new htmlMimeMail();
		
    $tpl2 = new Smarty;
    $tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
    $sendinfo = $emails->GetEmailDetails1($_SESSION['User_Id']);
    $mail2->setFrom("billing@taskcontrol.net");
    // $mail2->setFrom($sendinfo->email_adress);
    // $mail2->setSubject($sendinfo->email_subject);
    $mail2->setSubject('TaskControl: Thanks for Your Order!');
    
    // echo " envia al mail plan_details->storage_name: "; echo $plan_details->storage_name;
    // echo " envia al mail plan_details->amount: "; echo $plan_details->total_price;
    
    $tpl2->assign(array("storage" => $plan_details->storage_name,
                        "finished_date" => $finished_date,
                        "amount" => $plan_details->total_price));
    
    $mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
    $mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
    $mail_content_reg = $tpl2->fetch("email_template:".STORAGE_BUY);	

    $mail_html = "<table border=0 cellpadding=0 cellspacing=0 width=75%>
					<tr>
						<td>".$mail_content_header."</td>
					</tr>
					<tr>
						<td>".$mail_content_reg."</td>
					</tr>
					<tr>
						<td>".$mail_content_footer."</td>
					</tr>
				</table>";
    
    $mail2->setHtml($mail_html);
    $recevier = GetEmailAddress($_SESSION['User_Id']);
    $result = $mail2->send(array($recevier));
    
    ////////////////////////////////////////////////////////////////////////////////////////     

     // echo "paso 5- ya deberia haber enviado el mail y le muestra los datos del plan comprado al user ";
      
    // Se le avisa que su compra ha sido exitosa. Se le recuerda el plan y fechas de compra y fin
   // ------------------------------------------------------------------
    
    $_SESSION['Storage_Name']	    =	$plan_details->storage_name;
	$_SESSION['Buy_Date']			=	date('Y-m-d');
	$_SESSION['Finished_Date']		=	$finished_date;
				 
    header("location: storage_buy_success.php");
  	exit(0);
}
else
 {
     
    // echo "otropaso";
    
	$ret = $member->ViewAll_Storage_Plans();
	$cnt = $db->num_rows();
	$i = 0;
	$str = $_SERVER['HTTP_REFERER'];
	
 //	 echo " cnt: "; echo $cnt;
	
	$str1 = substr(strrchr($str,'/'),1);
		
    if($str1 == 'account.php')
 	{
	   // echo " otropaso 1 ";
		$navigation = '<a href=account.php class=footerlink>'.$lang['My_Account'].'</a>';
		$navigation1= '<label class=navigation>'.$lang['Storage'].'</label>';
	}
	else
	{
	   // echo " otropaso 2 ";
		$navigation1= '<label class=navigation>'.$lang['Storage'].'</label>';
	}

	while($db->next_record())
	{
	    $arr_storage[$i]['id']	   				=	$db->f('storage_id');
		$arr_storage[$i]['name']					= 	$db->f('storage_name');
		// $arr_storage[$i]['time']					= 	$db->f('storage_time');
		$arr_storage[$i]['fees']			 	  	=	$db->f('storage_fees');
		$arr_storage[$i]['status']				=	$db->f('storage_status');
		$arr_storage[$i]['display_order']	    =	$db->f('display_order');
		$i++;
	}

    // echo " otropaso 3 ";
    
	$tpl->assign(array(	"T_Body"			=>	'buystorage'. $config['tplEx'],
						"JavaScript"		=>  array("storage.js"),
						"lang"				=>  $lang,
						"arr_storage"        =>  $arr_storage,
						"Loop"              =>  $cnt,
						"tab"			  	=>  4,
						"navigation"		=>	$navigation,
						"navigation1"		=>	$navigation1,
						"navigation2"		=>	$navigation2,
						));
						
   $user_storage_details = $member->GetMemberStorageDetails($_SESSION['User_Id']);						
   $plan_details = $member->GetMemberStorage($user_storage_details->plan_gigas_id);
   
   // echo "user_storage_details->plan_gigas_id: "; echo $user_storage_details->plan_gigas_id;
   
   $tpl->assign(array(	
						"plan_gigas_id"              =>  $user_storage_details->plan_gigas_id, 
						"storage_name"               =>  $plan_details->storage_name,
						"start_date"                 =>  $user_storage_details->storage_buy_date,
						"end_date"              	 =>  $user_storage_details->membership_finish_date,
						));
						
}
// echo "saliendo";
$tpl->display('default_layout'. $config['tplEx']);
?>