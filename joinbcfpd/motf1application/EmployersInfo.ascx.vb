
Partial Class EmployersInfo
	Inherits System.Web.UI.UserControl

	Private _AdditionalEmployers As Boolean

	Public ReadOnly Property GetEmployerName() As String
		Get
			Return Me.txtEmployerName.Text
		End Get
	End Property

	Public ReadOnly Property GetPosition() As String
		Get
			Return Me.txtPosition.Text
		End Get
	End Property

	Public ReadOnly Property GetStartDate() As String
		Get
			Return Me.txtStartDate.Text
		End Get
	End Property

	Public ReadOnly Property GetEndDate() As String
		Get
			Return Me.txtEndDate.Text
		End Get
	End Property

	Public Property AdditionalEmployers() As Boolean
		Get
			Return _AdditionalEmployers
		End Get

		Set(ByVal value As Boolean)
			_AdditionalEmployers = value

		End Set
	End Property

	Protected Sub chkAdditionalEmployer_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAdditionalEmployer.CheckedChanged
		Me.AdditionalEmployers = Me.chkAdditionalEmployer.Checked

	End Sub
End Class
