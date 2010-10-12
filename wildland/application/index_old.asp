<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/wildland.asa"-->
<!--#include virtual="/members_only/include/common_functions.asa"-->


<%
Dim Applicant_ID
Applicant_ID = GetVal("Applicant_ID", "")

' 2. Create a Recordset Object
Set rsApplicant = Server.CreateObject("ADODB.Recordset")

' 4. If there is a request to update the new record, update the new record
If Request.Form("Submit") = "Submit" Then
	rsApplicant.Open "Application_Wildland", cnnMain,3,3
	rsApplicant.AddNew
		For Each Item in Request.Form
			If Item <> "Submit" AND trim(Request.Form(Item)) <> "" Then
				'Response.Write(item & "<br>")
				rsApplicant(Item) = Request.Form(Item)
			End If
		Next
		rsApplicant.Update
	rsApplicant.Close
	set rsApplicant = Nothing
' Send e-mail notification to BCFPD 
		Dim servMess
		Dim servBody
	
		servBody = "A Join Wildland Information Request Application has been submitted." & vbCrLf & vbCrLf & "This information is available on the website at:" & vbCrLf & vbCrLf & "http://www.bcfdmo.com/members_only/index.asp?Login=True" & vbCrLf & vbCrLf & "Received:" & now() & vbCrLf
        
		Set servMess = Server.CreateObject("JMail.SMTPMail")
		
		servMess.ServerAddress = "192.168.222.4"
		'servMess.AddRecipient "david-stephens@lanit.com"
		'servMess.AddRecipient "solsen@bcfdmo.com"
		servMess.AddRecipient "hq@bcfdmo.com"

		servMess.Logging = true
		servMess.SenderName = Request.Form("First_Namereq") & " " & Request.form("Last_Namereq")
		'servMess.Sender = Request.Form("Email")
		servMess.Subject = "BCFPD Web Site - Wildland Join Information Request Application"

		servMess.Body = servBody
		servMess.Execute

        Set servMess  = Nothing	
%>
		<table cellpadding="5" cellspacing="0" border="0" width="98%">
			<tr>
				<td class="PageTitle">Join Wildland Information Request Application</td>
			</tr>	
			<tr>
				<td class="Content"><%=Request.Form("First_Namereq")%>, thank you for submitting an application to join our organization.
			</tr>
		</table>
<%else%>
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Join Wildland Information Request Application</td>
	</tr>	
	<tr>
		<td><font size="1"><strong>Items in bold are required.</strong></font></td>
	</tr>
	<tr>
		<td>
			<form method="post" action="index.asp" id="form1" name="form1" onsubmit="return ValidateApp(document.form1.elements, 'You must enter a ');">
		      <table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
				<tr>
					<td class="Header" colspan="2">Personal Information</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>First Name:</b></td>
					<td><input type="text" name="First_Namereq" size="30" maxlength="100"></td>
				</tr>	
				<tr>
					<td class="AppLabel"><b>Last Name:</b></td>
					<td><input type="text" name="Last_Namereq" size="30" maxlength="100"></td>
				</tr>	
				<tr>
					<td class="AppLabel"><b>Home Address 1:</b></td>
					<td><input type="text" name="Address1req" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Home Address 2:</td>
					<td><input type="text" name="Address2" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>City:</b></td>
					<td class="AppLabel"><input type="text" name="Cityreq" size="30" maxlength="100">
					&nbsp;&nbsp;&nbsp;<b>State:</b>
					&nbsp;&nbsp;&nbsp;<input type="text" name="Statereq" value="MO" size="2" Maxlength="2">
					&nbsp;&nbsp;&nbsp;<b>Zip:</b>
					&nbsp;&nbsp;&nbsp;<input type="text" name="Zipreq" size="5" maxlength="5">
					</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Day Phone:</b></td>
					<td><input type="text" name="Day_Phonereq" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel">Evening Phone:</td>
					<td><input type="text" name="Night_Phone" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel">Pager Number:</td>
					<td><input type="text" name="Pager" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel">E-mail:</td>
					<td><input type="text" name="Email" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Social Security Number:</td>
					<td><input type="text" name="SSN" size="20" maxlength="11"></td>
				</tr>
				<tr>
					<td class="header" colspan="2">Drivers License Information</td>
				</tr>
				<tr>
					<td class="AppLabel">Driver's License Number:</td>
					<td class="AppLabel"><input type="text" name="DLN" size="20" maxlength="11">
					&nbsp;&nbsp;&nbsp;State:
					&nbsp;&nbsp;&nbsp;<input type="text" name="DL_State" size="2" maxlength="2">
					&nbsp;&nbsp;&nbsp;Date of Expiration:
					&nbsp;&nbsp;&nbsp;<input type="text" name="DL_Exp" size="10" maxlength="25"></td>
				</tr>
				<tr>
					<td class="header" colspan="2">Employer Information</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Current Employer:</b></td>
					<td><input type="text" name="Employerreq" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Current Position:</b></td>
					<td><input type="text" name="Positionreq" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Current Supervisor:</td>
					<td><input type="text" name="Supervisor" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Employer Address 1:</b></td>
					<td><input type="text" name="Emp_Address1req" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Employer Address 2:</td>
					<td><input type="text" name="Emp_Address2" size="30" maxlength="100"></td>
				</tr>

				<tr>
					<td class="AppLabel"><b>City:</b></td>
					<td class="AppLabel"><input type="text" name="Emp_Cityreq" size="30" maxlength="100">
					&nbsp;&nbsp;&nbsp;<b>State</b>:
					&nbsp;&nbsp;&nbsp;<input type="text" name="Emp_Statereq" value="MO" size="2" Maxlength="2">
					&nbsp;&nbsp;&nbsp;<b>Zip</b>:
					&nbsp;&nbsp;&nbsp;<input type="text" name="Emp_Zipreq" size="5" maxlength="5">
					</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Employer Phone 1:</b></td>
					<td><input type="text" name="Emp_Phone1req" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel">Employer Phone 2:</td>
					<td><input type="text" name="Emp_Phone2" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="header" colspan="2">Education and Certifications</td>
				</tr>
				<tr>
					<td class="AppLabel">Education Level:</td>
					<td class="AppLabel"><input type="radio" id="radio1" name="Education_Level" value="Completed High School">Completed High School<br>
						<input type="radio" id="radio2" name="Education_Level" value="G.E.D.">G.E.D.<br>
						<input type="radio" id="radio2" name="Education_Level" value="Less Than 60 Semester Hours of College">Less Than 60 Semester Hours of College<br>
						<input type="radio" id="radio2" name="Education_Level" value="Less Than 120 Semester Hours of College">Less Than 120 Semester Hours of College<br>
						<input type="radio" id="radio2" name="Education_Level" value="Greater Than 120 Semester Hours of College">Greater Than 120 Semester Hours of College<br>
						<input type="radio" id="radio2" name="Education_Level" value="College Degree">College Degree<br>
						<input type="radio" id="radio2" name="Education_Level" value="Vocational/Trade School">Vocational/Trade School
					</td>				
				</tr>
				<tr>
					<td class="AppLabel">License Types, Numbers and Expiration Dates:</td>
					<td class="AppLabel"><input type="textarea" name="License_Info"></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Firefighter Certifications:</td>
					<td class="AppLabel"><input type="radio" id="radio1" name="Fire_Certs" value="None">None<br>
						<input type="radio" id="radio2" name="Fire_Certs" value="FF1">FF1<br>
						<input type="radio" id="radio2" name="Fire_Certs" value="FF2">FF2
					</td>				
				</tr>
				<tr>
					<td class="AppLabel">Hazardous Materials<br>Certification:</td>
					<td class="AppLabel"><input type="radio" id="radio1" name="HazMat_Certs" value="None">None<br>
						<input type="radio" id="radio2" name="HazMat_Certs" value="Awareness">Awareness<br>
						<input type="radio" id="radio2" name="HazMat_Certs" value="Responder/Operations">Responder/Operations<br>
						<input type="radio" id="radio2" name="HazMat_Certs" value="Technical">Technical<br>
						<input type="radio" id="radio2" name="HazMat_Certs" value="Specialist">Specialist
					</td>				
				</tr>
				<tr>
					<td class="AppLabel">Incident<br> Command System Training:</td>
					<td class="AppLabel"><input type="radio" id="radio1" name="ICS_Training" value="None">None<br>
						<input type="radio" id="radio2" name="ICS_Training" value="Level I">Level I<br>
						<input type="radio" id="radio2" name="ICS_Training" value="Level II">Level II<br>
						<input type="radio" id="radio2" name="ICS_Training" value="Level III">Level III<br>
						<input type="radio" id="radio2" name="ICS_Training" value="Level IV">Level IV
					</td>				
				</tr>
				<tr>
					<td class="AppLabel">Other Pertinent Training:</td>
					<td><textarea rows="4" cols="50" id="textarea1" name="Other_Training"></textarea></td>
				</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="javascript:submitPlus(document.form1, 'Submit');"><img SRC="/images/buttons/Submit.gif" border="0"></a>
			<input type="Hidden" name="Submit">
		</td>
	</tr>
</table>
			</form>

<%	
	end if
%>				   		
<!--#include virtual="/include/templates/bottom.asa"-->
