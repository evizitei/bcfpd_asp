<%QuickLinkID = 7%>
<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/media.asa"-->
<!--#include virtual="/front_data.asa"-->
<table cellpadding="5" cellspacing="0" border="0" width="100%">
	<tr>
		<td class="PageTitle">BCFPD News
		
<%
		if Request.QueryString("HotTopic") = "True" then
			News 5, ""
		Else
			If Request("News_ID") = "" Then
				News 1, ""
			Else
				News 1, killChars(Request("News_ID"))
			End IF
		end if
		
						
%>
					</td>
				</tr>	
			</table>


<!--#include virtual="/include/templates/bottom.asa"-->
