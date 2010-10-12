<%Response.Buffer = true%>
<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/media.asa"-->
<%
Set rsIncident = Server.CreateObject("ADODB.Recordset")
Set rsStation = Server.CreateObject("ADODB.Recordset")

dim ArrIncidentStats
dim ArrStationStats
dim RecordCount
dim Rows
'for counter = 1 to 10
'	cnnMain.execute "Insert into Incidents2 Select Type_IDreq, Incident_Numreq, 0, 0, 0,0,0,0,0,0,0 from incidents2"
'next
'rsIncident.Open "SELECT Type_IDreq, COUNT(*) AS typeTotal FROM Incidents GROUP BY Type_IDreq ORDER BY typetotal DESC ", cnnMain, 3
'rsIncident.open "SELECT Type_IDreq, COUNT(*) AS typeTotal, (SELECT COUNT(*) FROM Incidents) AS theSum FROM Incidents GROUP BY Type_IDreq ORDER BY typetotal DESC", cnnMain, 3rsIncident.open "SELECT Type_IDreq, COUNT(*) AS typeTotal, (SELECT COUNT(*) FROM Incidents WHERE Datereq > DATEADD(Year, - 1, GETDATE()) AND Datereq < GETDATE()) AS theSum FROM Incidents WHERE (Datereq > DATEADD(Year, - 1, GETDATE())) AND (Datereq < GETDATE()) GROUP BY Type_IDreq ORDER BY typetotal DESC", cnnMain, 3
if not rsIncident.EOF then	ArrIncidentStats = rsIncident.GetRows
	RecordCount = rsIncident.RecordCount 
end ifrsIncident.Close%>

<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Incident Statistics</td>
	</tr>	
	<tr>
		<td>
			<table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2" width="100%">
				<tr>
					<td colspan="3" class="Header"><%=Year(now())%> Incidents by Type</td>
				</tr>
				<tr>
					<td class="SubHeaderCenter" >Type of Incident</td>
					<td class="SubHeaderCenter" >Number of Responses</td>
					<td class="SubHeaderCenter">Percent of Total</td>
				</tr>
					<%	for Rows = 0 to RecordCount - 1
							Response.Write("<tr>")
								'Response.Write("<td class=AppLabel>" & ArrIncidentStats(0, Rows) & "</td>")
								rsIncident.Open "Select Name from Incident_Types where type_ID = " & ArrIncidentStats(0, Rows), cnnMain, 3 
								Response.Write("<td class=content>" & rsIncident("Name") & "</td>")
								rsIncident.Close 
								Response.Write("<td class=content align=center>" & ArrIncidentStats(1, Rows) & "</td>") 
								Response.Write("<td class=content align=center>" & cint((ArrIncidentStats(1, Rows) / ArrIncidentStats(2, Rows) * 100)) & "</td>")
							Response.Write("</tr>")
						next%>
			</table>
		</td>
	</tr>
	<tr>
		<td><p><br><p><br>
			<table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2" width="100%">
				<tr>
					<td colspan="3" class="Header"><%=Year(now())%> Apparatus Response Statistics</td>
				</tr>
				<tr>
					<td class="SubHeaderCenter" >Station Number</td>
<!--				<td class="SubHeaderCenter" >Station Location</td> -->
					<td class="SubHeaderCenter" >Number of Responses</td>
					<td class="SubHeaderCenter">Percent of Total</td>
				</tr>
					<%	
						rsIncident.open "SELECT Station_Numberreq, COUNT(*) AS typeTotal, (SELECT COUNT(*) FROM Incidents WHERE Datereq > DATEADD(Year, - 1, GETDATE()) AND Datereq < GETDATE()) AS theSum FROM Incidents WHERE (Datereq > DATEADD(Year, - 1, GETDATE())) AND (Datereq < GETDATE()) GROUP BY Station_Numberreq ORDER BY typetotal DESC", cnnMain, 3
						if not rsIncident.EOF then							ArrStationStats = rsIncident.GetRows
							RecordCount = rsIncident.RecordCount 
						end if							rsIncident.Close						for Rows = 0 to RecordCount - 1
						'on error resume next
						'rsStation.Open "Select City from Stations where Station_Number = " & ArrIncidentStats(0, Rows), cnnMain, 3 
							Response.Write("<tr>")
								Response.Write("<td class=content align=center>" & ArrStationStats(0, Rows) & "</td>")
						'		Response.Write("<td class=content align=center>" & rsStation(0) & "</td>") 
								Response.Write("<td class=content align=center>" & ArrStationStats(1, Rows) & "</td>") 
								Response.Write("<td class=content align=center>" & cint((ArrStationStats(1, Rows) / ArrStationStats(2, Rows) * 100)) & "</td>")
							Response.Write("</tr>")
						'rsStation.Close 
						next
						set rsIncident = nothing
						'set rsStation = nothing%>
			</table>
		</td>
	</tr>

</table>
<!--#include virtual="/include/templates/bottom.asa"-->
