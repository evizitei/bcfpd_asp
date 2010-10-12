<!-- #include virtual="/members_only/include/functions.asa"-->
<%

Dim mySmartUpload
Dim File1, File2, File3, File4

Category_ID = Request.QueryString("Category_ID")

set rsImgCat = Server.CreateObject("ADODB.Recordset")
set rsImage = Server.CreateObject("ADODB.Recordset")

strSQL = "SELECT Name FROM Image_Category WHERE Category_ID = " & Category_ID
rsImgCat.Open strSQL, cnnMain, 0, 1
ImageCatName = rsImgCat("Name")
rsImgCat.Close 

ImgPath = "c:\websites\bcfdmo\images\photo_gallery\images\filmstrip\" 
ImgVirtualPath = "/images/photo_gallery/images/filmstrip/"

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
	
	for Counter = 1 to intCount
		strSQL = "INSERT INTO Image (Image_Category_ID, ThumbnailName, FilmStrip) VALUES (" & Category_ID & ", '" & mySmartUpload.Files.item(Counter).filename & "',1)"
		cnnMain.execute(strSQL)

	next

	for each item in mySmartUpload.Form("Delete")
		rsImage.Open "SELECT ThumbnailName FROM Image WHERE Image_ID = " & item, cnnMain,3,3 
		if not rsImage.EOF then
			fs.DeleteFile(ImgPath & rsImage("ThumbnailName"))	
			rsImage.Delete 
		end if
		rsImage.Close 
	next

		
end if

strSQL = "SELECT * FROM Image WHERE FilmStrip = 1 and Image_Category_ID = " & Category_ID
rsImage.Open strSQL, cnnMain, 0, 1

%>
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->

<table border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">Photo Gallery Images -- <%=ImageCatName%></td>
    </tr>
    <tr>
		<td>
			<form method="POST"  id=form1 name=form1 action="<%=Request.ServerVariables("SCRIPT_NAME")%>?Category_ID=<%=Category_ID%>" ENCTYPE="multipart/form-data">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td></td>
						<td>
							<table border="1" cellpadding="5" cellspacing="0" bordercolor="#f2f2f2">
								<tr>
									<td class="subheadercenter">Delete</td>
									<td class="subheadercenter">Image</td>
								</tr>
						<%	FilmStripCount = 0 
							do while not rsImage.EOF	%>
								<tr>
									<td align="center"><INPUT type="checkbox" id=checkbox1 name="Delete" value="<%=rsImage("Image_ID")%>"></td>
									<td ><IMG src="<%=ImgVirtualPath & rsImage("ThumbnailName")%>" width=100></td>
								</tr>
						<%		rsImage.MoveNext
								FilmStripCount = FilmStripCount + 1
							loop
							rsImage.Close 	%>
						
						<%	
							Do while FilmStripCount < 4 
								FilmStripCount = FilmStripCount + 1 %>
								<tr>
									<td>&nbsp</td>
									<td class="ContactInfo" bordercolor="#f2f2f2">Filmstrip Image <%=FilmStripCount%>:</td>
									<td><input type="file" id="FilmStrip<%=FilmStripCount%>" name="FilmStrip<%=FilmStripCount%>"></td>
								</tr>
						
						<%	loop %>
								<tr>
									<td align="right" colspan="3">
										<a href="javascript:submit(document.form1, 'Add Images');"><img SRC="/images/members/buttons/add.gif" border="0" width="45" height="34"></a>
										<img src="/images/spacer.gif" border="0" height="1" width="35">
										<a href="javascript:submit(document.form1, 'Delete');"><img SRC="/images/members/buttons/Delete.gif" border="0" width="45" height="34"></a>
										<img src="/images/spacer.gif" border="0" height="1" width="35">
										<a style="cursor: hand" OnClick="window.location='/members_only/photo_gallery/images/index.asp';"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
										<input type="hidden" name="Submit">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
