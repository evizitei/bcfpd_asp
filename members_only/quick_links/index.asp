<!-- #include virtual="/members_only/include/functions.asa"-->
<%
If Not Session("Authorized")(6) Then
    Response.Redirect "/members_only/index.asp"
End If

' 2. Create a recordset object called rsLinks.
Category_ID = GetVal("Category_ID", "")
Set rsLinks = Server.CreateObject("ADODB.Recordset")
Set rsLinksCat = Server.CreateObject("ADODB.Recordset")
strEmp = "SELECT * FROM Quick_Links"

' 3. If there is a request to delete, delete the record.
'If Request.Form("Submit") = "Delete Record" Then
	rsLinks.Open "Quick_Links", cnnBCFPD, 3, 3
		Do While Not rsLinks.EOF
			If Request.Form("Delete" & rsLinks("Link_id")) Then
				rsLinks.Delete
			End If
		rsLinks.MoveNext
		Loop
	rsLinks.Close
'End If

' 4. If there is a request to update the new record, update the new record.
If Request.Form("Submit") = "Update Link" Then
	rsLinks.Open "Quick_Links", cnnBCFPD,3,3
	rsLinks.AddNew
		For Each Item in Request.Form
			If Item <> "Submit" Then
				rsLinks(Item) = Request.Form(Item)
			End If
		Next
		rsLinks.Update
	rsLinks.Close
End If

' 5. If there is a request to update an existing record, update the existing record.
If Request.Form("Submit") = "Update Existing Link" Then
	rsLinks.Open "SELECT * FROM Quick_Links WHERE Link_id =" & Request.Form("Record_ID"), cnnBCFPD,3,3
		For Each Item in Request.Form
			If Item <> "Submit" AND Item <> "Record_ID" Then
				rsLinks(Item) = Request.Form(Item)
			End If
		Next
		rsLinks.Update
	rsLinks.Close
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


<% If Request.Form("Submit") = "Add New Link" OR Request.QueryString("Link_id") <> "" Then
		
		' 7. If there is a request to add new record, add new record.
		If Request.Form("Submit") = "Add New Link" Then
		 rsLinks.Open strEmp, cnnBCFPD, 3, 3
		 rsLinks.AddNew
		End If
		   
		' 8. If there is a request by clicking a hyper link, open the recordset and grab the selected record.
		If Request.QueryString("Link_id") <> "" Then
		 rsLinks.Open "SELECT * FROM Quick_Links WHERE Link_id = " & Request.QueryString("Link_id"), cnnBCFPD, 3, 3   
		End If
%>
	<!--' 9. A form is created that contains a table with update fields.-->
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>?Category_ID=<%=Category_ID%>" id="form1" name="form1">
		<!-- 9a. A table is created that contains the requested information.-->
			<table border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td class="ContactInfo">Name:</td>
					<td><input type="text" name="Name" value="<%=rsLinks("Name")%>"></td>
				</tr>
				<tr>
					<td class="ContactInfo">Web Address:</td>
					<td><input type="text" name="URL" value="<%=rsLinks("URL")%>"></td>
				</tr>
				<tr>
					<td class="ContactInfo">Description:</td>
					<td><textarea name="Description" maxlength="8000" cols="50" rows="10"><%=rsLinks("Description")%></textarea></td>
				</tr>
				<tr>
					<td class="ContactInfo">Category:</td>
					<td><select id="select1" name="Link_Category_ID">
					<%	rsLinksCat.Open "SELECT * FROM Quick_Links_Category", cnnBCFPD, 3 
						do while not rsLinksCat.EOF %>
							<option value="<%=rsLinksCat("Category_ID")%>" <%if rsLinksCat("Category_ID") = cint(Category_ID) then %> selected <%end if%>><%=rsLinksCat("Name")%></option>
					<%		rsLinksCat.MoveNext
						loop
						rsLinksCat.Close %>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<!-- 9b. If Then Else statement to check if updating new record or existing.-->
						<% If Request.QueryString("Link_id") <> "" Then %>
							<input type="hidden" name="Record_ID" value="<%=rsLinks("Link_id")%>">
							<a href="javascript:submit(document.form1, 'Update Existing Link');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
							<img src="/images/spacer.gif" border="0" height="1" width="35">
							<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
							<input type="hidden" name="Submit">
						<% Else %>
							<a href="javascript:submit(document.form1, 'Update Link');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
							<img src="/images/spacer.gif" border="0" height="1" width="35">
							<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
							<input type="Hidden" name="Submit">
						<% End If %>
					</td>
				</tr>
			</table>
	</form>

<% Else %>

	
	<%	'rsLinks.Open "SELECT * FROM employment WHERE publication_date <= #" & now() & "# AND expiration_date >= #" & now() & "# ORDER BY expiration_date" , cnnBCFPD, 3, 3
		rsLinks.Open "SELECT * FROM Quick_Links WHERE Link_Category_ID = " & Category_ID & " ORDER BY Name ASC" , cnnBCFPD, 3, 3
		'rsLinks.Open strEmp, cnnBCFPD, 3, 3%>
	<!-- 10. A form is created that contains a table with delete/make feature capability, 	Headline hyper links, and date info.-->
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>?Category_ID=<%=Category_ID%>" id="form2" name="form2">
	<!-- 11. A table is created that will contain a delete check box, Make Feature/Headline links, and date info.-->
		<table border="0" cellpadding="3" cellspacing="3">
			<tr>
				<td class="subheadercenter">Delete</td>
				<td class="subheadercenter">Link Name</td>
				<td class="subheadercenter">Web Address</td>
				<td class="subheadercenter">Link Category</td>
			</tr>
			<!-- 12. Do While Loop to populate the table with database information.-->
			<% Do while not rsLinks.EOF %>
			<tr>
				<td align="center"><input type="checkbox" name="Delete<%=rsLinks("Link_ID")%>" value="true"></td>
				<td><a href="<%Request.ServerVariables("SCRIPT_NAME")%>?Link_ID=<%=rsLinks("Link_ID")%>&amp;Category_ID=<%=Category_ID%>"><%=rsLinks("Name")%></a></td>
				<td><a href="http://<%=rsLinks("URL")%>" target="_new"><%=rsLinks("URL")%></td>
				<%	rsLinksCat.Open "SELECT * FROM Quick_Links_Category WHERE Category_ID=" & rsLinks("Link_Category_ID"), cnnBCFPD, 3 %>
				<td class="ContactInfo"><%=rsLinksCat("Name")%></td>
				<%	rsLinksCat.Close %>
			</tr>
			<% rsLinks.MoveNext
			   Loop
			%>
			<tr>
				<td align="right" colspan="4">
					<a href="javascript:submit(document.form2, 'Add New Link');"><img SRC="/images/members/buttons/add.gif" border="0"></a>
					<img src="/images/spacer.gif" border="0" height="1" width="35">
					<a href="javascript:Delete();"><img SRC="/images/members/buttons/Delete.gif" border="0"></a>
					<img src="/images/spacer.gif" border="0" height="1" width="35">
					<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
					<input type="hidden" name="Submit">

				</td>
			</tr>
		</table>
	</form>
	<%rsLinks.Close%>

<% End If %>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
