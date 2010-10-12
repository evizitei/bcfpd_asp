<%QuickLinkID = 41%>
<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/media.asa"-->
<!--#include virtual="/front_data.asa"-->
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Official Releases
		
		<%
		If Request("News_ID") = "" Then
			News 4, ""
		Else
			News 4, Request("News_ID")
		End IF
			
			%>
		</td>
	</tr>	
</table>
<!--#include virtual="/include/templates/bottom.asa"-->
