Imports System.Data
Imports System.Data.SqlClient

Partial Class Registrations
	Inherits System.Web.UI.UserControl

	Public ReadOnly Property Registration() As String
		Get
			Registration = Me.txtRegistration.Text
		End Get
	End Property

	Public ReadOnly Property LicenseNumber() As String
		Get
			LicenseNumber = Me.txtLicenseNumber.Text
		End Get
	End Property

	Public ReadOnly Property ExpirationDate() As String
		Get
			ExpirationDate = Me.txtExpDate.Text
		End Get
	End Property

	Public ReadOnly Property Issuer() As String
		Get
			Issuer = Me.txtIssuer.Text
		End Get
	End Property

	Public Property AddAnotherLicense() As Boolean
		Get
			If Me.chkAddLicense.Checked = True Then
				AddAnotherLicense = True
			Else
				AddAnotherLicense = False
			End If
		End Get

		Set(ByVal value As Boolean)
			If value = False Then
				Me.chkAddLicense.Visible = False
			End If
		End Set

	End Property

End Class
