<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/perserverence.asa"-->
<!--#include virtual="/include/constants/database.asa"-->
<!--#include virtual="/members_only/include/common_functions.asa"-->
<%
Dim Applicant_ID
Applicant_ID = GetVal("Applicant_ID", "")

' 2. Create a Recordset Object
Set rsApplicant = Server.CreateObject("ADODB.Recordset")


' 4. If there is a request to update the new record, update the new record
If Request.Form("Submit") = "Submit" Then
	rsApplicant.Open "Application_Perserverence", cnnMain,3,3
	rsApplicant.AddNew
		For Each Item in Request.Form
			if trim(Request.Form(Item)) <> "" and Item <> "Submit" then
				rsApplicant(Item) = Request.Form(Item)
			end if 
		Next
		rsApplicant.Update
	rsApplicant.Close
	
' Send e-mail notification to BCFPD 
		Dim servMess
		Dim servBody

		servBody = "A Perseverence Donation Request Application has been submitted."
        
		Set servMess = Server.CreateObject("JMail.SMTPMail")
		
		servMess.ServerAddress = "192.168.222.4"
		servMess.AddRecipient "david-stephens@lanit.com"
		'servMess.AddRecipient "solsen@bcfdmo.com"
		servMess.AddRecipient "hq@bcfdmo.com"

		servMess.Logging = true
		servMess.SenderName = Request.Form("Namereq")
		'servMess.Sender = Request.Form("Email")
		servMess.Subject = "BCFPD Web Site - Perseverance Request Application"

		servMess.Body = servBody
		servMess.Execute

        Set servMess  = Nothing	
End If



%>									
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Perseverance Donation Application</td>
	</tr>	
	<tr>
		<td><font size="1"><strong>Items in bold are required.</strong></font></td>
	</tr>
	<tr>
		<td>
			<form method="post" action="index.asp" id="form1" name="form1" onsubmit="return ValidateApp(document.form1.elements, 'You must enter a ');">
			<table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
				<tr>
					<td class="AppLabel" ><b>Name:</b></td>
					<td><input type="text" name="Namereq" size="50" maxlength="100"></td>
				</tr>	
				<tr>
					<td class="AppLabel">Title:</td>
					<td><input type="text" name="Title" size="50" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel" ><b>Address 1:</b></td>
					<td ><input type="text" name="Address1req" size="50" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel" >Address 2:</td>
					<td ><input type="text" name="Address2" size="50" maxlength="100"></td>
				</tr>

				<tr>
					<td class="AppLabel" ><b>City:</b></td>
					<td ><input type="text" name="Cityreq" size="50" maxlength="100"></td>
				</tr>
				<tr>
					<td class="AppLabel" ><b>State:</b></td>
					<td ><input type="text" name="Statereq" value="MO" size="2" Maxlength="2"></td>
				</tr>
				<tr>
					<td class="AppLabel" ><b>Zip:</b></td>
					<td ><input type="text" name="Zipreq" size="5" maxlength="5"></td>
				</tr>
				</tr>
				<tr>
					<td class="AppLabel" ><b>Day Time Phone:</b></td>
					<td ><input type="text" name="Day_Time_Phonereq" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel" >Night Time Phone:</td>
					<td ><input type="text" name="Night_Time_Phone" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel" >Fax:</td>
					<td ><input type="text" name="Fax" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<td class="AppLabel" >E-mail:</td>
					<td ><input type="text" name="Email" size="50" maxlength="100"></td>
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
	set rsApplicant = Nothing
%>				   		
<!--#include virtual="/include/templates/bottom.asa"-->
