<!-- #include virtual="/members_only/include/functions.asa"-->


<%
If Not Session("Authorized")(9) Then
   Response.Redirect "/update/"
End If
FullPath = Request.QueryString("FullPath")
Virtual = Request.QueryString("Virtual")
%>
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->

<table border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">MO-TF1 Library Resource Management</td>
    </tr>
    <tr>
		<td>
<!--#include virtual="/members_only/include/modules/photo_gallery/file_management/image_list.asa"-->
		</td>
	</tr>
</table>
<% ManageImage FullPath, Virtual%>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->



