// JavaScript Document

function Edit_Click(emailids)

{

	with(document.frmEmailNewsletter)

	{
		Action.value	= 'Send';
		submit();
	}

}

function Validate_Form(frm)
{
	with(frm)
    {
		if(!IsEmpty(en_email_subject, 'Please enter Email Subject.'))
		{
			return false;
		}

		if(email_receiver_seller.checked == false && email_receiver_buyer.checked == false)
		{
			alert('Please select the Receivers of the email')
			return false;
		}

		return true;
	}
}