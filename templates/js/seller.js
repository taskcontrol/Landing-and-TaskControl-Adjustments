// JavaScript Document
function OpenImage(ImagePath)
{
	 popupWindowURL('protfolioimage.php?path='+ImagePath,'','300','250','','false','false');	
}
function View_Terms()
{
	popupWindowURL('page.php?pid=6&pop_up=true','','900','500','','true','true');	
}
function Delete_Click(bidid)
{
	with(document.frmselleractivity)
	{
		if(confirm('Are you sure you want to delete Bid?'))
		{
			bid_id.value 	= bidid;
			Action.value	= 'Delete';
			submit();
		}
	}
}
function chk_user(user_Id)
{
	if(user_Id != '')
	{
		return true;
	}
	else
	{
		alert("Please, First Login.")
		return false;
	}
}