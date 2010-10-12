<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(13) Then
    Response.Redirect "/members_only/index.asp"
End If
	
Dim Application_ID
Application_ID = GetVal("Application_ID", "")

' 2. Create a Recordset Object
Set rsApplicant = Server.CreateObject("ADODB.Recordset")

' If there is a request to delete, delete the record.
'If Request.Form("Submit") = "Delete Contact" Then
	rsApplicant.Open "Application_MOTF1", cnnBCFPD, 3, 3
		Do While Not rsApplicant.EOF
			If Request.Form("Delete" & rsApplicant("Application_ID")) Then
				rsApplicant.Delete
			End If
		rsApplicant.MoveNext
		Loop
	rsApplicant.Close
'End If


%>									
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table width="98%" border="0" cellspacing="0" cellpadding="5" bordercolor="orange">
	<tr>
		<td class="PageTitle">MO-TF1 Join Application</td>
    </tr>
	<tr>
		<td valign="bottom">
	

<%
	if Request.QueryString("Application_ID") <> "" then
		rsApplicant.Open "Select * From Application_MOTF1 WHERE Application_ID = " & Application_ID, cnnBCFPD, 3 
%>


	<form method="post" action="index.asp" id="form1" name="form1" onsubmit="return ValidateApp(document.form1.elements, 'You must enter a ');">
		<!-- 8a. A table is created that contains the requested information.-->
	      <table width="770" border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
			<tr>
				<td class="header" colspan="2">Personal Information</td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">First Name:</td>
				<td class="AppLabel"><%=rsApplicant("First_Namereq")%></td>
			</tr>	
			<tr>
				<td width="25%" class="AppLabel">Last Name:</td>
				<td class="AppLabel"><%=rsApplicant("Last_Namereq")%></td>
			</tr>	
			<tr>
				<td width="25%"  class="AppLabel">Home Address 1:</td>
				<td class="AppLabel"><%=rsApplicant("Address1req")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Home Address 2:</td>
				<td class="AppLabel"><%=rsApplicant("Address2")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">Home City:</td>
				<td class="AppLabel"><%=rsApplicant("Cityreq")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Home State:</td>
				<td class="AppLabel"><%=rsApplicant("Statereq")%></td>
			</tr>
			<tr>		
				<td width="25%"  class="AppLabel">Home Zip:</td>
				<td class="AppLabel"><%=rsApplicant("Zipreq")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Day Phone:</td>
				<td class="AppLabel"><%=rsApplicant("Day_Phonereq")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Evening Phone:</td>
				<td class="AppLabel"><%=rsApplicant("Night_Phone")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">Pager Number:</td>
				<td class="AppLabel"><%=rsApplicant("Pager")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">E-mail:</td>
				<td class="AppLabel"><%=rsApplicant("Email")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">Social Security Number:</td>
				<td class="AppLabel"><%=rsApplicant("SSN")%></td>
			</tr>
			<tr>
				<td class="header" colspan="2">Drivers License Information</td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">Driver's License Number:</td>
				<td class="AppLabel"><%=rsApplicant("DLN")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">State:</td>
				<td class="AppLabel"><%=rsApplicant("DL_State")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Date of Expiration:</td>
				<td class="AppLabel"><%=rsApplicant("DL_Exp")%></td>
			</tr>
			<tr>
				<td class="header" colspan="2">Employer Information</td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Current Employer:</td>
				<td class="AppLabel"><%=rsApplicant("Employerreq")%></td>
			</tr>	
			<tr>
				<td width="25%"  class="AppLabel">Current Position:</td>
				<td class="AppLabel"><%=rsApplicant("Positionreq")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Current Supervisor:</td>
				<td class="AppLabel"><%=rsApplicant("Supervisor")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">Employer Address 1:</td>
				<td class="AppLabel"><%=rsApplicant("Emp_Address1req")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">Employer Address 2:</td>
				<td class="AppLabel"><%=rsApplicant("Emp_Address2")%></td>
			</tr>

			<tr>
				<td width="25%" class="AppLabel">Employer City:</td>
				<td class="AppLabel"><%=rsApplicant("Emp_Cityreq")%></td>
			</tr>
			<tr>
				<td width="25%" class="AppLabel">Employer State:</td>
				<td class="AppLabel"><%=rsApplicant("Emp_Statereq")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Employer Zip:</td>
				<td class="AppLabel"><%=rsApplicant("Emp_Zipreq")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">Employer Phone 1:</td>
				<td class="AppLabel"><%=rsApplicant("Emp_Phone1req")%></td>
			</tr>
			<tr>
				<td class="AppLabel">Employer Phone 2:</td>
				<td class="AppLabel"><%=rsApplicant("Emp_Phone2")%></td>
			</tr>
			<tr>
				<td class="header" colspan="2">Education and Certifications</td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Education Level:</td>
				<td class="AppLabel"><%=rsApplicant("Education_Level")%></td>
			</tr>
			<tr>
				<td  width="25%" class="AppLabel">License Types, Numbers and Expiration Dates</td>
				<td class="AppLabel"><%=rsApplicant("License_Info")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Firefighter Certifications:</td>
				<td class="AppLabel"><%=rsApplicant("Fire_Certs")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Hazardous Materials<br>Certification:</td>
				<td class="AppLabel"><%=rsApplicant("HazMat_Certs")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Incident<br> Command System Training:</td>
				<td class="AppLabel"><%=rsApplicant("ICS_Training")%></td>
			</tr>
			<tr>
				<td width="25%"  class="AppLabel">Other Pertinent Training:</td>
				<td class="AppLabel"><%=rsApplicant("Other_Training")%></td>
			</tr>
		</table>
	<tr>
		<td align="right" colspan="10">
			<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
		</td>
	</tr>

	</form>


	
<%	else
		rsApplicant.Open "Select * From Application_MOTF1 Order By Last_Namereq ASC", cnnBCFPD, 3 %>
	<!-- 9. A form is created that contains a table with delete capability, Headline hyper links, and date info.-->
	<form method="post" action="index.asp" id="form2" name="form2">
	<!-- 10. A table is created that will contain a delete check box, Headline links, and date info.-->
      <table border="1" cellpadding="1" cellspacing="0" bordercolor="#f2f2f2">
		<tr>
			<td class="SubHeaderCenter">Delete</td>
			<td class="subheadercenter">Name</td>
			<td class="subheadercenter">Day Phone</td>
			<td class="subheadercenter">Evening Phone</td>
			<td class="subheadercenter">E-mail</td>
			<td class="subheadercenter">Employer</td>
			<td class="subheadercenter">View Application</td>
		</tr>
		<!-- 11. Do While Loop to populate the table with database information.-->
		<% Do while not rsApplicant.EOF %>
		<tr>
			<td valign="top" align="center"><input type="checkbox" name="Delete<%=rsApplicant("Application_ID")%>" value="true"></td>
			<td class="contactinfo"><%=rsApplicant("Last_Namereq") & ", " & rsApplicant("First_Namereq")%></td>
			<td class="contactinfo"><%=rsApplicant("Day_Phonereq")%></td>
			<td class="contactinfo"><%=rsApplicant("Night_Phone")%></td>
			<td class="contactinfo"><a class="update" href="mailto:<%=rsApplicant("Email")%>?subject=MO-TF1 Join Application"><%=rsApplicant("Email")%></a></td>
			<td class="contactinfo"><%=rsApplicant("Employerreq")%></td>
			<td align="center"><a class="update" href="index.asp?Application_ID=<%=rsApplicant("Application_ID")%>">view details</a></td>
		</tr>
		<%	rsApplicant.MoveNext
			Loop
			
		%>
	</table>
	<tr>
		<td align="right" colspan="7">
			<a href="javascript:Delete();"><img SRC="/images/members/buttons/Delete.gif" border="0"></a>
			<img src="/images/spacer.gif" border="0" height="1" width="35">
			<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
		</td>
	</tr>

	</form>

<%	
   	rsApplicant.Close 
	set rsApplicant = Nothing
	end if
%>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
