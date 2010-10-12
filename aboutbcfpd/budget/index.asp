<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/about.asa"-->
<%
	dim rs, BudgetYear
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT DISTINCT BudgetYear FROM Budget ORDER BY BudgetYear DESC"
	set rs = cnnMain.execute(strSQL)
	
	BudgetYear = Request.QueryString("Year")
	
	function GetPageByContent(ContentType)

		select case ContentType
			
			case "application/msword"
				
				GetPageByContent = "viewword"
			
			case "application/pdf"
				
				GetPageByContent = "viewpdf"

			case "application/vnd.ms-excel"
				
				GetPageByContent = "viewexcel"

			case "text/plain"
				
				GetPageByContent = "viewtext"

			case else
				
				GetPageByContent = "viewtext"
	
		end select
	
	end function
	
%>

<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td align="left">
<%if BudgetYear = "" then %>
	<table cellpadding="5" cellspacing="0" border="0" width="98%">
		<tr>
			<td class="PageTitle">Budget</td>
		</tr>	
		<tr>
			<td align="left">
				<table cellpadding="0" cellspacing="0" border="0" width=100%>
			<%	do while not rs.EOF %>
					<tr>
						<td class="SubHeader"><a href="index.asp?Year=<%=rs("BudgetYear")%>"><%=rs("BudgetYear")%></a></td>
					</tr>
			<%		rs.MoveNext
				loop
				rs.Close %>
				</table>
			</td>
		</tr>
	</table>

<%else
%>
	<table cellpadding="5" cellspacing="0" border="0" width="98%">
		<tr>
			<td class="PageTitle"><%=BudgetYear%> Budget</td>
		</tr>	
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="left">
				<table cellpadding="0" cellspacing="0" border="0" width=100%>
					<tr>
						<td class="ContactInfo" valign=top>
				<%	
					strSQL = "bcfpdwebuser.spGetBudgetByYear '" & BudgetYear & "'"
					set rs = cnnMain.execute(strSQL)
					do while not rs.eof %>					
							<a target="_blank" href="<%=GetPageByContent(rs("ContentType"))%>.asp?nid=<%=rs("nID")%>"><%=rs("FileName")%></a><br>
				<%		rs.MoveNext 
					loop %>
						</td>
					</tr>
				<%	rs.Close %>
				</table>
			</td>
		</tr>
	</table>
<%end if %>


		</td>
	</tr>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->