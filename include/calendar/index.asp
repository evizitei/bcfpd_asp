<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<!--#include file="include/common_functions.asa"-->
<!--#include file="include/calendar_functions.asa"-->
<%
Node_ID = GetVal("Node_ID", "")
todayDate = GetVal("Date", date)

Select Case GetVal("View", "Month")
	Case "Year"
		dispYear Node_ID, todayDate
	Case "Month"
		dispMonth Node_ID, todayDate
	Case "Day"
		dispDay Node_ID, todayDate, False
	Case "PrintMonth"
		makePrintable Node_ID, todayDate, 1	
	Case "PrintYear"
		makePrintable Node_ID, todayDate, 2	
End Select
%>

<!--#include virtual="/members_only/include/templates/bottom.asa"-->
