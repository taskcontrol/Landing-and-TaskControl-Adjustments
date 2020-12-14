<?php
/* this file is used for database connection */


$config['tplEx'] = '.tpl';  // file extension
//$Language_Types = isset($_POST['Language_Types']) ? $_POST['Language_Types'] : (isset($_SESSION['Language_Types'])?$_SESSION['Language_Types']:"en" );
//$_SESSION['Language_Types'] = $Language_Types;


$Language_Types = isset($_GET['lang']) ? $_GET['lang'] : (isset($_SESSION['Language_Types'])?$_SESSION['Language_Types']:"es" );
$_SESSION['Language_Types'] = $Language_Types;

#====================================================================================================
#	Database		
#----------------------------------------------------------------------------------------------------

switch($config['Server_Name'])
{
			

    case "TASKCONTROL.NET":
	case "WWW.TASKCONTROL.NET":
	case "www.TASKCONTROL.NET":
	case "TASKCONTROL.NET":  
	case "www.taskcontrol.net":
	case "taskcontrol.net":
	    $config['DB_Type']      = 'mysql';
	    $config['DB_Host']      = 'localhost';
	    $config['DB_Name']      = 'c1bairesda_taskcontrol';
	    $config['DB_User']      = 'c1taskcontrol';
	    $config['DB_Passwd']    = 'j6BRh3gN65tXnE';
        break;
	
    default:
	    $config['DB_Type']      = 'mysql';
	    $config['DB_Host']      = 'localhost';
	    $config['DB_Name']      = 'c1bairesda_taskcontrol';
	    $config['DB_User']      = 'c1taskcontrol';
	    $config['DB_Passwd']    = 'j6BRh3gN65tXnE';
        break;
}

?>
