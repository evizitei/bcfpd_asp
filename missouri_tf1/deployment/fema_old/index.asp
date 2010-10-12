<!-- #include virtual="/members_only/include/functions.asa"-->
<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/motf1.asa"-->
<%
	Dim Remainder
	set rsRotation = Server.CreateObject("ADODB.Recordset")
	rsRotation.Open "Select * from Fema_Rotation", cnnMain, 3
	ArrRotation = rsRotation.GetRows	rsRotation.Close	set rsRotation = nothing

%>

<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">FEMA Deployment Schedule</td>
	</tr>	
	<tr>
		<td align="left" width="100%">
			<table  border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
				    <td width="100%">
						<table width="100%" border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
							<tr>
								<td class="SubHeader" >Region</td>
								<td class="SubHeader">1st Due</td>
								<td class="SubHeader">2nd Due</td>
								<td class="SubHeader">3rd Due</td>
								<td class="SubHeader">4th Due</td>
								<td class="SubHeader">5th Due</td>
								<td class="SubHeader">6th Due</td>
								<td class="SubHeader">7th Due</td>
								<td class="SubHeader">8th Due</td>
								<td class="SubHeader">9th Due</td>
							</tr>
							<tr>
					<%	for Rows = 0 to 35
							Remainder = Rows Mod 3
							if Remainder = 0 then %>
								<td colspan="10" class=RotationHeader><%=MonthName(ArrRotation(1, Rows))%></td>
					<%		end if %>
							</tr>
							<tr>
								<td class="RotationRegion"><nobr><%=ArrRotation(2, Rows)%></nobr></td>
					<%		for Cols = 3 to 11%>
								<td align="center" <%ReturnClass ArrRotation(Cols, Rows), "MO-TF1", "MOTF1", ""%> ><font size="1"><nobr><%=ArrRotation(Cols, Rows)%></nobr></font></td>
					<%		next%>
							</tr>
					<%	next%>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!--#include virtual="/include/templates/bottom.asa"-->
