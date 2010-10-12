<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(9) Then
    Response.Redirect "/members_only/index.asp"
End If
%>

<!-- #include virtual="/include/constants/database.asa"-->

<%


' Create a recordset object called rsCategory.
	set rsCategory = Server.CreateObject("ADODB.Recordset")
	strNode = "SELECT * FROM Library_Category"

' If there is a request to delete, delete the record.
'If Request.Form("Submit") = "Delete Category" Then
	rsCategory.Open "Library_Category", cnnMain, 3, 3
		Do While Not rsCategory.EOF
			If Request.Form("Delete" & rsCategory("Category_ID")) Then
				rsCategory.Delete
			End If
		rsCategory.MoveNext
		Loop
	rsCategory.Close
'End If

' If there is a request to update the new record, update the new record.
If Request.Form("Submit") = "Update Category" Then
	rsCategory.Open "Library_Category", cnnMain,3,3
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
	rsCategory.Open "SELECT * FROM Library_Category WHERE Category_ID =" & Request.Form("Category_ID"), cnnMain,3,3
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
<table border="0" width="98%" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">Library Categories</td>
    </tr>
	<tr>
		<td width="100%" valign="bottom">

<% If Request.Form("Submit") = "Add New Category" OR Request.QueryString("Category_ID") <> "" Then
		
		' If there is a request to add new record, add new record.
		If Request.Form("Submit") = "Add New Category" Then
		 rsCategory.Open strNode, cnnMain, 3, 3
		 rsCategory.AddNew
		End If
		   
		' If there is a request by clicking a hyper link, open the recordset and grab the selected record.
		If Request.QueryString("Category_ID") <> "" Then
		 rsCategory.Open "SELECT * FROM Library_Category WHERE Category_ID = " & Request.QueryString("Category_ID"), cnnMain, 3, 3   
		End If
%>
	<!--' 9. A form is created that contains a table with update fields.-->
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form1" name="form1">
		<!-- 9a. A table is created that contains the requested information.-->
			<table border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td></td>
					<td>
						<table border="0" cellpadding="0" cellspacing="0" bordercolor="#f2f2f2">
							<tr>
								<td class="ContactInfo" bordercolor="#f2f2f2">Name:</td>
								<td bordercolor="#f2f2f2"><input type="text" name="Name" size="50" maxlength="200" value="<%=rsCategory("Name")%>"></td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<!-- 9b. If Then Else statement to check if updating new record or existing.-->
									<% If Request.QueryString("Category_ID") <> "" Then %>
										<a href="javascript:submit(document.form1, 'Update Existing Category');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
										<img src="/images/spacer.gif" border="0" height="1" width="35">
										<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
										<input type="hidden" name="Submit">
										<input type="hidden" name="Category_ID" value="<%=rsCategory("Category_ID")%>">
									<% Else %>
										<a href="javascript:submit(document.form1, 'Update Category');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
										<img src="/images/spacer.gif" border="0" height="1" width="35">
										<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
										<input type="Hidden" name="Submit">
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
		rsCategory.Open "SELECT * FROM Library_Category ORDER BY Name ASC" , cnnMain, 3, 3
	%>
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form2" name="form2">
	<!-- 11. A table is created that will contain a delete check box, Make Feature/Headline links, and date info.-->
			<table border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td></td>
					<td align="right"><a href="image_list.asp?Edit=<%=Request.QueryString("Edit")%>&amp;Spot_ID=&amp;FullPath=<%=server.URLEncode("C:\WebSites\bcfdmo\missouri_tf1\Library\Files")%>&amp;Virtual=<%=server.URLEncode("/missouri_tf1/Library/Files")%>"><img src="/images/members/buttons/files.gif" border="0"></a></td>
				</tr>		 
				<tr>
					<td></td>
					<td>
					    <table border="0" cellpadding="3" cellspacing="3" bordercolor="#f2f2f2">
							<tr>
								<td class="subheadercenter">Delete</td>
								<td class="subheadercenter">Name</td>
								<td class="subheadercenter">Edit</td>
							</tr>
							<!-- 12. Do While Loop to populate the table with database information.-->
							<% Do while not rsCategory.EOF %>
							<tr>
								<td align="center" bordercolor="#f2f2f2"><input type="checkbox" name="Delete<%=rsCategory("Category_ID")%>" value="true"></td>
								<td class="ContactInfo" bordercolor="#f2f2f2"><%=rsCategory("Name")%></td>
								<td align="center"><a class="update" href="index.asp?Category_ID=<%=rsCategory("Category_ID")%>">Edit Category</a></td>
							</tr>
							<% rsCategory.MoveNext
							   Loop
							%>
							<tr>
								<td align="right" colspan="3">
									<a href="javascript:submit(document.form2, 'Add New Category');"><img SRC="/images/members/buttons/add.gif" border="0"></a>
									<img src="/images/spacer.gif" border="0" height="1" width="35">
									<a href="javascript:Delete();"><img SRC="/images/members/buttons/Delete.gif" border="0"></a>
									<img src="/images/spacer.gif" border="0" height="1" width="35">
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



