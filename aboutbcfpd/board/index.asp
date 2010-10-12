<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<%
	dim rs, BoardYear
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT DISTINCT MinutesYear FROM BoardMinutes ORDER BY MinutesYear DESC"
	set rs = cnnMain.execute(strSQL)
	
	BoardYear = Request.QueryString("Year")
	
	function GetPageByContent(ContentType)

		select case ContentType
			
			case "application/msword"
				
				GetPageByContent = "viewminutesword"
			
			case "application/pdf"
				
				GetPageByContent = "viewminutespdf"

			case "application/vnd.ms-excel"
				
				GetPageByContent = "viewminutesexcel"

			case "text/plain"
				
				GetPageByContent = "viewminutestext"

			case else
				
				GetPageByContent = "viewminutestext"
	
		end select
	
	end function
	
%>

<%if BoardYear = "" then %>
	<table cellpadding="5" cellspacing="0" border="0" width="98%">
		<tr>
			<td class="PageTitle">Board Minutes</td>
		</tr>	
		<tr>
			<td class="Content">View board minutes from the following years:</td>
		</tr>
		<tr>
			<td align="left">
				<table cellpadding="0" cellspacing="0" border="0" width=100%>
			<%	do while not rs.EOF %>
					<tr>
						<td class="SubHeader"><a href="index.asp?Year=<%=rs("MinutesYear")%>"><%=rs("MinutesYear")%></a></td>
					</tr>
			<%		rs.MoveNext
				loop
				rs.Close %>
				</table>
			</td>
		</tr>
	</table>

<%else%>

	<table cellpadding="5" cellspacing="0" border="0" width="98%">
		<tr>
			<td class="PageTitle"><%=BoardYear%> Board Minutes</td>
		</tr>	
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="left">
				<table cellpadding="0" cellspacing="0" border="0" width=100%>
					<tr>
						<td class="SubHeader">January</td>
						<td class="SubHeader">February</td>
					</tr>
					<tr>
						<td class="ContactInfo" valign=top>
				<%	
					'strSQL = "SELECT * FROM BoardMinutes WHERE MinutesYear = '" & BoardYear & "' AND MinutesMonth = 'January' ORDER BY nID"
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'January', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'February', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td class="SubHeader">March</td>
						<td class="SubHeader">April</td>					
					</tr>
					<tr>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'March', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'April', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td class="SubHeader">May</td>
						<td class="SubHeader">June</td>
					</tr>
					<tr>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'May', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'June', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td class="SubHeader">July</td>
						<td class="SubHeader">August</td>					
					</tr>
					<tr>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'July', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'August', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td class="SubHeader">September</td>
						<td class="SubHeader">October</td>
					</tr>
					<tr>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'September', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'October', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
					</tr>
					<tr>
						<td colspan=2>&nbsp;</td>
					</tr>
					<tr>
						<td class="SubHeader">November</td>
						<td class="SubHeader">December</td>					
					</tr>
					<tr>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'November', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBoardMinutesByYearMonth 'December', " & BoardYear
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop
					rs.Close %>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<%end if %>
<!--#include virtual="/include/templates/bottom.asa"-->