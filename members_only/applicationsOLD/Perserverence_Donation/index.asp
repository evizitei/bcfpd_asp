<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(13) Then
    Response.Redirect "/members_only/index.asp"
End If
	
Dim Application_ID
Application_ID = GetVal("Application_ID", "")

' 2. Create a Recordset Object
Set rsApplicant = Server.CreateObject("ADODB.Recordset")

' If there is a request to delete, delete the record.
'If Request.Form("Submit") = "Delete Contact" Then
	rsApplicant.Open "Application_Perserverence", cnnBCFPD, 3, 3
		Do While Not rsApplicant.EOF
			If Request.Form("Delete" & rsApplicant("Application_ID")) Then
				rsApplicant.Delete
			End If
		rsApplicant.MoveNext
		Loop
	rsApplicant.Close
'End If


%>									
<!--#include virtual="/members_only/include/templates/top.asa"-->
<!--#include virtual="/members_only/include/templates/members.asa"-->
<table width="98%" border="0" cellspacing="0" cellpadding="5" bordercolor="orange">
	<tr>
		<td class="PageTitle">Perseverance Information Request Application</td>
    </tr>
	<tr>
		<td valign="bottom">
	
	<%rsApplicant.Open "Select * From Application_Perserverence Order By Namereq ASC", cnnBCFPD, 3 %>
	<!-- 9. A form is created that contains a table with delete capability, Headline hyper links, and date info.-->
	<form method="post" action="index.asp" id=form2 name=form2>
	<!-- 10. A table is created that will contain a delete check box, Headline links, and date info.-->
      <table border="1" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
		<tr>
			<td class="SubHeaderCenter">Delete</td>
			<td class="subheadercenter" >Name</td>
			<td class="subheadercenter">Title</td>
			<td class="subheadercenter">Address</td>
			<td class="subheadercenter">City</td>
			<td class="subheadercenter">State</td>
			<td class="subheadercenter">Zip</td>
			<td class="subheadercenter">Work Phone</td>
			<td class="subheadercenter">Home Phone</td>
			<td class="subheadercenter">Fax</td>
			<td class="subheadercenter">E-mail</td>
		</tr>
		<!-- 11. Do While Loop to populate the table with database information.-->
		<% Do while not rsApplicant.EOF %>
		<tr>
			<td valign="top" align="center"><input type="checkbox" name="Delete<%=rsApplicant("Application_ID")%>" value="true"></td>
			<td valign="top" class="contactinfo"><%=rsApplicant("Namereq")%></td>
			<td valign="top" class="contactinfo"><%=rsApplicant("Title")%></td>
			<td valign="top"  class="contactinfo"><%=rsApplicant("Address1req")%>
				<% if rsApplicant("Address2") <> "" then%>
				<%=	"--" & rsApplicant("Address2") %>
				<% end if%>
			</td>
			<td valign="top" class="contactinfo"><%=rsApplicant("Cityreq")%></td>
			<td valign="top"  class="contactinfo"><%=rsApplicant("Statereq")%></td>
			<td valign="top"  class="contactinfo"><%=rsApplicant("Zipreq")%></td>
			<td valign="top"  class="contactinfo"><%=rsApplicant("Day_Time_Phonereq")%></td>
			<td valign="top"  class="contactinfo"><%=rsApplicant("Night_Time_Phone")%></td>
			<td valign="top"  class="contactinfo"><%=rsApplicant("Fax")%></td>
			<td valign="top"  class="contactinfo"><%=rsApplicant("Email")%></td>
		</tr>
		<%	rsApplicant.MoveNext
			Loop
		   	rsApplicant.Close 
			
		%>
	</table>
	<tr>
		<td align="right" colspan="11">
			<a href="javascript:Delete();"><img SRC="/images/members/buttons/Delete.gif" border="0"></a>
			<img src="/images/spacer.gif" border="0" height="1" width="35">
			<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
		</td>
	</tr>

	</form>

<%	
	set rsApplicant = Nothing
%>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
