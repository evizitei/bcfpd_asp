<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<%
' Create a recordset object called rsPersonnel.
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
					<td class="Header" colspan="3" align="left">&nbsp;Stations</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td width="33%" class="SubHeader">Name</td>
					<td width="33%"  class="SubHeader">Address</td>
					<td width="34%"  class="SubHeader">Additonal Info</td>
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
					<td>&nbsp;</td>
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
