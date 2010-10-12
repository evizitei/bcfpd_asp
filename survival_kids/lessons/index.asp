
<%
	if Request.Cookies("CurrentRank") = "" then
		Response.Cookies("CurrentRank").Expires = "December 31, 2020"
		Response.Cookies("CurrentRank").Domain = Request.ServerVariables("Server_Name")
		'Response.Cookies("CurrentRank").Domain = "12.10.125.18"
		'Response.Cookies("CurrentRank").Domain = "192.168.222.74"
		Response.Cookies("CurrentRank").Path = "/"
		Response.Cookies("CurrentRank") = "BEGINNER"
	end if
	
	GoToNextLesson(Request.Cookies("CurrentRank"))

%>
<!--#include file="sk_functions.asa"-->
