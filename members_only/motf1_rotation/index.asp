<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(10) Then
    Response.Redirect "/members_only/index.asp"
End If

' Create a recordset object called rsRotation.
	set rsRotation = Server.CreateObject("ADODB.Recordset")

	If Request.Form("Submit") = "Save" then
		rsRotation.Open "SELECT * FROM TF_Rotation", cnnBCFPD,3,3 
		For each item in Request.Form("Primary_Force")
			rsRotation("Primary_Force") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
		
		rsRotation.Open "SELECT * FROM TF_Rotation", cnnBCFPD,3,3 
		For each item in Request.Form("Secondary_Force")
			rsRotation("Secondary_Force") = item
			rsRotation.Update
			rsRotation.MoveNext 
		next
		rsRotation.close
	end if

	%>
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<form method="POST" action="index.asp" id="form1" name="form1">

<table border="0" width="98%" cellspacing="0" cellpadding="5">
	<tr>
		<td class="PageTitle">MOTF1 Rotation Schedule</td>
    </tr>
	<tr>
		<td width="100%" valign="bottom">
			<table border="0" cellpadding="3" cellspacing="3">
				<tr>
					<td></td>
				    <td>
						<table border="0" cellpadding="5" cellspacing="5" bordercolor="#f2f2f2">
							<tr>
								<td class="subheadercenter">Month</td>
								<td class="subheadercenter">Primary Force</td>
								<td class="subheadercenter">Secondary Force</td>
							</tr>
			<%				rsRotation.Open "SELECT * FROM TF_Rotation ORDER BY Rotation_ID", cnnBCFPD,3  
							do while not rsRotation.eof %>
							<tr>
								<td class="AppLabel"><%=rsRotation("Month")%></td>
								<td align="center"><select id="select1" name="Primary_Force">
										<option <% if rsRotation("Primary_Force") = "Blue" then%>selected<%end if%>>Blue</option>
										<option <% if rsRotation("Primary_Force") = "Red" then%>selected<%end if%>>Red</option>
										<option <% if rsRotation("Primary_Force") = "White" then%>selected<%end if%>>White</option>
									</select>
								</td>
								<td align="center"><select id="select1" name="Secondary_Force">
										<option <% if rsRotation("Secondary_Force") = "Blue" then%>selected<%end if%>>Blue</option>
										<option <% if rsRotation("Secondary_Force") = "Red" then%>selected<%end if%>>Red</option>
										<option <% if rsRotation("Secondary_Force") = "White" then%>selected<%end if%>>White</option>
									</select>
								</td>
							</tr>
			<%
								rsRotation.MoveNext 
							loop
							rsRotation.close			%>
							<tr>
								<td align="right" colspan="6">
									<a href="javascript:submit(document.form1, 'Save');"><img SRC="/images/members/buttons/save.gif" border="0"></a>
									<img src="/images/spacer.gif" border="0" height="1" width="35">
									<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
									<input type="hidden" name="Submit">
								</td>
							</tr>
					</table>
				 </td>
				</tr>
			</table>
		</td>
	</tr>
</table>

	</form>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
