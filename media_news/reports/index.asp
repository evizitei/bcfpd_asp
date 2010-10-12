<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/media.asa"-->
<%
Set rsIncident = Server.CreateObject("ADODB.Recordset")
Set rsIncTypes = Server.CreateObject("ADODB.Recordset")

%>
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Incident Reports</td>
	</tr>	
	<%rsIncident.Open "Select * From Incidents where datereq > DATEADD(day, - 4, GETDATE()) AND datereq <= getdate() Order By Datereq ASC, Timereq ASC ", cnnMain, 3
	if not rsIncident.EOF then%>
	<tr>
		<td>
			<table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2" width="100%">
				<tr>
					<td class="SubHeaderCenter" >Date</td>
					<td class="SubHeaderCenter" >Time</td>
					<td class="SubHeaderCenter">Location</td>
					<td class="SubHeaderCenter">Incident<br>Type</td>
					<td class="SubHeaderCenter">Description</td>
					<td class="SubHeaderCenter">Station</td>
				</tr>
				<% 
				Do while not rsIncident.EOF %>
				<tr>
					<td class="AppLabel" valign="top"><%=rsIncident("Datereq")%></td>
					<td class="AppLabel" valign="top"><nobr><%=rsIncident("Timereq")%></nobr></td>
					<td align="left" class="AppLabel" valign="top"><nobr><%=rsIncident("Address1req") & "</nobr><br>"%>
						<%if rsIncident("Address2") <> "" then%>
							<%="<nobr>" & rsIncident("Address2") & "</nobr><br>"%>
						<%end if %>
						<%="<nobr>" & rsIncident("Cityreq") & ", " & rsIncident("State")%>
						<%if rsIncident("Zip") <> "" then%>
							<%="<br>" & rsIncident("Zip")%>
						<%end if %>
					</td>
					<td class="AppLabel" valign="top"><%rsIncTypes.Open "Select * from Incident_Types where Type_ID = " & rsIncident("Type_IDreq"), cnnMain, 3%>
						<%=rsIncTypes("Name")%>
						<%rsIncTypes.Close   %>
					</td>
					<td class="AppLabel" valign="top"><%=rsIncident("Description")%></td>
					<td class="AppLabel" align="center" valign="top"><%=rsIncident("Station_Numberreq")%></td>
				</tr>
				<%	rsIncident.MoveNext
					Loop
					set rsIncTypes = Nothing
				   	rsIncident.Close %>
			</table>
		</td>
	</tr>
<%	else %>
		<tr>
			<td><font size="2" color="#CC0000">We do not have any Incident Reports at this time.
				Please check back later after we have updated this area.</font>
			</td>
		</tr>
<%	end if%>

</table>
<!--#include virtual="/include/templates/bottom.asa"-->
