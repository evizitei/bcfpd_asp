<!-- #include virtual="/include/constants/database.asa"-->
<!-- #include virtual="/members_only/include/functions.asa"-->
<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/motf1.asa"-->
<%
	Dim Remainder
	set rsRotation = Server.CreateObject("ADODB.Recordset")
	rsRotation.Open "Select * from Fema_Rotation", cnnMain, 3
	ArrRotation = rsRotation.GetRows	rsRotation.Close	set rsRotation = nothing

%>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td class="PageTitle">FEMA Deployment Schedule</td>
	</tr>	
	<tr>
		<td width="100%" valign="bottom" >
			<table border="0" cellpadding="3" cellspacing="0">
				<tr>
					<td></td>
				    <td>
						<table border="1" cellpadding="5" cellspacing="0" bordercolor="#f2f2f2">
							<tr>
								<td class="RotationHeader">Month</td>
								<td class="RotationHeader">Region</td>
								<td class="RotationHeader">1st Due</td>
								<td class="RotationHeader">2nd Due</td>
								<td class="RotationHeader">3rd Due</td>
								<td class="RotationHeader">4th Due</td>
								<td class="RotationHeader">5th Due</td>
								<td class="RotationHeader">6th Due</td>
								<td class="RotationHeader">7th Due</td>
								<td class="RotationHeader">8th Due</td>
								<td class="RotationHeader">9th Due</td>
							</tr>
							<tr>
					<%	for Rows = 0 to 35
							Remainder = Rows Mod 3
							if Remainder = 0 then %>
								<td rowspan="3" class=AppLabel><%=MonthName(ArrRotation(1, Rows))%></td>
					<%		end if %>
							<td class=AppLabel><nobr><%=ArrRotation(2, Rows)%></nobr></td>
					<%		for Cols = 3 to 11%>
								<td <%ReturnClass ArrRotation(Cols, Rows), "MO-TF1", "MOTF1"%> ><%=ArrRotation(Cols, Rows)%></td>
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
