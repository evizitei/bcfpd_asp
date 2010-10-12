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
	<tr>
		<td class="Content"><b><u>How Can I Help? </u></b>
		</td>
	</tr>
	<tr>
		<td class="Content">Over the past several years, many people, companies and corporations across Missouri have asked, “How can I help Missouri Task Force 1?”  There are a number of ways.
		</td>
	</tr>
	<tr>
		<td class="Content">First, the Task Force is composed of volunteer participants from all walks of life.  In addition to rescue specialists that come to us from the fire service, the Task Force uses structural engineers, hazardous materials technicians, communications specialists, canine search specialists, logistics specialists, physicians, surgeons, nurses, technical information specialists and safety officers.  If you are interested in direct participation in the Task Force, please refer to the “How To Join” page within this website.
		</td>
	</tr>
	<tr>
		<td class="Content">Missouri Task Force 1 is funded with federal grant funds and some state funding.  Following the September 11, 2001 World Trade Center disaster, Missouri Task Force 1 was the recipient of many private donations.  These funds are placed directly in equipment replacement and new equipment acquisition.  The Task Force remains some $500,000 short of acquiring the complete equipment cache as specified by the Federal Emergency Management Agency and donations are certainly appreciated. 
		</td>
	</tr>
	<tr>
		<td class="Content">Additionally, the Task Force remains in need of ground transportation capability.  Presently, the Task Force must rely on borrowed or rented tractor-trailers to transport the Task Force in the event of a deployment. This arrangement causes significant delays in our deployment.  Missouri Task Force 1 is presently seeking viable ground transportation.  Anyone interested in donating in this manner is encouraged to contact the Task Force office.  
		</td>
	</tr>
	<tr>
		<td class="Content">Also, the Missouri Task Force 1 continues to develop its training site north of Columbia. One of the vital training “props” is a rubble pile comprised of large slabs of concrete and steel which simulates the collapse of a large steel and concrete structure. The Task Force relies on the donation of large slabs of concrete from demolition sites, highway resurfacing projects, etc. to build the rubble pile.  If contractors or developers in the Central Missouri area have such material, they are encouraged to contact the Task Force office. Additionally, many Central Missouri concrete companies that manufacture storm water products, vaults and other concrete structures, from time to time, donate damaged or unmarketable products to the rubble pile, as well. 
		</td>
	</tr>
	<tr>
		<td class="Content">All donations are tax-deductible. 
		</td>
	</tr>

</table>
<!--#include virtual="/include/templates/bottom.asa"-->
