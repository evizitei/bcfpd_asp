<%Response.ContentType = "application/pdf"%>
<!-- #include virtual="/include/constants/database.asa"-->
<%
	dim rs
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "[bcfpdwebuser].[spGetBudgetByID] " & Request.QueryString("nID") 
	set rs = cnnMain.execute(strSQL)
	Response.BinaryWrite rs("Document")
%>