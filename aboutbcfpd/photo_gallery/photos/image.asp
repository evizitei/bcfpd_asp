<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<!-- #include virtual="/include/constants/database.asa"-->
<!-- #include virtual="/include/common_functions.asa"-->

<%
Category_ID = GetVal("Category_ID", "")

Dim NumberOfFiles
Dim DefaultImage
dim DefaultDescription

set rsGallery = Server.CreateObject("ADODB.Recordset")
rsGallery.Open "SELECT * FROM Image where FilmStrip = 0 and Image_Category_ID = " & Category_ID & " ORDER BY ThumbnailName" , cnnMain, 3
if not rsGallery.EOF then
	NumberOfFiles = rsGallery.RecordCount
	DefaultImage = rsGallery("ThumbnailName")
	DefaultDescription = rsGallery("Description")
end if 
	
Path = "/images/photo_gallery/images/thumbnail"
PhysicalPath = Server.MapPath(Path)
Set fs = Server.CreateObject("Scripting.FilesystemObject")
Set folder = fs.GetFolder(PhysicalPath)
Set f = folder.files

Response.Write vbcrlf
Response.Write "<script language=javascript>" & vbcrlf
Response.Write "var imageArray = new Array(" & NumberOfFiles & ");" & vbcrlf
Response.Write "var descArray = new Array(" & NumberOfFiles & ");" & vbcrlf
i = 0
do while not rsGallery.EOF 
	Response.Write "imageArray[" & i & "] = new Image();" & vbcrlf
	Response.Write "imageArray[" & i & "].src = '" & trim(Path) & "/" & server.URLPathEncode(rsGallery("ThumbnailName")) & "'" & vbcrlf
	'Response.Write "imageArray[" & i & "].width = 100;" & vbcrlf
	Response.Write "descArray[" & i & "] = '" & rsGallery("Description") & "'" & vbcrlf
	i=i+1
	rsGallery.MoveNext 
loop
rsGallery.Close
Set rsGallery = nothing

Response.Write "</script>" & vbcrlf

			
%>
<script language="JavaScript">
var ImageCounter;
var NumberOfImages;
ImageCounter = 0;
NumberOfImages = <%=i%>

function changeGalleryImage(imagename, direction)
{
	if (direction == 'back'){
		if (ImageCounter == 0) {
			alert("You are at the beginning of the images for this category.");
		}
		else {
			ImageCounter = ImageCounter - 1;
		}
	}
	else if(direction == 'next') {
		if ((ImageCounter + 1) == NumberOfImages) {
			alert("You are at the end of the images for this category.");
		}
		else {
			ImageCounter = ImageCounter + 1;
		}
	}
	
	document.images[imagename].src=imageArray[ImageCounter].src;
	document.all.description.innerHTML = descArray[ImageCounter];
	//alert(NumberOfImages);
}

</script>

<table cellpadding="0" cellspacing="0" border="0" width="570">
	<tr>
		<td class="PageTitle">Photo Gallery</td>
	</tr>
<% if NumberOfFiles <> "" then %>
	<tr>
		<td width="570" valign="top" align="center" nowrap>
		<a href="javascript:changeGalleryImage('galleryImg', 'back')"><img src="/images/photo_gallery/buttons/back.gif" border="0"></a>
		<a href="javascript:changeGalleryImage('galleryImg', 'next')"><img src="/images/photo_gallery/buttons/next.gif" border="0"></a>
		</td>
	</tr>
	<tr>
		<td align="center"><p><br>	
			<table cellspacing="0" cellpadding="0" border="0">
				<tr>
					<td align="center"><img id="galleryImg" name="galleryImg" src="/images/photo_gallery/images/thumbnail/<%=server.URLPathEncode(DefaultImage)%>" border="0"></td>
				</tr>
				<tr>
					<td align="left">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td class="AppLabel" align="left"><div id="description" name="description"><%=DefaultDescription%></div></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>  
	</tr>
<%	else%>
	<tr>
		<td><font size="2" color="#CC0000">There are no images associated with this category at this time.
			Please check back later after we have updated the images for this category.</font>
		</td>
	</tr>
<%	end if %>
</table>


<script language="javascript">
//alert("hello");
//alert(document.images['galleryImg'].width);
</script>



<!--#include virtual="/include/templates/bottom.asa"-->
