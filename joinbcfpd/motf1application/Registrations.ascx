<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Registrations.ascx.vb" Inherits="Registrations" %>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<table width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width=285>License/Registration:</td>
		<td>
			<asp:TextBox runat="server" ID="txtRegistration" TextMode="MultiLine" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>License Number:</td>
		<td>
			<asp:TextBox runat="server" ID="txtLicenseNumber" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>Issued By:</td>
		<td>
			<asp:TextBox runat="server" ID="txtIssuer" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td style="height: 24px">Expiration Date:</td>
		<td style="height: 24px">
			<asp:TextBox runat="server" ID="txtExpDate" Width="300px"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td class="AppLabel"><asp:CheckBox ID="chkAddLicense" runat="server" Text="Add another license/registration?" AutoPostBack="True" /></td>
	</tr>

</table>
