<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/motf1.asa"-->
<%
	set rsRotation = Server.CreateObject("ADODB.Recordset")
%>
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">MO-TF1 Deployment Schedule</td>
	</tr>	
	<tr>
	    <td width="100%" align="left">
			<table border="0" cellpadding="0" cellspacing="0" bordercolor="#f2f2f2" width="100%">
				<tr>
					<td class="Header" colspan="3"><b><%=year(now())%></b></td>
				</tr>
				<tr>
					<td width="34%" valign="center" class="SubHeader">Month</td>
					<td width="33%"  class="SubHeader">Primary<br>Force</td>
					<td width="33%"  class="SubHeader">Secondary<br>Force</td>
				</tr>
<%				rsRotation.Open "SELECT * FROM TF_Rotation ORDER BY Rotation_ID", cnnMain,3  
				do while not rsRotation.eof %>
				<tr>
					<td class="SubHeader"><%=rsRotation("Month")%></td>
					<td class="ContactInfo" align="left">&nbsp;<%=rsRotation("Primary_Force")%></td>
					<td class="ContactInfo" align="left">&nbsp;<%=rsRotation("Secondary_Force")%></td>
				</tr>
<%
					rsRotation.MoveNext 
				loop
				rsRotation.close			
				set rsRotation = nothing %>
			</table>
		</td>
	</tr>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->
