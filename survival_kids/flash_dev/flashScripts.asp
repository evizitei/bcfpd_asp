<% 'On Error Resume Next %>
<!--#include virtual="/include/constants/database.asa"-->
<%
'****************
'This file contains all the modules for the flash project for Survival Kids
'errHandler is main Variable used in flash movie
'****************
Set RS = CreateObject("ADODB.Recordset")

'>>>> Add User <<<<
  If Request("RegUser") <> "" Then
	rs.Open "Select * From SurvivalKids Where UserName ='" & Request("UserName") & "'", cnnMain, 3, 3
	If Not rs.EOF Then
		Response.Write "&errHandler=<font color=""#ffffff"">There is already a user named " & Request("UserName") & ".<br> Please try a different user name!</font>" 
	Else
		rs.AddNew
		rs("UserName")=Request("UserName")
		rs("FName") = Request("FName")
		rs("LName") = Request("LName")
		rs("Password") = Request("Password")
		rs("Teacher") = Request("Teacher")
		rs("School") = Request("School")
		rs("City") = Request("City")
		rs("State") = Request("State")
		rs("Lesson") = 1
		rs.Update
		
		Response.Write "&errHandler=OK"
	End If
	rs.Close

  End If

'>>>> Pass User <<<<  
  If Request("PassUser") = "yes" Then
  	numLesson = Request("numLesson")
	If numLesson = "PreTest" Then
		rs.Open "Select * From SurvivalKids Where UserName='" & Request("UserName") & "'", cnnMain, 3, 3
	  	skID = rs("SKid_ID")
		rs("PreTest") = 1
		rs.Update
	  	rs.Close
		
		rs.Open "SurvivalKids_PreTest_Insert " & skID & ",'" & Request("strAnswers") & "'," & Request("NumCorrect"), cnnMain, 3
		'rs.Close
		
  		response.Write "&errHandler=OK"	
	
	ElseIf numLesson = "PostTest" Then
		rs.Open "Select * From SurvivalKids Where UserName='" & Request("UserName") & "'", cnnMain, 3, 3
	  	skID = rs("SKid_ID")
		rs("PostTest") = 1
		rs.Update
	  	rs.Close
		
		rs.Open "SurvivalKids_PostTest_Insert " & skID & ",'" & Request("strAnswers") & "'," & Request("NumCorrect"), cnnMain, 3		
		response.Write "&errHandler=OK"			
	Else
	
		rs.Open "Select * From SurvivalKids Where UserName='" & Request("UserName") & "'", cnnMain, 3, 3
	  	rs("Lesson") = rs("Lesson") + 1
  		rs.Update
	  	rs.Close
  		response.Write "&errHandler=OK"
	End If
  End If



cnnMain.Close


If err.Number > 0 Then
	Response.Write "&errHandler=" & err.Description
	'Response.Write "&errHandler=" & Request("UserName")

End If
%>