<%
	
	'Response.Write(Request.Cookies("CurrentRank"))
	Dim PassGrade
	Dim QuestionCounter
	Dim TotalQuestions
	Dim Pass
	Dim NumberofCorrect
	Dim CurrentRank
	Dim NewRank
	PassGrade = .8
	QuestionCounter = 0
	TotalQuestions = Request.Form("TotalQuestions")
	Pass = false
	NumberofCorrect = 0
	CurrentRank = Request.Cookies("CurrentRank")
	
	if Request.Form("submit") = "Submit" then
		For each item in Request.Form
			'Response.Write("item: " & item & "<br>")
			'Response.Write(Request.Form & ": " & Request.form(item) & "<br>")
			if Request.form(item) <> "Submit" and  item <> "TotalQuestions" then
				QuestionCounter = QuestionCounter + 1
				if Request.form(item) = "true" then 
					NumberofCorrect = NumberofCorrect + 1	
				end if 
			end if
		next
		'Response.Write("QuestionCounter: " & QuestionCounter & "<br>")
		'Response.Write("NumberofCorrect: " & NumberofCorrect & "<br>")
		if QuestionCounter <> 0 and TotalQuestions <> 0 then 
			'Response.Write(NumberofCorrect / Questioncounter)
			if (NumberofCorrect / Questioncounter) >= PassGrade and (Questioncounter / TotalQuestions >= .8) then
				Pass = true
				NewRank = GetNextRank(CurrentRank)
				Response.Cookies("CurrentRank").Expires = "December 31, 2020"
				Response.Cookies("CurrentRank").Domain = Request.ServerVariables("Server_Name")
				'Response.Cookies("CurrentRank").Domain = "12.10.125.18"
				'Response.Cookies("CurrentRank").Domain = "192.168.222.74"
				Response.Cookies("CurrentRank").Path = "/"
				Response.Cookies("CurrentRank") = NewRank
				if NewRank = "FIRE_CHIEF" then
					Response.Redirect "fire_chief.asp"
				end if
			end if
		end if
	elseif Request.Form("Submit2") = "Next Lesson" then
		GoToNextLesson(CurrentRank)
	elseif Request.Form("Submit") = "Try Again" then
		GoToNextLesson(CurrentRank)
	elseif Request.Form("Submit") = "Start Over" then
		GoToNextLesson(CurrentRank)
	else
		Response.Redirect "/survival_kids/index.asp"
	end if
	
%>
<!--#include virtual="/include/templates/sk_top.asa"-->
<!--#include file="sk_functions.asa"-->
<form name="sk" action="grade_lesson.asp" method="post">
<input type="hidden" name="Submit">

<table>
	<tr>
		<%	if Pass = true then %>
				<td class="SKPass" colspan="2"><b>Congradulations!!!</b> You have successfully passed the
				 <%=NewRank%> test by correctly answering <%=NumberofCorrect%> out
				 of <%=TotalQuestions%> questions. You can continue to the next lesson 
				 by pressing the button that reads &quot;Next Lesson&quot;. If you want to take a 
				 break and continue later, press the button that reads &quot;Take a Break&quot;.
				 </td>
		<%	else %>
				<td class="SKFail" colspan="2"><b>Sorry!!!</b> You did not passed the
				 <%=NewRank%> test. You answered <%=NumberofCorrect%> out
				 of <%=TotalQuestions%> questions correctly. You can take the quiz again
				 by pressing the button that reads &quot;Try Again&quot;. If you want to take a 
				 break and continue later, press the button that reads &quot;Take a Break&quot;.
				 </td>
		<%	end if %>
	</tr>
<!--		<tr>		<td align="center"><p><br><INPUT type="submit" value="Take A Break" id=submit1 name="Break"></td>		<%	if Pass = true then %>		<td align="center"><p><br><INPUT type="submit" value="Next Lesson" id=submit2 name="Next">		<%	else %>		<td align="center"><p><br><INPUT type="submit" value="Try Again" id=submit2 name="Next">		<%	end if%>	</tr>-->
	<tr>
		<td align="center"><p><br><a href="javascript:window.location.href='/survival_kids/'"><img SRC="/images/buttons/TakeBreak.gif" border="0"></a></td>
		<%	if Pass = true then %>
		<td align="center"><p><br><input type="submit" value="Next Lesson" id="submit2" name="Submit2">
		<%	else %>
		<td align="center"><p><br><a href="javascript:SubmitForm('Try Again');"><img SRC="/images/buttons/TryAgain.gif" border="0"></a>
		<%	end if%>
	</tr>
</form>
</table>
<!--#include virtual="/include/templates/sk_bottom.asa"-->
