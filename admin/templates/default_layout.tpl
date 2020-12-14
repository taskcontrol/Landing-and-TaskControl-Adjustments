<html>
<head>
	<title>{$Site_Title}</title>
	<meta name="title" 			content="{$Meta_Title}">
	<meta name="description" 	content="{$Meta_Description}">
	<meta name="keywords" 		content="{$Meta_Keyword}">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
	<link href="{$Templates_CSS}style.css" rel="stylesheet" type="text/css">
	<script language="javascript" src="{$Templates_JS}validate.js"></script>
	<script language="javascript" src="{$Templates_JS}functions.js"></script>
	<script language="javascript" src="{$Templates_JS}dropdowntab.js"></script>
    {section name=FileName loop=$JavaScript}
    <script language="javascript" src="{$Templates_JS}{$JavaScript[FileName]}"></script>
	{/section}
</head>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
{include file="$T_Header"}


	{include file="$T_Menu"}

<table border="0" cellpadding="0" width="100%" align="center" height="100%">
	<tr>
		<td valign="top" align="center" bgcolor="#FFFFFF">
		<BR />
			{include file="$T_Body"}
		</td>
	</tr>
</table>
{include file="$T_Footer"}
</body>
</html>
