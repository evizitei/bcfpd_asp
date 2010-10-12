<!--#include virtual="/include/constants/database.asa"-->

<%
' Create a recordset object called rsNodes.
	set rsNodes = Server.CreateObject("ADODB.Recordset")
	strNode = "SELECT * FROM Calendar_Nodes"

%>					
						

	
	<%rsNodes.Open "SELECT * FROM Calendar_Nodes" , cnnMain, 3, 3%>
		<%	Do while not rsNodes.EOF %>
				<nobr><A CLASS='menutext' HREF='/include/calendar/index.asp?Node_ID=<%=rsNodes("Node_ID")%>'>&nbsp;&nbsp;<%=rsNodes("Name")%> Calendar View&nbsp;&nbsp;</nobr></A><br>
				<nobr><a CLASS='menutext' href='/members_only/calendars/layout.asp?Node_ID=<%=rsNodes("Node_ID")%>'>&nbsp;&nbsp;<%=rsNodes("Name")%> Layout View&nbsp;&nbsp;</nobr></a></font><p>
		<%		rsNodes.MoveNext
			Loop	
			rsNodes.Close
			set rsNodes = Nothing%>




