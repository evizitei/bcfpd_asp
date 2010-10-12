<%QuickLinkID = 43%>
<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/training.asa"-->
<!--#include virtual="/front_data.asa"-->
<table cellpadding="5" cellspacing="0" border="0" bordercolor=lime height="100%" width="100%">
	<tr>
		<td valign="top" class="PageTitle">Emergency Preparedness New News
		
		<%
		If Request("News_ID") = "" Then
			News 6, ""
		Else
			News 6, Request("News_ID")
		End IF
			
			%>
		</td>
	</tr>	
	<tr>
		<td><img src="/images/spacer.gif" border="0" height="175" width="1"></td>
	</tr>
</table>


<!--#include virtual="/include/templates/bottom.asa"-->
