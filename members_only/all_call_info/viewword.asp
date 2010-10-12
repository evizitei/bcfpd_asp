<%
    if len(Request.Servervariables("Query_String")) > 40 then
        response.clear
        response.write "Invalid page access"
        response.end
    end if 
%>

<%Response.ContentType = "application/msword"%>
<!-- #include virtual="/members_only/include/constants/database.asa"-->
<%
	dim rs
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "Select * from AllCall where nid = " & Request.QueryString("nID") 
	set rs = cnnBCFPD.execute(strSQL)
	Response.BinaryWrite rs("Document")
%>