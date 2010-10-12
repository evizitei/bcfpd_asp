<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(6) Then
    Response.Redirect "/members_only/index.asp"
End If

' Create a recordset object called rsCategory.
	set rsCategory = Server.CreateObject("ADODB.Recordset")
	set rsLinks = Server.CreateObject("ADODB.Recordset")

	strNode = "SELECT * FROM Quick_Links_Category"

' If there is a request to delete, delete the record.
'If Request.Form("Submit") = "Delete Category" Then
	rsCategory.Open "Quick_Links_Category", cnnBCFPD, 3, 3
		Do While Not rsCategory.EOF
			If Request.Form("Delete" & rsCategory("Category_ID")) Then
				rsLinks.Open "SELECT * FROM Quick_Links WHERE Link_Category_ID = " & rsCategory("Category_ID"), cnnBCFPD, 3, 3
					do while not rsLinks.EOF
						rsLinks.Delete 
						rsLinks.MoveNext 
					loop
				rsLinks.Close 
				rsCategory.Delete
			End If
		rsCategory.MoveNext
		Loop
	rsCategory.Close
'End If

' If there is a request to update the new record, update the new record.
If Request.Form("Submit") = "Update Category" Then
	rsCategory.Open "Quick_Links_Category", cnnBCFPD,3,3
	rsCategory.AddNew
		For Each Item in Request.Form
			If Item <> "Submit" Then
				rsCategory(Item) = Request.Form(Item)
			End If
		Next
		rsCategory.Update
	rsCategory.Close
End If

' If there is a request to update an existing record, update the existing record.
If Request.Form("Submit") = "Update Existing Category" Then
	rsCategory.Open "SELECT * FROM Quick_Links_Category WHERE Category_ID =" & Request.Form("Category_ID"), cnnBCFPD,3,3
		For Each Item in Request.Form
			If Item <> "Submit" AND Item <> "Category_ID" Then
				rsCategory(Item) = Request.Form(Item)
			End If
		Next
		rsCategory.Update
	rsCategory.Close
End If

%>					
						
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table width="98%" border="0" cellspacing="0" cellpadding="5" bordercolor="orange">
	<tr>
		<td class="PageTitle">Quick Links Information</td>
    </tr>
	<tr>
		<td valign="bottom">

<% If Request.Form("Submit") = "Add New Category" OR Request.QueryString("Category_ID") <> "" Then
		
		' If there is a request to add new record, add new record.
		If Request.Form("Submit") = "Add New Category" Then
		 rsCategory.Open strNode, cnnBCFPD, 3, 3
		 rsCategory.AddNew
		End If
		   
		' If there is a request by clicking a hyper link, open the recordset and grab the selected record.
		If Request.QueryString("Category_ID") <> "" Then
		 rsCategory.Open "SELECT * FROM Quick_Links_Category WHERE Category_ID = " & Request.QueryString("Category_ID"), cnnBCFPD, 3, 3   
		End If
%>
	<!--' 9. A form is created that contains a table with update fields.-->
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form1" name="form1">
		<!-- 9a. A table is created that contains the requested information.-->
			<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td></td>
					<td>
						<table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
							<tr>
								<td class="ContactInfo" bordercolor="#f2f2f2">Name:</td>
								<td bordercolor="#f2f2f2"><input type="text" name="Name" size="50" maxlength="200" value="<%=rsCategory("Name")%>"></td>
							</tr>
							<tr>
								<td colspan="2">
									<!-- 9b. If Then Else statement to check if updating new record or existing.-->
									<% If Request.QueryString("Category_ID") <> "" Then %>
										<input type="Submit" name="Submit" value="Update Existing Category">
										<input type="hidden" name="Category_ID" value="<%=rsCategory("Category_ID")%>">
									<% Else %>
										<input type="Submit" name="Submit" value="Update Category">
									<% End If %>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>					
	</form>

<% Else %>

	
	<%	
		rsCategory.Open "SELECT * FROM Quick_Links_Category ORDER BY Name ASC" , cnnBCFPD, 3, 3
	%>
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form2" name="form2">
	<!-- 11. A table is created that will contain a delete check box, Make Feature/Headline links, and date info.-->
			<table border="0" cellpadding="3" cellspacing="0">
				<tr>
				    <td></td>
				    <td>
						<table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
							<tr>
								<td colspan="2" class="Subheadercenter">Web Page</td>
							</tr>
						<% Do while not rsCategory.EOF %>
							<tr>
								<td class="ContactInfo"><%=rsCategory("Name")%></td>
								<td align="center" class="ContactInfo"><a class="update" href="index.asp?Category_ID=<%=rsCategory("Category_ID")%>">View Links</a></td>
							</tr>
							<% rsCategory.MoveNext
							   Loop
							%>
							<tr>
								<td colspan="2" align="right">
									<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
									<input type="hidden" name="Submit">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	</form>
	<%rsCategory.Close%>

<% End If %>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->



