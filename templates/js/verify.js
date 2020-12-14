// JavaScript Document
function Check_Details(frm)
{
	with(frm)
	{
		if(!IsEmpty(verifycode, JS_Verify))
		{
			return false;
		}
		return true;
	}
}