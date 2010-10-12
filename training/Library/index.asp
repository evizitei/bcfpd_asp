<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/training.asa"-->
<%
	set rsCategory = Server.CreateObject("ADODB.Recordset")
	strCategory = "SELECT * FROM Training_library_category ORDER BY Name ASC"
	set rsLibrary = Server.CreateObject("ADODB.Recordset")
	
function GetPageByContent(ContentType)

	select case ContentType
		
		case "application/msword"
			
			GetPageByContent = "viewword"
		
		case "application/pdf"
			
			GetPageByContent = "viewpdf"

		case "application/vnd.ms-excel"
			
			GetPageByContent = "viewexcel"

		case "text/plain"
			
			GetPageByContent = "viewtext"

		case else
			
			GetPageByContent = "viewtext"
	
	end select
	
end function


%>
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">Training Opportunities Library</td>
	</tr>	
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width=100%>
			<%	rsCategory.Open strCategory, cnnMain, 3
				Do while not rsCategory.EOF %>
				<tr>
					<td class="Header">&nbsp;<%=rsCategory("Name")%></td>
				</tr>
				<tr>
					<td width="100%">
						<table cellpadding="0" cellspacing="1" border="0"  width=100%>
							<tr>
								<td class="Subheader" width=50%>Resource</td>
								<td class="Subheader">File Size</td>
							</tr>
								<%	rsLibrary.Open "SELECT * FROM Training_Library_File WHERE Category_ID = " & rsCategory("Category_ID") & " ORDER BY FileName ASC", cnnMain, 3
									do while not rsLibrary.EOF %>
							<tr>
										<td valign="top"  class="ContactInfo"><a class="news" href="/training/library/<%=GetPageByContent(rsLibrary("FileType"))%>.asp?nid=<%=rsLibrary("nID")%>" target="_new"><%=rsLibrary("FileName")%></a></td>
										<td valign="top"  class="ContactInfo"><%=formatnumber(rsLibrary("FileSize")/1024, 0) & " KB"%></td>
							</tr>	
								<%		rsLibrary.MoveNext										
									loop
									rsLibrary.Close%>
						</table>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			<%	rsCategory.MoveNext
				Loop
				rsCategory.Close
				set rsLibrary = nothing
				set rsCategory = nothing%>	
			</table>
		</td>
	</tr>
</table>

<!--#include virtual="/include/templates/bottom.asa"-->
