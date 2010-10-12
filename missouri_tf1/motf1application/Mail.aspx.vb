
Partial Class Mail
    Inherits System.Web.UI.Page

	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
		Dim myJMail As jmail.Message = New jmail.Message

		With myJMail
			'.From = "hq@bcfdmo.com"
			.From = "orders@dot-1.com"
			.FromName = "Rick"
			'.AddRecipient("hq@bcfdmo.com")
			.AddRecipient("rick@dot-1.com")
			.Subject = "BCFPD Web Site - BCFPD Join Application"
			.HTMLBody = "A BCFPD Join Application has been submitted." & vbCrLf & vbCrLf & "This information is available on the website at:" & vbCrLf & vbCrLf & "http://www.bcfdmo.com/members_only/index.asp?Login=True" & vbCrLf & vbCrLf & "Received:" & Now() & vbCrLf
			.Silent = False
			.Logging = True
			'.MailServerUserName = "mfahome"
			'.MailServerPassWord = "nucwqac5"
			.Priority = 1

		End With

		Try

			'myJMail.Send("server2.bcfdmo.com")
			myJMail.Send("mail.dot-1.com")

		Catch ex As Exception

		Finally
			myJMail.ClearRecipients()
			myJMail = Nothing

		End Try

	End Sub
End Class
