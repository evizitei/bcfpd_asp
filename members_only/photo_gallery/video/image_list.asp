<!-- #include virtual="/members_only/include/functions.asa"-->
<%
Dim mySmartUpload

set rsVideoCat = Server.CreateObject("ADODB.Recordset")
set rsVideo = Server.CreateObject("ADODB.Recordset")

Category_ID = Request.QueryString("Category_ID")

strSQL = "SELECT Name FROM Video_Category WHERE Category_ID = " & Category_ID
rsVideoCat.Open strSQL, cnnMain, 0, 1
VideoCatName = rsVideoCat("Name")
rsVideoCat.Close 

ImgPath = "c:\websites\bcfdmo\images\photo_gallery\video" 
ImgVirtualPath = "/images/photo_gallery/video/"

Set fs = CreateObject("Scripting.FileSystemObject")
Set f = fs.GetFolder(ImgPath & "\")
Set fc = f.Files

If Not fs.FolderExists(ImgPath) Then
   fs.CreateFolder ImgPath
End If

if Request.ServerVariables("REQUEST_METHOD") = "POST" then
	Set mySmartUpload = Server.CreateObject("aspSmartUpload.SmartUpload")
	mySmartUpload.Upload
	intCount = mySmartUpload.Save(server.mappath(ImgVirtualPath))
	
	if intCount > 0 then
		strSQL = "INSERT INTO Video (Video_Category_ID, Name, Description) VALUES (" & Category_ID & ", '" & mySmartUpload.Files.item(1).filename & "', '" & mySmartUpload.Form("Description") & "')"
		cnnMain.execute(strSQL)
	end if
	
	for each item in mySmartUpload.Form("Delete")
		rsVideo.Open "SELECT Name FROM Video WHERE Video_ID = " & item, cnnMain,3,3 
		if not rsVideo.EOF then
			fs.DeleteFile(ImgPath & "\" & rsVideo("Name"))	
			rsVideo.Delete 
		end if
		rsVideo.Close 
	next
		
end if

strSQL = "SELECT * FROM Video WHERE Video_Category_ID = " & Category_ID
rsVideo.Open strSQL, cnnMain, 0, 1

%>

<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->

<table border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">Photo Gallery Videos -- <%=VideoCatName%></td>
    </tr>
    <tr>
		<td>
			<form method="POST"  id=form1 name=form1 action="<%=Request.ServerVariables("SCRIPT_NAME")%>?Category_ID=<%=Category_ID%>" ENCTYPE="multipart/form-data">
				<table border="0" cellpadding="0" cellspacing="0">
				<%if not rsVideo.EOF then%>
					<tr>
						<td class="PageTitle">Current videos:</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<table border="1" cellpadding="5" cellspacing="0" bordercolor="#f2f2f2">
								<tr>
									<td class="subheadercenter">Delete</td>
									<td class="subheadercenter">Video</td>
									<td  class="subheadercenter">View</td>
								</tr>
						<%	do while not rsVideo.EOF %>
								<tr>
									<td align="center"><INPUT type="checkbox" id=checkbox1 name="Delete" value="<%=rsVideo("Video_ID")%>"></td>
									<td ><font size="1"><%=rsVideo("Name")%></font></td>
									<td align="center"><a class="Update" target="_blank" href="/images/photo_gallery/video/<%=rsVideo("Name")%>">View Video</a></td>
								</tr>
						<%		rsVideo.MoveNext
							loop
							rsVideo.Close 	%>
							</table>
						</td>
					</tr>
				<%end if%>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td class="PageTitle">Add new video:</td>
					</tr>
					<tr>
						<td>
							<table border="1" cellpadding="5" cellspacing="0" bordercolor="#f2f2f2">
								<tr>
									<td class="ContactInfo">Description:</td>
									<td colspan=3><TEXTAREA rows=2 cols=25 id="Description" name="Description"></TEXTAREA></td>
								</tr>
								<tr>
									<td class="ContactInfo">Video:</td>
									<td colspan=3><input type="file" id="ImageFile" name="ImageFile"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td align="right">
						<!--	<a href="javascript:submit(document.form1, 'Add Images');"><img SRC="/images/members/buttons/add.gif" border="0" width="45" height="34"></a> -->
							<a href="javascript:VerifyFileSelected(document.form1);"><img SRC="/images/members/buttons/add.gif" border="0" width="45" height="34"></a>
							<img src="/images/spacer.gif" border="0" height="1" width="35">
							<a href="javascript:submit(document.form1, 'Delete');"><img SRC="/images/members/buttons/Delete.gif" border="0" width="45" height="34"></a>
							<img src="/images/spacer.gif" border="0" height="1" width="35">
							<a style="cursor: hand" OnClick="window.location='/members_only/photo_gallery/video/index.asp';"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
							<input type="hidden" name="Submit">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->

