<%@ Control Language="VB" AutoEventWireup="false" CodeFile="EmployersInfo.ascx.vb" Inherits="EmployersInfo" %>
<table border=0 cellpadding=0 cellspacing=0>
	<tr>
		<td>Employer Name:</td>
		<td>
			<asp:TextBox runat="server" ID="txtEmployerName"></asp:TextBox></td>
	</tr>
	<tr>	
		<td>Position:</td>
		<td>
			<asp:TextBox ID="txtPosition" runat="server"></asp:TextBox></td>
	</tr>
	<tr>
		<td>Start Date:</td>
		<td>
			<asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox></td>
	</tr>
	<tr>
		<td>End Date:</td>
		<td>
			<asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox></td>	
	</tr>
	<tr>
		<td>Add Additional Employer?</td>
		<td>
			<asp:CheckBox runat="server" ID="chkAdditionalEmployer" AutoPostBack="True" Text="Yes" /></td>	
	</tr>

</table>
