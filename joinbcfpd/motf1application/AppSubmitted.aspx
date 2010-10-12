<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AppSubmitted.aspx.vb" Inherits="AppSubmitted" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Boone County Fire Protection District - MOTF1 Join Application</title>
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
BODY
{
    FONT-FAMILY: Verdana
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
		<td width="72">
			<table cellspacing="0" cellpadding="0" border="0">
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
								<td><img SRC="http://www.bcfdmo.com/images/motf1/missouritaskforce1.jpg" border=0></td>
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
								<td><font size="1">Thank you for submitting an application to join our organization.</font></td>
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
