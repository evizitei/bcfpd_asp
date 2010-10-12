<!--#include virtual="/include/browser.asp"-->
<!--#include file="front_data.asa"-->
<head>
<meta http-equiv="Content-Language" content="en-us">
<title>Boone County Fire Protection District</title>

<style type="text/css">
    
	.whiteText { color: white }
	
	a {text-decoration:none}
	
	.Date
	{
	    color: white;
	    font-size: 10pt;
	    font-weight: bold;
	    text-align: right;
	}
	.Address
	{
	    color: white;
	    font-size: 8pt;
	    text-align: right;
	}
	
	TD.NewsLink
	{
	    FONT-WEIGHT: bold;
	    FONT-SIZE: 8pt;
	    COLOR: black;
	    FONT-FAMILY: Arial
	}
	TD.HotSpot
	{
	    FONT-WEIGHT: normal;
	    FONT-SIZE: 7pt;
	    COLOR: white;
	    FONT-FAMILY: Arial
	}
	TD.HotSpotTitle
	{   
	    
	    FONT-WEIGHT: bold;
	    FONT-SIZE: 9pt;
	    COLOR: white;
	    FONT-FAMILY: Arial
	}
	.CoverStory
	{
	    FONT-WEIGHT: normal;
	    FONT-SIZE: 8pt;
	    COLOR: black;
	    FONT-FAMILY: Arial;
	    text-align: left;
	   
	}

	TD.Address 
	{
	    color: white;
	    font-size: 8pt;
	}

	
	.CoverStory SPAN
	{
		float: right;
		clear: left;
		margin-bottom: 10px;
		padding-left: 10px;	
		
	{
	
	</style>

<script language="javascript" src="image.js"></script>
<script language="JavaScript">
	function CheckSize(theImage) {
		
		if (theImage.width > 300) {
			theImage.width = 300;
		}
		
    }
</script>
</head>

<body bgcolor="#000000" style="font-family: Arial; color: #000000" topmargin="0" leftmargin="0" link="#191970" vlink="#191970" alink="#0000ff">
<table id="Table_01" border="0" bordercolor=white cellpadding="0" cellspacing="0" width="1000">
	<tr>
		<td rowspan="2"><img src="/stuff/bcfpd/images/BCFPD-home_01.jpg" width="125" height="163" alt=""></td>
		<td rowspan="2"><img src="/stuff/bcfpd/images/BCFPD-home_02.jpg" width="754" height="163" alt=""></td>
		<td><a href="/aboutbcfpd/photo_gallery/intro.asp"><img border=0 src="/stuff/bcfpd/images/BCFPD-home_03.jpg" width="121" height="56" alt=""></a></td>
	</tr>
	<tr>
		<td><img src="/stuff/bcfpd/images/BCFPD-home_04.jpg" width="121" height="107" alt=""></td>
	</tr>
	<tr>
		<td colspan="3"><img src="/stuff/bcfpd/images/BCFPD-home_05.jpg" height="69" alt=""></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td colspan=2>
		    <table border=0 cellpadding=0 cellspacing=0 width=100%>
		        <tr>
		            <td class="Address">2201 I-70 Drive NW, Columbia, MO 65202&nbsp;Phone: (573) 447-5000&nbsp;FAX: (573) 447-5099</td>
		            <td class="Date" width=240><%=FormatDateTime(Now, vbLongDate)%></td>
		        </tr>
		    </table>
	    </td>
	</tr>
</table>

<table border="0" bordercolor=yellow cellspacing="0" cellpadding="0" width="1000">
	<tr>
		<td rowspan="8"><img border="0" src="images/spacer.gif" width="23" height="40"></td>
		<td width=98><a href="/aboutbcfpd/" onmouseover="changeImage('a',buttonona);" onmouseout="changeImage('a',buttonoffa);"><img border="0" src="images/front_page/BCFPDicon.gif" width="98" height="56"></a></td>
		<td width=280><a href="/aboutbcfpd/" onmouseover="changeImage('a',buttonona);" onmouseout="changeImage('a',buttonoffa);"><img name="a" border="0" src="images/front_page/HOMEaboutOFF.gif"></a></td>
		<td rowspan="7" valign="top" bgcolor="#FFFFFF">
			<table border="0" bordercolor=red width="100%" cellspacing="0" cellpadding="0" class="blackText">
				<tr>
					<td bgcolor="#000000"><img border="0" src="images/spacer.gif" width="10" height="0"></td>
					<td width="100%"><%GetNews%></td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" width="100%"><%GetHotspot%></td>
					<td bgcolor="#ffffff"><img border="0" src="images/spacer.gif" width="10" height="0"></td>
				</tr>
				<tr>
				    <td bgcolor="#000000"><td bgcolor="#ffffff"><img border="0" src="images/spacer.gif" width="0" height="10"></td>
				    <td colspan="2" bgcolor="#ffffff" width="100%"><img border="0" src="images/spacer.gif" width="10" height="0"></td>
			    </tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><a onmouseover="changeImage('b',buttononb);" onmouseout="changeImage('b',buttonoffb);" href="/services/"><img border="0" SRC="images/front_page/ServicesIcon.gif" WIDTH="98" HEIGHT="51"></a></td>
		<td><a onmouseover="changeImage('b',buttononb);" onmouseout="changeImage('b',buttonoffb);" href="/services/"><img name="b" border="0" src="images/front_page/HOMEservicesOFF.gif"></a></td>
	</tr>
	<tr>
		<td><a href="/survival_kids/" onmouseover="changeImage('c',buttononc);" onmouseout="changeImage('c',buttonoffc);"><img border="0" src="images/front_page/SurvivalKidsIcon.gif" WIDTH="98" HEIGHT="74"></a></td>
		<td><a onmouseover="changeImage('c',buttononc);" onmouseout="changeImage('c',buttonoffc);" href="/survival_kids/"><img Name="c" border="0" src="images/front_page/HOMEkidsOFF.gif"></a></td>
	</tr>
	<tr>
		<td><a onmouseover="changeImage('d',buttonond);" onmouseout="changeImage('d',buttonoffd);" href="/missouri_tf1/"><img border="0" SRC="images/front_page/TaskForceIcon.gif" WIDTH="98" HEIGHT="58"></a></td>
		<td ><a onmouseover="changeImage('d',buttonond);" onmouseout="changeImage('d',buttonoffd);" href="/missouri_tf1/"><img name="d" border="0" src="images/front_page/HOMEtask1OFF.gif"></a></td>
	</tr>
	<tr>
		<td><a href="/wildland/" onmouseover="changeImage('e',buttonone);" onmouseout="changeImage('e',buttonoffe);"><img border="0" src="images/front_page/Smokeyicon.gif" width="98" height="50"></a></td>
		<td ><a href="/wildland/" onmouseover="changeImage('e',buttonone);" onmouseout="changeImage('e',buttonoffe);"><img name="e" border="0" src="images/front_page/HOMEwildlandOFF.gif"></a></td>
	</tr>
	<tr>
		<td><a href="/training/" onmouseover="changeImage('i',buttononi);" onmouseout="changeImage('i',buttonoffi);"><img border="0" SRC="images/front_page/Training-Icon.jpg"></a></td>
		<td><a href="/training/" onmouseover="changeImage('i',buttononi);" onmouseout="changeImage('i',buttonoffi);"><img name="i" border="0" src="images/front_page/Training-OFF.gif"></a></td>
	</tr>
	<tr>
		<td><a href="/emrgprep/" onmouseover="changeImage('h',buttononh);" onmouseout="changeImage('h',buttonoffh);"><img border="0" SRC="images/front_page/EmrgPrepIcon.gif"></a></td>
		<td><a href="/emrgprep/" onmouseover="changeImage('h',buttononh);" onmouseout="changeImage('h',buttonoffh);"><img name="h" border="0" src="images/front_page/EmrgPrepoff.gif"></a></td>
	</tr>
	<tr>
		<td><a href="/joinbcfpd/" onmouseover="changeImage('g',buttonong);" onmouseout="changeImage('g',buttonoffg);"><img border="0" SRC="images/front_page/JoinIcon.gif" WIDTH="98" HEIGHT="49"></a></td>
		<td><a href="/joinbcfpd/" onmouseover="changeImage('g',buttonong);" onmouseout="changeImage('g',buttonoffg);"><img name="g" border="0" src="images/front_page/HOMEjoinOFF.gif"></a></td>
	</tr>
	<tr>
		<td colspan=4 align="right"><a href="/members_only/"><img border="0" src="images/front_page/MemberAreaLink.gif" width="62" height="52"></a></td>
	</tr>
	<tr>
		<td colspan="4" class="whiteText"><b><font size="1">&nbsp;©<%=Year(Now)%> Boone County Fire Protection District, Columbia, Missouri&nbsp;</font></b></td>
	</tr>
</table>

</body>
</html>





