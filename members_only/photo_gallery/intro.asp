<%
If Not Session("Authorized")(5) Then
    Response.Redirect "/members_only/index.asp"
End If
%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<LINK rel="stylesheet" type="text/css" href="../style.css">
<BODY>
<table>
<!--
	<tr>
	  <td bgcolor="#EEEEEE" OnMouseOver="this.bgColor='#ffffff'" OnMouseOut="this.bgColor='#EEEEEE'">
	  	<p><a href="images/image_list.asp?Edit=<%=Request.QueryString("Edit")%>&Spot_ID=&FullPath=<%=server.URLEncode("c:\Websites\bcfdmo\images\photo_gallery\images")%>&Virtual=<%=server.URLEncode("/images/photo_gallery/images")%>">Photos</a></td>

	  </td>
	</tr>
	<tr>
	  <td bgcolor="#EEEEEE" OnMouseOver="this.bgColor='#ffffff'" OnMouseOut="this.bgColor='#EEEEEE'">
	  	<p><a href="video/image_list.asp?Edit=<%=Request.QueryString("Edit")%>&Spot_ID=&FullPath=<%=server.URLEncode("c:\Websites\bcfdmo\images\photo_gallery\video")%>&Virtual=<%=server.URLEncode("/images/photo_gallery/video")%>">Video</a></td>
	  </td>
	</tr>
-->
	<tr>
	  <td bgcolor="#EEEEEE" OnMouseOver="this.bgColor='#ffffff'" OnMouseOut="this.bgColor='#EEEEEE'">
	  	<p><a href="images/index.asp">Photos</a></td>
	  </td>
	</tr>
	<tr>
	  <td bgcolor="#EEEEEE" OnMouseOver="this.bgColor='#ffffff'" OnMouseOut="this.bgColor='#EEEEEE'">
	  	<p><a href="video/index.asp">Video</a></td>
	  </td>
	</tr>

</table>

</BODY>
</HTML>
