<!-- #include virtual="/members_only/include/functions.asa"-->


<%
Server.ScriptTimeout = 10000
'If Not Session("Authorized")(15) Then
   'Response.Redirect "/update/"
'End If
FullPath = Request.QueryString("FullPath")
Virtual = Request.QueryString("Virtual")
%>
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->

<table border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">Emergency Preparedness Library Resource Management</td>
    </tr>
    <tr>
		<td>
<!--#include virtual="/members_only/include/modules/photo_gallery/emrgprep_file_management/image_list.asa"-->
		</td>
	</tr>
</table>
<% ManageImage FullPath, Virtual%>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->


