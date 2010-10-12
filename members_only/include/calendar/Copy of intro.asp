<!-- #include virtual="/include/constants/database.asa"-->

<%
' Create a recordset object called rsNodes.
	set rsNodes = Server.CreateObject("ADODB.Recordset")
	strNode = "SELECT * FROM Calendar_Nodes"
%>					
						

<html>
<head>
<!-- #include virtual="/members_only/include/common_functions.asa"-->
</head>
<LINK rel="stylesheet" type="text/css" href="../../members_only/style.css">
<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" background="../../images/backgroundSideBar.jpg" text="#000000" link="#0000FF" vlink="#800080">
<table border="0" width="770" cellspacing="0" cellpadding="0">
	<tr>
		<td width="100%" >
			<font face="Arial, Helvetica, sans serif" size="4">
				<strong>Boone County Fire Protection District Calendars</strong>
			</font>
			<p>
			<a href="/members_only/index.asp">Return To Main Update Area</a>
			<p><br>
		</td>
    </tr>
	<tr>
		<td width="100%" valign="bottom" >
	
	<%rsNodes.Open "SELECT * FROM Calendar_Nodes" , cnnMain, 3, 3%>
	<!-- 10. A form is created that contains a table with delete/make feature capability, 	Headline hyper links, and date info.-->
	<form method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" id="form2" name="form2">
	<!-- 11. A table is created that will contain a delete check box, Make Feature/Headline links, and date info.-->
		<table border="0" cellpadding="3" cellspacing="0">
		  <tr>
		    <td></td>
		    <td>
		      <table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
				<tr>
					<td width="10">Name</td>
					<td width="10">Description</td>
					<td>View Calendar</td>
				</tr>
				<!-- 12. Do While Loop to populate the table with database information.-->
				<% Do while not rsNodes.EOF %>
				<tr>
					<td class="AppLabel"><a href="<%Request.ServerVariables("SCRIPT_NAME")%>?Node_ID=<%=rsNodes("Node_ID")%>"><%=rsNodes("Name")%></a></td>
					<td class="AppLabel"><%=rsNodes("Description")%></td>
					<td><font size="2"><a href="index.asp?Node_ID=<%=rsNodes("Node_ID")%>">Calendar View</a> | <a href="layout.asp?Node_ID=<%=rsNodes("Node_ID")%>">Layout View</a></font></td>
				</tr>
				<% rsNodes.MoveNext
				   Loop
				%>
			</table>
		  </td>
		 </tr>
	</table>
	</form>
	<%rsNodes.Close%>

		</td>
	</tr>
</table>
</body>
</html>



