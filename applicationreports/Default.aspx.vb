Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine

Partial Class _Default
    Inherits System.Web.UI.Page

	Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
		Dim myReport As New ReportDocument
		Dim ReportLocation As String = Server.MapPath("Application.rpt")
		Dim OutputLocation As String = Request.PhysicalApplicationPath
		Dim OutputReport As String
		Dim OutputReportLocation As String
		Dim ReportID As Integer

		If Request.QueryString("nID") <> "" Then
			ReportID = CInt(Request.QueryString("nID"))
		Else
			ReportID = 0
		End If

		OutputReport = "JoinApp" & ReportID & ".pdf"
		OutputReportLocation = OutputLocation & OutputReport

		'myReport.Load("C:\websites\bcfdmo\applicationreports\JoinApplication.rpt")
		myReport.Load(ReportLocation)

		myReport.SetParameterValue("@nID", ReportID)
		myReport.SetParameterValue("@nID", ReportID, "ApplicationCertifications")

        'myReport.SetDatabaseLogon("bcfpdwebuser", "HudvG4QJ", "10.8.0.3", "bcfdmo")
        myReport.SetDatabaseLogon("bcfpdwebuser", "HudvG4QJ", "fh.bcfdmo.com", "bcfdmo")

		'myReport.ExportToDisk(ExportFormatType.PortableDocFormat, "C:\websites\bcfdmo\applicationreports\test.pdf")
		myReport.ExportToDisk(ExportFormatType.PortableDocFormat, OutputReportLocation)
		Response.Redirect(OutputReport)

	End Sub
End Class
