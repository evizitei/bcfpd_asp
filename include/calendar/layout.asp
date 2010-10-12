<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<!--#include file="../../include/calendar/include/common_functions.asa"-->
<%
Node_ID = GetVal("Node_ID", "")
Set rsNode = Server.CreateObject("ADODB.Recordset")
Set rsCalendar = Server.CreateObject("ADODB.Recordset")
LCol = 50
rsNode.Open "Select * From Calendar_Nodes Where Node_ID=" & Node_ID, cnnMain, 3
rsCalendar.Open "Select * From Calendar Where Node_ID=" & Node_ID & " ORDER BY Date ASC", cnnMain, 3
%>
<table border="0" cellpadding="3" cellspacing="0">
	<tr>
		<td width="<%=LCol%>" valign="top" align="center"><br>
		</td>
		<td width="<%=760 - LCol%>" valign="top"><img SRC="/images/calendar/calendarOfevents.gif" WIDTH="220" HEIGHT="36"><br>
			<%If Not rsNode.EOF Then%>
				<span class="SubHeader"><%=rsNode("Name")%></span>
				<p>
		      <table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
			<%prevMonth = ""
			  Do While Not rsCalendar.EOF
				If prevMonth <> Month(rsCalendar("Date")) or prevYear <> Year(rsCalendar("Date")) Then %>
					<tr>
						<td align="center" colspan="2"><font size="4"><strong><p><br><%=MonthName(Month(rsCalendar("Date")))%>&nbsp;<%If Year(Now) <> Year(rsCalendar("Date")) Then%><%=Year(rsCalendar("Date"))%><%End If%></strong></font></p></td>
					</tr>
				<%End If%>
					<tr>
						<td valign="top"><%=Day(rsCalendar("Date"))%></td>
						<td>
							<table border="0" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
								<tr>
									<%="<td class=AppLabel>Event: </td><td class=AppLabel>" & rsCalendar("Title") & "</td></tr>"%>
									<%if rsCalendar("Event") then%>
										<%="<tr><td class=AppLabel>Start: </td><td rowspan=2 class=AppLabel>All Day Event</td>"%>
										<%="<tr><td class=AppLabel>End: </td></tr>"%>
									<%else%>
										<%="<tr><td class=AppLabel>Start: </td><td class=AppLabel>" & FormatDateTime(rsCalendar("Date"), vbLongTime) & "</td></tr>"%>
										<%="<tr><td class=AppLabel>End: </td><td class=AppLabel>"  & rsCalendar("End_Date") & "</tr>"%>
									<%end if%>
									<%="<tr><td class=AppLabel>Description: </td><td class=AppLabel>"  & Replace(rsCalendar("Description"), vbCr, "</td></tr>") %>
								</tr>
							</table>
						</td>
					</tr>
			<%
			  prevYear = Year(rsCalendar("Date"))
			  prevMonth = Month(rsCalendar("Date"))
			  rsCalendar.MoveNext
			  Loop
			%>
				</table>
			  <%Else%>
					No Calendar Events at this time.
			  <%End If%>

		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
