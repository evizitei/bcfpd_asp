<%Response.ContentType = "application/vnd.ms-excel"%>
<!-- #include virtual="/include/constants/database.asa"-->
<%
	dim rs
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "Select * from VolunteerOpportunities where nid = " & Request.QueryString("nID") 
	set rs = cnnMain.execute(strSQL)
	if Request.QueryString("Document") = "JobDescription" then
		Response.BinaryWrite rs("JobDescription")
	else
		Response.BinaryWrite rs("JobApplication")
	end if
%>