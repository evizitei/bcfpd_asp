<!-- #include virtual="/members_only/include/functions.asa"-->

<%
If Not Session("Authorized")(13) Then
    Response.Redirect "/members_only/index.asp"
End If
	
Set rsApplicant = Server.CreateObject("ADODB.Recordset")

' If there is a request to delete, delete the record.
'If Request.Form("Submit") = "Delete Contact" Then
	rsApplicant.Open "MOTF1JoinApplication", cnnBCFPD, 3, 3
		Do While Not rsApplicant.EOF
			If Request.Form("Delete" & rsApplicant("nID")) Then
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
		<td class="PageTitle">BCFPD Join Application</td>
    </tr>
	<tr>
		<td valign="bottom">
	
<%
		rsApplicant.Open "Select * From MOTF1JoinApplication Order By nID DESC", cnnBCFPD, 3 %>
	<!-- 9. A form is created that contains a table with delete capability, Headline hyper links, and date info.-->
	<form method="post" action="index.asp" id="form2" name="form2">
	<!-- 10. A table is created that will contain a delete check box, Headline links, and date info.-->
      <table border="1" cellpadding="1" cellspacing="0" bordercolor="#f2f2f2">
		<tr>
			<td class="SubHeaderCenter">Delete</td>
			<td class="subheadercenter">Name</td>
			<td class="subheadercenter">Email</td>
			<td class="subheadercenter">View Application</td>
		</tr>
		<!-- 11. Do While Loop to populate the table with database information.-->
		<% Do while not rsApplicant.EOF %>
		<tr>
			<td valign="top" align="center"><input type="checkbox" name="Delete<%=rsApplicant("nID")%>" value="true"></td>
			<td class="contactinfo"><%=rsApplicant("LastName") & ", " & rsApplicant("FirstName")%></td>
			<td class="contactinfo"><a class="update" href="mailto:<%=rsApplicant("Email")%>?subject=BCFPD Join Application"><%=rsApplicant("Email")%></a></td>
			<td align="center"><a class="update" target=_blank href="/applicationreports/default.aspx?nID=<%=rsApplicant("nID")%>">view details</a></td>
		</tr>
		<%	rsApplicant.MoveNext
			Loop
			
		%>
	</table>
	<tr>
		<td align="right" colspan="7">
			<a href="javascript:Delete();"><img SRC="/images/members/buttons/Delete.gif" border="0"></a>
			<img src="/images/spacer.gif" border="0" height="1" width="35">
			<a style="cursor: hand" OnClick="window.history.back();"><img src="/images/members/buttons/cancel.gif" border="0" width="45" height="34"></a>
		</td>
	</tr>

	</form>

<%	
   	rsApplicant.Close 
	set rsApplicant = Nothing
%>				   		
		</td>
	</tr>
</table>
<!--#include virtual="/members_only/include/templates/bottom.asa"-->
