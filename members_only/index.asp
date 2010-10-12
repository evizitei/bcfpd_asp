<!--#include virtual="/members_only/include/functions.asa"-->
<!--#include virtual="/members_only/include/templates/top2.asa"-->
<%
Server.ScriptTimeout = 10000


If Request.Form <> "" Then
	For Each Item in Request.Form
	   Session(Item) = Request.Form(Item)
	Next

    set cmd = server.CreateObject("ADODB.Command")
    'cmd.ActiveConnection = "Provider=SQLOLEDB.1;UID=sa; PWD=dzpjaawb; Initial Catalog=bcfdmo; Data source=d1dellm90"
    cmd.ActiveConnection = "Provider=SQLOLEDB.1;UID=bcfpdwebuser; PWD=HudvG4QJ; Initial Catalog=bcfdmo; Data source=10.8.0.3"

    cmd.CommandText = "bcfpdwebuser.spGetLogin"
    cmd.CommandType = 4
    set objParam1 = cmd.CreateParameter("@UserID", 200, &H0001, 50, cstr(Session("UserID")))
    set objParam2 = cmd.CreateParameter("@Password", 200, &H0001, 50, cstr(Session("Password")))
    cmd.Parameters.Append objParam1
    cmd.Parameters.Append objParam2
	set rsSecurity = cmd.execute    
    
	'strSQL = "spGetLogin '" & cstr(Session("UserID")) & "', '" & cstr(Session("Password")) & "')"
	'response.Write strsql
	'response.End 	
	'set rsSecurity = cnnBCFPD.execute(strSQL)	
	
	FieldCount = rsSecurity.Fields.Count
	ReDim arrFields(FieldCount)
	If Not rsSecurity.EOF Then
		Session("SessionAuthorized") = True
		For y = 4 to FieldCount - 1 
			arrFields(y) = rsSecurity(y)
		Next
		Session("Authorized") = arrFields
	End If
	rsSecurity.Close    
End If

If Session("SessionAuthorized") Then
	'strSQL = "spGetLogin " & Session("UserID") & ", " & Session("Password")
	'set rsSecurity = cnnBCFPD.execute(strSQL)

    set cmd = server.CreateObject("ADODB.Command")
    'cmd.ActiveConnection = "Provider=SQLOLEDB.1;UID=sa; PWD=dzpjaawb; Initial Catalog=bcfdmo; Data source=d1dellm90"  
    cmd.ActiveConnection = "Provider=SQLOLEDB.1;UID=bcfpdwebuser; PWD=HudvG4QJ; Initial Catalog=bcfdmo; Data source=10.8.0.3"

    cmd.CommandText = "bcfpdwebuser.spGetLogin"
    cmd.CommandType = 4
    set objParam1 = cmd.CreateParameter("@UserID", 200, &H0001, 50, cstr(Session("UserID")))
    set objParam2 = cmd.CreateParameter("@Password", 200, &H0001, 50, cstr(Session("Password")))
    cmd.Parameters.Append objParam1
    cmd.Parameters.Append objParam2
	set rsSecurity = cmd.execute    

	set rsSecurity = cmd.execute    

 	FieldCount = rsSecurity.Fields.Count
 	ReDim arrFields(FieldCount)
 	For y = 4 to FieldCount - 1 
 		arrFields(y) = rsSecurity(y)
 	Next	
 	Session("LoggedIn")=True
 	Response.Redirect("index2.asp")
 	
 End If
%>
<table border="0" cellpadding="5" cellspacing="0" ID="Table1" bgcolor="White" style="Width:585px;Height:242px;">
<tr>
	<td>
	<dd><font color=DarkRed size="3"><strong>Please login:</strong></font>
		<form method="POST" action="https://www.bcfdmo.com/members_only/index.asp" id="form1" name="form1">
			<table width="234" ID="Table2">
			<tr>
				<td align="right" nowrap><strong><font color=DarkRed face="Arial, Helvetica, sans serif" size="2">UserID: </font></strong></td>
				<td width="81"><input maxlength=50 type="text" name="UserID" size="10" value="<%=Session("UserID")%>" ID="Text1"></td>
			</tr>
			<tr>
				<td align="right" nowrap><strong><font color=DarkRed face="Arial, Helvetica, sans serif" size="2">Password: </font></strong></td>
				<td width="81"><input maxlength=50 type="password" name="Password" size="10" ID="Password1"></td>
			</tr>
			<tr>
				<td width="145"></td>
				<td width="81"><input type="submit" value="Login..." id="submit1" name="submit1"></td>
			</tr>
			</table>
		</form>
	</td>
	</tr>
</table>
<script language="JavaScript">
	document.form1.UserID.focus();
</script>


<!--#include virtual="/members_only/include/templates/bottom2.asa"-->
