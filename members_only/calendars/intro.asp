<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(8) Then
    Response.Redirect "/members_only/index.asp"
End If

' Create a recordset object called rsNodes.
	set rsNodes = Server.CreateObject("ADODB.Recordset")
	strNode = "SELECT * FROM Calendar_Nodes"

' If there is a request to delete, delete the record.
'If Request.Form("Submit") = "Delete Calendar" Then
	rsNodes.Open "Calendar_Nodes", cnnMain, 3, 3
		Do While Not rsNodes.EOF
			If Request.Form("Delete" & rsNodes("Node_ID")) Then
				rsNodes.Delete
			End If
		rsNodes.MoveNext
		Loop
	rsNodes.Close
'End If

' If there is a request to update the new record, update the new record.
If Request.Form("Submit") = "Update Calendar" Then
	rsNodes.Open "Calendar_Nodes", cnnMain,3,3
	rsNodes.AddNew
		For Each Item in Request.Form
			If Item <> "Submit" Then
				rsNodes(Item) = Request.Form(Item)
			End If
		Next
		rsNodes.Update
	rsNodes.Close
End If

' If there is a request to update an existing record, update the existing record.
If Request.Form("Submit") = "Update Existing Calendar" Then
	rsNodes.Open "SELECT * FROM Calendar_Nodes WHERE Node_ID =" & Request.Form("Node_ID"), cnnMain,3,3
		For Each Item in Request.Form
			If Item <> "Submit" AND Item <> "Node_ID" Then
				rsNodes(Item) = Request.Form(Item)
			End If
		Next
		rsNodes.Update
	rsNodes.Close
End If

%>					
						

<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table border="0" width="98%" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">BCFPD Calendars</td>
    </tr>
	<tr>
		<td width="100%" valign="bottom">

<% If Request.Form("Submit") = "Add New Calendar" OR Request.QueryString("Node_ID") <> "" Then
		set rsNodes = Server.CreateObject("ADODB.Recordset")
		' If there is a request to add new record, add new record.
		If Request.Form("Submit") = "Add New Calendar" Then
		 rsNodes.Open strNode, cnnMain, 3, 3
		 rsNodes.AddNew
		End If
		   
		' If there is a request by clicking a hyper link, open the recordset and grab the selected record.
		If Request.QueryString("Node_ID") <> "" Then
		 rsNodes.Open "SELECT * FROM Calendar_Nodes WHERE Node_ID = " & Request.QueryString("Node_ID"), cnnMain, 3, 3   
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
								<td class="ContactInfo">Calendar:</td>
								<td><input type="text" name="Name" value="<%=rsNodes("Name")%>"></td>
							</tr>
							<tr>
								<td class="ContactInfo">Description:</td>
								<td><textarea name="Description" cols="50" rows="10"><%=rsNodes("Description")%></textarea></td>
							</tr>
							<tr>
								<td align="right" colspan="2">
									<!-- 9b. If Then Else statement to check if updating new record or existing.-->
									<% If Request.QueryString("Node_ID") <> "" Then %>
											<a href="javascript:submit(document.form1, 'Update Existing Calendar');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
											<img src="/images/spacer.gif" border="0" height="1" width="35">
											<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
											<input type="hidden" name="Submit">
											<input type="hidden" name="Node_ID" value="<%=rsNodes("Node_ID")%>">
									<% Else %>
											<a href="javascript:submit(document.form1, 'Update Calendar');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
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
		set rsNodes = Server.CreateObject("ADODB.Recordset")
		rsNodes.Open "SELECT * FROM Calendar_Nodes" , cnnMain, 3, 3
	%>
	<!-- 10. A form is created that contains a table with delete/make feature capability, 	Headline hyper links, and date info.-->
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form2" name="form2">
	<!-- 11. A table is created that will contain a delete check box, Make Feature/Headline links, and date info.-->
		<table border="0" cellpadding="3" cellspacing="3">
		  <tr>
		    <td></td>
		    <td>
		      <table border="0" cellpadding="3" cellspacing="3" bordercolor="#f2f2f2">
				<tr>
					<td class="subheadercenter">Delete</td>
					<td  class="subheadercenter">Name</td>
					<td  class="subheadercenter">Description</td>
					<td class="subheadercenter">View Calendar</td>
				</tr>
				<!-- 12. Do While Loop to populate the table with database information.-->
				<% Do while not rsNodes.EOF %>
				<tr>
					<td valign="top" align="center"><input type="checkbox" name="Delete<%=rsNodes("Node_ID")%>" value="true"></td>
					<td valign="top" ><a class="Update" href="<%Request.ServerVariables("SCRIPT_NAME")%>?Node_ID=<%=rsNodes("Node_ID")%>"><%=rsNodes("Name")%></a></td>
					<td valign="top"  class="contactInfo"><%=rsNodes("Description")%></td>
					<td valign="top" ><a class="Update" href="index.asp?Node_ID=<%=rsNodes("Node_ID")%>">Calendar View</a><br><a class="Update" href="layout.asp?Node_ID=<%=rsNodes("Node_ID")%>">Layout View</a></td>
				</tr>
				<% rsNodes.MoveNext
				   Loop
				%>
				<tr>
					<td align="right" colspan="4">
						<a href="javascript:submit(document.form2, 'Add New Calendar');"><img SRC="/images/members/buttons/add.gif" border="0"></a>
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
	<%rsNodes.Close%>

<% End If %>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->



