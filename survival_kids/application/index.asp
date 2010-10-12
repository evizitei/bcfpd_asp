<!--#include virtual="/include/templates/sk_top.asa"-->
<!--#include virtual="/include/constants/database.asa"-->
<!--#include virtual="/members_only/include/common_functions.asa"-->
<%
Dim Applicant_ID
Applicant_ID = GetVal("Applicant_ID", "")

' 2. Create a Recordset Object
Set rsApplicant = Server.CreateObject("ADODB.Recordset")


' 4. If there is a request to update the new record, update the new record
If Request.Form("Submit") = "Submit" Then
	rsApplicant.Open "Application_SK", cnnMain,3,3
	rsApplicant.AddNew
		For Each Item in Request.Form
			if trim(Request.Form(Item)) <> "" and Item <> "Submit" then
				rsApplicant(Item) = Request.Form(Item)
			End If
		Next
		rsApplicant.Update
	rsApplicant.Close

' Send e-mail notification to BCFPD 
		Dim servMess
		Dim servBody

		servBody = "A Request for Additional Survival Kids Information has been submitted."
        
		Set servMess = Server.CreateObject("JMail.Message")
		
		servMess.AddRecipient "rstephens@bcfdmo.com"
		servMess.Logging = true
		servMess.FromName = Request.Form("Namereq")
		servMess.From = Request.Form("Email")
		servMess.Subject = "BCFPD Web Site - Survival Kids Additional Info Request Application"

		servMess.Body = servBody
		servMess.Send("server2.bcfdmo.com")


        Set servMess  = Nothing	
End If



%>
<table cellpadding="5" cellspacing="0" border="0" width="98%" ID="Table1">
	<tr>
		<td class="PageTitle">Survival Kids Information Request Application</td>
	</tr>	
	<tr>
		<td><font size="1"><strong>Items in bold are required.</strong></font></td>
	</tr>
	<tr>
		<td>
			<form method="post" action="index.asp" id="form1" name="form1" onsubmit="return ValidateApp(document.form1.elements, 'You must enter a ');">
			  <table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2" ID="Table2">
				<tr>
					<td class="AppLabel"><b>Name:</b></td>
					<td><input type="text" name="Namereq" size="50" maxlength="100" ID="Text1"></td>
				</tr>	
				<tr>
					<td class="AppLabel">Title:</td>
					<td><input type="text" name="Title" size="50" maxlength="100" ID="Text2"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Address 1:</b></td>
					<td><input type="text" name="Address1req" size="50" maxlength="100" ID="Text3"></td>
				</tr>
				<tr>
					<td class="AppLabel">Address 2:</td>
					<td><input type="text" name="Address2" size="50" maxlength="100" ID="Text4"></td>
				</tr>

				<tr>
					<td class="AppLabel"><b>City:</b></td>
					<td><input type="text" name="Cityreq" size="50" maxlength="100" ID="Text5"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>State:</b></td>
					<td><input type="text" name="Statereq" value="MO" size="2" Maxlength="2" ID="Text6"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Zip:</b></td>
					<td><input type="text" name="Zipreq" size="5" maxlength="5" ID="Text7"></td>
				</tr>
				</tr>
				<tr>
					<td class="AppLabel"><b>Day Time Phone:</b></td>
					<td><input type="text" name="Day_Phonereq" size="15" maxlength="15" ID="Text8"></td>
				</tr>
				<tr>
					<td class="AppLabel">Home Phone:</td>
					<td><input type="text" name="Night_Time_Phone" size="15" maxlength="15" ID="Text9"></td>
				</tr>
				<tr>
					<td class="AppLabel">Fax:</td>
					<td><input type="text" name="Fax" size="15" maxlength="15" ID="Text10"></td>
				</tr>
				<tr>
					<td class="AppLabel">E-mail:</td>
					<td><input type="text" name="Email" size="50" maxlength="100" ID="Text11"></td>
				</tr>
				<tr>
					<td class="AppLabel"><b>Your Department <br>or School Name:</b></td>
					<td><input type="text" name="DeptNamereq" size="50" maxlength="100" ID="Text12"></td>
				</tr>
				<tr>
					<td class="AppLabel">Fire Chief Name <font size="1">(if applicable)</font></td>
					<td><input type="text" name="FireChief" size="50" maxlength="100" ID="Text13"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<a href="javascript:submitPlus(document.form1, 'Submit');"><img SRC="/images/buttons/Submit.gif" border="0"></a>
			<input type="Hidden" name="Submit" ID="Hidden1">
		</td>
	</tr>

	<tr>
		<td class="Content">To Contact us for more information....<br>
					573-447-5000<br>
					khines@bcfdmo.com
		</td>
	</tr>
</table>
			</form>

<%	
	set rsApplicant = Nothing
%>				   		
<!--#include virtual="/include/templates/sk_bottom.asa"-->
