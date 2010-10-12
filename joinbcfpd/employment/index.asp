<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/join.asa"-->
<%
	dim rs, BudgetYear
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT * FROM EmploymentOpportunities ORDER BY JobTitle ASC"
	set rs = cnnMain.execute(strSQL)
	
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
			<table cellpadding="5" cellspacing="0" border="0" width="98%">
				<tr>
					<td class="PageTitle">Career Opportunities</td>
				</tr>	
			<%	if not rs.EOF then %>
				<tr>
					<td align="left">
						<table cellpadding="4" cellspacing="0" border="1">
			<%			do while not rs.eof %>					
							<tr>
								<td class="SubHeader"><%=rs("JobTitle")%></td>
								<td class="AppLabel"><a target="_blank" href="<%=GetPageByContent(rs("JobDescriptionContentType"))%>.asp?nid=<%=rs("nID")%>&Document=JobDescription">Job Description</a></td>
								<td class="AppLabel"><a target="_blank" href="<%=GetPageByContent(rs("JobApplicationContentType"))%>.asp?nid=<%=rs("nID")%>&Document=JobApplication">Job Application</a></td>
							</tr>
			<%				rs.MoveNext 
						loop 
						rs.Close %>
						</table>
					</td>
				</tr>
			<%	else %>
				<tr>
					<td><font size="2" color="#CC0000">We do not have open postions at this time. Please check back later for career opportunities.</font></td>
				</tr>
			<%	end if %>
			
			</table>
		</td>
	</tr>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->