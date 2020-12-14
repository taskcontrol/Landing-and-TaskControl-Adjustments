<?

class Helper 
{

	function Helper()
	{

	}

	function ParseNumeric ($pValue)
	{
		$returnValue = $pValue;
		
		if (!is_numeric($returnValue))
		{
			$returnValue = str_replace(',' , '.', $pValue);
		}
		$returnValue = number_format($returnValue, 2);

       	return $returnValue;
	}

}

?>