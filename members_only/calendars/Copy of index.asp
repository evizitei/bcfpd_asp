<%
If Not Session("Authorized")(8) Then
    Response.Redirect "/members_only/index.asp"
End If
%>

<!-- #include virtual="/include/constants/database.asa"-->

<%'If Session("Authorized") Then%>
<%	Node_ID = GetVal("Node_ID", "")
	set rsNodes = Server.CreateObject("ADODB.Recordset")
	rsNodes.Open "Select * from Calendar_Nodes where Node_ID= " & Node_ID, cnnMain, 3
%>
<html>
<head>

</head>
<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" background="../../images/backgroundSideBar.jpg" text="#000000" link="#0000FF" vlink="#800080">

<table border="0" width="644" cellspacing="0" cellpadding="0">
  <tr>
    <td width="150" rowspan="2" valign="top">

      <!--left menu goes here-->

    </td>
      
    <td width="3" valign="top" rowspan="3"><img src="../images/spacer.gif" width="5" height="10"></td>
    <td width="500" valign="top">
      <table border="0" width="100%" cellspacing="0" cellpadding="24">
        <tr>
          <td width="100%" colspan="3" nowrap>
			<font face="Arial, Helvetica, sans serif" size="4" color="#000033">
				<strong><%=rsNodes("Name")%> Calendars Update Section</strong>
			</font>
            
            
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="500" valign="bottom" colspan="2"><!-- #include virtual="/include/calendar/include/update.asa" -->
    </td>
  </tr>
</table>

</body>
</html>

<%
'cnn.Close
'Else
 '  Response.Redirect "/update/index.asp"
'End If
%>