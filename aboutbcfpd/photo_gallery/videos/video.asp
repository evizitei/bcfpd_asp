<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<!-- #include virtual="/include/constants/database.asa"-->
<!-- #include virtual="/include/common_functions.asa"-->

<%
Category_ID = GetVal("Category_ID", "")

set rsVideo = Server.CreateObject("ADODB.Recordset")

	
Path = "/images/photo_gallery/video"
PhysicalPath = Server.MapPath(Path)
Set fs = Server.CreateObject("Scripting.FilesystemObject")
Set folder = fs.GetFolder(PhysicalPath)
Set f = folder.files			
%>

<table cellpadding="0" cellspacing="0" border="0" width="570">
	<tr>
		<td class="PageTitle">Video Gallery</td>
	</tr>
<%	rsVideo.Open "SELECT * FROM Video where Video_Category_ID =" & Category_ID , cnnMain, 3%>
<%	if rsVideo.EOF then%>
	<tr>
		<td><font size="2" color="#CC0000">There are no videos associated with this category at this time.
			Please check back later after we have updated the videos for this category.</font>
		</td>
	</tr>
<%	else	
		do while not rsVideo.EOF %>
			<tr>
				<td><p><br>
					<table border="0" cellpadding="3" cellspacing="3">
						<tr>
							<td class="SubHeader">Name</td>
							<td><a class="Public" href="<%=trim(Path) & "/" & rsVideo("Name")%>"><%=rsVideo("Name")%></a></td>  
						</tr>
						<tr>
							<td valign="top" class="Subheader">Description</td>
							<td><font size="2"><%=rsVideo("description")%></font></td>
						</tr>
					</table>
				</td>
			</tr>
	<%	rsVideo.MoveNext 
		loop
		rsVideo.Close 
		set rsVideo = nothing 
	end if %>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->
