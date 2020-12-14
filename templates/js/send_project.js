// JavaScript Document
function Check_Details(frm)
{
	with(frm)
	{
		if(!IsEmpty(email_address, "Plz enter email address"))
		{
			return false;
		}
		else if(!IsEmail(email_address, "Plz check email address"))
		{
			return false;
		}
		if(!IsEmpty(Comment, "Plz enter Comment"))
		{
			return false;
		}
		return true;
	}
}