<?

class Employee
{    
    function Employee() 
    {
    }

	function GetEmployeeList()
	{
		global $db;
		$sql= " SELECT * FROM ".employee_master." ORDER BY size_id";
		$db->query($sql);
	}

}
?>