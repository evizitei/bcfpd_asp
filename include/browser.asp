<%
' this is asp script that runs on the server when the page is requested
Dim SvrVarCollection
Set SvrVarCollection = Request.ServerVariables
Dim ua, os
Dim MyBrowser
Dim Win98, WinNT, AnyMac, PPC, Mac68K
Dim MyOS

''''''''''''''''''''
' Server Variables '
''''''''''''''''''''

ua  = SvrVarCollection("HTTP_USER_AGENT")
os  = SvrVarCollection("HTTP_UA_OS")


'''''''''''''''''''''''''
' Determine the Browser '
'''''''''''''''''''''''''

If Instr(ua, "MSIE") Then
	MyBrowser = "IE"

ElseIf Instr(ua, "Firefox") Then
   MyBrowser = "Firefox"

ElseIf Instr(ua, "Netscape") Then
   MyBrowser = "Netscape"

Else
   MyBrowser = "Junk"
   
End If

''''''''''''''''''''
' Determine the OS '
''''''''''''''''''''

Win98 = False
WinNT = False
AnyMac = False
PPC = False
Mac68K = False

If InStr(ua, "Windows 98") Or InStr(ua, "Win98") Then
   Win98 = True
   MyOs = "Win98"
ElseIf InStr(ua, "Windows 3.1") Or InStr(os, "Win16") Then
   Win31_WinNT351 = True
   MyOs = "Win 3.1 / NT 3.51"
ElseIf InStr(ua, "NT") Or InStr(os, "NT") Then
   WinNT = True
   MyOs = "WinNT"
ElseIf InStr(ua, "Mac") Then
   AnyMac = True
   MyOs = "Anymac"
   If InStr(ua, "PowerPC") Or InStr(ua, "PPC") Then
      PPC = True
      MyOs = "PowerPc"
   ElseIf InStr(ua, "68000") Or InStr(ua, "68K") Then
      Mac68K = True
      MyOs = "Mac 68000"
   End If
End If
%>