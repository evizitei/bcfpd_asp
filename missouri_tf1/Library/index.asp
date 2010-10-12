<!--#include virtual="/include/templates/top.asa"-->
<!--#include virtual="/include/menus/motf1.asa"-->
<%
	set rsCategory = Server.CreateObject("ADODB.Recordset")
	strCategory = "SELECT * FROM Library_Category ORDER BY Name ASC"
	set rsLibrary = Server.CreateObject("ADODB.Recordset")
	

%>
<table cellpadding="5" cellspacing="0" border="0" width="98%">
	<tr>
		<td class="PageTitle">MO-TF1 Library</td>
	</tr>	
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" >
			<%	rsCategory.Open strCategory, cnnMain, 3
				Do while not rsCategory.EOF %>
				<tr>
					<td class="Header">&nbsp;<%=rsCategory("Name")%></td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="1" border="0" width="100%" >
							<tr>
								<td width="40%" class="Subheader">Resource</td>
								<td width="15%" class="Subheader">File Size</td>
								<td width="15%" class="Subheader">File Type</td>
								<td width="30%" class="Subheader">Description</td>
							</tr>
								<%	rsLibrary.Open "SELECT * FROM Library_File WHERE Library_Category_ID = " & rsCategory("Category_ID") & " ORDER BY Name ASC", cnnMain, 3
									do while not rsLibrary.EOF %>
							<tr>
										<td valign="top"  class="ContactInfo"><a class="news" href="/missouri_tf1/library/files/<%=rsLibrary("Name")%>" target="_new"><%=rsLibrary("Name")%></a></td>
										<td valign="top"  class="ContactInfo"><%=rsLibrary("File_Size") & " KB"%></td>
										<td valign="top"  class="ContactInfo"><%=rsLibrary("File_Type")%></td>
										<td valign="top" class="ContactInfo"><%=rsLibrary("Description")%></td>
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
