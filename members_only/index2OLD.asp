<!--#include virtual="/members_only/include/functions.asa"-->
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->

<%


If Session("SessionAuthorized") Then

	strSQL = "bcfpdwebuser.spGetLogin " & Session("UserID") & ", " & Session("Password")
	set rsSecurity = cnnBCFPD.execute(strSQL)

 	FieldCount = rsSecurity.Fields.Count
 	ReDim arrFields(FieldCount)
 	For y = 4 to FieldCount - 1 
 		arrFields(y) = rsSecurity(y)
 	Next	
 	
 	if Session("UserID") = "bcfdmo" then
 		DefaultUser = true
 	else
 		DefaultUser = false
 	end if
 		 		
%>
		
<table cellpadding="5" cellspacing="0" border="0" width="95%">
	<tr>
		<td class="PageTitle"><%if not DefaultUser then %>
									Members Only Update Area
							  <%else%>
									Members Only Area
							  <%end if %>
							  <p></td>
	</tr>
	<tr>
		<td>
			<table width="50%" cellpadding="0" cellspacing="1" border="0">
			<%	If arrFields(17) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">All Call<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="all_call/index.asp">All Call</a></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			<%	End If
				If arrFields(13) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Applications<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
								<tr>
									<td><a class="update" HREF="/members_only/applications/BCFPD_Join/index.asp">BCFPD Join Application</a></td>
								</tr>
								<tr>
									<td><a class="update"  HREF="/members_only/applications/MOTF1_Join/index.asp">MO-TF1 Join Application</a></td>
								</tr>
								<tr>
									<td><a class="update" HREF="/members_only/applications/Perserverence_Donation/index.asp">Perseverance Join Application</a></td>
								</tr>
								<tr>
									<td><a class="update"  HREF="/members_only/applications/SKInfo_Request/index.asp">Survival Kids Information Request Application</a></td>
								</tr>
								<tr>
									<td><a class="update"  HREF="/members_only/applications/Wildland_join/index.asp">Wildland Join Information Request Application</a><p></td>
								</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				 If arrFields(16) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Board<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="board/index.asp">Board Minutes</a></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				If arrFields(18) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Budget<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="budget/index.asp">Budget</a></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			<%	End If
				If arrFields(8) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Calendars<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" href="calendars/intro.asp">Calendar List</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
			 	If arrFields(4) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Contact Us<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
								<tr>
									<td><a class="update" HREF="/members_only/contact_us/stations/index.asp">Stations</a></td>
								</tr>
								<tr>
									<td><a class="update"  HREF="/members_only/contact_us/personnel/index.asp">Personnel</a><p></td>
								</tr>
						</table><p>

					</td>
				 </tr>
			 <%	End If
				 If arrFields(15) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Emergency Preparedness<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="emrgprep_library/index.asp">Library Categories</a></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				If arrFields(11) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">FEMA Rotation<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="fema_rotation/index.asp">Rotation Schedule</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>

			 <%	End If
				If arrFields(12) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Incident Reporting<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="/members_only/incident_reporting/index.asp">Incident Reporting</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				If arrFields(9) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">MOTF1 Library<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="motf1_library/index.asp">Library Categories</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				If arrFields(10) Then%><tr>
				<tr>
					<td width="100%" class="UpdateHeader">MOTF1 Rotation<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="motf1_rotation/index.asp">Rotation Schedule</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				If arrFields(7) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">News<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" href="news/index.asp">News Stories</a></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				If arrFields(5) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Photo Gallery<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update"  href="/members_only/photo_gallery/images/index.asp">Photos</a></td>
							</tr>
							<tr>
								<td><a class="update"  href="/members_only/photo_gallery/video/index.asp">Video</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				If arrFields(19) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Positions Available<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="employment/index.asp">Career Opportunities</a></td>
							</tr>
							<tr>
								<td><a class="update" HREF="volunteer/index.asp">Volunteer Opportunities</a></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			<%	End If
				If arrFields(6) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Quick Links<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="quick_links/intro.asp">Pages</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If
				 If arrFields(14) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Security<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="security/index.asp">Security</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If 
				 If arrFields(20) Then%>
				<tr>
					<td width="100%" class="UpdateHeader">Training Opportunities<hr noshade size="1"></td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td><a class="update" HREF="training_library/index.asp">Library Categories</a><p></td>
							</tr>
						</table><p>
					</td>
				 </tr>
			 <%	End If %>

			</table>
		</td>
	</tr>
</table>
				
<% 
Else 

	if Request.QueryString("Login") = "True" then %>
          <table border="0" cellpadding="5" cellspacing="0">
            <tr>
			  <td>
				<dd><font color=DarkRed size="3"><strong>Please login:</strong></font>
				    <form method="POST" action="<%=Request("SCRIPT_NAME")%>" id="form1" name="form1">
				      <table width="234">
				        <tr>
				          <td align="right" nowrap><strong><font color=DarkRed face="Arial, Helvetica, sans serif" size="2">UserID: </font></strong></td>
				          <td width="81"><input type="text" name="UserID" size="10" value="<%=Session("UserID")%>"></td>
				        </tr>
				        <tr>
				          <td align="right" nowrap><strong><font color=DarkRed face="Arial, Helvetica, sans serif" size="2">Password: </font></strong></td>
				          <td width="81"><input type="password" name="Password" size="10"></td>
				        </tr>
				        <tr>
				          <td width="145"></td>
				          <td width="81"><input type="submit" value="Login..." id="submit1" name="submit1"></td>
				        </tr>
				      </table>
				    </form>
				</td>
			  </tr>
			</table>
			<script language="JavaScript">
				document.form1.UserID.focus();
			</script>

<%	
	else
%>
	<img src="/images/spacer.gif" border="0" width="1" height="500">

<%
	End if
End If
%>

</ul>

<!--#include virtual="/members_only/include/templates/bottom.asa"-->
