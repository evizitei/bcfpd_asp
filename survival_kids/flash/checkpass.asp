<%@ Language=VBScript %>
<!--#include virtual="/include/constants/database.asa"-->
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 5.0">
</HEAD>
<BODY>
<%
  Set rs = CreateObject("ADODB.Recordset")
  rs.Open "Select * From SurvivalKids Where UserName = '" & Request("UserName") & "' AND Password = '" & Request("Password") & "'", cnnMain, 3
  If rs.EOF Then
  	Response.Write "&verified=no"
  Else
  	Response.Write "&verified=true&lesson=" & rs("Lesson")
  End If

%>
</BODY>
</HTML>