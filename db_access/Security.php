<?

class Security
{

    var $encription_key = 'TaskControl01/01/2020';

	function Security()
	{

	}

	function encrypt($pure_string) {

		$result = '';
		for($i = 0; $i < strlen($pure_string); $i++) {
			$char = substr($pure_string, $i, 1);
			$keychar = substr($this->encription_key, ($i % strlen($this->encription_key))-1, 1);
			$char = chr(ord($char) + ord($keychar));
			$result .= $char;
		}

	    return base64_encode($result);
	}

	function decrypt($encrypted_string) {
		$result = '';
	    $string = base64_decode($encrypted_string);

	    for($i = 0; $i < strlen($string); $i++) {
	    	$char = substr($string, $i, 1);
	    	$keychar = substr($this->encription_key, ($i % strlen($this->encription_key))-1, 1);
	    	$char = chr(ord($char) - ord($keychar));
	    	$result .= $char;
	    }

	    return $result;
	}

}

?>
