<?
define('IN_SITE', 	true);
define('IN_USER',	true);

include_once("includes/common.php");
include_once($physical_path['DB_Access']. 'Member.php');
include_once($physical_path['Site_Lang'].'membership.php');
include_once($physical_path['DB_Access']. 'Email.php');
include_once($physical_path['DB_Access']. 'Pending.php');
include_once($physical_path['DB_Access']. 'Payment.php');
include_once($physical_path['DB_Access']. 'Pdf_Send.php');

$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : A_VIEW_ALL);

$member = new Member();
$emails	= new Email();
$pays   = new Payment();

 // echo " ingreso ";

if($_POST['Submit2'] == $lang['Button_Cancel'])
{
//    echo "dio Cancel";
   header("location: membership.php");
   exit(0);
}
elseif($_POST['Submit'] == $lang['Button_Submit'])
{
    
    // echo "dio submit1";
  
  // Traigo detalles del plan elegido  
  $membership_id = $_POST['selected_membership'][0];
  $Company_Address= $member->GetMember($mem_address);
  $details = $member->GetMember($membership_id);
  
  // Traigo los datos del usuario
  $user_details = $member->GetMemberDetails($_SESSION['User_Id']);
  $totaldiscount= number_format(($details->membership_fees)*$user_details->discount_percent/100.00,2); 
  
   // echo "** details->membership_fees: ".$details->membership_fees;
   // echo "** totaldiscount recien calculado: ".$totaldiscount;
  $totalamount1 = Select_wallet_sum($_SESSION['User_Id']);
  $test  = substr($totalamount1,1);
  $test2 = str_replace(",","",$test);

  // chequea si tiene saldo suficiente en su wallet para comprar para este plan
   // echo " wallet(test2): ".$test2;
  $temp= $details->membership_fees+$user_details->additionals_cost-$totaldiscount;
   // echo "discount: ".$totaldiscount;
   // echo " plan+additionals-discount: ".$temp;
  
  if($test2 >= $details->membership_fees+$user_details->additionals_cost-$totaldiscount) 
      {
          
        // echo "test2-1";
          
	      $tpl->assign(array(	"T_Body"		  =>  'membership_confirm'. $config['tplEx'],
		                        "msg_confirm"     =>  $lang['Message_Confirm'], 
								"lang"			  =>  $lang,
								"membership_id"   =>  $membership_id,
								"membership_name" =>  $details->membership_name,
								"tab"			  =>  4,
								"navigation"	  =>  '<label class=navigation>'.$lang['Membership'].'</label>'
							));	
	  }
  else
	  {
		
		 // echo "test2-2";
		
			$tpl->assign(array(	"T_Body"	=>	'Msg'. $config['tplEx'],
								"msg"       =>   $lang['Message'],
								"tab"	 	=>  4,
								"navigation"	=>  '<label class=navigation>'.$lang['Membership'].'</label>'
							));	
	  }
}
elseif($_POST['Submit1'] == $lang['Button_Submit'])
{
    
     // echo "dio submit va a hacer la transaccion";
    
    $user_details = $member->GetMemberDetails($_SESSION['User_Id']);	
    $details = $member->GetMember($_POST['membership_id']);
    $totalamount1 = Select_wallet_sum($_SESSION['User_Id']);
    $totaladditionals= number_format($user_details->additionals_cost,2);
    $additionals_descrip= $user_details->additionals_description;
    $totaldiscount= number_format(($details->membership_fees+$totaladditionals)*$user_details->discount_percent/100.00,2); 
    // echo " Totaladditionals: "; echo $totaladditionals;
    // echo " Totaldiscount: "; echo $totaldiscount;
    $importe_plan= number_format($details->membership_fees,2);
    $importe= number_format($importe_plan + $totaladditionals - $totaldiscount,2); // le sumo los posibles adicionales y le resto el descuento si existiese para ese cliente
     // echo "total monto con +adicionales - descuento: "; echo $importe;
    $new_wallet1 = number_format($totalamount1 - $importe,2);
	// echo "new wallet: "; echo $new_wallet1;
	
    // Updating Buyer Wallet	    
	Update_wallet_sum($_SESSION['User_Id'],$new_wallet1); 

	// Inserta esta transaccion del usuario en los movimientos del usuario (solo Paypal por ahora)";
	$transcation_id = $member->Insert_Member_Paypal($_SESSION['User_Id'],$_SESSION['User_Name'],$importe,$details->membership_name);
    
    //	$finished_date = date('Y-m-d ', mktime(0,0,0,date("m")+$details->membership_time,date("d"),date("y")) );
	// $finished_date= date('Y-m-d',mktime(0,0,0,date('d')+$details->membership_time));
	
	$finished_date = date('Y-m-d', strtotime('+30 day'));
	// echo $finished_date;

    // echo "Inserta la historia en la tabla member_membership_history";
    $member->Insert_History($_SESSION['User_Id'],$_SESSION['User_Name'],$details->membership_id,$details->membership_name,$details->membership_time,$importe,$finished_date);

    // Inserto nuestra ganancia neta en la tabla site_earning_deposite
    
     // echo "Monto Total Pagado: "; echo $details->total_price;
        $costo_droplet= number_format($details->membership_time*24*$details->hourly_cost,2);
        $costo_backup=  number_format(($costo_droplet*$details->backup_cost)/100.00,2); //backup cost 20% sobre costo del droplet
        $costo_chat=    number_format($details->snapshot_cost*$details->gigas_included,2); // snapshot cost 0.05 por Gigabyte del droplet
        $costo_plan=    number_format($costo_droplet+$costo_backup+$costo_chat,2);  //tomo el costo del droplet, + backup + backup del chat server
	    $earning   =    number_format($importe - ($costo_droplet+$costo_backup+$costo_chat),2); 

	 // echo "  Costo_plan: ";echo $costo_droplet+$costo_backup+$costo_chat;
	$earning    = $importe - $costo_plan;
	// echo "  Earning: "; echo $earning;
    $payment_gateway = "Paypal";
    
    // echo "User_Id"; echo $_SESSION['User_Id'];
    // echo "User_Name"; echo $_SESSION['User_Name'];
    
	$pays->Insert_Earning_depost($_SESSION['User_Id'],$_SESSION['User_Name'],$importe,$costo_plan,$earning,$payment_gateway);	

	// echo "va a updatear la tabla member_master";
	$member->Update_Member_details($details->membership_id,$transcation_id,$_SESSION['User_Id'],$finished_date,$earning);

    // echo "va a insertar la trx pendiente para el admin";
    // Inserto la transaccion como pendiente en la tabla Paypal_Pending_Deposite para el admin ASAP!!
    // $desc = $_SESSION['User_Name'] . " Plan: ". $details->membership_name . " Price: " . $details->membership_fees . " Expiration Date: " . $finished_date;
	// $pays->InsertInPaypalPending($_POST,$desc);


     // echo "va a enviar un mail";
    
    // Se le envia un mail agradeciendo su compra y con los datos basico de su plan..
    ////////////////////////////////////////////////////////////////////////////
    global $mail2;
    $mail2 = '';
    $mail2 = new htmlMimeMail();
		
    $tpl2 = new Smarty;
    $tpl2->compile_dir 	= $physical_path['Site_Root']. 'templates_c/';
    // $sendinfo = $emails->GetEmailDetails1($_SESSION['User_Id']);
    // $mail2->setFrom($sendinfo->email_adress);
    // $mail2->setSubject($sendinfo->email_subject);
    $mail2->setFrom('billing@taskcontrol.net');
    $mail2->setSubject('TaskControl: Your Subscription');
    $tpl2->assign(array("membership" => $details->membership_name,
                        "finished_date" => $finished_date,
                        "amount" => $details->membership_fees,
                        "additionals" => $totaladditionals,
                        "additionals_descrip" => $additionals_descrip,
                        "total_discount" => $totaldiscount,
                        "total_order" => $importe ));
    
     // echo "llega moe";
    
    $mail_content_header = $tpl2->fetch("email_template:".EMAIL_HEADER);	
    $mail_content_footer = $tpl2->fetch("email_template:".EMAIL_FOOTER);	
    $mail_content_reg = $tpl2->fetch("email_template:".SUBSCRIPTION_BUY);	

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
    
     // echo "llega curly";
    
    $mail2->setHtml($mail_html);
    $recevier = GetEmailAddress($_SESSION['User_Id']);
    $result = $mail2->send(array($recevier));
    
    // echo "llego a Larry!!";
    
    // Le enviamos una factura (.pdf) por su subscripcion 
     
     $Numero=strftime("%d%m%Y%H%M%S");
	 $User_ID=$_SESSION['User_Name'];
 	 $Company_ID=$_SESSION['User_Name'];
	 $from="billing@taskcontrol.net";
	 $to=$recevier;
	 $Descripcion=$details->membership_name;
	 if ($additionals_descrip == '') $adittionals_descrip='No Additionals';
	 $DescripAdditionals=$additionals_descrip;  //descripcion de los extras (users, gigas etc)
	 $add_cost=number_format($totaladditionals,2);
	 $PorcDescuento=number_format($user_details->discount_percent,2);
	 $FechaDesde=strftime("%Y-%m-%d");
	 $FechaHasta=$finished_date;
	 $Tax=0.00;
	 $Importe=$importe_plan;
	 $Total=number_format($Importe+$add_cost-$totaldiscount,2);
	 $Tipo="1"; // Factura Neutral (sin letra) averiguar por AFIP que letra se manda en estos casos (SaaS)
	 $resultado=Send_Pdf($Numero,$User_ID,$Company_ID,$Company_Address,$to,$from,$to,$Descripcion,$DescripAdditionals,$add_cost,$PorcDescuento,$totaldiscount,$FechaDesde,$FechaHasta,$Tax,$Importe,$Total,$Tipo);

      // echo "ya envio la factura por mail";
    ////////////////////////////////////////////////////////////////////////////////////////     

   // Se le avisa que su compra ha sido exitosa. Se le recuerda el plan y fechas de compra y fin
   // ------------------------------------------------------------------
    
    $_SESSION['Membership_Name']	=	$details->membership_name;
	$_SESSION['Buy_Date']			=	date('Y-m-d');
	$_SESSION['Finished_Date']		=	$finished_date;
				 
    header("location: membership_buy_success.html");
  	exit(0);
}
else
 {
     
    // echo "otropaso";
    
	$ret = $member->ViewAll_MemberShip();
	$cnt = $db->num_rows();
	$i = 0;
	$str = $_SERVER['HTTP_REFERER'];
	
	// echo " cnt: "; echo $cnt;
	
	$str1 = substr(strrchr($str,'/'),1);
		
    if($str1 == 'account.php')
 	{
	  //  echo " otropaso 1 ";
		$navigation = '<a href=account.php class=footerlink>'.$lang['My_Account'].'</a>';
		$navigation1= '<label class=navigation>'.$lang['Membership'].'</label>';
	}
	else
	{
	  //  echo " otropaso 2 ";
		$navigation1= '<label class=navigation>'.$lang['Membership'].'</label>';
	}

	while($db->next_record())
	{
	    $arr_member[$i]['id']	   				=	$db->f('membership_id');
		$arr_member[$i]['name']					= 	$db->f('membership_name');
		$arr_member[$i]['time']					= 	$db->f('membership_time');
		$arr_member[$i]['fees']			 	  	=	$db->f('membership_fees');
		$arr_member[$i]['status']				=	$db->f('membership_status');
		$arr_member[$i]['display_order']	    =	$db->f('display_order');
		$arr_member[$i]['description']			=	explode(',', $arr_member[$i]['name']);
		$i++;
	}

    // echo " otropaso 3 ";
    
	$tpl->assign(array(	"T_Body"			=>	'membership'. $config['tplEx'],
						"JavaScript"		=>  array("membership.js"),
						"lang"				=>  $lang,
						"arr_member"        =>  $arr_member,
						"Loop"              =>  $cnt,
						"tab"			  	=>  4,
						"navigation"		=>	$navigation,
						"navigation1"		=>	$navigation1,
						"navigation2"		=>	$navigation2,
						));
						
   $user_details = $member->GetMemberDetails($_SESSION['User_Id']);						
   
   	$tpl->assign(array(	
						"membership_id"              =>  $user_details->membership_id, 
						"membership_name"            =>  $user_details->membership_name,
						"start_date"                 =>  $user_details->membership_buy_date,
						"end_date"              	 =>  $user_details->membership_finish_date,
						));
						
}
 // echo "saliendo";
$tpl->display('default_layout'. $config['tplEx']);
?>