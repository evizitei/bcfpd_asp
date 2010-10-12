<!-- #include virtual="/members_only/include/functions.asa"-->
<%
' Create a recordset object called rsNodes.
	set rsNodes = Server.CreateObject("ADODB.Recordset")
	strNode = "SELECT * FROM Contact_Us_Stations"

Sort_ID = GetVal("Sort_ID", "")

' If there is a request to delete, delete the record.
'If Request.Form("Delete").Count > 0 Then
	rsNodes.Open "Contact_Us_Stations", cnnBCFPD, 3, 3
		Do While Not rsNodes.EOF
			If Request.Form("Delete" & rsNodes("Contact_ID")) Then
				rsNodes.Delete
			End If
		rsNodes.MoveNext
		Loop
	rsNodes.Close
'End If

' If there is a request to update the new record, update the new record.
If Request.Form("Submit") = "Update Contact" Then
	rsNodes.Open "Contact_Us_Stations", cnnBCFPD,3,3
	rsNodes.AddNew
		For Each Item in Request.Form
			If Item <> "Submit" Then
				rsNodes(Item) = killChars(Request.Form(Item))
			End If
		Next
		rsNodes.Update
	rsNodes.Close
End If

' If there is a request to update an existing record, update the existing record.
If Request.Form("Submit") = "Update Existing Contact" Then
	rsNodes.Open "SELECT * FROM Contact_Us_Stations WHERE Contact_ID =" & killChars(Request.Form("Contact_ID")), cnnBCFPD,3,3
		For Each Item in Request.Form
			If Item <> "Submit" AND Item <> "Contact_ID" Then
				rsNodes(Item) = killChars(Request.Form(Item))
			End If
		Next
		rsNodes.Update
	rsNodes.Close
End If

if Request.QueryString("Action") = "up" then
	Order "Contact_Us_Stations", "up", Sort_ID
else 
	if Request.QueryString("Action") = "down" then
		Order "Contact_Us_Stations", "down", Sort_ID
	end if 
end if		


%>					
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table width="98%" border="0" cellspacing="0" cellpadding="5" bordercolor="orange">
	<tr>
		<td class="PageTitle">Station Contact Information</td>
    </tr>
	<tr>
		<td valign="bottom">

<% If Request.Form("Submit") = "Add New Contact" OR Request.QueryString("Contact_ID") <> "" Then
		
		' If there is a request to add new record, add new record.
		set rsNodes = Server.CreateObject("ADODB.Recordset")
		strNode = "SELECT * FROM Contact_Us_Stations"
	
		If Request.Form("Submit") = "Add New Contact" Then
		 rsNodes.Open strNode, cnnBCFPD, 3, 3
		 rsNodes.AddNew
		End If
		   
		' If there is a request by clicking a hyper link, open the recordset and grab the selected record.
		If Request.QueryString("Contact_ID") <> "" Then
		 rsNodes.Open "SELECT * FROM Contact_Us_Stations WHERE Contact_ID = " & killChars(Request.QueryString("Contact_ID")), cnnBCFPD, 3, 3   
		End If
%>
	<!--' 9. A form is created that contains a table with update fields.-->
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form1" name="form1">
		<!-- 9a. A table is created that contains the requested information.-->
		<table border="0" bordercolor="green" cellpadding="0" cellspacing="0">
			<tr>
				<td></td>
				<td>
					<table border="0" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">Name:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="Name" size="50" maxlength="200" value="<%=rsNodes("Name")%>"></td>
						</tr>
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">Address 1:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="Address1" size="50" maxlength="200" value="<%=rsNodes("Address1")%>"></td>
						</tr>
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">Address 2:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="Address2" size="50" maxlength="200" value="<%=rsNodes("Address2")%>"></td>
						</tr>
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">City:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="City" size="50" maxlength="200" maxlength="100" value="<%=rsNodes("City")%>"></td>
						</tr>
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">State:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="State" size="2" maxlength="2" value="<%=rsNodes("State")%>"></td>
						</tr>
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">Zip:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="Zip" maxlength="20" value="<%=rsNodes("Zip")%>"></td>
						</tr>
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">Phone:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="Phone" maxlength="20" value="<%=rsNodes("Phone")%>"></td>
						</tr>
						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">Fax:</td>
							<td bordercolor="#f2f2f2"><input type="text" name="Fax" maxlength="20" value="<%=rsNodes("Fax")%>"></td>
						</tr>

						<tr>
							<td class="ContactInfo" bordercolor="#f2f2f2">Additional Info:</td>
							<td bordercolor="#f2f2f2"><textarea name="Info" cols="50" rows="10"><%=rsNodes("Info")%></textarea></td>
						</tr>
						<tr>
							<td align="right" colspan="2">
								<!-- 9b. If Then Else statement to check if updating new record or existing.-->
								<% If Request.QueryString("Contact_ID") <> "" Then %>
									<a href="javascript:submit(document.form1, 'Update Existing Contact');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
									<img src="/images/spacer.gif" border="0" height="1" width="35">
									<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
									<input type="hidden" name="Submit">
									<input type="hidden" name="Contact_ID" value="<%=rsNodes("Contact_ID")%>">
								<% Else %>
									<a href="javascript:submit(document.form1, 'Update Contact');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
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

<% 
	Else 
		set rsNodes = Server.CreateObject("ADODB.Recordset")
		rsNodes.Open "SELECT * FROM Contact_Us_Stations ORDER BY Sort Asc" , cnnBCFPD, 3, 3
%>
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form2" name="form2">
	<!-- 11. A table is created that will contain a delete check box, Make Feature/Headline links, and date info.-->
			<table border="0" bordercolor="pink" cellpadding="0" cellspacing="0">
				<tr>
					<td></td>
					<td>
						<table border="0" cellpadding="3" cellspacing="3" bordercolor="#f2f2f2">
							<tr>
								<td class="SubHeaderCenter">Delete</td>
								<td class="SubHeaderCenter">Name</td>
								<td class="SubHeaderCenter">Edit</td>
								<td class="SubHeaderCenter">Sort</td>
							</tr>
							<!-- 12. Do While Loop to populate the table with database information.-->
							<% Do while not rsNodes.EOF %>
							<tr>
								<td bordercolor="#f2f2f2"><input type="checkbox" name="Delete<%=rsNodes("Contact_ID")%>" value="true"></td>
								<td class="ContactInfo" bordercolor="#f2f2f2"><%=rsNodes("Name")%></td>
								<td class="ContactInfo" bordercolor="#f2f2f2"><a class="Update" href="index.asp?Contact_ID=<%=rsNodes("Contact_ID")%>">Edit Contact</a></td>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="3">
										<tr>
											<td valign="middle"><a href="index.asp?Action=up&amp;Sort_ID=<%=rsNodes("Contact_ID")%>"><img border="0" src="/images/members/buttons/arrow_up.gif"></a></td>
										</tr>
										<tr>
											<td valign="middle"><a href="index.asp?Action=down&amp;Sort_ID=<%=rsNodes("Contact_ID")%>"><img border="0" src="/images/members/buttons/arrow_down.gif"></a></td>
										</tr>
									</table>
								</td>		
							</tr>
							<% rsNodes.MoveNext
							   Loop
							%>
							<tr>
								<td align="right" colspan="4">
									<a href="javascript:submit(document.form2, 'Add New Contact');"><img SRC="/images/members/buttons/add.gif" border="0"></a>
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
	<%	rsNodes.Close
		set rsNodes = nothing
	End If %>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->



