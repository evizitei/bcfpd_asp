%>

<!-- #include virtual="/include/constants/database.asa"-->
<!--#include file="../../include/calendar/include/common_functions.asa"-->
<%
Node_ID = GetVal("Node_ID", "")
Set rsNode = Server.CreateObject("ADODB.Recordset")
Set rsCalendar = Server.CreateObject("ADODB.Recordset")
LCol = 50
rsNode.Open "Select * From Calendar_Nodes Where Node_ID=" & Node_ID, cnnMain, 3
rsCalendar.Open "Select * From Calendar Where Node_ID=" & Node_ID, cnnMain, 3

%>
<table width="760" border="0">
<tr>
<td width="<%=LCol%>" valign="top" align="center"><br>
</td>
<td width="<%=760 - LCol%>" valign="top"><img SRC="/images/calendar/calendarOfevents.gif" WIDTH="220" HEIGHT="36"><br>
<%If Not rsNode.EOF Then%>
<span class="SubHeader"><%=rsNode("Name")%></span>
<p>
<table cellpadding="1" cellspacing="0">

<%
prevMonth = ""
Do While Not rsCalendar.EOF
	If prevMonth <> Month(rsCalendar("Date")) or prevYear <> Year(rsCalendar("Date")) Then
%>
<tr>
<td colspan="2"><font size="4"><strong><%=MonthName(Month(rsCalendar("Date")))%>&nbsp;<%If Year(Now) <> Year(rsCalendar("Date")) Then%><%=Year(rsCalendar("Date"))%><%End If%></strong></font>
</tr>
<%End If%>

<tr><td width="50" nowrap><%=Day(rsCalendar("Date"))%><%If Not IsNull(rsCalendar("End_Date")) Then%>-<%=Day(rsCalendar("End_Date"))%><%End If%></td>
<td><%=rsCalendar("Title")%></td>
</tr>
<tr>
<td></td>
<%If Not IsNull(rsCalendar("Description")) Then%>
<td><font size="2"><%=Replace(rsCalendar("Description"), vbCr, "<br>")%></font></td>
<%End If%>
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
