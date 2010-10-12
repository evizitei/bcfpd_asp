<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<!-- #include virtual="/include/constants/database.asa"-->
<!-- #include virtual="/include/common_functions.asa"-->

<%

set rsVideo = Server.CreateObject("ADODB.Recordset")
			
%>
<table cellpadding="5" cellspacing="0" border="0" width="570">
	<tr>
		<td class="PageTitle">Video Gallery</td>
	</tr>
<%	rsVideo.Open "SELECT * FROM Video_Category" , cnnMain, 3
	if not rsVideo.EOF then
		do while not rsVideo.EOF %>
			<tr>
				<td class="Subheader"><%=rsVideo("Name")%>
					<a href="video.asp?Category_ID=<%=rsVideo("Category_ID")%>" title="<%=rsVideo("Description")%>"><br><img src="/images/photo_gallery/filmstrip.gif" border="0"></a></td>  
			</tr>
	<%	rsVideo.MoveNext 
		loop
	else%>
	<tr>
		<td><font size="2" color="#CC0000">We do not have videos to view at this time.
			Please check back later after we have updated the Video Gallery.</font>
		</td>
	</tr>
<%	end if

	rsVideo.Close 
	set rsVideo = nothing %>
</table>








<!--#include virtual="/include/templates/bottom.asa"-->
