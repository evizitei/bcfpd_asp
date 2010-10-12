<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/join.asa"-->
<!--#include virtual="/members_only/include/common_functions.asa"-->
<!--#include virtual="/members_only/include/functions.asa"-->


<%

' 4. If there is a request to update the new record, update the new record
If Request.Form("SubmitForm") = "True" Then
	Set rsApplicant = Server.CreateObject("ADODB.Recordset")
	set conn = server.CreateObject("ADODB.Connection")	
	set objDict = server.CreateObject("Scripting.Dictionary")

	objdict.Add "LastName", killChars(request.Form("LastName"))
	objdict.Add "FirstName", killChars(request.Form("FirstName"))
	objdict.Add "MiddleInitial", killChars(request.Form("MiddleInitial"))
	objdict.Add "Address1", killChars(request.Form("Address1"))
	objdict.Add "Address2", killChars(request.Form("Address2"))
	objdict.Add "City", killChars(request.Form("City"))
	objdict.Add "State", killChars(request.Form("State"))
	objdict.Add "Zip", killChars(request.Form("Zip"))
	objdict.Add "PhonePrimary", killChars(request.Form("PhonePrimary"))
	objdict.Add "PhoneSecondary", killChars(request.Form("PhoneSecondary"))
	objdict.Add "Email", killChars(request.Form("Email"))
	objdict.Add "WorkContact", killChars(request.Form("WorkContact"))
	objdict.Add "DOB", killChars(request.Form("DOB"))
	objdict.Add "SSN", killChars(request.Form("SSN"))
	objdict.Add "EmployedOtherNames", killChars(request.Form("EmployedOtherNames"))
	objdict.Add "EmployedOtherNamesList", killChars(request.Form("EmployedOtherNamesList"))
	objdict.Add "DLN", killChars(request.Form("DLN"))
	objdict.Add "DL_State", killChars(request.Form("DL_State"))
	objdict.Add "DL_Exp", killChars(request.Form("DL_Exp"))
	objdict.Add "FelonyConviction", killChars(request.Form("FelonyConviction"))
	objdict.Add "FelonyInfo", killChars(request.Form("FelonyInfo"))
	objdict.Add "TrafficViolation", killChars(request.Form("TrafficViolation"))
	objdict.Add "TrafficViolationInfo", killChars(request.Form("TrafficViolationInfo"))
	objdict.Add "Employer1", killChars(request.Form("Employer1"))
	objdict.Add "Emp1Position", killChars(request.Form("Emp1Position"))
	objdict.Add "Emp1StartDate", killChars(request.Form("Emp1StartDate"))
	objdict.Add "Emp1EndDate", killChars(request.Form("Emp1EndDate"))
	objdict.Add "Emp1ReasonLeave", killChars(request.Form("Emp1ReasonLeave"))
	objdict.Add "Employer2", killChars(request.Form("Employer2"))
	objdict.Add "Emp2Position", killChars(request.Form("Emp2Position"))
	objdict.Add "Emp2StartDate", killChars(request.Form("Emp2StartDate"))
	objdict.Add "Emp2EndDate", killChars(request.Form("Emp2EndDate"))
	objdict.Add "Emp2ReasonLeave", killChars(request.Form("Emp2ReasonLeave"))
	objdict.Add "Employer3", killChars(request.Form("Employer3"))
	objdict.Add "Emp3Position", killChars(request.Form("Emp3Position"))
	objdict.Add "Emp3StartDate", killChars(request.Form("Emp3StartDate"))
	objdict.Add "Emp3EndDate", killChars(request.Form("Emp3EndDate"))
	objdict.Add "Emp3ReasonLeave", killChars(request.Form("Emp3ReasonLeave"))
	objdict.Add "MilitaryBranch", killChars(request.Form("MilitaryBranch"))
	objdict.Add "DischargeRank", killChars(request.Form("DischargeRank"))
	objdict.Add "MilitaryDates", killChars(request.Form("MilitaryDates"))
	objdict.Add "DischargeDate", killChars(request.Form("DischargeDate"))
	objdict.Add "Duties", killChars(request.Form("Duties"))
	objdict.Add "HighSchool", killChars(request.Form("HighSchool"))
	objdict.Add "GraduationGEDDate", killChars(request.Form("GraduationGEDDate"))
	objdict.Add "College1", killChars(request.Form("College1"))
	objdict.Add "College1FromMonthYear", killChars(request.Form("College1FromMonthYear"))
	objdict.Add "College1ToMonthYear", killChars(request.Form("College1ToMonthYear"))
	objdict.Add "College1Units", killChars(request.Form("College1Units"))
	objdict.Add "College1Major", killChars(request.Form("College1Major"))
	objdict.Add "College1Degree", killChars(request.Form("College1Degree"))
	objdict.Add "College1DegreeYear", killChars(request.Form("College1DegreeYear"))
	objdict.Add "College2", killChars(request.Form("College2"))
	objdict.Add "College2FromMonthYear", killChars(request.Form("College2FromMonthYear"))
	objdict.Add "College2ToMonthYear", killChars(request.Form("College2ToMonthYear"))
	objdict.Add "College2Units", killChars(request.Form("College2Units"))
	objdict.Add "College2Major", killChars(request.Form("College2Major"))
	objdict.Add "College2Degree", killChars(request.Form("College2Degree"))
	objdict.Add "College2DegreeYear", killChars(request.Form("College2DegreeYear"))
	objdict.Add "College3", killChars(request.Form("College3"))
	objdict.Add "College3FromMonthYear", killChars(request.Form("College3FromMonthYear"))
	objdict.Add "College3ToMonthYear", killChars(request.Form("College3ToMonthYear"))
	objdict.Add "College3Units", killChars(request.Form("College3Units"))
	objdict.Add "College3Major", killChars(request.Form("College3Major"))
	objdict.Add "College3Degree", killChars(request.Form("College3Degree"))
	objdict.Add "College3DegreeYear", killChars(request.Form("College3DegreeYear"))
	objdict.Add "TradeSchool1", killChars(request.Form("TradeSchool1"))
	objdict.Add "TradeSchool1Course", killChars(request.Form("TradeSchool1Course"))
	objdict.Add "TradeSchool1FromMonthYear", killChars(request.Form("TradeSchool1FromMonthYear"))
	objdict.Add "TradeSchool1ToMonthYear", killChars(request.Form("TradeSchool1ToMonthYear"))
	objdict.Add "TradeSchool1HoursCompleted", killChars(request.Form("TradeSchool1HoursCompleted"))
	objdict.Add "TradeSchool2", killChars(request.Form("TradeSchool2"))
	objdict.Add "TradeSchool2Course", killChars(request.Form("TradeSchool2Course"))
	objdict.Add "TradeSchool2FromMonthYear", killChars(request.Form("TradeSchool2FromMonthYear"))
	objdict.Add "TradeSchool2ToMonthYear", killChars(request.Form("TradeSchool2ToMonthYear"))
	objdict.Add "TradeSchool2HoursCompleted", killChars(request.Form("TradeSchool2HoursCompleted"))
	objdict.Add "License1", killChars(request.Form("License1"))
	objdict.Add "License1Number", killChars(request.Form("License1Number"))
	objdict.Add "License1IssuedBy", killChars(request.Form("License1IssuedBy"))
	objdict.Add "License1ExpirationDate", killChars(request.Form("License1ExpirationDate"))
	objdict.Add "License2", killChars(request.Form("License2"))
	objdict.Add "License2Number", killChars(request.Form("License2Number"))
	objdict.Add "License2IssuedBy", killChars(request.Form("License2IssuedBy"))
	objdict.Add "License2ExpirationDate", killChars(request.Form("License2ExpirationDate"))
	objdict.Add "License3", killChars(request.Form("License3"))
	objdict.Add "License3Number", killChars(request.Form("License3Number"))
	objdict.Add "License3IssuedBy", killChars(request.Form("License3IssuedBy"))
	objdict.Add "License3ExpirationDate", killChars(request.Form("License3ExpirationDate"))
	objdict.Add "AdditionalSkills", killChars(request.Form("AdditionalSkills"))
	objdict.Add "ResidencyProgram", killChars(request.Form("ResidencyProgram"))
	objdict.Add "FireDistrict", killChars(request.Form("FireDistrict"))
	objdict.Add "FireDistrictInfo", killChars(request.Form("FireDistrictInfo"))
	objdict.Add "Member1Name", killChars(request.Form("Member1Name"))
	objdict.Add "Member1Station", killChars(request.Form("Member1Station"))
	objdict.Add "Member2Name", killChars(request.Form("Member2Name"))
	objdict.Add "Member2Station", killChars(request.Form("Member2Station"))
	objdict.Add "Member3Name", killChars(request.Form("Member3Name"))
	objdict.Add "Member3Station", killChars(request.Form("Member3Station"))
	objdict.Add "Member4Name", killChars(request.Form("Member4Name"))
	objdict.Add "Member4Station", killChars(request.Form("Member4Station"))
	objdict.Add "ContactEmployer", killChars(request.Form("ContactEmployer"))
	objdict.Add "ContactEmployerReason", killChars(request.Form("ContactEmployerReason"))
	objdict.Add "Reference1Name", killChars(request.Form("Reference1Name"))
	objdict.Add "Reference1Address", killChars(request.Form("Reference1Address"))
	objdict.Add "Reference1Occupation", killChars(request.Form("Reference1Occupation"))
	objdict.Add "Reference2Name", killChars(request.Form("Reference2Name"))
	objdict.Add "Reference2Address", killChars(request.Form("Reference2Address"))
	objdict.Add "Reference2Occupation", killChars(request.Form("Reference2Occupation"))
	objdict.Add "Reference3Name", killChars(request.Form("Reference3Name"))
	objdict.Add "Reference3Address", killChars(request.Form("Reference3Address"))
	objdict.Add "Reference3Occupation", killChars(request.Form("Reference3Occupation"))
	objdict.Add "BecomeFirefighterReason", killChars(request.Form("BecomeFirefighterReason"))
	
	for each key in objdict.keys 
		objdict.item(key) = replace(objdict(key), "'", "''")
		'response.Write key & ": " & objdict(key)  & "<br>"
	next

	strSQLVals = "'" & objdict.Item("LastName") & "','" 
	strSQLVals = strSQLVals &  objdict.Item("FirstName") & "','"
	strSQLVals = strSQLVals &  objdict.Item("MiddleInitial")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Address1")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Address2")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("City")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("State")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Zip")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("PhonePrimary")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("PhoneSecondary")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Email")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("WorkContact")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("DOB")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("SSN")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("EmployedOtherNames")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("EmployedOtherNamesList")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("DLN")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("DL_State")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("DL_Exp")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("FelonyConviction")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("FelonyInfo")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TrafficViolation")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TrafficViolationInfo")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Employer1")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp1Position")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp1StartDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp1EndDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp1ReasonLeave")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Employer2")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp2Position")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp2StartDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp2EndDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp2ReasonLeave")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Employer3")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp3Position")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp3StartDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp3EndDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Emp3ReasonLeave")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("MilitaryBranch")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("DischargeRank")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("MilitaryDates")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("DischargeDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Duties")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("HighSchool")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("GraduationGEDDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College1")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College1FromMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College1ToMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College1Units")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College1Major")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College1Degree")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College1DegreeYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College2")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College2FromMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College2ToMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College2Units")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College2Major")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College2Degree")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College2DegreeYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College3")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College3FromMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College3ToMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College3Units")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College3Major")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College3Degree")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("College3DegreeYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool1")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool1Course")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool1FromMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool1ToMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool1HoursCompleted")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool2")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool2Course")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool2FromMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool2ToMonthYear")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("TradeSchool2HoursCompleted")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License1")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License1Number")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License1IssuedBy")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License1ExpirationDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License2")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License2Number")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License2IssuedBy")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License2ExpirationDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License3")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License3Number")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License3IssuedBy")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("License3ExpirationDate")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("AdditionalSkills")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("ResidencyProgram")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("FireDistrict")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("FireDistrictInfo")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member1Name")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member1Station")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member2Name")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member2Station")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member3Name")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member3Station")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member4Name")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Member4Station")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("ContactEmployer")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("ContactEmployerReason")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference1Name")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference1Address")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference1Occupation")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference2Name")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference2Address")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference2Occupation")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference3Name")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference3Address")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("Reference3Occupation")  & "','"
	strSQLVals = strSQLVals &  objdict.Item("BecomeFirefighterReason")  & "'"

	'response.Write strSQLVals & "<br>"
	
	cnnMain.Execute("spInsertJoinApplication" & strSQLVals)
	
	' Send e-mail notification to BCFPD 
	Dim servMess
	Dim servBody

	servBody = "A BCFPD Join Application has been submitted." & vbCrLf & vbCrLf & "This information is available on the website at:" & vbCrLf & vbCrLf & "http://www.bcfdmo.com/members_only/index.asp?Login=True" & vbCrLf & vbCrLf & "Received:" & now() & vbCrLf
      
	Set servMess = Server.CreateObject("JMail.Message")
	
	servMess.AddRecipient "rstephens@bcfdmo.com"
	'servMess.AddRecipient "hq@bcfdmo.com"
	
	servMess.Logging = true
	servMess.FromName = Request.Form("FirstName") & " " & Request.form("LastName")
	servMess.From = "hq@bcfdmo.com"
	servMess.Subject = "BCFPD Web Site - BCFPD Join Application"

	servMess.Body = servBody
	
	servMess.Send("server2.bcfdmo.com")
	'servMess.Send("fh.bcfdmo.com")
	'servMess.Send("216.251.32.73")
	'servMess.Send("mail.dot-1.com")
	'servMess.Send("10.1.0.3")

        Set servMess  = Nothing	

%>

		<table cellpadding="5" cellspacing="0" border="0" width="98%">
			<tr>
				<td class="PageTitle">BCFPD Join Application</td>
			</tr>	
			<tr>
				<td class="Content"><%=objdict.Item("FirstName")%>, thank you for submitting an application to join our organization.
			</tr>
		</table>
<%else%>
<script language="JavaScript">
	function ValidateJoinApp(){
		if(document.form1.LastName.value == '') {
			alert('You must enter your Last Name.');
			document.form1.LastName.focus();
			return void(0);
		}
		if(document.form1.FirstName.value == '') {
			alert('You must enter your First Name.');
			document.form1.FirstName.focus();
			return void(0);
		}
		if(document.form1.MiddleInitial.value == '') {
			alert('You must enter your Middle Initial.');
			document.form1.MiddleInitial.focus();
			return void(0);
		}
		if(document.form1.Address1.value == '') {
			alert('You must enter your Home Address.');
			document.form1.Address1.focus();
			return void(0);
		}
		if(document.form1.City.value == '') {
			alert('You must enter your City.');
			document.form1.City.focus();
			return void(0);
		}
		if(document.form1.State.value == '') {
			alert('You must enter your State.');
			document.form1.State.focus();
			return void(0);
		}
		if(document.form1.Zip.value == '') {
			alert('You must enter your Zip Code.');
			document.form1.Zip.focus();
			return void(0);
		}
		if(document.form1.PhonePrimary.value == '') {
			alert('You must enter your Telephone number.');
			document.form1.PhonePrimary.focus();
			return void(0);
		}
		if((document.form1.WorkContactYes.checked == false && document.form1.WorkContactNo.checked == false)) {
			alert('You must select whether or not we can contact you at work.');
			document.form1.WorkContactYes.focus();
			return void(0);
		}
		if(document.form1.DOB.value == '') {
			alert('You must enter your Date of Birth.');
			document.form1.DOB.focus();
			return void(0);
		}
		if((document.form1.EmployedOtherNamesYes.checked == false && document.form1.EmployedOtherNamesNo.checked == false)) {
			alert('You must select whether or not you have been employed under other names.');
			document.form1.EmployedOtherNamesYes.focus();
			return void(0);
		}
		if((document.form1.EmployedOtherNamesYes.checked == true && document.form1.EmployedOtherNamesList.innerText == '')) {
			alert('You must list the names that you have been employed under.');
			document.form1.EmployedOtherNamesList.focus();
			return void(0);
		}
		if(document.form1.DLN.value == '') {
			alert('You must enter your Driver\'s License Number.');
			document.form1.DLN.focus();
			return void(0);
		}
		if(document.form1.DL_State.value == '') {
			alert('You must enter your Driver\'s License State.');
			document.form1.DL_State.focus();
			return void(0);
		}
		if(document.form1.DL_Exp.value == '') {
			alert('You must enter your Driver\'s License Expiration.');
			document.form1.DL_Exp.focus();
			return void(0);
		}
		if((document.form1.FelonyConvictionYes.checked == false && document.form1.FelonyConvictionNo.checked == false)) {
			alert('You must select whether or not you have been convicted of a felony.');
			document.form1.FelonyConvictionYes.focus();
			return void(0);
		}
		if((document.form1.TrafficViolationYes.checked == false && document.form1.TrafficViolationNo.checked == false)) {
			alert('You must select whether or not you have received a traffic violation.');
			document.form1.TrafficViolationYes.focus();
			return void(0);
		}
		if(document.form1.Employer1.value == '') {
			alert('You must enter the Employer Name.');
			document.form1.Employer1.focus();
			return void(0);
		}
		if(document.form1.Emp1Position.value == '') {
			alert('You must enter the Employment Position.');
			document.form1.Emp1Position.focus();
			return void(0);
		}
		if(document.form1.Emp1StartDate.value == '') {
			alert('You must enter the Employment Position Start Date.');
			document.form1.Emp1StartDate.focus();
			return void(0);
		}
		if(document.form1.Emp1EndDate.value == '') {
			alert('You must enter the Employment Position End Date.');
			document.form1.Emp1EndDate.focus();
			return void(0);
		}
		if(document.form1.Emp1ReasonLeave.innerText == '') {
			alert('You must enter the Reason for Leaving the position.');
			document.form1.Emp1ReasonLeave.focus();
			return void(0);
		}
		if(document.form1.HighSchool.innerText == '') {
			alert('You must enter the High School Name and Location.');
			document.form1.HighSchool.focus();
			return void(0);
		}
		if(document.form1.GraduationGEDDate.value == '') {
			alert('You must enter the Graduation/GED Date.');
			document.form1.GraduationGEDDate.focus();
			return void(0);
		}
		if((document.form1.ResidencyProgramYes.checked == false && document.form1.ResidencyProgramNo.checked == false)) {
			alert('You must select whether or not you would be interested in the Residency Program.');
			document.form1.ResidencyProgramYes.focus();
			return void(0);
		}
		if((document.form1.FireDistrictYes.checked == false && document.form1.FireDistrictNo.checked == false)) {
			alert('You must select whether or not you have ever served on a fire district/department.');
			document.form1.FireDistrictYes.focus();
			return void(0);
		}
		if((document.form1.ContactEmployerYes.checked == false && document.form1.ContactEmployerNo.checked == false)) {
			alert('You must select whether or not you have any objections to us contacting your present employer.');
			document.form1.ContactEmployerYes.focus();
			return void(0);
		}
		if(document.form1.Reference1Name.value == '') {
			alert('You must enter the name of the first Reference.');
			document.form1.Reference1Name.focus();
			return void(0);
		}
		if(document.form1.Reference1Address.innerText == '') {
			alert('You must enter the address of the first Reference.');
			document.form1.Reference1Address.focus();
			return void(0);
		}
		if(document.form1.Reference1Occupation.value == '') {
			alert('You must enter the occupation of the first Reference.');
			document.form1.Reference1Occupation.focus();
			return void(0);
		}
		if(document.form1.Reference2Name.value == '') {
			alert('You must enter the name of the second Reference.');
			document.form1.Reference2Name.focus();
			return void(0);
		}
		if(document.form1.Reference2Address.innerText == '') {
			alert('You must enter the address of the second Reference.');
			document.form1.Reference2Address.focus();
			return void(0);
		}
		if(document.form1.Reference2Occupation.value == '') {
			alert('You must enter the occupation of the second Reference.');
			document.form1.Reference2Occupation.focus();
			return void(0);
		}
		if(document.form1.Reference3Name.value == '') {
			alert('You must enter the name of the third Reference.');
			document.form1.Reference3Name.focus();
			return void(0);
		}
		if(document.form1.Reference3Address.innerText == '') {
			alert('You must enter the address of the third Reference.');
			document.form1.Reference3Address.focus();
			return void(0);
		}
		if(document.form1.Reference3Occupation.value == '') {
			alert('You must enter the occupation of the third Reference.');
			document.form1.Reference3Occupation.focus();
			return void(0);
		}
		if(document.form1.BecomeFirefighterReason.innerText == '') {
			alert('You must enter the reason why you want to become a firefighter.');
			document.form1.BecomeFirefighterReason.focus();
			return void(0);
		}
		if(document.form1.InfoTrue.checked == false) {
			alert('You must place a checkmark in the checkbox to indicate that the above information is true.');
			document.form1.InfoTrue.focus();
			return void(0);
		}
		document.form1.SubmitForm.value = "True";
		document.form1.submit();
	}

/*	
	function ActivateEmployedOtherNames() {
		if(form1.EmployedOtherNamesYes.checked == true) {
			document.getElementById('EmployedOtherNamesList').disabled = false;
			document.getElementById('EmployedOtherNamesList').style.backgroundColor = 'White';
	}
		else {
			document.getElementById('EmployedOtherNamesList').disabled = true;
			document.getElementById('EmployedOtherNamesList').style.backgroundColor = 'Whitesmoke';
			document.getElementById('EmployedOtherNamesList').innerText = '';
		}	
	}

	function ActivateFelonyInfo() {
		if(form1.FelonyConvictionYes.checked == true) {
			document.getElementById('FelonyInfo').disabled = false;
			document.getElementById('FelonyInfo').style.backgroundColor = 'White';
	}
		else {
			document.getElementById('FelonyInfo').disabled = true;
			document.getElementById('FelonyInfo').style.backgroundColor = 'Whitesmoke';
			document.getElementById('FelonyInfo').innerText = '';
		}	
	}

	function ActivateTrafficViolationInfo() {
		if(form1.TrafficViolationYes.checked == true) {
			document.getElementById('TrafficViolationInfo').disabled = false;
			document.getElementById('TrafficViolationInfo').style.backgroundColor = 'White';
	}
		else {
			document.getElementById('TrafficViolationInfo').disabled = true;
			document.getElementById('TrafficViolationInfo').style.backgroundColor = 'Whitesmoke';
			document.getElementById('TrafficViolationInfo').innerText = '';
		}	
	}
*/
</script>
<form method="post" action="join.asp" id="form1" name="form1">
<input type=hidden name="SubmitForm" id="SubmitForm" value="" />
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">BCFPD Join Application</td>
	</tr>	
	<tr>
		<td><font size="1"><strong>Items in bold are required.</strong></font></td>
	</tr>
	<tr>
		<td>
		      <table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
				<tr>
					<td class="Header" colspan="2">Personal Information</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Last Name:</b></td>
					<td><input type="text" name="LastName" id="LastName" size="30" maxlength="100"></td>
				</tr>	
				<tr>
					<td class="AppLabel"><b>First Name:</b></td>
					<td><input type="text" name="FirstName" size="30" maxlength="100"></td>
				</tr>	
				<tr>
					<td class="AppLabel"><b>Middle Initial:</b></td>
					<td><input type="text" name="MiddleInitial" size="30" maxlength="100"></td>
				</tr>	
			<!--
				<tr>
					<td class="AppLabel">Social Security Number:</td>
					<td><input type="text" name="SSN" size="20" maxlength="11"></td>
				</tr>
			-->
				<tr>
					<td class="AppLabel"><b>Home Address 1:</b></td>
					<td><input type="text" name="Address1" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Home Address 2:</td>
					<td><input type="text" name="Address2" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>City:</b></td>
					<td class="AppLabel"><input type="text" name="City" size="30" maxlength="100">
					&nbsp;&nbsp;&nbsp;<b>State:</b>
					&nbsp;&nbsp;&nbsp;<input type="text" name="State" value="MO" size="2" Maxlength="2">
					&nbsp;&nbsp;&nbsp;<b>Zip:</b>
					&nbsp;&nbsp;&nbsp;<input type="text" name="Zip" size="5" maxlength="5">
					</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Telephone: (Primary)</b></td>
					<td><input type="text" name="PhonePrimary" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel">Telephone: (Secondary)</td>
					<td><input type="text" name="PhoneSecondary" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel">E-mail:</td>
					<td><input type="text" name="Email" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>May we contact you at work?</b></td>
					<td class="AppLabel">
						<input type="radio" id="WorkContactYes" name="WorkContact" value="Yes">Yes<br>
						<input type="radio" id="WorkContactNo" name="WorkContact" value="No">No<br>
					</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Date of Birth:</b></td>
					<td><input type="text" name="DOB" size="30" maxlength="DOB"></td>
				</tr>
				<tr>
					<td class="AppLabel" valign=top ><b>Have you been employed under other names?</b></td>
					<td> 
						<table cellpadding=0 cellspacing=0 border=0>
							<tr>
								<td class="AppLabel">
									<input type="radio" id="EmployedOtherNamesYes" name="EmployedOtherNames" value="Yes" OnClick="ActivateEmployedOtherNames();">Yes<br>
									<input type="radio" id="EmployedOtherNamesNo" name="EmployedOtherNames" value="No" OnClick="ActivateEmployedOtherNames();">No<br>									
								</td>
							</tr>
							<tr>
								<td><font size="1">List name(s)</font><br />
								<textarea  style="background-color: WhiteSmoke;" rows="4" cols="50" id="EmployedOtherNamesList" name="EmployedOtherNamesList"></textarea></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Driver's License Number:</b></td>
					<td class="AppLabel"><input type="text" name="DLN" size="20" maxlength="11">
					&nbsp;&nbsp;&nbsp;<b>State:</b> 
					&nbsp;&nbsp;&nbsp;<input type="text" name="DL_State" size="2" maxlength="2">
					&nbsp;&nbsp;&nbsp;<b>Date of Expiration:</b> 
					&nbsp;&nbsp;&nbsp;<input type="text" name="DL_Exp" size="10" maxlength="25"></td>
				</tr>
				<tr>
					<td class="AppLabel" valign=top ><b>Have you even been convicted of a felony?</b></td>
					<td> 
						<table cellpadding=0 cellspacing=0 border=0 width=575>
							<tr>
								<td class="AppLabel">
									<input type="radio" id="FelonyConvictionYes" name="FelonyConviction" value="Yes" OnClick="ActivateFelonyInfo();">Yes<br>
									<input type="radio" id="FelonyConvictionNo" name="FelonyConviction" value="No" OnClick="ActivateFelonyInfo();">No<br>
								</td>
							</tr>
							<tr>
								<td><font size=1>Give details in space below showing (1)Date; (2)Charge; (3)Place; (4)Court; and (5)Action taken; NOTE: Convictions or discharges do not neccessarily disqualify you from employment. Each case will be considered fairly on its merits and after full consideration of the applicant's views.</font></td>
							</tr>
							<tr>
								<td><textarea style="background-color: WhiteSmoke;" rows="4" cols="50" id="FelonyInfo" name="FelonyInfo"></textarea></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="AppLabel" valign=top><b>Have you even received a traffic violation?</b></td>
					<td> 
						<table cellpadding=0 cellspacing=0 border=0>
							<tr>
								<td class="AppLabel">
									<input type="radio" id="TrafficViolationYes" name="TrafficViolation" value="Yes" OnClick="ActivateTrafficViolationInfo();">Yes<br>
									<input type="radio" id="TrafficViolationNo" name="TrafficViolation" value="No" OnClick="ActivateTrafficViolationInfo();">No<br>
								</td>
							</tr>
							<tr>
								<td><font size=1>If Yes, explain.</font></td>
							</tr>
							<tr>
								<td><textarea  style="background-color: WhiteSmoke;" rows="4" cols="50" id="TrafficViolationInfo" name="TrafficViolationInfo"></textarea></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="header" colspan="2">Employment History</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Name of Employer:</b></td>
					<td><input type="text" name="Employer1" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Position:</b></td>
					<td><input type="text" name="Emp1Position" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Start Date:</b></td>
					<td><input type="text" name="Emp1StartDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>End Date:</b></td>
					<td><input type="text" name="Emp1EndDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Reason for leaving:</b></td>
					<td><textarea name=Emp1ReasonLeave id=Emp1ReasonLeave></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Name of Employer:</td>
					<td><input type="text" name="Employer2" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Position:</td>
					<td><input type="text" name="Emp2Position" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Start Date:</td>
					<td><input type="text" name="Emp2StartDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">End Date:</td>
					<td><input type="text" name="Emp2EndDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Reason for leaving:</td>
					<td><textarea name=Emp2ReasonLeave id=Emp2ReasonLeave></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Name of Employer:</td>
					<td><input type="text" name="Employer3" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Position:</td>
					<td><input type="text" name="Emp3Position" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Start Date:</td>
					<td><input type="text" name="Emp3StartDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">End Date:</td>
					<td><input type="text" name="Emp3EndDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Reason for leaving:</td>
					<td><textarea name=Emp3ReasonLeave id=Emp3ReasonLeave></textarea></td>
				</tr>
				<tr>
					<td class="header" colspan="2">Military</td>
				</tr>
				<tr>
					<td class="AppLabel">Branch:</td>
					<td><input type="text" name="MilitaryBranch" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Rank at Discharge:</td>
					<td><input type="text" name="DischargeRank" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Dates (Mo/Yr):</td>
					<td><textarea name=MilitaryDates id=MilitaryDates></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Discharge Date:</td>
					<td><input type="text" name="DischargeDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Duties/Special Training:</td>
					<td><textarea name=Duties id=Duties></textarea></td>
				</tr>
				<tr>
					<td class="header" colspan="2">High School</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Name and Location of School:</b><br />(including City & State):</td>
					<td><textarea name=HighSchool id=HighSchool></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Date Graduated/GED</b>:</td>
					<td><input type="text" name="GraduationGEDDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="header" colspan="2">College/University</td>
				</tr>
				<tr>
					<td class="AppLabel">College/University:<br />Attended/Location</td>
					<td><textarea name=College1 id=College1></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">From Mo/Yr:</td>
					<td><input type="text" name="College1FromMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">To Mo/Yr:</td>
					<td><input type="text" name="College1ToMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Units Completed:<br />Sem. Qtr.</td>
					<td><textarea name=College1Units id=College1Units></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Major:</td>
					<td><input type="text" name="College1Major" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Degree:</td>
					<td><input type="text" name="College1Degree" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Year:</td>
					<td><input type="text" name="College1DegreeYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">College/University:<br />Attended/Location</td>
					<td><textarea name=College2 id=College2></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">From Mo/Yr:</td>
					<td><input type="text" name="College2FromMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">To Mo/Yr:</td>
					<td><input type="text" name="College2ToMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Units Completed:<br />Sem. Qtr.</td>
					<td><textarea name=College2Units id=College2Units></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Major:</td>
					<td><input type="text" name="College2Major" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Degree:</td>
					<td><input type="text" name="College2Degree" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Year:</td>
					<td><input type="text" name="College2DegreeYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">College/University:<br />Attended/Location</td>
					<td><textarea name=College3 id=College3></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">From Mo/Yr:</td>
					<td><input type="text" name="College3FromMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">To Mo/Yr:</td>
					<td><input type="text" name="College3ToMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Units Completed:<br />Sem. Qtr.</td>
					<td><textarea name=College3Units id=College3Units></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Major:</td>
					<td><input type="text" name="College3Major" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Degree:</td>
					<td><input type="text" name="College3Degree" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Year:</td>
					<td><input type="text" name="College3DegreeYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="header" colspan="2">Special Training</td>
				</tr>
				<tr>
					<td class="AppLabel">Institution-Business:<br />Trade School</td>
					<td><textarea name=TradeSchool1 id=TradeSchool1></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Course:</td>
					<td><input type="text" name="TradeSchool1Course" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">From Mo/Yr:</td>
					<td><input type="text" name="TradeSchool1FromMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">To Mo/Yr:</td>
					<td><input type="text" name="TradeSchool1ToMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Hours Completed:</td>
					<td><input type="text" name="TradeSchool1HoursCompleted" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Institution-Business:<br />Trade School</td>
					<td><textarea name=TradeSchool2 id=TradeSchool2></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">Course:</td>
					<td><input type="text" name="TradeSchool2Course" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">From Mo/Yr:</td>
					<td><input type="text" name="TradeSchool2FromMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">To Mo/Yr:</td>
					<td><input type="text" name="TradeSchool2ToMonthYear" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Hours Completed:</td>
					<td><input type="text" name="TradeSchool2HoursCompleted" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="header" colspan="2">Skills & Certifications:</td>
				</tr>
				<tr>
					<td class="AppLabel" colspan=2>List all valid professional licenses and registrations you hold</td>
				</tr>
				<tr>
					<td class="AppLabel">License/Certificaions:</td>
					<td><textarea name=License1 id=License1></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">License Number:</td>
					<td><input type="text" name="License1Number" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Issued By:</td>
					<td><input type="text" name="License1IssuedBy" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Expiration Date:</td>
					<td><input type="text" name="License1ExpirationDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">License/Certificaions:</td>
					<td><textarea name=License2 id=License2></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">License Number:</td>
					<td><input type="text" name="License2Number" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Issued By:</td>
					<td><input type="text" name="License2IssuedBy" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Expiration Date:</td>
					<td><input type="text" name="License2ExpirationDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">License/Certificaions:</td>
					<td><textarea name=License3 id=License3></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel">License Number:</td>
					<td><input type="text" name="License3Number" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Issued By:</td>
					<td><input type="text" name="License3IssuedBy" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Expiration Date:</td>
					<td><input type="text" name="License3ExpirationDate" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Additional skills, special training or related courses. Include any other information relevant to your employment application.</td>
					<td><textarea name=AdditionalSkills id=AdditionalSkills></textarea></td>
				</tr>
				<tr>
					<td class="header" colspan="2">Miscellaneous Fire District Information:</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Would you be interested in the Residency Program?</b></td>
					<td class="AppLabel">
						<input type="radio" id="ResidencyProgramYes" name="ResidencyProgram" value="Yes">Yes<br>
						<input type="radio" id="ResidencyProgramNo" name="ResidencyProgram" value="No">No<br>
					</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Have you ever served on a fire district/department?</b></td>
					<td class="AppLabel">
						<input type="radio" id="FireDistrictYes" name="FireDistrict" value="Yes">Yes<br>
						<input type="radio" id="FireDistrictNo" name="FireDistrict" value="No">No<br>
					</td>
				</tr>
				<tr>
					<td class="AppLabel">If yes, list district/department (Name, City/State, Phone).</td>
					<td><textarea name=FireDistrictInfo id=FireDistrictInfo></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel" colspan=2>List the names of any firefighters that you know that are currently on or have been a member of this department:</td>
				</tr>
				<tr>
					<td class="AppLabel">Name:</td>
					<td><input type="text" name="Member1Name" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Station:</td>
					<td><input type="text" name="Member1Station" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Name:</td>
					<td><input type="text" name="Member2Name" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Station:</td>
					<td><input type="text" name="Member2Station" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Name:</td>
					<td><input type="text" name="Member3Name" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Station:</td>
					<td><input type="text" name="Member3Station" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Name:</td>
					<td><input type="text" name="Member4Name" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel">Station:</td>
					<td><input type="text" name="Member4Station" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="header" colspan="2">References:</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>you have any objections to our contacting your present employer?</b></td>
					<td class="AppLabel">
						<input type="radio" id="ContactEmployerYes" name="ContactEmployer" value="Yes">Yes<br>
						<input type="radio" id="ContactEmployerNo" name="ContactEmployer" value="No">No<br>
					</td>
				</tr>
				<tr>
					<td class="AppLabel">If yes, please state the reason.</td>
					<td><textarea name=ContactEmployerReason id=ContactEmployerReason></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel" colspan=2>REFERENCE. List four persons who are NOT related to you and who have definite knowledge of your qualificatoins and fitness for the position for which you are applying. Do not repeat names of supervisors listed under Work Experience.</td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Full Name:</b></td>
					<td><input type="text" name="Reference1Name" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Present Business or Home address</b><br />(Number, Street, City, State, and Zip)</td>
					<td><textarea name=Reference1Address id=Reference1Address></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Business/Occupation:</b></td>
					<td><input type="text" name="Reference1Occupation" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Full Name:</b></td>
					<td><input type="text" name="Reference2Name" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Present Business or Home address</b><br />(Number, Street, City, State, and Zip)</td>
					<td><textarea name=Reference2Address id=Reference2Address></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Business/Occupation:</b></td>
					<td><input type="text" name="Reference2Occupation" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Full Name:</b></td>
					<td><input type="text" name="Reference3Name" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Present Business or Home address</b><br />(Number, Street, City, State, and Zip)</td>
					<td><textarea name=Reference3Address id=Reference3Address></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Business/Occupation:</b></td>
					<td><input type="text" name="Reference3Occupation" size="30" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel" colspan=2><b>Why do you want to become a firefighter for the Boone County Fire Protection District.</b><br />must be handwritten with a minimum of 1 paragraph.</td>
				</tr>
				<tr>
					<td colspan=2><textarea name=BecomeFirefighterReason id=BecomeFirefighterReason cols=75 rows=20></textarea></td>
				</tr>
				<tr>
					<td class="AppLabel" colspan=2><b>PLEASE READ CAREFULLY AND CHECK THE BOX BELOW.</b> The above information is true and complete, and I understand that any false information or omissions will be grounds for a refusal to hire me, or immediate discharge if hired. The Boone County Fire Protection District may review my previous employment, driving and criminal records, and other background data as it may relate to the positions(s) for which I am applying.</td>
				</tr>
				<tr>
					<td class="AppLabel" colspan=2><input id="InfoTrue" name="InfoTrue" type="checkbox" />&nbsp;<b>I Agree:</b></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="javascript:ValidateJoinApp();"><img SRC="/images/buttons/Submit.gif" border="0"></a>
			<input type="Hidden" name="Submit">
		</td>
	</tr>
</table>
</form>

<%	End If %>									

	   		
<!--#include virtual="/include/templates/bottom.asa"-->
