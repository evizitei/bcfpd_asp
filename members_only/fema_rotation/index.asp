<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(11) Then
    Response.Redirect "/members_only/index.asp"
End If

' Create a recordset object called rsRotation.
	set rsRotation = Server.CreateObject("ADODB.Recordset")
	set rsRotation2 = Server.CreateObject("ADODB.Recordset")
	set rsMonth = Server.CreateObject("ADODB.Recordset")
	set rsRegion = Server.CreateObject("ADODB.Recordset")
	set rsTeams = Server.CreateObject("ADODB.Recordset")
	set rsTeams2 = Server.CreateObject("ADODB.Recordset")

	rsRotation2.Open "Select * from Fema_Rotation", cnnBCFPD, 3
	ArrRotation = rsRotation2.GetRows	rsRotation2.Close 

	rsTeams2.Open "Select Name from Fema_Teams ORDER BY Name", cnnBCFPD, 3
	ArrTeams = rsTeams2.GetRows	rsTeams2.Close 
	Rotation_ID = GetVal("Rotation_ID", "")

	If Request.Form("Submit") = "Save" then
		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("First_Due")
			rsRotation("First_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
		
		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Second_Due")
			rsRotation("Second_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close

		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Third_Due")
			rsRotation("Third_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
		
		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Fourth_Due")
			rsRotation("Fourth_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
		
		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Fifth_Due")
			rsRotation("Fifth_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
		
		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Sixth_Due")
			rsRotation("Sixth_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close

		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Seventh_Due")
			rsRotation("Seventh_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
		
		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Eighth_Due")
			rsRotation("Eighth_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close

		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3,3 
		For each item in Request.Form("Ninth_Due")
			rsRotation("Ninth_Due") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
		Response.Redirect "index.asp"
	end if

	%>
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<%	if Rotation_ID = "" then %>
<form method="POST" action="index.asp" id=form1 name=form1>
<table border="0" width="98%" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">FEMA Rotation Schedule</td>
    </tr>
	<tr>
		<td width="100%" valign="bottom">
		<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td></td>
				    <td>
						<table border="1" cellpadding="5" cellspacing="0" bordercolor="#f2f2f2">
							<tr>
								<td class="subheadercenter"><nobr>Month</nobr></td>
								<td  class="subheadercenter"><nobr>Region</nobr></td>
								<td class="subheadercenter"><nobr>1st Due</nobr></td>
								<td class="subheadercenter"><nobr>2nd Due</nobr></td>
								<td class="subheadercenter"><nobr>3rd Due</nobr></td>
								<td class="subheadercenter"><nobr>4th Due</nobr></td>
								<td class="subheadercenter"><nobr>5th Due</nobr></td>
								<td class="subheadercenter"><nobr>6th Due</nobr></td>
								<td class="subheadercenter"><nobr>7th Due</nobr></td>
								<td class="subheadercenter"><nobr>8th Due</nobr></td>
								<td class="subheadercenter"><nobr>9th Due</nobr></td>
								<td class="subheadercenter"><nobr>Edit</td>
							</tr>
			
						<%	rsMonth.Open "SELECT * FROM Month ORDER BY Month_ID", cnnBCFPD,3  
							do while not rsMonth.EOF %>
								<td rowspan="3"><font size="2"><%=rsMonth("Name")%></font></td>
		   				<%		rsRegion.Open "SELECT * FROM FEMA_Region ORDER BY Region_ID", cnnBCFPD,3  
								do while not rsRegion.EOF %>
										<td><font size="2"><nobr><%=rsRegion("Name")%></nobr></font></td>
						<%			rsRotation.Open "SELECT * FROM FEMA_Rotation where Month_ID = " & rsMonth("Month_ID") & " AND Region_ID = " & "'" & rsRegion("Name") & "'" & " ORDER BY Rotation_ID", cnnBCFPD,3  
									do while not rsRotation.eof %>
										<td <%ReturnClass rsRotation("First_Due"), "MO-TF1", "MOTF1", "AppLabel"%> ><nobr><%=rsRotation("First_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Second_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Second_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Third_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Third_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Fourth_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Fourth_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Fifth_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Fifth_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Sixth_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Sixth_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Seventh_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Seventh_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Eighth_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Eighth_Due")%></nobr></td>
										<td <%ReturnClass rsRotation("Ninth_Due"), "MO-TF1", "MOTF1", "AppLabel"%>><nobr><%=rsRotation("Ninth_Due")%></nobr></td>
										<td><a class="Update" href="index.asp?Rotation_ID=<%=rsRotation("Rotation_ID")%>">edit</a></td>
									</tr>
						<%				rsRotation.MoveNext 
									loop
									rsRotation.close
								rsRegion.MoveNext 
								loop
								rsRegion.Close
							rsMonth.MoveNext
							loop
							rsMonth.Close %>
								<tr>
									<td align="right" colspan="12">
									<table>
										<tr>
											<td>
												<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
											</td>
										</tr>
									</table>
								</td>
							</tr>
					</table>
				 </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%	else
		rsRotation.Open "SELECT * FROM FEMA_Rotation where Rotation_ID = " & Rotation_ID, cnnBCFPD,3  
		rsMonth.Open "SELECT * FROM Month WHERE Month_ID = " & rsRotation("Month_ID"), cnnBCFPD,3  
		%>
<form method="POST" action="index.asp?Rotation_ID=<%=Rotation_ID%>" id=form1 name=form1>
<table border="0" width="98%" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">FEMA Rotation Schedule</td>
    </tr>
	<tr>
		<td width="100%" valign="bottom">
		<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td></td>
				    <td>
						<table border="1" cellpadding="5" cellspacing="0" bordercolor="#f2f2f2">
							<tr>
								<td class="subheadercenter">Month</td>
								<td  class="subheadercenter">Region</td>
								<td class="subheadercenter">1st Due</td>
								<td class="subheadercenter">2nd Due</td>
								<td class="subheadercenter">3rd Due</td>
								<td class="subheadercenter">4th Due</td>
								<td class="subheadercenter">5th Due</td>
								<td class="subheadercenter">6th Due</td>
								<td class="subheadercenter">7th Due</td>
								<td class="subheadercenter">8th Due</td>
								<td class="subheadercenter">9th Due</td>
							</tr>
			
								<td rowspan="3"><font size="2"><%=rsMonth("Name")%></font></td>
								<td><font size="2"><nobr><%=rsRotation("Region_ID")%></nobr></font></td>
						<%			do while not rsRotation.eof %>
										<td><SELECT id=select1 name="First_Due">						<%				for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("First_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("First_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>

										<td><SELECT id=select1 name="Second_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Second_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Second_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>
										<td><SELECT id=select1 name="Third_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Third_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Third_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>
										<td><SELECT id=select1 name="Fourth_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Fourth_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Fourth_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>
										<td><SELECT id=select1 name="Fifth_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Fifth_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Fifth_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>
										<td><SELECT id=select1 name="Sixth_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Sixth_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Sixth_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>
										<td><SELECT id=select1 name="Seventh_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Seventh_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Seventh_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>
										<td><SELECT id=select1 name="Eighth_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Eighth_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Eighth_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>
										<td><SELECT id=select1 name="Ninth_Due">									<%	for each item in ArrTeams %>
											<OPTION  <%ReturnClass rsRotation("Ninth_Due"), "MO-TF1", "MOTF1", "AppLabel"%> <% if rsRotation("Ninth_Due") = item then%> selected<%end if%>><%=item%></OPTION>
									<%	next %>
											</SELECT>
										</td>

									</tr>
						<%				rsRotation.MoveNext 
									loop
									rsRotation.close%>
								<tr>
									<td align="right" colspan="12">
									<table cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td><a href="javascript:submit(document.form1, 'Save');"><img SRC="/images/members/buttons/Save.gif" border="0"></a></td>
											<td><img src="/images/spacer.gif" border="0" height="1" width="35"></td>
											<td><a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a></td>
											<td><input type="Hidden" name="Submit"></td>
										</tr>
									</table>
								</td>
							</tr>
					</table>
				 </td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%	end if%>
</form>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->

