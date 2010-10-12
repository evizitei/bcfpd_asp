<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Register Src="Registrations.ascx" TagName="Registrations" TagPrefix="uc2" %>

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Boone County Fire Protection District - Join Application</title>
<script language="javascript">
	function changeImage(imagename,imagesrc)
	{
		if (ver == "n2") return false;
		document.images[imagename].src=imagesrc.src;
		return true;
	}
	
	bName = navigator.appName;
    bVer = parseInt(navigator.appVersion);

	if      (bName == "Netscape" && bVer >= 3) ver = "n3";
        else if (bName == "Netscape" && bVer == 2) ver = "n2";
        else if (bName == "Microsoft Internet Explorer" && bVer >= 3) ver = "n3";
	else if (bName == "Microsoft Internet Explorer" && bVer < 3) ver = "n2";
	if (ver != "n2") {
		
		buttonoffa = new Image();
		buttonoffa.src = "http://www.bcfdmo.com/images/top_template/left_navigation/aboutoff.gif";
		buttonona = new Image ();
		buttonona.src = "http://www.bcfdmo.com/images/top_template/left_navigation/abouton.gif";
		
		buttonoffb = new Image();
		buttonoffb.src = "http://www.bcfdmo.com/images/top_template/left_navigation/servicesoff.gif";
		buttononb = new Image ();
		buttononb.src = "http://www.bcfdmo.com/images/top_template/left_navigation/serviceson.gif";
		
		buttonoffc = new Image();
		buttonoffc.src = "http://www.bcfdmo.com/images/top_template/left_navigation/kidsoff.gif";
		buttononc = new Image ();
		buttononc.src = "http://www.bcfdmo.com/images/top_template/left_navigation/kidson.gif";
		
		buttonoffd = new Image();
		buttonoffd.src = "http://www.bcfdmo.com/images/top_template/left_navigation/task1off.gif";
		buttonond = new Image ();
		buttonond.src = "http://www.bcfdmo.com/images/top_template/left_navigation/task1on.gif";
		
		buttonoffe = new Image();
		buttonoffe.src = "http://www.bcfdmo.com/images/top_template/left_navigation/wildlandoff.gif";
		buttonone = new Image ();
		buttonone.src = "http://www.bcfdmo.com/images/top_template/left_navigation/wildlandon.gif";
		
		buttonofff = new Image();
		buttonofff.src = "http://www.bcfdmo.com/images/top_template/left_navigation/perservoff.gif";
		buttononf = new Image ();
		buttononf.src = "http://www.bcfdmo.com/images/top_template/left_navigation/perservon.gif";
		
		buttonoffg = new Image();
		buttonoffg.src = "http://www.bcfdmo.com/images/top_template/left_navigation/emrg_prepoff.gif";
		buttonong = new Image ();
		buttonong.src = "http://www.bcfdmo.com/images/top_template/left_navigation/emrg_prepon.gif";
	
		buttonoffh = new Image();
		buttonoffh.src = "http://www.bcfdmo.com/images/top_template/left_navigation/TrainingInteriorOFF.gif";
		buttononh = new Image ();
		buttononh.src = "http://www.bcfdmo.com/images/top_template/left_navigation/TrainingInteriorON.gif";
		
	} else {
		buttonoff = "";
		buttonon = "";
	
	}



</script>
<style type="text/css">
BODY {
	
    FONT-FAMILY: Verdana;
    padding-top: 0px;
    margin-top: 0px
}
A
{
    FONT-SIZE: 10pt;
    COLOR: #cc0000;
    TEXT-DECORATION: none
}
A.NavLinks
{
    FONT-WEIGHT: normal;
    FONT-SIZE: 8pt;
    COLOR: red;
    FONT-FAMILY: Verdana
}
A.menutext
{
    FONT-WEIGHT: normal;
    FONT-SIZE: xx-small;
    COLOR: white;
    FONT-FAMILY: Verdana, Tahoma, Arial;
    TEXT-DECORATION: none
}
A.menutext:hover
{
    COLOR: yellow
}
A.QuickLink
{
    COLOR: white
}
A.QuickLink:hover
{
    COLOR: #cc0000
}
A.FireLink
{
    COLOR: #cc0000
}
A.FireLink:hover
{
    COLOR: white
}
A.Public
{
    FONT-WEIGHT: bold;
    COLOR: #cc0000
}
A.Public:hover
{
    FONT-WEIGHT: bold;
    COLOR: #cc0000;
    TEXT-DECORATION: underline
}
A.News
{
    FONT-WEIGHT: normal;
    COLOR: #cc0000
}
A.News:hover
{
    FONT-WEIGHT: normal;
    COLOR: #cc0000;
    TEXT-DECORATION: underline
}
A.Image
{
    COLOR: black
}
A.Image:hover
{
    COLOR: black
}
A.Image:visited
{
    COLOR: black
}
.menubox
{
    DISPLAY: none;
    PADDING-LEFT: 0px;
    Z-INDEX: 9;
    PADDING-BOTTOM: 7px;
    POSITION: absolute;
    BACKGROUND-COLOR: #330099
}
TD.PageTitle
{
    FONT-WEIGHT: 900;
    FONT-SIZE: 12pt;
    COLOR: #330099;
    FONT-FAMILY: 'Trebuchet MS'
}
TD.SubHeader
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 8pt;
    COLOR: #330099;
    TEXT-ALIGN: left
}
TD.SubHeaderCenter
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 8pt;
    COLOR: #330099;
    TEXT-ALIGN: center
}
TD.RotationHeader
{
    FONT-SIZE: 8pt;
    COLOR: white;
    BACKGROUND-COLOR: #330099;
    TEXT-ALIGN: center
}
TD.ContactInfo
{
    FONT-SIZE: 8pt
}
TD.AppLabel
{
    FONT-SIZE: 8pt;
    FONT-FAMILY: Arial
}
TD.AppLabelRequired
{
    FONT-SIZE: 8pt;
    FONT-FAMILY: Arial;
	font-weight: bold
}

TD.RotationLabel
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 10pt;
    FONT-FAMILY: Arial
}
TD.MOTF1
{
    COLOR: white;
    BACKGROUND-COLOR: #cc0000
}
TD.RotationRegion
{
    FONT-SIZE: 8pt;
    FONT-FAMILY: 'Trebuchet MS'
}
TD.Content
{
    FONT-SIZE: 10pt
}
.Caption
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 7pt;
    COLOR: #1b00a1;
    FONT-FAMILY: Arial MT
}
A.FAQ
{
    FONT-WEIGHT: bold;
    COLOR: #330099
}
TD.Header
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 10pt;
    COLOR: white;
    BACKGROUND-COLOR: #330099;
    TEXT-ALIGN: left
}
TD.MainBody
{
    PADDING-RIGHT: 0px;
    MARGIN-RIGHT: 10px;
    PADDING-TOP: 0mm
}
TABLE.Body
{
    WIDTH: 95%
}
TD.UpdateHeader
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 12pt;
    COLOR: #330099;
    FONT-FAMILY: Arial;
    TEXT-ALIGN: center
}
TD.SKQuestion
{
    FONT-SIZE: 10pt
}
TD.SKAnswer
{
    FONT-SIZE: 10pt
}
TD.SKIntro
{
    FONT-SIZE: 10pt
}
.SKLesson
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 12pt;
    COLOR: #cc0000
}
TD.SKPass
{
    FONT-SIZE: 10pt;
    COLOR: #330099
}
TD.SKFail
{
    FONT-SIZE: 10pt;
    COLOR: #cc0000
}
TD.NewsLink
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 4pt;
    COLOR: black;
    FONT-FAMILY: Arial
}
TD.FAQ
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 10pt
}
TD.TableHeader
{
    FONT-WEIGHT: bold;
    FONT-SIZE: 10pt;
    COLOR: white;
    BACKGROUND-COLOR: #330099
}
TD.TableContent
{
    FONT-SIZE: 10pt;
    BACKGROUND-COLOR: white
}

</style>
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body bgcolor="black">
    <form id="form1" runat="server">
    <div>

<table cellspacing="0" cellpadding="0" width="980" border="0" bordercolor="yellow">
	<tr>
		<td width="72" valign=bottom >
			<table cellspacing="0" cellpadding="0" border="0" bordercolor=silver >
				<tr>
					<td><a title="Home" href="/"><img src="http://www.bcfdmo.com/images/about/BCFPDlogo.gif" border="0"></a></td>
				</tr>
			</table>
		</td>
		<td>
			<table  cellspacing="0" width=100% cellpadding="0" border="0" bordercolor=green>
				<tr>
					<td valign=bottom width=100%><img src="http://www.bcfdmo.com/images/top_template/BCFPDheadertext2.gif" border="0" width="245" height="64"></td>
					<td bgcolor="black" width=145>
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td bgcolor="black" style="height: 93px"><a href="/aboutbcfpd/photo_gallery/intro.asp"><img src="http://www.bcfdmo.com/images/PhotoCamera.gif" border="0" width="145" height="56"></a></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<table cellspacing="0" cellpadding="0" border="0">
							<tr>
								<td rowspan="2"><img SRC="http://www.bcfdmo.com/images/top_template/Topleftshadowbox.gif" border="0" width="20" height="26"></td>
								<td><img SRC="http://www.bcfdmo.com/images/join/joinourteam.gif" border=0></td>
								<td bgcolor="black" rowspan="2"><img SRC="http://www.bcfdmo.com/images/spacer.gif" width="24" height="26" border="0"></td>
							</tr>
							<tr>
								<td bgcolor="black"><img SRC="http://www.bcfdmo.com/images/top_template/Top5pixelSpacer.gif" border="0" width="573" height="5"><img SRC="http://www.bcfdmo.com/images/spacer.gif" width="11" height="1" border="0"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table border=0 bordercolor=red  cellpadding=0 cellspacing=0 width="1000">
	<tr>
		<td valign="top" colspan="3" height="100%">
			<table cellspacing="0" width=100% height="100%" cellpadding="0" border="0" bordercolor="green">
				<tr>
					<td width="92" bgcolor="black" height="100%" valign="top">
						<table cellspacing="0" height="100%" cellpadding="0" border="0" bordercolor="pink">
							<tr>
								<td height="100%" bgcolor="black" valign="top">			
									<table cellspacing="0" cellpadding="0" border="0" bordercolor="yellow">
										<tr>
											<td width="92" height="20"><img SRC="http://www.bcfdmo.com/images/top_template/left_navigation/NavSlice1.gif" border="0" width="92" height="20"></td>
										</tr>
										<tr>
											<td width="92" height="27"><a href="/aboutbcfpd/index.asp" onmouseover="changeImage('a',buttonona);" onmouseout="changeImage('a',buttonoffa);"><img name="a" SRC="http://www.bcfdmo.com/images/top_template/left_navigation/AboutOff.gif" border="0" width="92" height="27"></a></td>
										</tr>
										<tr>
											<td width="92" height="28"><a href="/services/index.asp" onmouseover="changeImage('b',buttononb);" onmouseout="changeImage('b',buttonoffb);"><img name="b" SRC="http://www.bcfdmo.com/images/top_template/left_navigation/ServicesOff.gif" border="0" width="92" height="28"></a></td>
										</tr>
										<tr>
											<td width="92" height="27"><a href="/survival_kids/index.asp" onmouseover="changeImage('c',buttononc);" onmouseout="changeImage('c',buttonoffc);"><img name="c" SRC="http://www.bcfdmo.com/images/top_template/left_navigation/KidsOff.gif" border="0" width="92" height="27"></a></td>
										</tr>
										<tr>
											<td width="92" height="26"><a href="/missouri_tf1/index.asp" onmouseover="changeImage('d',buttonond);" onmouseout="changeImage('d',buttonoffd);"><img name="d" SRC="http://www.bcfdmo.com/images/top_template/left_navigation/Task1Off.gif" border="0" width="92" height="26"></a></td>
										</tr>
										<tr>
											<td width="92" height="27"><a href="/wildland/index.asp" onmouseover="changeImage('e',buttonone);" onmouseout="changeImage('e',buttonoffe);"><img name="e" SRC="http://www.bcfdmo.com/images/top_template/left_navigation/WildlandOff.gif" border="0" width="92" height="27"></a></td>
										</tr>
										<tr>
											<td><a href="/training/index.asp" onmouseover="changeImage('h',buttononh);" onmouseout="changeImage('h',buttonoffh);"><img name="h" SRC="http://www.bcfdmo.com/images/top_template/left_navigation/TrainingInteriorOFF.gif" border="0" ></a></td>
										</tr>
										<tr>
											<td width="92" height="28"><a href="/emrgprep/index.asp" onmouseover="changeImage('g',buttonong);" onmouseout="changeImage('g',buttonoffg);"><img name="g" SRC="http://www.bcfdmo.com/images/top_template/left_navigation/emrg_prepoff.gif" border="0" width="92" height="30" ></a></td>
										</tr>
										<tr>
											<td width="92" height="31"><img SRC="http://www.bcfdmo.com/images/top_template/left_navigation/NavSlice2.gif" border="0" width="92" height="31"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="92" bgcolor="black" valign="bottom"><a href="/joinbcfpd/index.asp"><img SRC="http://www.bcfdmo.com/images/bottom_template/Joingraphic.gif" border="0" width="92" height="71"></a></td>
							</tr>
							<tr>
								<td width="92" height="78" bgcolor="black" valign="bottom"><img SRC="http://www.bcfdmo.com/images/spacer.gif" width="92" height="78" border="0"></td>
							</tr>
						</table>
					</td>
					<td class="MainBody" bgcolor="white" width="100%" valign="top">
					
						<table cellpadding="5" cellspacing="0" border="0" bordercolor=yellow  width="98%">
							<tr>
								<td class="PageTitle">Urban Search and Rescue Task Force Member Application</td>
							</tr>	
							<tr>
								<td><font size="1"><strong>Items in bold are required.</strong></font></td>
							</tr>
							<tr>
								<td>				
										  <table width="100%" border="0" cellpadding="3" cellspacing="0" bordercolor="#f2f2f2">
												<tr>
													<td class="Header" colspan="2">Personal Information</td>
												</tr>
												<tr>
													<td class="AppLabel"><b>Position Applying For:</b></td>
													<td class="AppLabel">
														<asp:Label ID="lblPosition" runat="server" Text="Label"></asp:Label></td>
												</tr>
												<tr>
													<td class="AppLabel"><b>Last Name:</b></td>
													<td><asp:TextBox runat="server" id="txtLastName" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required." SetFocusOnError="True" CssClass="RequiredField" Font-Bold="True" Font-Size="X-Small"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>First Name:</b></td>
													<td><asp:TextBox runat="server" id="txtFirstName" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Middle Name:</b></td>
													<td><asp:TextBox runat="server" id="txtMiddleName" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMiddleName" ErrorMessage="Middle Name is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>
												<tr>
													<td class="AppLabel"><b>Home Address 1:</b></td>
													<td>
														<asp:TextBox runat="server" ID="txtAddress1" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress1" ErrorMessage="Home Address is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel">Home Address 2:</td>
													<td><asp:TextBox runat="server" ID="txtAddress2" Width="350px"></asp:TextBox></td>				
												</tr>	
												<tr>
													<td class="AppLabel" valign=top ><b>City:</b></td>
													<td>
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td style="width: 165px"><asp:TextBox runat="server" ID="txtCity"></asp:TextBox></td>
																<td>&nbsp;</td>
																<td class="AppLabel"><b>State:</b></td>
																<td>&nbsp;</td>
																<td><asp:TextBox runat="server" ID="txtState" Width="39px"></asp:TextBox></td>
																<td>&nbsp;</td>
																<td class="AppLabel"><b>Zip:</b></td>
																<td>&nbsp;</td>
																<td><asp:TextBox runat="server" ID="txtZip" Width="75px"></asp:TextBox></td>
															</tr>
														</table>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCity" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">City is required</asp:RequiredFieldValidator>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtState" ErrorMessage="State is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtZip" ErrorMessage="Zip is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel"><b>Telephone: (Primary):</b></td>
													<td>					
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td>
																	<asp:TextBox runat="server" ID=txtTelephonePrimary></asp:TextBox></td>
																<td>&nbsp;</td>
																<td>
																	<asp:DropDownList ID="cboTelephonePrimaryType" runat="server">
																		<asp:ListItem>Cell</asp:ListItem>
																		<asp:ListItem>Home</asp:ListItem>
																		<asp:ListItem>Pager</asp:ListItem>
																	</asp:DropDownList></td>
															</tr>
														</table>					
														<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Telephone number is required" Font-Bold="True" Font-Size="X-Small" ControlToValidate="txtTelephonePrimary" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel">Telephone: (Secondary):</td>
													<td>					
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td>
																	<asp:TextBox runat="server" ID=txtTelephoneSecondary></asp:TextBox></td>
																<td>&nbsp;</td>
																<td>
																	<asp:DropDownList ID="cboTelephoneSecondaryType" runat="server">
																		<asp:ListItem>Cell</asp:ListItem>
																		<asp:ListItem>Home</asp:ListItem>
																		<asp:ListItem>Pager</asp:ListItem>
																	</asp:DropDownList></td>
															</tr>
														</table>					
													</td>				
												</tr>				
												<tr>
													<td class="AppLabel">Email:</td>
													<td>
														<asp:TextBox runat="server" ID="txtEmail" Width="350px"></asp:TextBox></td>				
												</tr>	
												<tr>
													<td class="AppLabel"><b>DOB:</b></td>
													<td>
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td style="height: 24px">
																	<asp:TextBox runat="server" ID="txtDOB"></asp:TextBox>&nbsp;<small>(mm/dd/yyyy)</small></td>
															</tr>
														</table>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Date of Birth is required" Font-Bold="True" Font-Size="X-Small" ControlToValidate="txtDOB" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel"><b>SSN:</b></td>
													<td style="height: 24px"><asp:TextBox runat="server" ID="txtSSN" Width="40px" MaxLength=4></asp:TextBox>&nbsp;<small>(last 4 digits)</small>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtSSN" ErrorMessage="SSN is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
														</td>				
												</tr>	
												<tr>
													<td class="AppLabel"><b>DLN:</b></td>
													<td>
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td><asp:TextBox ID="txtDLN" runat="server" Width="75px"></asp:TextBox></td>
																<td>&nbsp;</td>
																<td class="AppLabel"><b>State:</b></td>
																<td>&nbsp;</td>
																<td><asp:DropDownList runat="server" ID=cboDLNStates AutoPostBack="True"></asp:DropDownList></td>
																<td>&nbsp;</td>
																<td class="AppLabel"><b>Class:</b></td>
																<td>&nbsp;</td>
																<td>
																	<asp:TextBox runat="server" ID=txtDLNClassification Width="25px"></asp:TextBox>
																	<asp:ListBox runat="server" ID="lbDLNClassification" Rows="3" SelectionMode="Multiple" Visible="False">
																		<asp:ListItem>A</asp:ListItem>
																		<asp:ListItem>B</asp:ListItem>
																		<asp:ListItem>C</asp:ListItem>
																		<asp:ListItem>E</asp:ListItem>
																		<asp:ListItem>F</asp:ListItem>
																	</asp:ListBox></td>
																<td>&nbsp;</td>
																<td class="AppLabel"><b>Expiration Date:</b></td>
																<td>&nbsp;</td>
																<td>
																	<asp:TextBox runat="server" ID=txtDLNExpirationDate Width="50px"></asp:TextBox></td>
															</tr>
														</table>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Drivers Licence Number is required" ControlToValidate="txtDLN" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator>&nbsp;
														<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDLNExpirationDate" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel" valign=top >Have you ever received a traffic violation?:</td>
													<td>				
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td class="AppLabel">
																	<asp:CheckBox ID="chkTrafficViolation" runat="server" Text="Yes" />&nbsp;If yes, enter details below:</td>
															</tr>
															<tr>
																<td style="height: 38px" ><asp:TextBox ID="txtTrafficViolationReason" runat="server" TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>				
															</tr>
														</table>
													</td>				
												</tr>	
												<tr>
													<td class="AppLabel" valign=top >Have you ever been convicted of a felony?:</td>
													<td>				
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td class="AppLabel"><asp:CheckBox ID="chkFelony" runat="server" Text="Yes" />&nbsp;If yes, enter details below:</td>
															</tr>
															<tr>
																<td><asp:TextBox ID="txtFelonyReason" runat="server" TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>				
															</tr>
														</table>
													</td>				
												</tr>	
												<tr>
													<td class="AppLabel" valign=top>Are you a US citizen?:</td>
													<td>				
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td class="AppLabel">
																	<asp:CheckBox ID="chkUSCitizen" runat="server" Text="Yes" />&nbsp;If no, enter status below:</td>
															</tr>
															<tr>
																<td><asp:TextBox ID="txtImmigrationStatus" runat="server" Width="350px" Rows="3" TextMode="MultiLine"></asp:TextBox></td>				
															</tr>
														</table>
													</td>				
												</tr>	
												
												<tr>
													<td colspan=2>&nbsp;</td>
												</tr>
												<tr>
													<td class="Header" colspan="2">Employment History</td>
												</tr>
												<tr>
													<td class="AppLabel"><b>Current Employer:</b></td>
													<td>
														<asp:TextBox ID="txtCurrentEmployerName" runat="server" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCurrentEmployerName" ErrorMessage="Current Employer is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel" style="height: 30px"><b>Position:</b></td>
													<td style="height: 30px">
														<asp:TextBox ID="txtCurrentEmployerPosition" runat="server" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtCurrentEmployerPosition" ErrorMessage="Current Position is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel"><b>Start Date:</b></td>
													<td>
														<asp:TextBox ID="txtCurrentEmployerStartDate" runat="server"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtCurrentEmployerStartDate" ErrorMessage="Employment Start Date is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>				
												</tr>	
												<tr>
													<td class="AppLabel"></td>
													<td class="AppLabel">
														<asp:CheckBox ID="chkCurrentEmployerContact" runat="server" Text="May we contact this employer?" /></td>				
												</tr>	
												<tr>
													<td class="AppLabel"></td>
													<td class="AppLabel">
														<asp:CheckBox ID="chkAddEmployer2" runat="server" Text="Add another employer?" AutoPostBack="True" />
													</td>
												</tr>	
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmp2Info" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Employer Name:</td>
																	<td>
																		<asp:TextBox ID="txtEmp2Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td>
																		<asp:TextBox ID="txtEmp2Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Start Date:</td>
																	<td>
																		<asp:TextBox ID="txtEmp2Start" runat="server"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">End Date:</td>
																	<td>
																		<asp:TextBox ID="txtEmp2End" runat="server"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Reason for Leaving:</td>
																	<td>
																		<asp:TextBox runat="server" ID=txtEmp2ReasonLeave TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px"></td>
																	<td class="AppLabel">
																		<asp:CheckBox ID="chkEmp2Contact" runat="server" Text="May we contact this employer?" /></td>				
																</tr>	
																<tr>
																	<td class="AppLabel"></td>
																	<td class="AppLabel"><asp:CheckBox ID="chkAddEmp3" runat="server" Text="Add another employer?" AutoPostBack="True" /></td>
																</tr>
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmp3Info" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Employer Name:</td>
																	<td>
																		<asp:TextBox ID="txtEmp3Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td>
																		<asp:TextBox ID="txtEmp3Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Start Date:</td>
																	<td>
																		<asp:TextBox ID="txtEmp3Start" runat="server"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">End Date:</td>
																	<td>
																		<asp:TextBox ID="txtEmp3End" runat="server"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Reason for Leaving:</td>
																	<td>
																		<asp:TextBox runat="server" ID=txtEmp3ReasonLeave TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px"></td>
																	<td class="AppLabel">
																		<asp:CheckBox ID="chkEmp3Contact" runat="server" Text="May we contact this employer?" /></td>				
																</tr>	
																<tr>
																	<td class="AppLabel"></td>
																	<td class="AppLabel"><asp:CheckBox ID="chkAddEmp4" runat="server" Text="Add another employer?" AutoPostBack="True" /></td>
																</tr>
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmp4Info" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Employer Name:</td>
																	<td>
																		<asp:TextBox ID="txtEmp4Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td>
																		<asp:TextBox ID="txtEmp4Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Start Date:</td>
																	<td>
																		<asp:TextBox ID="txtEmp4Start" runat="server"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">End Date:</td>
																	<td>
																		<asp:TextBox ID="txtEmp4End" runat="server"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Reason for Leaving:</td>
																	<td>
																		<asp:TextBox runat="server" ID=txtEmp4ReasonLeave TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px"></td>
																	<td class="AppLabel">
																		<asp:CheckBox ID="chkEmp4Contact" runat="server" Text="May we contact this employer?" /></td>				
																</tr>	
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td class="AppLabel" valign=top >Have you been employed under other names?:</td>
													<td>				
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td class="AppLabel">
																	<asp:CheckBox ID="chkEmployedOtherNames" runat="server" Text="Yes" />&nbsp;If yes, enter other names below:</td>
															</tr>
															<tr>
																<td><asp:TextBox ID="txtEmployedOtherNames" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox></td>				
															</tr>
														</table>
													</td>				
												</tr>	
												<tr>
													<td class="Header" colspan="2">Military</td>
												</tr>
												<tr>
													<td class="AppLabel">Branch:</td>
													<td><asp:TextBox runat="server" id="txtMilitaryBranch"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Dates of Service:</td>
													<td><asp:TextBox runat="server" id="txtMilitaryDatesOfService" TextMode="MultiLine" Width="350px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Rank at Discharge:</td>
													<td><asp:TextBox runat="server" id="txtMilitaryDischargeRank"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Type of Discharge:</td>
													<td><asp:TextBox runat="server" id="txtMilitaryDischargeType"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Discharge Date:</td>
													<td><asp:TextBox runat="server" id="txtMilitaryDischargeDate"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel" valign=top>Duties/Special Training:</td>
													<td><asp:TextBox runat="server" id="txtMilitaryDuties" TextMode="MultiLine" Rows="7" Width="350px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="Header" colspan="2">High School</td>
												</tr>
												<tr>
													<td class="AppLabel" style="height: 30px"><b>School Name:</b></td>
													<td style="height: 30px"><asp:TextBox runat="server" id="txtHighSchoolName"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtHighSchoolName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Location (City/State):</b></td>
													<td><asp:TextBox runat="server" id="txtHighSchoolLocation" TextMode="MultiLine" Rows="3" Width="350px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtHighSchoolLocation" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Date Graduated/GED</b></td>
													<td><asp:TextBox runat="server" id="txtHighSchoolGraduationDate"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtHighSchoolGraduationDate" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="Header" colspan="2">College/University</td>
												</tr>
												<tr>
													<td class="AppLabel">College/University:<br />Attended/Location</td>
													<td><asp:TextBox runat="server" id="txtCollege1"  TextMode="MultiLine" Rows="4" Width="350px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">From Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtCollege1DatesFrom"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">To Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtCollege1DatesTo"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Units Completed:<br />Sem. Qtr.</td>
													<td><asp:TextBox runat="server" id="txtCollege1UnitsCompleted"  TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Major:</td>
													<td><asp:TextBox runat="server" id="txtCollege1Major"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Degree:</td>
													<td><asp:TextBox runat="server" id="txtCollege1Degree"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Year:</td>
													<td><asp:TextBox runat="server" id="txtCollege1Year"></asp:TextBox></td>
												</tr>	
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td class="AppLabel" style="height: 44px">College/University:<br />Attended/Location</td>
													<td style="height: 44px"><asp:TextBox runat="server" id="txtCollege2"  TextMode="MultiLine" Rows="4" Width="350px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">From Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtCollege2DatesFrom"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">To Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtCollege2DatesTo"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Units Completed:<br />Sem. Qtr.</td>
													<td><asp:TextBox runat="server" id="txtCollege2UnitsCompleted"  TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Major:</td>
													<td><asp:TextBox runat="server" id="txtCollege2Major"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Degree:</td>
													<td><asp:TextBox runat="server" id="txtCollege2Degree"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel" style="height: 37px">Year:</td>
													<td style="height: 37px"><asp:TextBox runat="server" id="txtCollege2Year"></asp:TextBox></td>
												</tr>	
												<tr>
													<td colspan="2">&nbsp;</td>
												</tr>
												<tr>
													<td class="AppLabel">College/University:<br />Attended/Location</td>
													<td><asp:TextBox runat="server" id="txtCollege3"  TextMode="MultiLine" Rows="4" Width="350px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">From Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtCollege3DatesFrom"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">To Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtCollege3DatesTo"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Units Completed:<br />Sem. Qtr.</td>
													<td><asp:TextBox runat="server" id="txtCollege3UnitsCompleted"  TextMode="MultiLine" Width="350px" Rows="3"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Major:</td>
													<td><asp:TextBox runat="server" id="txtCollege3Major"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Degree:</td>
													<td><asp:TextBox runat="server" id="txtCollege3Degree"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Year:</td>
													<td><asp:TextBox runat="server" id="txtCollege3Year"></asp:TextBox></td>
												</tr>	
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td class="Header" colspan="2">Special Training</td>
												</tr>
												<tr>
													<td class="AppLabel">Institution-Business:<br />Trade School</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool1"  TextMode="MultiLine" Rows="3" Width="350px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Course:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool1Course"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">From Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool1From"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">To Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool1To"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Hours Completed:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool1HoursCompleted"></asp:TextBox></td>
												</tr>	
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td class="AppLabel">Institution-Business:<br />Trade School</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool2"  TextMode="MultiLine" Rows="3" Width="350px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Course:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool2Course"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">From Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool2From"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">To Mo/Yr:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool2To"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Hours Completed:</td>
													<td><asp:TextBox runat="server" id="txtTradeSchool2HoursCompleted"></asp:TextBox></td>
												</tr>	
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td class="Header" colspan="2">Licenses & Registrations:</td>
												</tr>
												<tr>
													<td colspan="2">
														<asp:Panel ID=PanelRegistration1 runat="server" Height="50px" Width="100%">
															<uc2:Registrations ID="Registrations1" runat="server" />															
														</asp:Panel>
														<asp:Panel ID=PanelRegistration2 runat="server" Height="50px" Width="100%" Visible="False">
															<br />
															<uc2:Registrations ID="Registrations2" runat="server" Visible="true" />														
														</asp:Panel>
														<asp:Panel ID=PanelRegistration3 runat="server" Height="50px" Width="100%" Visible="False">
															<br />
															<uc2:Registrations ID="Registrations3" runat="server" Visible="true" />														
														</asp:Panel>
														<asp:Panel ID=PanelRegistration4 runat="server" Height="50px" Width="100%" Visible="False">
															<br />
															<uc2:Registrations ID="Registrations4" runat="server" Visible="true" />														
														</asp:Panel>
														<asp:Panel ID=PanelRegistration5 runat="server" Height="50px" Width="100%" Visible="False">
															<br />
															<uc2:Registrations ID="Registrations5" runat="server" Visible="true" />														
														</asp:Panel>														
													</td>
												</tr>
												<tr>
													<td class="Header" colspan="2">Certifications:</td>
												</tr>
												<tr>
													<td class="AppLabel" valign=top >Select Certifications:</td>
													<td><asp:ListBox ID="lstCertifications" runat="server" SelectionMode="Multiple" Rows="10"></asp:ListBox></td>
												</tr>	
												<tr>
													<td class="AppLabel" valign=top style="height: 82px" >Do you know a foreign language?:</td>
													<td style="height: 82px" valign=top >				
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td class="AppLabel"><asp:CheckBox ID="chkForeignLanguage" runat="server" Text="Yes" />&nbsp;If yes, enter details below:</td>
															</tr>
															<tr>
																<td style="height: 38px"><asp:TextBox ID="txtForeignLanguageInfo" runat="server" Width="350px" TextMode="MultiLine"></asp:TextBox></td>				
															</tr>
														</table>
													</td>				
												</tr>	
												<tr>
													<td class="AppLabel" valign=top >Additional skills, special training or related courses.<br />Include any other information relevant to your<br />employment application.</td>
													<td><asp:TextBox runat="server" ID="txtAdditionalSkills" Rows="7" TextMode="MultiLine" Width="350px"></asp:TextBox></td>
												</tr>
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td class="Header" colspan="2">Miscellaneous Fire District Information:</td>
												</tr>
												<tr>
													<td class="AppLabel">Would you be interested in the <a href="http://www.bcfdmo.com/joinbcfpd/FFS/" target=_blank >Residency Program</a>?</td>
													<td class="AppLabel">
														<asp:CheckBox ID="chkResidencyProgram" runat="server" Text="Yes" /></td>				
												</tr>	
												<tr>
													<td class="AppLabel">How did you hear about Boone County Fire Protection District?</td>
													<td class="AppLabel">
														<asp:DropDownList ID="cboBCFPDHearAbout" runat="server">
															<asp:ListItem>Another District</asp:ListItem>
															<asp:ListItem>Friend</asp:ListItem>
															<asp:ListItem>Other</asp:ListItem>
														</asp:DropDownList></td>				
												</tr>	
												<tr>
													<td class="AppLabel">Have you ever served on an emergency services organization?<br />(EMS, Fire, Law Enforcement...)</td>
													<td class="AppLabel">
														<asp:CheckBox ID="chkEmergencyServicesOrganization" runat="server" Text="Yes" AutoPostBack="True" />&nbsp;If yes, enter details below:</td>				
												</tr>	
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmergencyServicesInfo" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Name of Service Dept.:</td>
																	<td><asp:TextBox ID="txtEmergencyService1Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td><asp:TextBox ID="txtEmergencyService1Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Dates of Service:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService1DatesOfService Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">City:</td>
																	<td><asp:TextBox ID="txtEmergencyService1City" runat="server" Width="200px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">State:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService1State Width="150px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px">Phone:</td>
																	<td><asp:TextBox runat="server" ID="txtEmergencyService1Phone" Width="100px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel"></td>
																	<td class="AppLabel"><asp:CheckBox ID="chkAddEmergencyService2" runat="server" Text="Add another?" AutoPostBack="True" /></td>
																</tr>
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmergencyServicesInfo2" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Name of Service Dept:</td>
																	<td><asp:TextBox ID="txtEmergencyService2Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td><asp:TextBox ID="txtEmergencyService2Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Dates of Service:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService2DatesOfService Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">City:</td>
																	<td><asp:TextBox ID="txtEmergencyService2City" runat="server" Width="200px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">State:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService2State Width="150px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px">Phone:</td>
																	<td><asp:TextBox runat="server" ID="txtEmergencyService2Phone" Width="100px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="height: 20px"></td>
																	<td class="AppLabel"><asp:CheckBox ID="chkAddEmergencyService3" runat="server" Text="Add another?" AutoPostBack="True" /></td>
																</tr>
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmergencyServicesInfo3" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Name of Service Dept:</td>
																	<td><asp:TextBox ID="txtEmergencyService3Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td><asp:TextBox ID="txtEmergencyService3Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Dates of Service:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService3DatesOfService Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">City:</td>
																	<td><asp:TextBox ID="txtEmergencyService3City" runat="server" Width="200px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">State:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService3State Width="150px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px">Phone:</td>
																	<td><asp:TextBox runat="server" ID="txtEmergencyService3Phone" Width="100px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="height: 20px"></td>
																	<td class="AppLabel"><asp:CheckBox ID="chkAddEmergencyService4" runat="server" Text="Add another?" AutoPostBack="True" /></td>
																</tr>
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmergencyServicesInfo4" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Name of Service Dept:</td>
																	<td><asp:TextBox ID="txtEmergencyService4Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td><asp:TextBox ID="txtEmergencyService4Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Dates of Service:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService4DatesOfService Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">City:</td>
																	<td><asp:TextBox ID="txtEmergencyService4City" runat="server" Width="200px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">State:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService4State Width="150px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px">Phone:</td>
																	<td><asp:TextBox runat="server" ID="txtEmergencyService4Phone" Width="100px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="height: 20px"></td>
																	<td class="AppLabel"><asp:CheckBox ID="chkAddEmergencyService5" runat="server" Text="Add another?" AutoPostBack="True" /></td>
																</tr>
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td colspan=2>
														<div style="width: 100%;" id="divEmergencyServicesInfo5" runat=server visible=false >
															<table width=100% border=0 cellpadding=0 cellspacing=0>
																<tr>
																	<td class="AppLabel" style="width: 285px">Name of Service Dept:</td>
																	<td><asp:TextBox ID="txtEmergencyService5Name" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Position:</td>
																	<td><asp:TextBox ID="txtEmergencyService5Position" runat="server" Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">Dates of Service:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService5DatesOfService Width="350px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">City:</td>
																	<td><asp:TextBox ID="txtEmergencyService5City" runat="server" Width="200px"></asp:TextBox></td>				
																</tr>	
																<tr>
																	<td class="AppLabel" style="width: 285px">State:</td>
																	<td><asp:TextBox runat="server" ID=txtEmergencyService5State Width="150px"></asp:TextBox></td>
																</tr>
																<tr>
																	<td class="AppLabel" style="width: 285px">Phone:</td>
																	<td><asp:TextBox runat="server" ID="txtEmergencyService5Phone" Width="100px"></asp:TextBox></td>
																</tr>
															</table>											
														</div>
													</td>
												</tr>
												<tr>
													<td class="AppLabel" colspan=2>List the names of any firefighters that you know that are currently on or have been a member of Boone County Fire Protection District:</td>
												</tr>
												<tr>
													<td class="AppLabel">Name:</td>
													<td><asp:TextBox runat="server" id="txtBCFPD1Name" Width="300px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Station:</td>
													<td><asp:TextBox runat="server" id="txtBCFPD1Station" Width="300px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Name:</td>
													<td><asp:TextBox runat="server" id="txtBCFPD2Name" Width="300px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Station:</td>
													<td><asp:TextBox runat="server" id="txtBCFPD2Station" Width="300px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Name:</td>
													<td><asp:TextBox runat="server" id="txtBCFPD3Name" Width="300px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="AppLabel">Station:</td>
													<td><asp:TextBox runat="server" id="txtBCFPD3Station" Width="300px"></asp:TextBox></td>
												</tr>	
												<tr>
													<td class="Header" colspan="2">References:</td>
												</tr>
												<tr>
													<td class="AppLabel" colspan="2">List three persons who are NOT related to you and who have definite knowledge of your qualificatoins and fitness for the position for which you are applying. Do not repeat names of supervisors listed under Employment History.</td>
												</tr>
												<tr>
													<td class="AppLabel"><b>First Name:</b></td>
													<td><asp:TextBox runat="server" id="txtReference1FirstName"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtReference1FirstName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">First Name is Required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Last Name:</b></td>
													<td><asp:TextBox runat="server" id="txtReference1LastName"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtReference1LastName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Last Name is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Present Business/Home address<br />(Number, Street, City, State, and Zip:</b></td>
													<td><asp:TextBox runat="server" id="txtReference1Address" Rows="3" TextMode="MultiLine" Width="300px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtReference1Address" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Address is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Relationship:</b></td>
													<td><asp:TextBox runat="server" id="txtReference1Relationship"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtReference1Relationship" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Relationship is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Telephone Number:</b></td>
													<td><asp:TextBox runat="server" id="txtReference1TelephoneNumber"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtReference1TelephoneNumber" ErrorMessage="Telephone Number is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td colspan=2>&nbsp;</td>
												</tr>
												<tr>
													<td class="AppLabel"><b>First Name:</b></td>
													<td><asp:TextBox runat="server" id="txtReference2FirstName"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtReference2FirstName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">First Name is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Last Name:</b></td>
													<td><asp:TextBox runat="server" id="txtReference2LastName"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtReference2LastName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Last Name is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Present Business/Home address<br />(Number, Street, City, State, and Zip:</b></td>
													<td><asp:TextBox runat="server" id="txtReference2Address" Rows="3" TextMode="MultiLine" Width="300px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtReference2Address" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Address is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Relationship:</b></td>
													<td><asp:TextBox runat="server" id="txtReference2Relationship"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtReference2Relationship" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Relationship is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Telephone Number:</b></td>
													<td><asp:TextBox runat="server" id="txtReference2TelephoneNumber"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtReference2TelephoneNumber" ErrorMessage="Telephone Number is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td colspan=2>&nbsp;</td>
												</tr>
												<tr>
													<td class="AppLabel"><b>First Name:</b></td>
													<td><asp:TextBox runat="server" id="txtReference3FirstName"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtReference3FirstName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">First Name is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel" style="height: 18px"><b>Last Name:</b></td>
													<td style="height: 18px"><asp:TextBox runat="server" id="txtReference3LastName"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtReference3LastName" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Last Name is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Present Business/Home address<br />(Number, Street, City, State, and Zip:</b></td>
													<td><asp:TextBox runat="server" id="txtReference3Address" Rows="3" TextMode="MultiLine" Width="300px"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtReference3Address" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Address is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Relationship:</b></td>
													<td><asp:TextBox runat="server" id="txtReference3Relationship"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtReference3Relationship" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True">Relationship is required</asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td class="AppLabel"><b>Telephone Number:</b></td>
													<td><asp:TextBox runat="server" id="txtReference3TelephoneNumber"></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtReference3TelephoneNumber" ErrorMessage="Telephone Number is required" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>	
												<tr>
													<td colspan=2>&nbsp;</td>
												</tr>
												<tr>
													<td class="AppLabelRequired" colspan=2>Why do you want to become a 
														<asp:Label runat="server" ID="lblPosition2" Text=""></asp:Label> for the Boone County Fire Protection District:</td>
												</tr>
												<tr>
													<td colspan="2">
														<asp:TextBox runat="server" ID="txtReasonBecomeBCFPD" TextMode="MultiLine" Rows="10" Width="600px" ></asp:TextBox>
														<asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtReasonBecomeBCFPD" ErrorMessage="RequiredFieldValidator" Font-Bold="True" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
												</tr>
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td colspan="2"><b>PLEASE READ CAREFULLY AND CHECK THE BOX BELOW.</b> The above information is true and complete, and I understand that any false information or omissions will be grounds for a refusal to hire me, or immediate discharge if hired. The Boone County Fire Protection District may review my previous employment, driving and criminal records, and other background data as it may relate to the positions(s) for which I am applying.</td>
												</tr>
												<tr>
													<td colspan="2"></td>
												</tr>
												<tr>
													<td colspan=2>
														<table border=0 cellpadding=0 cellspacing=0>
															<tr>
																<td style="height: 20px"><asp:CheckBox ID="chkAgree" runat="server" Font-Bold="True" Text="I Agree." /></td>
															</tr>
														</table>
														<asp:Label ID="lblAgreeMessage" runat="server" Font-Bold="True" Font-Size="X-Small" ForeColor="Red" Text="You must check the box to agree that the above information is true and complete." Visible="False"></asp:Label></td>
												</tr>	
												<tr>
													<td colspan="2"></td>
												</tr>											
												<tr>
													<td colspan="2" align=center >
														<asp:Button runat="server" id="Submit" Text="Submit" /></td>
												</tr>												
											</table> 
											
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan=2>
						<table border=0 cellpadding=0 cellspacing=0>
							<tr>
								<td valign="bottom" width="100%" height="59" bgcolor="black"><img SRC="http://www.bcfdmo.com/images/spacer.gif" width="503" height="5" bordercolor="#000000" border="0"><br><b><font size="1" color="#666666">®<%=year(now) %> Boone County Fire Protection District, Columbia, Missouri</font><b></td>
								<td valign="bottom" width=81 height="59" bgcolor="black"><a href="/members_only/index.asp"><img SRC="http://www.bcfdmo.com/images/bottom_template/Memberareasignin.gif" border="0" width="81" height="59"></a></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>								
</table>
</div> 
</form>
</body>
</html>
