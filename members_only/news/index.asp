<!-- #include virtual="/members_only/include/functions.asa"-->
<!-- #include virtual="/members_only/news/fileupload/upload.asa" -->

<%
If Not Session("Authorized")(7) Then
    Response.Redirect "/members_only/index.asp"
End If

Dim Uploader, File
Set Uploader = New FileUploader

' This starts the upload process
'Uploader.Upload()

dim rsNews
Dim News_Category_ID
Dim Category_Name
dim imgLoc
Dim FileNames(1)
 
Set rsNews = Server.CreateObject("ADODB.Recordset")

if Request.QueryString("News_Category_ID") <> "" then
	News_Category_ID = killChars(Request.QueryString("News_Category_ID"))
end if

Set fs = CreateObject("Scripting.FileSystemObject")
imgPath = "c:\WebSites\bcfdmo\images\news\"
ImgVirtualPath = "/images/news/"

if Request.ServerVariables("REQUEST_METHOD") = "POST" then
	Uploader.Upload()

	If Uploader.Files.Count > 0 Then
		Dim FileCounter
		FileCounter = 0
		For Each File In Uploader.Files.Items
				
			File.SaveToDisk server.MapPath(ImgVirtualPath)
			FileNames(FileCounter) = File.FileName
			FileCounter = FileCounter + 1
		Next	
	else
		FileNames(0) = ""
		FileNames(1) = ""
	end if
	
	If Uploader.Form("Submit") = "Update Story" Then
		strSQL = "spInsertNews " & Uploader.Form("News_Category_ID") & ",'" & killChars(Uploader.Form("Headline")) & "','" & killChars(Uploader.Form("Story")) & "','" & killChars(Uploader.Form("Author")) & "','" & killChars(Uploader.Form("PubDate")) & "','" & killChars(Uploader.Form("ExpDate")) & "','" & FileNames(0) & "', '" & killChars(Uploader.Form("Image1_Caption")) & "','" & FileNames(1) & "', '" & killChars(Uploader.Form("Image2_Caption")) & "'"
		cnnBCFPD.execute(strSQL)
	End If

	If Uploader.Form("Submit") = "Update Existing Story" Then
		strSQL = "spGetNewsImages " & Uploader.Form("Record_ID")
		set rsBCFPD = cnnBCFPD.execute(strSQL)
		
		if rsBCFPD("Image1") <> "" then
			FileNames(0) = rsBCFPD("Image1")	
		end if
		
		if rsBCFPD("Image2") <> "" then
			FileNames(1) = rsBCFPD("Image2")	
		end if

		strSQL = "spUpdateNews " & Uploader.Form("News_Category_ID") & ",'" & killChars(Uploader.Form("Headline")) & "','" & killChars(Uploader.Form("Story")) & "','" & killChars(Uploader.Form("Author")) & "','" & killChars(Uploader.Form("PubDate")) & "','" & killChars(Uploader.Form("ExpDate")) & "','" & FileNames(0) & "', '" & killChars(Uploader.Form("Image1_Caption")) & "','" & FileNames(1) & "', '" & killChars(Uploader.Form("Image2_Caption")) & "'," & Uploader.Form("Record_ID")
		cnnBCFPD.execute(strSQL)
		
	End If
end if

if Request.QueryString("Delete") <> "" then	
	strSQL = "spGetNewsImages " & Request.QueryString("Delete")
	set rsBCFPD = cnnBCFPD.execute(strSQL)
	
	if rsBCFPD("Image1") <> "" then
		fs.DeleteFile(ImgPath & rsBCFPD("Image1"))	
	end if
	
	if rsBCFPD("Image2") <> "" then
		fs.DeleteFile(ImgPath & rsBCFPD("Image2"))	
	end if

	strSQL = "spDeleteNewsArticle " & Request.QueryString("Delete")
	set rsBCFPD = cnnBCFPD.execute(strSQL)
	
end if

if Request.QueryString("DeleteImage") = "Image1" then
	strSQL = "SELECT Image1, Image1_Caption FROM News WHERE News_ID = " & killChars(Request.QueryString("News_Id"))
	rsNews.Open strSQL, cnnBCFPD, 3, 3		
	if rsNews("Image1") <> "" then
		fs.DeleteFile(ImgPath & rsNews("Image1"))	
	end if
	rsNews("Image1") = ""
	rsNews("Image1_Caption") = ""
	rsNews.Update 
	rsNews.Close 
end if

if Request.QueryString("DeleteImage") = "Image2" then
	strSQL = "SELECT Image2, Image2_Caption FROM News WHERE News_ID = " & killChars(Request.QueryString("News_Id"))
	rsNews.Open strSQL, cnnBCFPD, 3, 3
	if rsNews("Image2") <> "" then
		fs.DeleteFile(ImgPath & rsNews("Image2"))	
	end if
	rsNews("Image2") = ""
	rsNews("Image2_Caption") = ""
	rsNews.Update  
	rsNews.Close 
end if

If Request.QueryString("Feature") <> "" then
	rsNews.OPEN "Select * from News where News_Category_ID = " & killChars(News_Category_ID), cnnBCFPD, 3, 3
	Do While Not rsNews.EOF
		if rsNews("Feature") = true then
			rsNews("Feature") = false
			rsNews.Update 
		end if
		rsNews.MoveNext
	loop
	rsNews.Close
	rsNews.Open "Select * from News where News_ID = " & killChars(Request.QueryString("Feature")) & " AND News_Category_ID = " & News_Category_ID, cnnBCFPD, 3, 3
	rsNews("Feature") = true
	rsNews.Update 
	rsNews.Close
End If

strSQL = "bcfpdwebuser.spGetNewsCategories"
set rsBCFPD = cnnBCFPD.execute(strSQL)

Category_Name = rsBCFPD("Name")
%>									
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table width="98%" border="0" cellspacing="0" cellpadding="5" bordercolor="orange">
	<tr>
		<td class="PageTitle"><%=Category_Name%> Update</td>
    </tr>
	<tr>
		<td valign="bottom">
		

<% 
If Uploader.Form("Submit") = "Add Story" OR Request.QueryString("News_Id") <> "" Then
		
	If Uploader.Form("Submit") = "Add Story" Then
		rsNews.Open "News", cnnBCFPD, 3, 3
		rsNews.AddNew
	End If
		   
	If Request.QueryString("News_Id") <> "" Then
		rsNews.Open "SELECT * FROM News WHERE News_Id = " & killChars(Request.QueryString("News_Id")), cnnBCFPD, 3, 3   
	End If

	if rsNews("PubDate") = "" then
		DefaultPubDate = formatdatetime(now(),2)
	else
		DefaultPubDate = rsNews("PubDate")
	end if

	if rsNews("ExpDate") = "" then
		DefaultExpDate = formatdatetime(dateadd("yyyy", 1, now()),2)
	else
		DefaultExpDate = rsNews("ExpDate")
	end if

%>
	<!-- 8. A form is created that contains a table with update fields.-->
	<form method="POST" id="form1" name="form1" action="<%=Request.ServerVariables("SCRIPT_NAME")%>?News_Category_ID=<%=News_Category_ID%>" ENCTYPE="multipart/form-data">
		<!-- 8a. A table is created that contains the requested information.-->
			<table border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td class="ContactInfo">Category:</td>
					<td>
						<SELECT id=News_Category_ID name=News_Category_ID>							<OPTION value=1 <%if rsNews("News_Category_ID") = 1 then %> selected <%end if %>>BCFPD News</OPTION>
							<OPTION value=6 <%if rsNews("News_Category_ID") = 6 then %> selected <%end if %> >Emergency Preparedness</OPTION>
							<OPTION value=5 <%if rsNews("News_Category_ID") = 5 then %> selected <%end if %>>Hot Topic</OPTION>
							<OPTION value=2 <%if rsNews("News_Category_ID") = 2 then %> selected <%end if %>>MO-TF1 News</OPTION>
							<OPTION value=3 <%if rsNews("News_Category_ID") = 3 then %> selected <%end if %>>Wildland News</OPTION>
						</SELECT>					
					</td>
				</tr>	
				<tr>
					<td class="ContactInfo">Headline:</td>
					<td><input maxlength=255 type="text" name="Headline" size="40" value="<%=rsNews("Headline")%>"></td>
				</tr>	
				<tr>
					<td class="ContactInfo">Story:</td>
					<td><textarea cols="60" rows="20" name="Story"><%=rsNews("Story")%></textarea></td>
				</tr>
				<tr>
					<td class="ContactInfo">Author:</td>
					<td><input maxlength=255 type="text" name="Author" value="<%=rsNews("Author")%>"></td>
				</tr>
				<tr>
					<td class="ContactInfo">Publication Date:</td>
					<td><input maxlength=10 type="text" name="PubDate" value="<%=DefaultPubDate%>"></td>
				</tr>
				<tr>
					<td class="ContactInfo">Expiration Date:</td>
					<td><input maxlength=10 type="text" name="ExpDate" value="<%=DefaultExpDate%>"></td>
				</tr>
				<tr>
					<td class="ContactInfo">Image 1:</td>
				<%	if rsNews("Image1") <> "" then %>
					<td><img width=100 src="/images/news/<%=rsNews("Image1")%>">&nbsp;<a href="index.asp?DeleteImage=Image1&News_Id=<%=Request.QueryString("News_Id")%>&News_Category_ID=<%=News_Category_ID%>">Delete Image</a></td>
				<%	else %>
					<td><input type="file" id="Image1" name="Image1"></td>
				<%	end if %>
				</tr>
				<tr>
					<td class="ContactInfo">Image 1 Caption:</td>
					<td><input maxlength=500 type="text" size="40" name="Image1_Caption" value="<%=rsNews("Image1_Caption")%>" maxlength="500"></td>
				</tr>
				<tr>
					<td class="ContactInfo">Image 2:</td>
				<%	if rsNews("Image2") <> "" then %>
					<td><img width=100 src="/images/news/<%=rsNews("Image2")%>">&nbsp;<a href="index.asp?DeleteImage=Image2&News_Id=<%=Request.QueryString("News_Id")%>&News_Category_ID=<%=News_Category_ID%>">Delete Image</a></td>
				<%	else %>
					<td><input type="file" id="Image2" name="Image2"></td>
				<%	end if %>
				</tr>
				<tr>
					<td class="ContactInfo">Image 2 Caption:</td>
					<td><input maxlength=500 type="text" size="40" name="Image2_Caption" value="<%=rsNews("Image2_Caption")%>" maxlength="500"></td>
				</tr>
				
				
				<tr>
					<td align="right" colspan="2">
					<!-- 8b. If Then Else statement to check if updating new record or existing.-->
						<% If Request.QueryString("News_Id") <> "" Then %>
							<a href="javascript:submit(document.form1, 'Update Existing Story');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
							<input type="Hidden" name="Submit">
							<input type="hidden" name="Record_ID" value="<%=rsNews("News_Id")%>">
							<img src="/images/spacer.gif" border="0" height="1" width="35">
							<a style="cursor: hand" href="/members_only/news/index.asp"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
						<% Else %>
							<a href="javascript:submit(document.form1, 'Update Story');"><img SRC="/images/members/buttons/Save.gif" border="0"></a>
							<img src="/images/spacer.gif" border="0" height="1" width="35">
							<a style="cursor: hand" href="/members_only/news/index.asp"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
							<input type="Hidden" name="Submit">
						<% End If %>
					</td>
				</tr>
			</table>
		</form>
<% Else 
	
	strSQL = "bcfpdwebuser.spGetNews"
	set rsNews = cnnBCFPD.execute(strSQL)
	%>
	<form method="post" action="index.asp?News_Category_ID=<%=Request.QueryString("News_Category_ID")%>" id="form2" name="form2" ENCTYPE="multipart/form-data">
	<!-- 10. A table is created that will contain a delete check box, Headline links, and date info.-->
		<table border="0" cellpadding="4" cellspacing="0">
			<tr>
				<td class="subheadercenter">&nbsp;</td>
				<td class="subheadercenter">Featured</td>
				<td class="subheadercenter">Category</td>
				<td class="subheadercenter">Headline</td>
				<td class="subheadercenter">Publication Date</td>
				<td class="subheadercenter">Expiration Date</td>
			<!--	<td>Change Order</td> -->
			</tr>
			<!-- 11. Do While Loop to populate the table with database information.-->
			<%	if rsNews.RecordCount = 1 then
					rsNews("Feature") = true
				end if
				Do while not rsNews.EOF %>
			<tr>
				<td align="center"><a href="index.asp?Delete=<%=rsNews("News_ID")%>">delete</a></td>
				<td align="center"><%if rsNews("Feature") then%><img SRC="/images/members/buttons/checkmarkRED.gif"><%else%><a href="index.asp?Feature=<%=rsNews("News_ID")%>&amp;News_Category_ID=<%=rsNews("News_Category_ID")%>"><img SRC="/images/members/buttons/checkmarkBlack.gif" border="0"></a><%end if%></td>
                <td class="AppLabel" align="center"><%=rsNews("Name")%></td>
				<td><a href="index.asp?News_Id=<%=rsNews("News_Id")%>&amp;News_Category_ID=<%=rsNews("News_Category_ID")%>"><%=rsNews("Headline")%></a></td>
				<td class="AppLabel" align="center"><%=rsNews("PubDate")%></td>
				<td class="AppLabel" align="center"><%=rsNews("ExpDate")%></td>
			</tr>
			<% rsNews.MoveNext
			   Loop
			%>
			<tr>
				<td align="right" colspan="6">
					<a href="javascript:submit(document.form2, 'Add Story');"><img SRC="/images/members/buttons/add.gif" border="0"></a>
					<img src="/images/spacer.gif" border="0" height="1" width="35">
					<a href="javascript:Delete();"><img SRC="/images/members/buttons/Delete.gif" border="0"></a>
					<img src="/images/spacer.gif" border="0" height="1" width="35">
					<a style="cursor: hand" OnClick="window.location.href='/members_only/';"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
					<input type="hidden" name="Submit">
				</td>
			</tr>
		</table>
	</form>

<% End If 
   rsBCFPD.Close
   
   set rsNews = Nothing	
   set rsBCFPD = nothing
%>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
