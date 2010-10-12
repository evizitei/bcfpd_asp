<!-- #include virtual="/members_only/include/functions.asa"-->
<%
server.ScriptTimeout = 5000  
If Not Session("Authorized")(17) Then
    Response.Redirect "/members_only/index.asp"
End If

if Request.QueryString("Delete") <> "" then
	cnnMain.execute("Delete from AllCall where nID = " & killChars(Request.QueryString("Delete")))
end if

if Request.ServerVariables("REQUEST_METHOD") = "POST" then
	Dim mySmartUpload
	Dim intCount
	dim rs
	
	Set mySmartUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
	set rs = server.CreateObject("ADODB.Recordset")

	mySmartUpload.Upload
		
	intCount = mySmartUpload.Save(Path)
	'Response.Write mySmartUpload.files.item(1).filename 

	'Response.Write(intCount & " file(s) uploaded.")
	
	rs.Open "AllCall", cnnMain, 3, 3
	rs.AddNew 
	rs("FileName") = mySmartUpload.files.item(1).filename
	rs("AllCallYear") = mySmartUpload.Form("MinutesYear")
	rs("ContentType") = trim(mySmartUpload.files.item(1).ContentType)
	mySmartUpload.Files.item(1).FileToField rs("Document")
	rs.Update 

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
<table width="98%" border="0" cellspacing="0" cellpadding="5" bordercolor="orange">
	<tr>
		<td class="PageTitle">All Call Update</td>
    </tr>
	<tr>
		<td valign="bottom">

	<!-- 8. A form is created that contains a table with update fields.-->
	<form name="form1" method="post" action="index.asp" ENCTYPE="multipart/form-data">
		<!-- 8a. A table is created that contains the requested information.-->
			<table border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td class="ContactInfo">Year:</td>
					<td colspan="2">
						<select size="1" name="MinutesYear">
					<%	for Counter = 2010 to 2005 step -1 %>
							<option value="<%=Counter%>" <%if Counter = year(now) then%> selected <%end if%>><%=Counter%></option>
					<%	next %>
						</select> 
					</td>
				</tr>
				<tr>
					<td class="ContactInfo">Document:</td>
					<td colspan="2"><input type="file" id="Document" name="Document">					</td>
				</tr>
				<tr>
					<td align="right" colspan="3">
						<a href="javascript:document.form1.submit();"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
						<img src="/images/spacer.gif" border="0" height="1" width="35">
						<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
					</td>
				</tr>
			</table>
		</form>

<p>	
	<%set rs = cnnMain.execute("select * from AllCall order by nID Desc")%>
		<table border="1" cellpadding="4" cellspacing="0">
			<tr>
				<td class="subheadercenter">Delete</td>
				<td class="subheadercenter">Year</td>
				<td class="subheader">File Name</td>
			</tr>
			<%	Do while not rs.EOF %>
			<tr>
				<td align="center"><a href="index.asp?Delete=<%=rs("nID")%>">delete</a></td>
				<td class="AppLabel" align="center"><%=rs("AllCallYear")%></td>
				<td class="AppLabel" align="left"><a target="_blank" href="/members_only/all_call_info/<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a></td>
			</tr>
			<% rs.MoveNext
			   Loop
			   rs.Close 
			%>
		</table>
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
