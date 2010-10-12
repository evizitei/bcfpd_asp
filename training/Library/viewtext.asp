<%Response.ContentType = "text/HTML"%>
<!-- #include virtual="/include/constants/database.asa"-->
<%
	dim rs
	dim RecordID
	RecordID = Request.QueryString("nID")
	
	if isnumeric(RecordID) then
	    strSQL = "bcfpdwebuser.spGetLibraryTrainingFilesByID " & RecordID
	    set rs = cnnMain.execute(strSQL)
	    Response.BinaryWrite rs("DocumentFile")
	end if
%>