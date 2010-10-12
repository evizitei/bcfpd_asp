




<%Response.Buffer = True 

'Author: David Stephens
'Original Author: Chris Ellingsworth
'(c) LANIT Consulting
'Purpose: Upload a .jpg or .gif from the client to a folder on the server
'This page uses an asp component

'  Variables
'  *********
   Dim mySmartUpload
   Dim intCount
   dim Path
   Path = Request.QueryString("Path") 
'  Object creation
'  ***************
   Set mySmartUpload = Server.CreateObject("aspSmartUpload.SmartUpload")

'  Upload
'  ******
   mySmartUpload.Upload
	
'  Save the files with their original names in a virtual path of the web server
'  ****************************************************************************
   'Response.Write(Path)
   'intCount = mySmartUpload.Save(Path)
	
	mySmartUpload.files.item(1).saveas "/images/photo_gallery/Images/" &  mySmartUpload.files.item(1).filename 
	mySmartUpload.files.item(2).saveas "/images/photo_gallery/Full_Size/" &  mySmartUpload.files.item(1).filename 
	
'  Display the number of files uploaded
'  ************************************
   'Response.Write(intCount & " file(s) uploaded.")
   

%>

<html>
<head>
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
<title><%=Title%></title>
<link REL="stylesheet" TYPE="text/css" HREF="/Modules/SkunkDB/include/skunkdb.css">
</head>
<body class="dialogBox">

<table border="2" bordercolor="#F6E2C1" cellpadding="0" cellspacing="3" height="100%" width="100%">
	<tr>
		<td align="left" valign="top" colspan="2" class="statusBox"><br>&nbsp;<br>
			<table cellpadding="3">
				<tr>
					<td>
					<font size="3"><strong>Image Upload was Successful</font></strong><p>
					<font size="2"><strong><%= Ucase(mySmartUpload.Files(1).FileName) %> and <%= Ucase(mySmartUpload.Files(2).FileName) %></strong></font><font size="2"> were uploaded.<p></font>
					<p><a style="Cursor: hand" onclick="javascript:window.close();"><img SRC="/images/members/buttons/next.gif" border="0"></a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script language="javascript">
	window.opener.document.location.reload();
</script>
</body>
</html>
