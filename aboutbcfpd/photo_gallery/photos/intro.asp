<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<!-- #include virtual="/include/constants/database.asa"-->
<!-- #include virtual="/include/common_functions.asa"-->

<%
set rsImageCat = Server.CreateObject("ADODB.Recordset")
set rsImage = Server.CreateObject("ADODB.Recordset")			
			
%>
<table cellpadding="5" cellspacing="0" border="0" width="570">
	<tr>
		<td class="PageTitle">Photo Gallery</td>
	</tr>
	<tr>
		<td class="Content"><font size="1">Click on a category to see all of the images for that category.</font>
		</td>
	</tr>
<%	rsImageCat.Open "SELECT * FROM Image_Category ORDER BY Name ASC" , cnnMain, 0, 1
	if not rsImageCat.EOF then
		do while not rsImageCat.EOF 
		%>
			<tr>
				<td class="Subheader"><a href="/aboutbcfpd/photo_gallery/photos/image.asp?Category_ID=<%=rsImageCat("Category_ID")%>" title="<%=rsImageCat("Description")%>"><%=rsImageCat("Name")%></a>
					<br><br>
					<%	
						strSQL = "SELECT * FROM Image WHERE FilmStrip = 1 AND Image_Category_ID = " & rsImageCat("Category_ID")
						rsImage.Open strSQL, cnnMain, 0, 1
						if not rsImage.EOF then %>	
							<table cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td>
										<table cellpadding="0" cellspacing="0" border="0" bordercolor="black">
											<tr>
												<td bgcolor="black">
													<table cellpadding="0" cellspacing="0" border="0" bordercolor="black">
														<tr>
															<td><img width="400" SRC="/images/photo_gallery/images/filmstrip/Filmstrip.jpg"></td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td bgcolor="black">
													<table cellpadding="0" cellspacing="0" border="1" bordercolor="black">
														<tr>
													<%	do while not rsImage.EOF  %>
															<td><img width=100 src="/images/photo_gallery/images/filmstrip/<%=rsImage("ThumbnailName")%>" border="0"></a></td>
													<%		rsImage.MoveNext
														loop %>														 
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td bgcolor="black">
													<table cellpadding="0" cellspacing="0" border="0" bordercolor="black">
														<tr>
															<td><img width="400" SRC="/images/photo_gallery/images/filmstrip/Filmstrip.jpg"></td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>  
								</tr>
							</table>
					<%	end if 
						rsImage.Close
			rsImageCat.MoveNext 
		loop
		rsImageCat.Close 
		set rsImageCat = nothing 
		set rsImage = nothing
	else%>
	<tr>
		<td><font size="2" color="#CC0000">We do not have images to view at this time.
			Please check back later after we have updated the Photo Gallery.</font>
		</td>
	</tr>
<%	end if%>

</table>
<p><br>
<!--#include virtual="/include/templates/bottom.asa"-->
