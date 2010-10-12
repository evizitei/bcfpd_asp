<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<%
' Create a recordset object called rsPersonnel.
	set rsPersonnel = Server.CreateObject("ADODB.Recordset")
	set rsStations = Server.CreateObject("ADODB.Recordset")

%>
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Contact Us</td>
	</tr>	
	<tr>
		<td align="left">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td class="Header" colspan="3" align="left">&nbsp;Personnel</td>
				</tr>
				<%	rsPersonnel.Open "SELECT * FROM Contact_Us_Personnel ORDER BY Sort Asc" , cnnMain, 3
					Do while not rsPersonnel.EOF %>
				<tr>
					<td colspan="3"><p><br>
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
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td class="Header" colspan="3" align="left">&nbsp;Stations</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td width="25%" class="SubHeader">Name</td>
					<td width="25%"  class="SubHeader">Address</td>
					<td width="25%"  class="SubHeader">Additonal Info</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<% 	rsStations.Open "SELECT * FROM Contact_Us_Stations ORDER BY Sort Asc" , cnnMain, 3
					Do while not rsStations.EOF %>
				<tr>
					<td valign="top" class="ContactInfo"><%=rsStations("Name")%></td>
					<td valign="top"  class="ContactInfo"><%=rsStations("Address1")%>
						<%	if rsStations("Address2") <> "" then
								Response.Write("<br>" & rsStations("Address2"))
							end if
							if rsStations("City") <> "" then
								Response.Write("<br>" & rsStations("City"))
							end if
							if rsStations("State") <> "" then
								Response.Write("<br>" & rsStations("State"))
							end if
							if rsStations("Zip") <> "" then
								Response.Write("<br>" & rsStations("Zip"))
							end if %>
					</td>
					<td valign="top"  class="ContactInfo"><%=rsStations("Info")%></td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<% rsStations.MoveNext
				   Loop
				   rsStations.Close 
				   Set rsStations = nothing %>
			</table>
		</td>
	</tr>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->
