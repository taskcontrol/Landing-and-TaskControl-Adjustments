<?php

#====================================================================================================
#	File Name		:	siteconfig.php
#----------------------------------------------------------------------------------------------------
#	Include required files
#----------------------------------------------------------------------------------------------------

define('IN_SITE', 	true);
define('IN_ADMIN', 	true);

include_once("../includes/common.php");
include_once("../db_access/Db_Backup.php");
#=======================================================================================================================================
#								RESPONSE PROCESSING CODE
#---------------------------------------------------------------------------------------------------------------------------------------
$Action = isset($_GET['Action']) ? $_GET['Action'] : (isset($_POST['Action']) ? $_POST['Action'] : '');
#-----------------------------------------------------------------------------------------------------------------------------

#	Update Config information

#-----------------------------------------------------------------------------------------------------------------------------
$backup=new Backup();
$database = $config['DB_Name'];
$sql_query3='';
if($Action=='DeleteSelected')
{
	$succMessage = "Backup has been Deleted Successfully!!";
	$path=$physical_path['Backup'];
	
	foreach($_POST['chk_no'] as $key=>$val)
	{
		$del=unlink($path.$_POST['chk_no'][$key]);
	}
	header("location: dbbackup.php?action=del");
	exit(0);
}
if($Action == 'Restore' && $_POST['filename'])
{
	$path=$physical_path['Backup'];
	$filename = $path.$_POST['filename'];
	$templine = '';
	$lines = file($filename);
	$succMessage = "Backup has been Restore Successfully!!";
	foreach ($lines as $line_num => $line) 
	{
		
		if (substr($line, 0, 2) != '--' && $line != '') 
		{
			$templine .= $line;
			if (substr(trim($line), -1, 1) == ';') 
			{
				#print $templine;die;
				mysql_query($templine) or print('Error performing query \'<b>' . $templine . '</b>\': ' . mysql_error() . '<br /><br />');
     			$templine = '';
    		}
  		}
	}
	header("location: dbbackup.php?action=restore");
	exit(0);
}
if($_POST['Submit']=='Restore')
{
	$path=$HTTP_POST_FILES['fileField'];
	$tmpfile=$path['name'];
	$ext=explode(".",$tmpfile);
	if($ext[1]=='sql')
	{
		$filename = $path['tmp_name'];
		$templine = '';
		$lines = file($filename);
		$succMessage = "Backup has been Restore Successfully!!";
		foreach ($lines as $line_num => $line) 
		{
			
			if (substr($line, 0, 2) != '--' && $line != '') 
			{
				$templine .= $line;
				if (substr(trim($line), -1, 1) == ';') 
				{
					#print $templine;die;
					mysql_query($templine) or print('Error performing query \'<b>' . $templine . '</b>\': ' . mysql_error() . '<br /><br />');
					$templine = '';
				}
			}
		}
	}
	else
	{
		$succMessage = "Only Sql File Allowed!!";
	}
	header("location: dbbackup.php?action=restored");
	exit(0);
}
if($Action == 'Backup' && $_POST['filename'])
{
	$downloadFile=$_POST['filename'];
	$backupFile = $physical_path['Backup'].$downloadFile;
	$succMessage = "Backup has been get Successfully!!";
	$handle = fopen($backupFile, 'r');
	$Data = fread($handle,filesize($backupFile));
	
	Header("Content-type: application/octet-stream");
    Header("Content-Disposition: attachment; filename=$downloadFile"); 
   	print $Data; 
    fclose($handle);
	ob_end_flush();
	exit();
	header("location: dbbackup.php?action=backup");
	exit(0);
}
if($Action == 'Delete' && $_POST['filename'])
{
	$succMessage = "Backup has been Deleted Successfully!!";
	$path=$physical_path['Backup'];
	unlink($path.$_POST['filename']);
	
	header("location: dbbackup.php?action=delete");
	exit(0);
}

	#print_r($_GET);die;
	if($_GET['action'] == 'backup_complete')
		$succMessage = "Backup has been taken Successfully!!";
	elseif($_GET['action'] == 'restored' || $_GET['action'] == 'restore')
		$succMessage = "Backup has been get Successfully!!";
	elseif($_GET['action'] == 'delete' || $_GET['action'] == 'del')
		$succMessage = "Backup has been Deleted Successfully!!";
		

	
	$fulltext     = '';
	
	$dir_path =dir($physical_path['Backup']);
	$list=$backup->get_directory($dir_path);
	$list_count=count($list);
	
		$tpl->assign(array(	"T_Body"		=>	'backup_manage'. $config['tplEx'],
							"succMessage"	=>   $succMessage,
							"List"			=>	 $list,
							"Loop"			=>   $list_count,
							"JavaScript"	=>   array('backupmanage.js'),
						));

if($_POST['Submit']=='Backup')
{
	$time=date("m_d_Y_G:i:s");
	$time=str_replace(":","_",$time);
	$backupFile = $database.$time.'.sql';
	$result .= "# MySQL Data Backup of ".$database."\n";
	$result .= "# This was generated on " . date("m/d/Y") . "\n\n";
	$tables = mysql_list_tables($database);
	for($i = 0; $i < mysql_num_rows($tables); $i++)
	{
		$table = mysql_tablename ($tables, $i);
		$fields_names=array();
		$field_type=array();
		$field_primary=array();
		$field_null=array();
		$field_extra=array();
		$field_default=array();
		$val=0;
		$fields_rs=$backup->getfield_Name($table);
		$enginetype=$backup->getEngine_Type();	
		#$charset=$backup->getChar_Set();
		
			foreach ($fields_rs AS $key => $val) 
			{
				$fields_names[]     = $val['Field'];		
			} 
			$field_cnt=count($fields_names);
			foreach ($fields_rs AS $key1 => $val1) 
			{
				$field_type[]     = $val1['Type'];		
			}
			foreach ($fields_rs AS $key2 => $val2) 
			{
				$field_null[]     = $val2['Null'];		
			}  
			foreach ($fields_rs AS $key3 => $val3) 
			{
				$field_primary[]     = $val3['Key'];		
			}  
			foreach ($fields_rs AS $key4 => $val4) 
			{
				$field_default[]     = $val4['Default'];		
			}  
			foreach ($fields_rs AS $key5 => $val5) 
			{
				$field_extra[]     = $val5['Extra'];		
			} 
			$sql_query = $query_cpy = '';
			for ($K = 0; $K < $field_cnt; $K++) 
			{
				$query = $backup->generateFieldSpec($table,$fields_names[$K], $field_type[$K], $field_length[$K], $field_attribute[$K], isset($field_collation[$K]) ? $field_collation[$K] : '', $field_null[$K], $field_default[$K], isset($field_default_current_timestamp[$K]), $field_extra[$K], isset($field_comments[$K]) ? $field_comments[$K] : '', $field_primary, $K);
				$query .= ', ';
				$sql_query .= $query;
				$query_cpy .= "\n" . '  ' . $query;
				
			}
			
			$sql_query = preg_replace('@, $@', '', $sql_query);
			$query_cpy = preg_replace('@, $@', '', $query_cpy);
	
			$primary_cnt = (isset($field_primary) ? count($field_primary) : 0);
			
			$primary='';
			for ($J = 0; $J < $primary_cnt; $J++) 
			{
				#$j = $field_primary[$J];
				if ($field_primary[$J] == 'PRI' && $J == 0) 
				{
					$primary = backquote($fields_names[$J]) . ', ';
				}
			} 
			
			$primary = preg_replace('@, $@', '', $primary);
			
			if (strlen($primary)) 
			{
				$sql_query .= ', PRIMARY KEY (' . $primary . ')';
				$query_cpy .= ',' . "\n" . '  PRIMARY KEY (' . $primary . ')';
			}
			
			$index     = '';
			$index_cnt = (isset($field_index) ? count($field_index) : 0);
			for ($J = 0;$J < $index_cnt; $J++) 
			{	
				$j = $field_index[$J];
				if (isset($field_name[$j]) && strlen($field_name[$j])) 
				{
					$index .= backquote($field_name[$j]) . ', ';
				}
			} 
			
			$index = preg_replace('@, $@', '', $index);
			if (strlen($index)) 
			{
				
				$sql_query .= ', INDEX (' . $index . ')';
				$query_cpy .= ',' . "\n" . '  INDEX (' . $index . ')';
			}
	
			$unique     = '';
			$unique_cnt = (isset($field_unique) ? count($field_unique) : 0);
			for ($J = 0; $J < $unique_cnt; $J++) 
			{
				$j = $field_unique[$J];
				if (isset($field_name[$j]) && strlen($field_name[$j])) 
				{
				   $unique .= backquote($field_name[$j]) . ', ';
				}
			} 
			
			$unique = preg_replace('@, $@', '', $unique);
			if (strlen($unique)) 
			{
				$sql_query .= ', UNIQUE (' . $unique . ')';
				$query_cpy .= ',' . "\n" . '  UNIQUE (' . $unique . ')';
			}
	
			$fulltext     = '';
			$fulltext_cnt = (isset($field_fulltext) ? count($field_fulltext) : 0);
			for ($J = 0; $J < $fulltext_cnt; $J++) 
			{
				$j = $field_fulltext[$J];
				if (isset($field_name[$j]) && strlen($field_name[$J])) 
				{
				   $fulltext .= backquote($field_name[$j]) . ', ';
				}
			}
		
			$fulltext = preg_replace('@, $@', '', $fulltext);
			if (strlen($fulltext)) 
			{
				$sql_query .= ', FULLTEXT (' . $fulltext . ')';
				$query_cpy .= ',' . "\n" . '  FULLTEXT (' . $fulltext . ')';
			}
			$sql_query2 ="\n"."DROP TABLE IF EXISTS ". backquote($table);
			#print $sql_query3=$sql_query3.$sql_query2;
			$sql_query      = "\n".'CREATE TABLE ' . backquote($table) . ' (' . $sql_query . ')';
			$query_cpy      = "\n".'CREATE TABLE ' . backquote($table) . ' (' . $query_cpy .  ')';
			
			if (!empty($enginetype) && ($tbl_type != 'Default')) 
			{
				$sql_query .= ' ' . 'ENGINE'  . ' = ' . $enginetype;
				$query_cpy .=  'ENGINE' . ' = ' . $enginetype;
			}
			
			/*if (!empty($charset)) 
			{
				$sql_query .= ' ' . 'CHARSET'  . ' = ' . $charset;
				$query_cpy .=  'CHARSET' . ' = ' . $charset;
			}*/
			
			if (MYSQL_INT_VERSION >= 40100 && !empty($tbl_collation)) 
			{
				$sql_query .= generateCharsetQueryPart($tbl_collation);
				$query_cpy .= "\n" . generateCharsetQueryPart($tbl_collation);
			}
	
			if (!empty($comment)) 
			{
				$sql_query .= ' COMMENT = \'' . sqlAddslashes($comment) . '\'';
				$query_cpy .=  'COMMENT = \'' . sqlAddslashes($comment) . '\'';
			}
			
			$error_create = FALSE;
			$result    = mysql_query($sql_query) or $error_create = TRUE;
			if ($error_create == FALSE) 
			{
				$sql_query = $query_cpy;
				unset($query_cpy);
				$message   = $strTable . ' ' . htmlspecialchars($table) . ' ' . $strHasBeenCreated;
				exit();
			} 
			
			if ($i+1 != mysql_num_rows($tables))
			{
				$sql_query .= "\n";
				$sql_query2 .= "\n";
			}
			
			$result1 .= "";
			
			$query = mysql_query("select * from $table");
			$num_fields = mysql_num_fields($query);
			$numrow = mysql_num_rows($query);
			
			while( $row = mysql_fetch_array($query, MYSQL_NUM))
			{
				$result1 .= "\n"."INSERT INTO ".$table." VALUES(";
				for($j=0; $j<$num_fields; $j++)
				{
					$row[$j] = addslashes($row[$j]);
					$row[$j] = str_replace("\n","\\n",$row[$j]);
					$row[$j] = str_replace("\r","",$row[$j]);
					if (isset($row[$j]))
						$result1 .= "\"$row[$j]\""; 
					else
						$result1 .= "\"\"";
					if ($j<($num_fields-1))
						$result1 .= ", ";
				}   
				 $result1 .= ");\n";
			}
				
				$sql_query1 =$sql_query1.$sql_query.";";
				$sql_query3 =$sql_query3.$sql_query2.";";
				
			if ($i+1 != mysql_num_rows($tables))
				$result1 .= "\n";
			
	}

	$backup=$sql_query3.$sql_query1.$result1;
	writeFileContent($physical_path['Backup'].$backupFile,$backup);

	header("location: dbbackup.php?action=backup_complete");
	exit(0);
}
$tpl->display('default_layout'. $config['tplEx']);
	

?>