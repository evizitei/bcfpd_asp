<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(14) Then
    Response.Redirect "/members_only/"
End If

'Security Update
'Author: Chris Ellingsworth
'Copyright LANIT Consulting
'
'Declarations
Response.Buffer = True 
Set rsSecurity = Server.CreateObject ("ADODB.Recordset")

'If Request.Form("Delete").Count > 0 Then
	rsSecurity.Open "Security", cnnBCFPD, 3, 3
		Do While Not rsSecurity.EOF
			If Request.Form("Delete" & rsSecurity("security_id")) Then
				rsSecurity.Delete
			End If
		rsSecurity.MoveNext
		Loop
	rsSecurity.Close
'End If

AddNewRecord = False 
If Request.Form("Security_ID").Count > 0 Then
	'Check to make sure User_ID isn't in use first
	rsSecurity.Open "Select * From Security where user_id='" & killChars(Request.Form("_1")) & "'", cnnBCFPD, 3
	If Not rsSecurity.EOF Then
		If rsSecurity(0) <> Int(Request.Form("Security_ID")) Then
			rsSecurity.Close 
			Response.Redirect "index.asp?Edit=" & Request.Form("Security_ID") & "&Error=User_ID"		
		End If
	End If
	rsSecurity.Close 
	rsSecurity.Open "Select * From Security Where Security_ID=" & killChars(Request.Form("Security_ID")), cnnBCFPD, 3, 3
	If rsSecurity.EOF Then
		rsSecurity.AddNew
		AddNewRecord = True
	End If
	For Item = 1 to rsSecurity.Fields.Count - 1
		ItemVal = Request.Form("_" & killChars(Item))
		If Item > 3 and ItemVal = "" And Not AddNewRecord Then
			rsSecurity(Item) = False
		
		ElseIf ItemVal <> "" Then
		
			rsSecurity(Item) = ItemVal
		End If
		
	Next

	rsSecurity.Update
	rsSecurity.Close
End If

%>
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table width="98%" border="0" cellspacing="0" cellpadding="5" bordercolor="orange">
	<tr>
		<td class="PageTitle">BCFPD Web Site Security Update</td>
    </tr>
	<tr>
		<td valign="bottom">

<form name="form2" method="POST" action="index.asp">
<%If Request.QueryString("Edit").Count = 0 Then%>
		<table border="0" bordercolor="green" cellpadding="5" cellspacing="5">
			<tr>
				<td></td>
				<td>
					<table border="0" cellpadding="5" cellspacing="5" bordercolor="#f2f2f2">
					<%rsSecurity.Open "Select * From Security", cnnBCFPD, 3%>
						<tr>
							<td class="subHeadercenter">Delete</td>
						  <%For y = 1 to 3%>
							<td class="subHeadercenter"><%=rsSecurity.Fields(y).Name%></td>
						  <%Next%>
						</tr>
						<%
						bgColor = Array("D6DEE2", "DBDBDB")
						x = 0
						Do While Not rsSecurity.EOF 
							
						%>
						<tr>
							<td bordercolor="#f2f2f2"><input type="checkbox" name="Delete<%=rsSecurity(0)%>" value="true"></td>
						  <%For y = 1 to 3%>
							<td class="contactinfo"><%=rsSecurity(y)%></td>
						  <%Next%>
							<td><a class="update" href="index.asp?Edit=<%=rsSecurity(0)%>">edit account</a></td>
						</tr>
						<%	rsSecurity.MoveNext
							If x = 0 Then 
								x = 1
							ElseIf x = 1 Then 
								x = 0 
							End If
							      
							Loop
							rsSecurity.Close%>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<a href="index.asp?Edit=0"><img SRC="/images/members/buttons/add.gif" border="0"></a>
					<img src="/images/spacer.gif" border="0" height="1" width="35">
					<a href="javascript:Delete();"><img SRC="/images/members/buttons/Delete.gif" border="0"></a>
					<img src="/images/spacer.gif" border="0" height="1" width="35">
					<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
				</td>
			</tr>

		</table>
<%
	Else
		rsSecurity.Open "Select * From Security Where Security_ID=" & killChars(Request.QueryString("Edit")), cnnBCFPD, 3, 3
		If rsSecurity.EOF Then
			rsSecurity.AddNew 
		End If

		If Request.Querystring("Error") = "User_ID" Then%>
		  <ul><strong><font color="Red" size="3">That User ID is already in use.</font></strong><br>Your changes have not been saved</ul>
	  <%End If%>
		  <input type="hidden" value="<%=Request.QueryString("Edit")%>" name="Security_ID">
		  <table border="0" cellpadding="4" cellspacing="0">
		    <tr>
		      <%For y = 1 to 3%>
		      <td class="subheadercenter"><%=rsSecurity.Fields(y).Name%></td>
		      <%Next%>
		    </tr>
		    <tr>
		     <%For y = 1 to 3%>
		      <td align="center"><input type="text" name="_<%=y%>" size="20" class="text" value="<%=rsSecurity(y)%>"></td>
		     <%Next%>
		    </tr>
		    <tr>
		    <td colspan="4"><strong>Security Access</strong><ul>
		    <%For y = 4 to rsSecurity.Fields.Count - 1%>
				<input type="checkbox" name="_<%=y%>" value="-1" <%If rsSecurity(y) Then%>checked<%End If%>><%=rsSecurity.Fields(y).Name%><br>
			<%Next%>
			</ul>
		    </td>
		    </tr>
			<tr>
				<td align="right" colspan="3">
					<a href="javascript:submit(document.form2, 'Update');"><img SRC="/images/members/buttons/save.gif" border="0"></a>
					<img src="/images/spacer.gif" border="0" height="1" width="35">
					<a href="index.asp"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
					<input type="hidden" name="Submit">
				</td>
			</tr>
		  </table>
<%	
		'rsSecurity.Close 
	End If
%>
</form>
</p>
</ul>

		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
