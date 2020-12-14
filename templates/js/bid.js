// JavaScript Document
function Check_Bidding(frm)
{
	with(frm)
	{
		if(!IsEmpty(bid_amount, JS_Bid_Amount))
		{
			return false;
		}
		else if(isNaN(bid_amount.value))
		{
			alert(JS_Bid1);
			frm.bid_amount.focus;
			return false;
		}
		else if(parseFloat(bid_amount.value) < parseFloat(min_bid_amount))
		{
			alert(JS_Confirm_Bid);
			bid_amount.focus();
			return false;
		}
		if(!IsEmpty(delivery_within, JS_Days))
		{
			return false;
		}
		else if(isNaN(delivery_within.value))
		{
			alert(JS_Days1);
			frm.delivery_within.focus;
			return false;
		}
		else if(delivery_within.value == 0 || delivery_within.value < 0)
		{
			alert(JS_bid);
			return false;
		}
		if(!IsEmpty(en_bid_desc, JS_English))
		{
			return false;
		}
		return true;
	}
}
function View_Terms()
{
	popupWindowURL('page.php?pid=2&pop_up=true','','900','500','','true','true');	
}