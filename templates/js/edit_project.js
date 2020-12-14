// JavaScript Document
function Check_Details(frm)
{
	with(frm)
	{
		if(!IsEmpty(en_edit_proj, JS_en_dec))
		{
			return false;
		}
		return true;
	}
}
function cancel()
 {
	with(document.frmeditProject)
	{
		Action.value= 'cancel';
		submit();
	}
 }