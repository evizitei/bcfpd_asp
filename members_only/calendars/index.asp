<!-- #include virtual="/members_only/include/functions.asa"-->
<!-- #include virtual="/include/constants/database.asa"-->
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->

<%
	If Not Session("Authorized")(8) Then
	    Response.Redirect "/members_only/index.asp"
	End If

	Node_ID = GetVal("Node_ID", "")
	set rsNodes = Server.CreateObject("ADODB.Recordset")
	rsNodes.Open "Select * from Calendar_Nodes where Node_ID= " & Node_ID, cnnMain, 3
%>

<table border="0" width="98%" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle"><%=rsNodes("Name")%> Calendars Update Section</td>
    </tr>
	<tr>
		<td valign="bottom"><p><br><!-- #include virtual="/include/calendar/include/update.asa" -->
		</td>
	</tr>
</table>

<!--#include virtual="/members_only/include/templates/bottom.asa"-->

