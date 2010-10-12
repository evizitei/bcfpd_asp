Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

	Dim connString As String = ConfigurationManager.ConnectionStrings("strConn").ConnectionString
	Dim dbConn As New SqlConnection(connString)

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Page.IsPostBack Then
			'TODO: Add validation
			'If Me.txtDOB.Text <> "" Then
			'	Dim strDOBFilter As String = Me.txtDOB.Text.Replace("/", "")
			'	Dim strDay As String = strDOBFilter.Substring(0, 2)
			'	Dim strMonth As String = strDOBFilter.Substring(2, 2)
			'	Dim strYear As String = strDOBFilter.Substring(4, 4)
			'	strDOBFilter = strDay & "/" & strMonth & "/" & strYear
			'	Me.txtDOB.Text = strDOBFilter
			'	Me.txtSSN.Focus()
			'End If

			'Dynamically show additional licenses
			If Page.Request.Form("__EVENTTARGET") = "Registrations1$chkAddLicense" Then
				If Me.Registrations1.AddAnotherLicense = True Then
					Me.PanelRegistration2.Visible = True
				Else
					Me.PanelRegistration2.Visible = False
				End If
				Me.chkForeignLanguage.Focus()

			ElseIf Page.Request.Form("__EVENTTARGET") = "Registrations2$chkAddLicense" Then
				If Me.Registrations2.AddAnotherLicense = True Then
					Me.PanelRegistration3.Visible = True
				Else
					Me.PanelRegistration3.Visible = False
				End If
				Me.chkForeignLanguage.Focus()

			ElseIf Page.Request.Form("__EVENTTARGET") = "Registrations3$chkAddLicense" Then
				If Me.Registrations3.AddAnotherLicense = True Then
					Me.PanelRegistration4.Visible = True
				Else
					Me.PanelRegistration4.Visible = False
				End If
				Me.chkForeignLanguage.Focus()

			ElseIf Page.Request.Form("__EVENTTARGET") = "Registrations4$chkAddLicense" Then
				If Me.Registrations4.AddAnotherLicense = True Then
					Me.PanelRegistration5.Visible = True
					Me.Registrations5.AddAnotherLicense = False
				Else
					Me.PanelRegistration5.Visible = False
				End If
				Me.chkForeignLanguage.Focus()

			End If

		Else

			Dim cmdSelect As SqlCommand
			Dim cmdSelectCert As SqlCommand

			Dim dt As SqlDataReader
			Dim dtStates As SqlDataReader
			Dim dtCertifications As SqlDataReader

			Dim PositionID As Integer
			Dim Position As String

			If Request.QueryString("PositionID") = "" Then
				PositionID = 0
			Else
				PositionID = Request.QueryString("PositionID")
			End If

			dbConn.Open()
			cmdSelect = New SqlCommand("bcfpdwebuser.spGetFEMAPosition", dbConn)
			cmdSelect.CommandType = CommandType.StoredProcedure
			cmdSelect.Parameters.Add("@PositionID", SqlDbType.Int).Value = PositionID
			dt = cmdSelect.ExecuteReader()
			dt.Read()
			If dt.HasRows Then
				Position = dt.Item("Position").ToString
			Else
				Position = Request.QueryString("PositionName")
			End If
			Me.lblPosition.Text = Position
			Me.lblPosition2.Text = Position
			dt.Close()
			dbConn.Close()

			'DL States dropdown 
			dbConn.Open()
			cmdSelect = New SqlCommand("bcfpdwebuser.spGetStates", dbConn)
			cmdSelect.CommandType = CommandType.StoredProcedure
			dtStates = cmdSelect.ExecuteReader(CommandBehavior.CloseConnection)
			Me.cboDLNStates.DataSource = dtStates
			Me.cboDLNStates.DataTextField = "StateName"
			Me.cboDLNStates.DataValueField = "StateName"
			Me.cboDLNStates.DataBind()
			dtStates.Close()

			'Certifications listbox
			dbConn.Open()
			cmdSelectCert = New SqlCommand("bcfpdwebuser.spGetFEMASpecificationsForPositions", dbConn)
			cmdSelectCert.CommandType = CommandType.StoredProcedure
			cmdSelectCert.Parameters.Add("@PositionID", SqlDbType.Int).Value = PositionID
			dtCertifications = cmdSelectCert.ExecuteReader(CommandBehavior.CloseConnection)
			Me.lstCertifications.DataSource = dtCertifications
			Me.lstCertifications.DataTextField = "Specification"
			Me.lstCertifications.DataValueField = "nID"
			Me.lstCertifications.DataBind()
			dtCertifications.Close()
			dbConn.Close()

		End If


	End Sub


	Protected Sub Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Submit.Click
		If Me.chkAgree.Checked Then
			Dim dbCmd As New SqlCommand("spInsertMOTF1JoinApplication", dbConn)
			dbCmd.CommandType = Data.CommandType.StoredProcedure

			dbCmd.Parameters.Add(New SqlParameter("@Position", Data.SqlDbType.VarChar, 100)).Value = Me.lblPosition.Text
			dbCmd.Parameters.Add(New SqlParameter("@LastName", Data.SqlDbType.VarChar, 100)).Value = Me.txtLastName.Text
			dbCmd.Parameters.Add(New SqlParameter("@FirstName", Data.SqlDbType.VarChar, 100)).Value = Me.txtFirstName.Text
			dbCmd.Parameters.Add(New SqlParameter("@MiddleName", Data.SqlDbType.VarChar, 100)).Value = Me.txtMiddleName.Text
			dbCmd.Parameters.Add(New SqlParameter("@Address1", Data.SqlDbType.VarChar, 100)).Value = Me.txtAddress1.Text
			dbCmd.Parameters.Add(New SqlParameter("@Address2", Data.SqlDbType.VarChar, 100)).Value = Me.txtAddress2.Text
			dbCmd.Parameters.Add(New SqlParameter("@City", Data.SqlDbType.VarChar, 100)).Value = Me.txtCity.Text
			dbCmd.Parameters.Add(New SqlParameter("@State", Data.SqlDbType.VarChar, 50)).Value = Me.txtState.Text
			dbCmd.Parameters.Add(New SqlParameter("@Zip", Data.SqlDbType.VarChar, 11)).Value = Me.txtZip.Text
			dbCmd.Parameters.Add(New SqlParameter("@PhonePrimary", Data.SqlDbType.VarChar, 50)).Value = Me.txtTelephonePrimary.Text & " (" & Me.cboTelephonePrimaryType.SelectedValue.ToString & ")"

			If Me.txtTelephoneSecondary.Text <> "" Then
				dbCmd.Parameters.Add(New SqlParameter("@PhoneSecondary", Data.SqlDbType.VarChar, 50)).Value = Me.txtTelephoneSecondary.Text & " (" & Me.cboTelephoneSecondaryType.SelectedValue.ToString & ")"
			Else
				dbCmd.Parameters.Add(New SqlParameter("@PhoneSecondary", Data.SqlDbType.VarChar, 50)).Value = ""
			End If

			dbCmd.Parameters.Add(New SqlParameter("@EMail", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmail.Text
			dbCmd.Parameters.Add(New SqlParameter("@DOB", Data.SqlDbType.VarChar, 10)).Value = Me.txtDOB.Text
			dbCmd.Parameters.Add(New SqlParameter("@SSN", Data.SqlDbType.VarChar, 4)).Value = Me.txtSSN.Text
			dbCmd.Parameters.Add(New SqlParameter("@DLN", Data.SqlDbType.VarChar, 50)).Value = Me.txtDLN.Text
			dbCmd.Parameters.Add(New SqlParameter("@DLState", Data.SqlDbType.VarChar, 50)).Value = Me.cboDLNStates.SelectedValue
			dbCmd.Parameters.Add(New SqlParameter("@DLClassification", Data.SqlDbType.VarChar, 50)).Value = GetDLNClassification()
			dbCmd.Parameters.Add(New SqlParameter("@DLExp", Data.SqlDbType.VarChar, 50)).Value = Me.txtDLNExpirationDate.Text
			dbCmd.Parameters.Add(New SqlParameter("@TrafficViolationInfo", Data.SqlDbType.VarChar, 1000)).Value = GetTrafficViolationResponse() & Me.txtTrafficViolationReason.Text
			dbCmd.Parameters.Add(New SqlParameter("@FelonyInfo", Data.SqlDbType.VarChar, 2000)).Value = Me.GetFelonyResponse & Me.txtFelonyReason.Text
			dbCmd.Parameters.Add(New SqlParameter("@CurrentEmployerName", Data.SqlDbType.VarChar, 100)).Value = Me.txtCurrentEmployerName.Text
			dbCmd.Parameters.Add(New SqlParameter("@CurrentEmployerPosition", Data.SqlDbType.VarChar, 300)).Value = Me.txtCurrentEmployerPosition.Text
			dbCmd.Parameters.Add(New SqlParameter("@CurrentEmployerStartDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtCurrentEmployerStartDate.Text
			dbCmd.Parameters.Add(New SqlParameter("@CurrentEmployerContact", Data.SqlDbType.VarChar, 2000)).Value = GetContactCurrentEmployer()
			dbCmd.Parameters.Add(New SqlParameter("@Employer2", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmp2Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer2Position", Data.SqlDbType.VarChar, 300)).Value = Me.txtEmp2Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer2StartDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmp2Start.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer2EndDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmp2End.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer2ReasonLeft", Data.SqlDbType.VarChar, 1000)).Value = Me.txtEmp2ReasonLeave.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer2Contact", Data.SqlDbType.VarChar, 50)).Value = Me.GetContactEmployer2
			dbCmd.Parameters.Add(New SqlParameter("@Employer3", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmp3Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer3Position", Data.SqlDbType.VarChar, 300)).Value = Me.txtEmp3Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer3StartDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmp3Start.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer3EndDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmp3End.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer3ReasonLeft", Data.SqlDbType.VarChar, 1000)).Value = Me.txtEmp3ReasonLeave.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer3Contact", Data.SqlDbType.VarChar, 50)).Value = Me.GetContactEmployer3
			dbCmd.Parameters.Add(New SqlParameter("@Employer4", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmp4Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer4Position", Data.SqlDbType.VarChar, 300)).Value = Me.txtEmp4Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer4StartDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmp4Start.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer4EndDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmp4End.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer4ReasonLeft", Data.SqlDbType.VarChar, 1000)).Value = Me.txtEmp4ReasonLeave.Text
			dbCmd.Parameters.Add(New SqlParameter("@Employer4Contact", Data.SqlDbType.VarChar, 50)).Value = Me.GetContactEmployer4
			dbCmd.Parameters.Add(New SqlParameter("@EmployedOtherNames", Data.SqlDbType.VarChar, 1000)).Value = GetEmployedOtherNamesResponse() & Me.txtEmployedOtherNames.Text
			dbCmd.Parameters.Add(New SqlParameter("@MilitaryBranch", Data.SqlDbType.VarChar, 100)).Value = Me.txtMilitaryBranch.Text
			dbCmd.Parameters.Add(New SqlParameter("@MilitaryDates", Data.SqlDbType.VarChar, 200)).Value = Me.txtMilitaryDatesOfService.Text
			dbCmd.Parameters.Add(New SqlParameter("@DischargeRank", Data.SqlDbType.VarChar, 100)).Value = Me.txtMilitaryDischargeRank.Text
			dbCmd.Parameters.Add(New SqlParameter("@DischargeType", Data.SqlDbType.VarChar, 100)).Value = Me.txtMilitaryDischargeType.Text
			dbCmd.Parameters.Add(New SqlParameter("@DischargeDate", Data.SqlDbType.VarChar, 200)).Value = Me.txtMilitaryDischargeDate.Text
			dbCmd.Parameters.Add(New SqlParameter("@MilitaryDuties", Data.SqlDbType.VarChar, 1000)).Value = Me.txtMilitaryDuties.Text
			dbCmd.Parameters.Add(New SqlParameter("@HighSchoolName", Data.SqlDbType.VarChar, 500)).Value = Me.txtHighSchoolName.Text
			dbCmd.Parameters.Add(New SqlParameter("@HighSchoolLocation", Data.SqlDbType.VarChar, 500)).Value = Me.txtHighSchoolLocation.Text
			dbCmd.Parameters.Add(New SqlParameter("@GraduationGEDDate", Data.SqlDbType.VarChar, 50)).Value = Me.txtHighSchoolGraduationDate.Text
			dbCmd.Parameters.Add(New SqlParameter("@USCitizen", Data.SqlDbType.VarChar, 200)).Value = GetUSCitizenResponse()
			dbCmd.Parameters.Add(New SqlParameter("@College1", Data.SqlDbType.VarChar, 500)).Value = Me.txtCollege1.Text
			dbCmd.Parameters.Add(New SqlParameter("@College1FromMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege1DatesFrom.Text
			dbCmd.Parameters.Add(New SqlParameter("@College1ToMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege1DatesTo.Text
			dbCmd.Parameters.Add(New SqlParameter("@College1Units", Data.SqlDbType.VarChar, 200)).Value = Me.txtCollege1UnitsCompleted.Text
			dbCmd.Parameters.Add(New SqlParameter("@College1Major", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege1Major.Text
			dbCmd.Parameters.Add(New SqlParameter("@College1Degree", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege1Degree.Text
			dbCmd.Parameters.Add(New SqlParameter("@College1DegreeYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege1Year.Text
			dbCmd.Parameters.Add(New SqlParameter("@College2", Data.SqlDbType.VarChar, 500)).Value = Me.txtCollege2.Text
			dbCmd.Parameters.Add(New SqlParameter("@College2FromMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege2DatesFrom.Text
			dbCmd.Parameters.Add(New SqlParameter("@College2ToMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege2DatesTo.Text
			dbCmd.Parameters.Add(New SqlParameter("@College2Units", Data.SqlDbType.VarChar, 200)).Value = Me.txtCollege2UnitsCompleted.Text
			dbCmd.Parameters.Add(New SqlParameter("@College2Major", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege2Major.Text
			dbCmd.Parameters.Add(New SqlParameter("@College2Degree", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege2Degree.Text
			dbCmd.Parameters.Add(New SqlParameter("@College2DegreeYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege2Year.Text
			dbCmd.Parameters.Add(New SqlParameter("@College3", Data.SqlDbType.VarChar, 500)).Value = Me.txtCollege3.Text
			dbCmd.Parameters.Add(New SqlParameter("@College3FromMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege3DatesFrom.Text
			dbCmd.Parameters.Add(New SqlParameter("@College3ToMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege3DatesTo.Text
			dbCmd.Parameters.Add(New SqlParameter("@College3Units", Data.SqlDbType.VarChar, 200)).Value = Me.txtCollege3UnitsCompleted.Text
			dbCmd.Parameters.Add(New SqlParameter("@College3Major", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege3Major.Text
			dbCmd.Parameters.Add(New SqlParameter("@College3Degree", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege3Degree.Text
			dbCmd.Parameters.Add(New SqlParameter("@College3DegreeYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtCollege3Year.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool1", Data.SqlDbType.VarChar, 100)).Value = Me.txtTradeSchool1.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool1Course", Data.SqlDbType.VarChar, 100)).Value = Me.txtTradeSchool1Course.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool1FromMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtTradeSchool1To.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool1ToMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtTradeSchool2From.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool1HoursCompleted", Data.SqlDbType.VarChar, 50)).Value = Me.txtTradeSchool2HoursCompleted.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool2", Data.SqlDbType.VarChar, 100)).Value = Me.txtTradeSchool2.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool2Course", Data.SqlDbType.VarChar, 100)).Value = Me.txtTradeSchool2Course.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool2FromMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtTradeSchool2To.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool2ToMonthYear", Data.SqlDbType.VarChar, 50)).Value = Me.txtTradeSchool2From.Text
			dbCmd.Parameters.Add(New SqlParameter("@TradeSchool2HoursCompleted", Data.SqlDbType.VarChar, 50)).Value = Me.txtTradeSchool2HoursCompleted.Text
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration1", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations1.Registration
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration1Number", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations1.LicenseNumber
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration1IssuedBy", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations1.Issuer
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration1ExpirationDate", Data.SqlDbType.VarChar, 50)).Value = Me.Registrations1.ExpirationDate
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration2", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations2.Registration
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration2Number", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations2.LicenseNumber
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration2IssuedBy", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations2.Issuer
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration2ExpirationDate", Data.SqlDbType.VarChar, 50)).Value = Me.Registrations2.ExpirationDate
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration3", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations3.Registration
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration3Number", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations3.LicenseNumber
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration3IssuedBy", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations3.Issuer
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration3ExpirationDate", Data.SqlDbType.VarChar, 50)).Value = Me.Registrations3.ExpirationDate
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration4", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations4.Registration
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration4Number", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations4.LicenseNumber
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration4IssuedBy", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations4.Issuer
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration4ExpirationDate", Data.SqlDbType.VarChar, 50)).Value = Me.Registrations4.ExpirationDate
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration5", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations5.Registration
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration5Number", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations5.LicenseNumber
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration5IssuedBy", Data.SqlDbType.VarChar, 100)).Value = Me.Registrations5.Issuer
			dbCmd.Parameters.Add(New SqlParameter("@LicenseRegistration5ExpirationDate", Data.SqlDbType.VarChar, 50)).Value = Me.Registrations5.ExpirationDate
			dbCmd.Parameters.Add(New SqlParameter("@ResidencyProgram", Data.SqlDbType.VarChar, 200)).Value = Me.GetResidencyProgramResponse
			dbCmd.Parameters.Add(New SqlParameter("@BCFPDHearAbout", Data.SqlDbType.VarChar, 50)).Value = Me.cboBCFPDHearAbout.SelectedValue
			dbCmd.Parameters.Add(New SqlParameter("@ForeignLanguage", Data.SqlDbType.VarChar, 500)).Value = GetForeignLanguageResponse()
			dbCmd.Parameters.Add(New SqlParameter("@AdditionalSkills", Data.SqlDbType.VarChar, 2000)).Value = Me.txtAdditionalSkills.Text()
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyServices", Data.SqlDbType.VarChar, 50)).Value = Me.GetEmergencyServicesResponse
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService1Name", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService1Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService1Position", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService1Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService1ServiceDates", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService1DatesOfService.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService1City", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmergencyService1City.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService1State", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService1State.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService1Phone", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService1Phone.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService2Name", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService2Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService2Position", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService2Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService2ServiceDates", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService2DatesOfService.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService2City", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmergencyService2City.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService2State", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService2State.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService2Phone", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService2Phone.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService3Name", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService3Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService3Position", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService3Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService3ServiceDates", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService3DatesOfService.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService3City", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmergencyService3City.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService3State", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService3State.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService3Phone", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService3Phone.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService4Name", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService4Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService4Position", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService4Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService4ServiceDates", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService4DatesOfService.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService4City", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmergencyService4City.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService4State", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService4State.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService4Phone", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService4Phone.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService5Name", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService5Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService5Position", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService5Position.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService5ServiceDates", Data.SqlDbType.VarChar, 200)).Value = Me.txtEmergencyService5DatesOfService.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService5City", Data.SqlDbType.VarChar, 100)).Value = Me.txtEmergencyService5City.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService5State", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService5State.Text
			dbCmd.Parameters.Add(New SqlParameter("@EmergencyService5Phone", Data.SqlDbType.VarChar, 50)).Value = Me.txtEmergencyService5Phone.Text
			dbCmd.Parameters.Add(New SqlParameter("@Member1Name", Data.SqlDbType.VarChar, 100)).Value = Me.txtBCFPD1Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@Member1Station", Data.SqlDbType.VarChar, 50)).Value = Me.txtBCFPD1Station.Text
			dbCmd.Parameters.Add(New SqlParameter("@Member2Name", Data.SqlDbType.VarChar, 100)).Value = Me.txtBCFPD2Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@Member2Station", Data.SqlDbType.VarChar, 50)).Value = Me.txtBCFPD2Station.Text
			dbCmd.Parameters.Add(New SqlParameter("@Member3Name", Data.SqlDbType.VarChar, 100)).Value = Me.txtBCFPD3Name.Text
			dbCmd.Parameters.Add(New SqlParameter("@Member3Station", Data.SqlDbType.VarChar, 50)).Value = Me.txtBCFPD3Station.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference1FirstName", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference1FirstName.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference1LastName", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference1LastName.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference1Address", Data.SqlDbType.VarChar, 200)).Value = Me.txtReference1Address.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference1Relationship", Data.SqlDbType.VarChar, 100)).Value = Me.txtReference1Relationship.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference1TelephoneNumber", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference1TelephoneNumber.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference2FirstName", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference2FirstName.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference2LastName", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference2LastName.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference2Address", Data.SqlDbType.VarChar, 200)).Value = Me.txtReference2Address.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference2Relationship", Data.SqlDbType.VarChar, 100)).Value = Me.txtReference2Relationship.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference2TelephoneNumber", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference2TelephoneNumber.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference3FirstName", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference3FirstName.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference3LastName", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference3LastName.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference3Address", Data.SqlDbType.VarChar, 200)).Value = Me.txtReference3Address.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference3Relationship", Data.SqlDbType.VarChar, 100)).Value = Me.txtReference3Relationship.Text
			dbCmd.Parameters.Add(New SqlParameter("@Reference3TelephoneNumber", Data.SqlDbType.VarChar, 50)).Value = Me.txtReference3TelephoneNumber.Text
			dbCmd.Parameters.Add(New SqlParameter("@BecomeFirefighterReason", Data.SqlDbType.VarChar, 4000)).Value = Me.txtReasonBecomeBCFPD.Text

			dbConn.Open()
			Dim ApplicationID As Integer = dbCmd.ExecuteScalar()
			dbConn.Close()

			Me.InsertCertifications(ApplicationID)

			SendEmail()

			Response.Redirect("AppSubmitted.aspx")
		Else
			Me.lblAgreeMessage.Visible = True
			Me.chkAgree.Focus()

		End If

	End Sub

	Protected Sub InsertCertifications(ByVal ApplicationID As Integer)
		Dim dbCmd As New SqlCommand("bcfpdwebuser.spInsertMOTF1ApplicationCertifications", dbConn)
		dbCmd.CommandType = Data.CommandType.StoredProcedure
		dbConn.Open()

		For Counter As Integer = 0 To Me.lstCertifications.Items.Count - 1
			If Me.lstCertifications.Items.Item(Counter).Selected = True Then
				dbCmd.Parameters.Clear()
				dbCmd.Parameters.Add(New SqlParameter("@ApplicationID", Data.SqlDbType.Int)).Value = ApplicationID
				dbCmd.Parameters.Add(New SqlParameter("@Certification", Data.SqlDbType.VarChar, 200)).Value = Me.lstCertifications.Items.Item(Counter).Value
				dbCmd.ExecuteNonQuery()
			End If
		Next

		dbConn.Close()

	End Sub

	Protected Sub SendEmail()
		Dim myJMail As jmail.Message = New jmail.Message

		With myJMail
			.From = "hq@bcfdmo.com"
			.FromName = Me.txtFirstName.Text & " " & Me.txtLastName.Text
			.AddRecipient("hq@bcfdmo.com")
			.Subject = "BCFPD Web Site - BCFPD Join Application"
			.HTMLBody = "A BCFPD Join Application has been submitted." & vbCrLf & vbCrLf & "This information is available on the website at:" & vbCrLf & vbCrLf & "http://www.bcfdmo.com/members_only/index.asp?Login=True" & vbCrLf & vbCrLf & "Received:" & Now() & vbCrLf
			.Silent = False
			.Logging = True
			.Priority = 1

		End With

		Try

			myJMail.Send("server2.bcfdmo.com")
			'myJMail.Send("mail.dot-1.com")

		Catch ex As Exception

		Finally
			myJMail.ClearRecipients()
			myJMail = Nothing

		End Try

	End Sub

	Protected Function GetTrafficViolationResponse() As String
		If Me.chkTrafficViolation.Checked Then
			GetTrafficViolationResponse = "Yes -- "
		Else
			GetTrafficViolationResponse = "No"
		End If
	End Function

	Protected Function GetFelonyResponse() As String
		If Me.chkFelony.Checked Then
			GetFelonyResponse = "Yes -- "
		Else
			GetFelonyResponse = "No"
		End If
	End Function

	Protected Function GetUSCitizenResponse() As String
		If Me.chkUSCitizen.Checked Then
			GetUSCitizenResponse = "Yes"
		Else
			GetUSCitizenResponse = "No--" & Me.txtImmigrationStatus.Text
		End If
	End Function

	Protected Function GetEmployedOtherNamesResponse() As String
		If Me.chkEmployedOtherNames.Checked Then
			GetEmployedOtherNamesResponse = "Yes -- "
		Else
			GetEmployedOtherNamesResponse = "No "
		End If
	End Function

	Protected Function GetForeignLanguageResponse() As String
		If Me.chkForeignLanguage.Checked Then
			GetForeignLanguageResponse = "Yes--" & Me.txtForeignLanguageInfo.Text
		Else
			GetForeignLanguageResponse = "No"
		End If
	End Function

	Protected Function GetResidencyProgramResponse() As String
		If Me.chkResidencyProgram.Checked Then
			GetResidencyProgramResponse = "Yes"
		Else
			GetResidencyProgramResponse = "No"
		End If
	End Function

	Protected Function GetContactCurrentEmployer() As String
		If Me.chkCurrentEmployerContact.Checked Then
			GetContactCurrentEmployer = "Yes"
		Else
			GetContactCurrentEmployer = "No"
		End If
	End Function

	Protected Function GetContactEmployer2() As String
		If Me.chkEmp2Contact.Checked Then
			GetContactEmployer2 = "Yes"
		Else
			GetContactEmployer2 = ""
		End If
	End Function

	Protected Function GetContactEmployer3() As String
		If Me.chkEmp3Contact.Checked Then
			GetContactEmployer3 = "Yes"
		Else
			GetContactEmployer3 = ""
		End If
	End Function

	Protected Function GetContactEmployer4() As String
		If Me.chkEmp4Contact.Checked Then
			GetContactEmployer4 = "Yes"
		Else
			GetContactEmployer4 = ""
		End If
	End Function

	Protected Function GetDLNClassification() As String
		'Classification codes will either come from the list box (If state = Missouri) or the text box (if state <> Missouri)
		Dim strRet As String = ""

		If Me.txtDLNClassification.Text <> "" Then
			strRet = Me.txtDLNClassification.Text

		Else

			For Counter As Integer = 0 To Me.lbDLNClassification.Items.Count - 1
				If Me.lbDLNClassification.Items.Item(Counter).Selected = True Then
					strRet += Me.lbDLNClassification.Items.Item(Counter).Value & ","
				End If
			Next
		End If

		GetDLNClassification = strRet

	End Function

	Protected Function GetEmergencyServicesResponse() As String
		If Me.chkEmergencyServicesOrganization.Checked Then
			GetEmergencyServicesResponse = "Yes"
		Else
			GetEmergencyServicesResponse = "No"
		End If
	End Function


	Protected Sub chkAddEmployer2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAddEmployer2.CheckedChanged
		If Me.chkAddEmployer2.Checked = True Then
			Me.divEmp2Info.Visible = True
			Me.chkAddEmp3.Focus()
		Else
			Me.divEmp2Info.Visible = False
		End If
	End Sub

	Protected Sub chkAddEmp3_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAddEmp3.CheckedChanged
		If Me.chkAddEmp3.Checked = True Then
			Me.divEmp3Info.Visible = True
			Me.chkAddEmp4.Focus()
		Else
			Me.divEmp3Info.Visible = False
		End If
	End Sub

	Protected Sub chkAddEmp4_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAddEmp4.CheckedChanged
		If Me.chkAddEmp4.Checked = True Then
			Me.divEmp4Info.Visible = True
			Me.chkEmp4Contact.Focus()
		Else
			Me.divEmp4Info.Visible = False
		End If
	End Sub

	Protected Sub chkEmergencyServicesOrganization_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkEmergencyServicesOrganization.CheckedChanged
		If Me.chkEmergencyServicesOrganization.Checked = True Then
			Me.divEmergencyServicesInfo.Visible = True
			Me.chkAddEmergencyService2.Focus()
		Else
			Me.divEmergencyServicesInfo.Visible = False
		End If

	End Sub

	Protected Sub chkAddEmergencyService2_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAddEmergencyService2.CheckedChanged
		If Me.chkAddEmergencyService2.Checked = True Then
			Me.divEmergencyServicesInfo2.Visible = True
			Me.chkAddEmergencyService3.Focus()
		Else
			Me.divEmergencyServicesInfo2.Visible = False
		End If

	End Sub

	Protected Sub chkAddEmergencyService3_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAddEmergencyService3.CheckedChanged
		If Me.chkAddEmergencyService3.Checked = True Then
			Me.divEmergencyServicesInfo3.Visible = True
			Me.chkAddEmergencyService4.Focus()
		Else
			Me.divEmergencyServicesInfo3.Visible = False
		End If

	End Sub

	Protected Sub chkAddEmergencyService4_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAddEmergencyService4.CheckedChanged
		If Me.chkAddEmergencyService4.Checked = True Then
			Me.divEmergencyServicesInfo4.Visible = True
			Me.chkAddEmergencyService5.Focus()
		Else
			Me.divEmergencyServicesInfo4.Visible = False
		End If

	End Sub

	Protected Sub chkAddEmergencyService5_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAddEmergencyService5.CheckedChanged
		If Me.chkAddEmergencyService5.Checked = True Then
			Me.divEmergencyServicesInfo5.Visible = True
			Me.txtEmergencyService5Phone.Focus()
		Else
			Me.divEmergencyServicesInfo5.Visible = False
		End If

	End Sub

	Protected Sub cboDLNStates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboDLNStates.SelectedIndexChanged
		If Me.cboDLNStates.SelectedValue = "Missouri" Then
			Me.txtDLNClassification.Visible = False
			Me.lbDLNClassification.Visible = True
		Else
			Me.txtDLNClassification.Visible = True
			Me.lbDLNClassification.Visible = False
		End If
	End Sub

	
	
	
	Protected Sub Registrations1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Registrations1.Load

	End Sub
End Class
