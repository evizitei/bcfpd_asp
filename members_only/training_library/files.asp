<!-- #include virtual="/members_only/include/functions.asa"-->
<!--#include virtual="/include/fileupload/upload.asa"-->

<%
Server.ScriptTimeout = 10000
If Not Session("Authorized")(20) Then
   Response.Redirect "/update/"
End If

Category_ID = request.QueryString("Category_ID")

if Request.QueryString("Delete") <> "" then
	cnnMain.execute("Delete from Training_Library_File where nID = " & Request.QueryString("Delete"))
end if

if Request.ServerVariables("REQUEST_METHOD") = "POST" then
    Dim Uploader, File
    Set Uploader = New FileUploader
	dim rs

    Uploader.Upload()

    If Uploader.Files.Count = 0 Then
	    Response.Write "File(s) not uploaded."
	    'response.End 
    Else
    	For Each File In Uploader.Files.Items
		
	        Set rs = Server.CreateObject("ADODB.Recordset")
	        rs.Open "Training_Library_File", cnnMain, 3, 3
	        rs.AddNew 

	        RS("Category_ID") = Category_ID
	        RS("FileName") = File.FileName
	        RS("FileType") = File.ContentType
	        RS("FileSize") = File.Filesize

	        File.SaveToDatabase rs("DocumentFile")
    		
	        RS.Update
	        RS.Close
        		
	        ' Output the file details to the browser
	        'Response.Write "File Uploaded: " & File.FileName & "<br>"
	        'Response.Write "Size: " & File.FileSize & " bytes<br>"
	        'Response.Write "Type: " & File.ContentType & "<br><br>"
	    next
    End If
	
end if

function GetPageByContent(ContentType)

	select case ContentType
		
		case "application/msword"
			
			GetPageByContent = "viewword"
		
		case "application/pdf"
			
			GetPageByContent = "viewpdf"

		case "application/vnd.ms-excel"
			
			GetPageByContent = "viewexcel"

		case "text/plain"
			
			GetPageByContent = "viewtext"

		case else
			
			GetPageByContent = "viewtext"
	
	end select
	
end function


								
%>
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<form id="form1" name="form1" action="files.asp?Category_ID=<%=Category_ID%>" method="post" enctype="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">Training Opportunities Library</td>
    </tr>
    <tr>
		<td>
		    <table border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td class="ContactInfo">File</td>
                    <td><input id="DocumentFile" name="DocumentFile" type="file" /></td>
                </tr>
                <tr>
                    <td colspan=2 align=center>
                        <table border=0 cellpadding=0 cellspacing=0 width=100%>
                            <tr>
                                <td align=center><a href="javascript:document.form1.submit();"><img border=0 src="/images/members/buttons/add.gif" /></a></td>
                                <td align=center ><a href="index.asp"><img border=0 src="/images/members/buttons/cancel.gif" /></a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
		</td>        
	</tr>
</table>
</form>
<p>	
<%set rs = cnnMain.execute("select * from Training_Library_File WHERE Category_ID = " & Category_ID & " order by FileName")%>
<table border="1" cellpadding="4" cellspacing="0">
	<tr>
		<td class="subheadercenter">Delete</td>
		<td class="subheader">File Name</td>
	</tr>
	<%	Do while not rs.EOF %>
	<tr>
		<td align="center"><a href="files.asp?Category_ID=<%=Category_ID%>&Delete=<%=rs("nID")%>">delete</a></td>
		<td align="left"><a target="_blank" href="/training/library/<%=GetPageByContent(rs("FileType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a></td>
	</tr>
	<% rs.MoveNext
	   Loop
	   rs.Close 
	%>
</table>

<!--#include virtual="/members_only/include/templates/bottom.asa"-->


