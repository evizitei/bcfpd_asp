<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<%
' Create a recordset object called rsPersonnel.
	set rsPersonnel = Server.CreateObject("ADODB.Recordset")

%>
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Contact Us</td>
	</tr>	
	<tr>
		<td align="left">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="Header" colspan="4" align="left">&nbsp;Personnel</td>
				</tr>
				<%	rsPersonnel.Open "SELECT * FROM Contact_Us_Personnel ORDER BY Sort Asc" , cnnMain, 3
					Do while not rsPersonnel.EOF %>
				<tr>
					<td><p><br>
						<table cellpadding="5" cellspacing="3" border="0">
							<tr>
								<td align="left" class="SubHeader">Name</td>
								<td align="left" class="ContactInfo"><%=rsPersonnel("Name")%></td>
							</tr>
							<tr>
								<td align="left" class="SubHeader">Title</td>
								<td align="left"  class="ContactInfo"><%=rsPersonnel("Title")%></td>
							</tr>
							<tr>
								<td align="left" class="SubHeader">E-Mail</td>
								<td align="left"  class="ContactInfo"><a href="mailto:<%=rsPersonnel("Email")%>?subject=BCFPD Web Site: Contact Us"><%=rsPersonnel("Email")%></a></td>
							</tr>
							<tr>
								<td align="left"  valign="top" class="SubHeader">Responsibilities</td>
								<td align="left"   class="ContactInfo"><%=rsPersonnel("Responsibilities")%></td>
							</tr>
						</table>
					</td>
				</tr>
				<% rsPersonnel.MoveNext
				   Loop
				   rsPersonnel.Close 
				   Set rsPersonnel = nothing %>
			</table>
		</td>
	</tr>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->
