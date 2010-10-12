<%
    if len(Request.Servervariables("Query_String")) > 40 then
        response.clear
        response.write "Invalid page access"
        response.end
    end if 
%>

<!-- #include virtual="/members_only/include/functions.asa"-->
<%
	dim rs, AllCallYear
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT DISTINCT AllCallYear FROM AllCall ORDER BY AllCallYear DESC"
	set rs = cnnBCFPD.execute(strSQL)
	
	AllCallYear = Request.QueryString("Year")
	
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
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->

<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td align="left">
<%if AllCallYear = "" then %>
	<table cellpadding="5" cellspacing="0" border="0" width="98%">
		<tr>
			<td class="PageTitle">All Call</td>
		</tr>	
		<tr>
			<td align="left">
				<table cellpadding="0" cellspacing="0" border="0" width=100%>
			<%	do while not rs.EOF %>
					<tr>
						<td class="SubHeader"><a href="index.asp?Year=<%=rs("AllCallYear")%>"><%=rs("AllCallYear")%></a></td>
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
			<td class="PageTitle"><%=AllCallYear%> All Call</td>
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
					strSQL = "SELECT * FROM AllCall WHERE AllCallYear = '" & AllCallYear & "' ORDER BY DateEntered ASC"
					set rs = cnnBCFPD.execute(strSQL)
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
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
