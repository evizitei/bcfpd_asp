<%
'Author: David Stephens
'(c) LANIT Consulting
'Purpose: Upload a .jpg or .gif from the client to a folder on the server
'This page uses a HTML input type=file element to browse client for files

%>

<html>
<head>
<title><%=Title%></title>
<link REL="stylesheet" TYPE="text/css" HREF="/Modules/SkunkDB/include/skunkdb.css">
</head>
<style type="text/css">
	a {text-decoration: none; font-family: Arial; color: #0E02FB}
	a.menu {font-family: Arial, sans-serif; font-size: 12pt; color: #0E02FB; font-weight: bold;}
	a.submenu {font-family: Arial, sans-serif; font-size: 9pt; color: #0E02FB;}
	a.regBold  {font-family: Arial, sans-serif; font-size: 1em; color: #0E02FB; font-weight: bold;}
	.styleID {text-decoration: none; font-family: Arial, sans-serif; font-size:9pt; color: Black; cursor: "hand";}
	.Header {font-family: Arial, sans-serif; font-size: 1.5em; color: #0C8B5B; font-weight: bold;}
	td {font-family:Arial, sans-serif; font-size:10pt; color: Black;}
	div.bold {font-family:Arial; font-size:10pt; font-weight:bold; color: Black;}
	td.accounts {font-family:Arial, sans-serif; font-size:8.5pt; color: Black;}
.SmBldIt 
{
	font-family: Arial; 
	font-size:8pt; 
	color: Black; 
	font-style: italic; 
	font-weight: bold;
}

#RateCellHead
{
    FONT-FAMILY: Arial;
    FONT-SIZE: 8pt;
    FONT-WEIGHT: bold
}
#RateSubHead
{
    FONT-FAMILY: arial;
    FONT-SIZE: 12pt;
    FONT-STYLE: italic;
    FONT-WEIGHT: bold;
    LETTER-SPACING: 2pt
}
#RateHead
{
    FONT-FAMILY: Arial;
    FONT-SIZE: 18pt;
    FONT-STYLE: italic;
    FONT-WEIGHT: bold;
    LETTER-SPACING: 4pt
}
#normal
{
    FONT-FAMILY: Arial;
    FONT-SIZE: 10pt;
    FONT-STYLE: normal;
    FONT-WEIGHT: normal;

}
INPUT.text
{
    BACKGROUND-COLOR: #ffffff;
    BORDER-BOTTOM: #000000 1px solid;
    BORDER-LEFT: #000000 1px solid;
    BORDER-RIGHT: #000000 1px solid;
    BORDER-TOP: #000000 1px solid
}
TEXTAREA
{
    BACKGROUND-COLOR: #ffffff;
    BORDER-BOTTOM: #000000 1px solid;
    BORDER-LEFT: #000000 1px solid;
    BORDER-RIGHT: #000000 1px solid;
    BORDER-TOP: #000000 1px solid;
    FONT-FAMILY: Arial;
    FONT-SIZE: 10pt
}

</style>
<script language="JavaScript">
//Size window to represent a wizard-like application.
	function WindowSize() {
		window.resizeTo(400,500);
		//window.moveTo(300,200);
	}
</script>

<script language="JavaScript">
//File must be either a .jpg or .gif to upload to server.
	function Verify() {
		var name1 = window.document.Browse.file1.value;
		var number1 = name1.length;
		var ext1 = name1.substring(number1, number1 - 3);

		if(document.all.file1.value == "") {
			alert("You must choose a file before continuing.");
			//return false;
		}
		else if ((ext1 != 'gif') && (ext1 != 'jpg') && (ext1 != 'mpg') && (ext1 !='mov'))  {
			alert("You can't upload *" + ext1 + " files. Only files with .gif or .jpg extensions can be uploaded.");
			//return false;
		}
		else {
			document.Browse.submit();
			//return true;
		}
		
	}
</script>

<body class="dialogBox" onload="JavaScript:WindowSize();">

<form name="Browse" method="post" action="upload.asp?Path=<%=Request.QueryString("Path")%>" ENCTYPE="multipart/form-data" OnSubmit="return Verify()">
<table border="2" bordercolor="#330099" cellpadding="0" cellspacing="3" height="100%" width="100%">
	<tr>
		<td valign="top" colspan="2" class="statusBox"><br>&nbsp;<br>
		<table cellpadding="3">
		  <tr>
		    <td>
				<font color="#330099" size="3"><b>Upload an Image</b></font>
				<p><font size="2">Please choose a file to upload, then click next to continue.</font>
				<br><br><input type="file" id="file1" name="file1" size="30">
		    </td>
		  </tr>
		  <tr>
		    <td align="center">
				<a href="javascript:Verify();"><img SRC="/images/members/buttons/next.gif" border="0"></a>
				<img src="/images/spacer.gif" border="0" width="35" height="1">
				<a style="Cursor: hand" onclick="javascript:window.close();"><img SRC="/images/members/buttons/CAncel.gif" border="0"></a><img src="/images/spacer.gif" border="0" width="10" height="1">
			</td>
		  </tr>		
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html> 