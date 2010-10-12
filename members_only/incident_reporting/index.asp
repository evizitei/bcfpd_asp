<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(12) Then
    Response.Redirect "/members_only/index.asp"
End If

Dim Incident_ID
Dim Time
Dim AMPMVal

Incident_ID = killChars(GetVal("Incident_ID", ""))
AMPVal = GetVal("AMPM", "")
Time = GetVal("Timereq", "") & AMPVal

' 2. Create a Recordset Object
Set rsIncident = Server.CreateObject("ADODB.Recordset")
Set rsIncTypes = Server.CreateObject("ADODB.Recordset")
Set rsStations = Server.CreateObject("ADODB.Recordset")


' 4. If there is a request to update the new record, update the new record
If Request.Form("Submit") = "Update Incident" Then
	rsIncident.Open "Incidents", cnnBCFPD,3,3
	rsIncident.AddNew
		For Each Item in Request.Form
			if trim(Request.Form(Item)) <> "" AND Item <> "Submit" AND Item <> "AMPM" then
				if item <> "Timereq" then
					rsIncident(Item) = killChars(Request.Form(Item))
				else
					'Response.Write(Item & " = " & Time)
					rsIncident(Item) = Time
				end if
			end if
		Next
		rsIncident.Update
	rsIncident.Close
End If

' If there is a request to update an existing record, update the existing record.
If Request.Form("Submit") = "Update Existing Incident" Then
	rsIncident.Open "SELECT * FROM Incidents WHERE Incident_ID =" & Incident_ID, cnnBCFPD,3,3
		For Each Item in Request.Form
			if trim(Request.Form(Item)) <> "" AND Item <> "Submit" AND Item <> "Incident_ID" then
			'if trim(Request.Form(Item)) <> "" AND Item <> "Submit" AND right(Item, 3) <> "req" AND Item <> "Incident_ID" then
				'Response.Write(item)
				rsIncident(Item) = killChars(Request.Form(Item))
			'elseif right(Item, 3) = "req" then
			'	Response.Write(item)
			'	rsIncident(Item) = Request.Form(Item)
				'rsIncident(replace(Item, "req", "")) = Request.Form(Item)
			end if
		Next
		rsIncident.Update
	rsIncident.Close
End If


%>									
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table border="0" width="98%" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">Incident Reporting</td>
    </tr>
	<tr>
		<td width="100%" valign="bottom">
<% If Request.Form("Submit") = "Add New Incident" OR Request.QueryString("Incident_ID") <> "" Then
		
		' 6. If there is a request to add new record, add new record
		If Request.Form("Submit") = "Add New Incident" Then
		 rsIncident.Open "Incidents", cnnBCFPD, 3, 3
		 rsIncident.AddNew
		End If
		   
		' 7. If there is a request by clicking a hyper link, open the recordset and grab the selected record
		If Request.QueryString <> "" Then
		 rsIncident.Open "SELECT * FROM Incidents WHERE Incident_ID = " & killChars(Request.QueryString("Incident_ID")), cnnBCFPD, 3, 3   
		End If
%>
	<!-- 8. A form is created that contains a table with update fields.-->
	<br>
	<font size="1"><strong>Items in bold are required.</strong></font>

	<form method="post" action="index.asp" id="form1" name="form1" onsubmit="return ValidateApp(document.form1.elements, 'You must enter a ');">
		<!-- 8a. A table is created that contains the requested information.-->
	      <table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
			<tr>
				<td class="AppLabel"><b>Incident #:</b></td>
				<td><input type="text" name="Incident_Numreq" value="<%=rsIncident("Incident_Numreq")%>" size="9" maxlength="9"></td>
			</tr>
			<tr>
				<td class="AppLabel"><b>Date:</b></td>
				<td><input type="text" name="Datereq" value="<%=rsIncident("Datereq")%>" size="9" maxlength="15"></td>
			</tr>
			<tr>
				<td class="AppLabel"><b>Time:</b></td>
				<td><input type="text" name="Timereq" value="<%=rsIncident("Timereq")%>" size="9" maxlength="15">&nbsp;
				<%if Incident_ID = "" then%>
				<select id="select1" name="AMPM">
					<option value="AM">A.M.</option>
					<option value="PM">P.M.</option>
				</select>
				<%end if%>
				</td>
			</tr>
			<tr>
				<td class="AppLabel"><b>Address 1:</b></td>
				<td><input type="text" name="Address1req" value="<%=rsIncident("Address1req")%>" size="60" maxlength="200"></td>
		<!--		<td align="right"><a href="image_list.asp?Edit=<%=Request.QueryString("Incident_ID")%>&FullPath=<%=server.URLEncode("c:\Websites\bcfdmo\images\Incident\")%>&Virtual=<%=server.URLEncode("/images/Incident")%>">Image Management</a></td> -->
			</tr>	
			<tr>
				<td class="AppLabel">Address 2:</td>
				<td><input type="text" name="Address2" value="<%=rsIncident("Address2")%>" size="60" maxlength="200"></td>
			</tr>
			<tr>
				<td class="AppLabel"><b>City:</b></td>
				<td><input type="text" name="Cityreq" value="<%=rsIncident("Cityreq")%>" size="50" maxlength="100"></td>
			</tr>
			<tr>
				<td class="AppLabel"><b>State:</b></td>
				<td><input type="text" name="State" value="MO" size="2" Maxlength="2"></td>
			</tr>
			<tr>
				<td class="AppLabel">Zip:</td>
				<td><input type="text" name="Zip" value="<%=rsIncident("Zip")%>" size="5" maxlength="5"></td>
			</tr>
			<tr>
				<td class="AppLabel">Description:</td>
				<td><textarea rows="5" cols="50" id="textarea1" name="Description"><%=rsIncident("Description")%></textarea></td>
			</tr>
			<tr>
				<td class="AppLabel"><b>Incident Type:</b> </td>
				<td><select size="1" name="Type_IDreq">
				    <option value>Choose Type...</option>
				<%	rsIncTypes.Open "SELECT * FROM Incident_Types ORDER BY Number", cnnBCFPD, 3
					Do while not rsIncTypes.EOF %>
						<option <%if rsIncident("Type_IDreq") = rsIncTypes("Type_ID") then%> selected <%end if%> value="<%=rsIncTypes("Type_ID")%>"><%=rsIncTypes("Number") & " -- " & rsIncTypes("Name")%></option>
				<%		rsIncTypes.MoveNext 
					loop
					rsIncTypes.Close 
					set rsIncTypes = Nothing
				%>
				</td>
			</tr>
			<tr>
				<td class="AppLabel"><b>Station:</b> </td>
				<td><select size="1" name="Station_Numberreq">
				    <option value>Choose Station...</option>
				<%	rsStations.Open "SELECT  * from Stations", cnnBCFPD, 3
					Do while not rsStations.EOF %>
						<option <%if rsIncident("Station_Numberreq") = rsStations("Station_Number") then%> selected <%end if%> value="<%=rsStations("Station_Number")%>"><%=rsStations("Name")%></option>
				<%		rsStations.MoveNext 
					loop
					rsStations.Close 
					set rsStations = Nothing
				%>
				</td>
			</tr>
			<tr>
				<td align="right" colspan="3">
				<!-- 8b. If Then Else statement to check if updating new record or existing.-->
					<% If Request.QueryString <> "" Then %>
						<a href="javascript:submitPlus(document.form1, 'Update Existing Incident');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
						<img src="/images/spacer.gif" border="0" height="1" width="35">
						<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
						<input type="hidden" name="Submit">
						<input type="hidden" name="Incident_ID" value="<%=rsIncident("Incident_ID")%>">
					<% Else %>
						<a href="javascript:submitPlus(document.form1, 'Update Incident');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
						<img src="/images/spacer.gif" border="0" height="1" width="35">
						<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
						<input type="Hidden" name="Submit">
					<% End If %>
				</td>
			</tr>
		</table>
	</form>

<% Else %>	
	
	<%rsIncident.Open "Select * From Incidents where datereq > DATEADD(day, - 14, GETDATE()) AND datereq < getdate() Order By Datereq ASC, Timereq ASC ", cnnBCFPD, 3%>
	<!-- 9. A form is created that contains a table with delete capability, Headline hyper links, and date info.-->
	<form method="post" action="index.asp" id="form2" name="form2">
	<!-- 10. A table is created that will contain a delete check box, Headline links, and date info.-->
      <table border="0" cellpadding="5" cellspacing="5" bordercolor="#f2f2f2">
		<tr>
			<td class="subheadercenter">Date</td>
			<td class="subheadercenter">Time</td>
			<td class="subheadercenter">Location</td>
			<td class="subheadercenter">Incident Type</td>
			<td class="subheadercenter">Description</td>
			<td class="subheadercenter">Edit</td>
		</tr>
		<!-- 11. Do While Loop to populate the table with database information.-->
		<% Do while not rsIncident.EOF %>
		<tr>
			<td class="contactinfo" valign="top"><%=rsIncident("Datereq")%></td>
			<td class="contactinfo" valign="top"><%=rsIncident("Timereq")%></td>
			<td align="left" class="contactinfo" valign="top"><%=rsIncident("Address1req")%>
				<%if rsIncident("Address2") <> "" then%>
					<%="<br>" & rsIncident("Address2")%>
				<%end if %>
				<%if rsIncident("Cityreq") <> "" then%>
					<%="<br>" & rsIncident("Cityreq") & ", " & rsIncident("State")%>
				<%end if %>
				<%if rsIncident("Zip") <> "" then%>
					<%="<br>" & rsIncident("Zip")%>
				<%end if %>
			</td>
			<td class="contactinfo" valign="top"><%rsIncTypes.Open "Select * from Incident_Types where Type_ID = " & rsIncident("Type_IDreq"), cnnBCFPD, 3%>
				<%=rsIncTypes("Name")%>
				<%rsIncTypes.Close   %>
			</td>
			<td class="contactinfo" valign="top"><%=rsIncident("Description")%></td>
			<td valign="top"><a class="update" href="index.asp?Incident_ID=<%=rsIncident("Incident_ID")%>">edit incident</a></td>
		</tr>
		<%	rsIncident.MoveNext
			Loop
			set rsIncTypes = Nothing
		   	rsIncident.Close 

		%>
		<tr>
			<td align="right" colspan="6">
				<a href="javascript:submit(document.form2, 'Add New Incident');"><img SRC="/images/members/buttons/add.gif" border="0"></a>
				<img src="/images/spacer.gif" border="0" height="1" width="35">
				<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
				<input type="hidden" name="Submit">
			</td>
		</tr>
	</table>
	</form>

<%	
	End If
	set rsIncident = Nothing
%>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
