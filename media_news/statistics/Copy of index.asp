<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/media.asa"-->
<%
Set rsIncident = Server.CreateObject("ADODB.Recordset")

Set rsIncTypes = Server.CreateObject("ADODB.Recordset")
dim ArrStats
dim RecordCount
dim Rows
dim Percent
dim Total
'for counter = 1 to 10
'	cnnMain.execute "Insert into Incidents2 Select Type_IDreq, Incident_Numreq, 0, 0, 0,0,0,0,0,0,0 from incidents2"
'next
'rsIncident.Open "SELECT Type_IDreq, COUNT(*) AS typeTotal FROM Incidents GROUP BY Type_IDreq ORDER BY typetotal DESC ", cnnMain, 3
'rsIncident.open "SELECT Type_IDreq, COUNT(*) AS typeTotal, (SELECT COUNT(*) FROM Incidents) AS theSum FROM Incidents GROUP BY Type_IDreq ORDER BY typetotal DESC", cnnMain, 3rsIncident.open "SELECT Type_IDreq, COUNT(*) AS typeTotal, (SELECT COUNT(*) FROM Incidents WHERE Datereq > DATEADD(Year, - 1, GETDATE()) AND Datereq < GETDATE()) AS theSum FROM Incidents WHERE (Datereq > DATEADD(Year, - 1, GETDATE())) AND (Datereq < GETDATE()) GROUP BY Type_IDreq ORDER BY typetotal DESC", cnnMain, 3
ArrStats = rsIncident.GetRows
RecordCount = rsIncident.RecordCount rsIncident.Close%>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td class="PageTitle">Incident Statistics<p><br></td>
	</tr>	
	<tr>
		<td>
			<table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2" width="100%">
				<tr>
					<td colspan="3" class="RotationYearHeader"><%=Year(now())%> Incidents by Type</td>
				</tr>
				<tr>
					<td class="RotationHeader" >Type of Incident:</td>
					<td class="RotationHeader" >Number of Responses</td>
					<td class="RotationHeader">Percent of Total</td>
				</tr>
					<%	for Rows = 0 to RecordCount - 1
							Response.Write("<tr>")
								'Response.Write("<td class=AppLabel>" & ArrStats(0, Rows) & "</td>")
								rsIncident.Open "Select Name from Incident_Types where type_ID = " & ArrStats(0, Rows), cnnMain, 3 
								Response.Write("<td class=AppLabel>" & rsIncident("Name") & "</td>")
								rsIncident.Close 
								Response.Write("<td align=center>" & ArrStats(1, Rows) & "</td>") 
								Response.Write("<td align=center>" & cint((ArrStats(1, Rows) / ArrStats(2, Rows) * 100)) & "</td>")
							Response.Write("</tr>")
						next
						set rsIncident = nothing%>
			</table>
		</td>
	</tr>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->
