<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/join.asa"-->
<%
	dim rs
	set rs = server.CreateObject("ADODB.Recordset")
	strSQL = "SELECT * FROM bcfpdwebuser.tblFemaPositions"
	set rs = cnnMain.execute(strSQL)
	
%>

<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td align="left">
			<table cellpadding="5" cellspacing="0" border="0" width="98%">
				<tr>
					<td class="PageTitle">MO-TF1 Positions</td>
				</tr>	
			<%	if not rs.EOF then %>
				<tr>
					<td align="left">
						<table cellpadding="4" cellspacing="0" border="1">
			<%			do while not rs.eof %>					
							<tr>
								<td class="SubHeader"><%=rs("Position")%></td>
								<td class="AppLabel"><a target="_blank" href="/missouri_tf1/motf1application/Default.aspx?PositionID=<%=rs("nID")%>">Application</a></td>
							</tr>
			<%				rs.MoveNext 
						loop 
						rs.Close %>
						</table>
					</td>
				</tr>
			<%	end if %>
			
			</table>
		</td>
	</tr>
</table>
<!--#include virtual="/include/templates/bottom.asa"-->