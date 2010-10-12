<%QuickLinkID = 19%>
<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/motf1.asa"-->
<!--#include virtual="/front_data.asa"-->
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td valign="top" class="PageTitle">Missouri Task Force 1
		
		<%
		If Request("News_ID") = "" Then
			News 2, ""
		Else
			News 2, Request("News_ID")
		End IF
			
			%>
		</td>
	</tr>	
</table>
<!--#include virtual="/include/templates/bottom.asa"-->
