// JavaScript Document

var xmlHttp



function showUserID(str)

{

//	alert(str);

	if (str.length==0)

	{ 

		alert('Please select username');

		document.getElementById("user_checking").innerHTML=""

//		document.getElementById("txtHint_line").style.visibility = 'hidden';

//		document.getElementById("txtHint_line").style.display = 'none';

		return

	}

	xmlHttp=GetXmlHttpObject()

	if (xmlHttp==null)

	{

		alert ("Browser does not support HTTP Request")

		return

	} 

	var url="signup.php?Checking=CheckID"

	url=url+"&check="+str

	url=url+"&sid="+Math.random()



	xmlHttp.onreadystatechange=stateChangedUserID 

	xmlHttp.open("GET",url,true)

	xmlHttp.send(null)

} 



function stateChangedUserID() 

{ 

	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

	{ 

		document.getElementById("user_checking").innerHTML=xmlHttp.responseText 

		document.getElementById("user_checking").style.visibility = 'visible';

		document.getElementById("user_checking").style.display = 'block';

	} 

} 





function showUserEmail(str)

{

	if (str.length==0)

	{ 

		alert('Please provide email id');

		document.getElementById("txtHint_email").innerHTML=""

		return

	}

	xmlHttp=GetXmlHttpObject()

	if (xmlHttp==null)

	{

		alert ("Browser does not support HTTP Request")

		return

	} 

	var url="signup.php?Checking=CheckEmail"

	url=url+"&check="+str

	url=url+"&sid="+Math.random()

	xmlHttp.onreadystatechange=stateChangedUserEmail 

	xmlHttp.open("GET",url,true)

	xmlHttp.send(null)

} 



function stateChangedUserEmail() 

{ 

	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

	{ 

		//document.getElementById("mem_email").innerHTML=xmlHttp.responseText 

		//document.getElementById("mem_email").style.visibility = 'visible';

		//document.getElementById("mem_email").style.display = 'block';

	} 

} 



function showHint(str)

{

	xmlHttp=GetXmlHttpObject()

	if (xmlHttp==null)

	{

		alert ("Browser does not support HTTP Request")

		return

	} 

	var url="escrow.php?Action=Next_Step1"

	url=url+"&check="+str

	url=url+"&sid="+Math.random()

	xmlHttp.onreadystatechange=stateChanged 

	xmlHttp.open("GET",url,true)

	xmlHttp.send(null)

} 



function stateChanged() 

{ 

	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

	{ 

		first = (xmlHttp.responseText.substring(0,xmlHttp.responseText.indexOf("-")));

		second = (xmlHttp.responseText.substring(xmlHttp.responseText.indexOf("-")+1));

		document.getElementById("txtHint").innerHTML=second;

		document.getElementById("txtHint_1").innerHTML=first 

		

		document.getElementById("send_amount").value=first 

		document.getElementById("user_name").value=second 



		document.getElementById("type").value='1'; 

	} 

} 







function showHint_Partial(str)

{

	xmlHttp=GetXmlHttpObject()

	if (xmlHttp==null)

	{

		alert ("Browser does not support HTTP Request")

		return

	} 

	var url="escrow.php?Action=Next_Step2"

	url=url+"&check="+str

	url=url+"&sid="+Math.random()

	xmlHttp.onreadystatechange=stateChanged_Partial

	xmlHttp.open("GET",url,true)

	xmlHttp.send(null)

} 



function stateChanged_Partial() 

{ 

	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

	{ 

		first_1 = (xmlHttp.responseText.substring(0,xmlHttp.responseText.indexOf("-")));

		second_1 = (xmlHttp.responseText.substring(xmlHttp.responseText.indexOf("-")+1,xmlHttp.responseText.indexOf("-",first_1.length+1)));

		third_1 = (xmlHttp.responseText.substring(xmlHttp.responseText.indexOf("-",first_1.length+1)+1));

		//third_1 = (xmlHttp.responseText.substring(xmlHttp.responseText.indexOf("-")+ 1));



		document.getElementById("txtHint_2").innerHTML=third_1;

		/*second_1 = (xmlHttp.responseText.substring(0,xmlHttp.responseText.indexOf("-")));

		third_1 = (xmlHttp.responseText.substring(0,xmlHttp.responseText.indexOf("-")));

		

		fouth_1 = (xmlHttp.responseText.substring(third_1.indexOf("-")+1));

		alert(first_1);

		alert(second_1);

		alert(third_1);*/

		

		document.getElementById("max_amount").value=first_1;

		document.getElementById("user_name").value=third_1;

		document.getElementById("remaing_amount").value=second_1; 

		/*document.getElementById("user_name").value=third_1;

		document.getElementById("remaing_amount").value=second_1;*/

		

		document.getElementById("type").value='2'; 

	} 

} 



function showHint_Partial_Complete(str)

{

	xmlHttp=GetXmlHttpObject()

	if (xmlHttp==null)

	{

		alert ("Browser does not support HTTP Request")

		return

	} 

	var url="escrow.php?Action=Next_Step3"

	url=url+"&check="+str

	url=url+"&sid="+Math.random()

	xmlHttp.onreadystatechange=showHint_Partial_Completed

	xmlHttp.open("GET",url,true)

	xmlHttp.send(null)

} 



function showHint_Partial_Completed() 

{ 

	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")

	{ 

		first_1 = (xmlHttp.responseText.substring(0,xmlHttp.responseText.indexOf("-")));

		second_1 = (xmlHttp.responseText.substring(xmlHttp.responseText.indexOf("-")+1));



		document.getElementById("txtHint_3").innerHTML=second_1;

		document.getElementById("txtHint_4").innerHTML=first_1;

		

		document.getElementById("total_max_amount").value=first_1;

		document.getElementById("user_name").value=second_1;

		

		document.getElementById("type").value='3'; 

	} 

} 



function GetXmlHttpObject()

{ 

	var objXMLHttp=null

	if (window.XMLHttpRequest)

	{

		objXMLHttp=new XMLHttpRequest()

	}

	else if (window.ActiveXObject)

	{

		objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP")

	}

	return objXMLHttp

} 