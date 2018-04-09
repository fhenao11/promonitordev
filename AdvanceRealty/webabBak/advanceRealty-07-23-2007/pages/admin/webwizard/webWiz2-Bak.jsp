<%@ page import="com.advanceRealty.dto.Agent" %>
<%@ page import="com.advanceRealty.util.PropsLoader" %>

<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>

<template:insert template="/pages/admin/adminTemplate.jsp">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

<%

Agent agent = (Agent) session.getAttribute("loggedAgent");

PropsLoader props = new PropsLoader();	    	
props.load();	

String agentName = agent.getFirstName();
long agentId = agent.getAgentId();

String hostPath = request.getContextPath();

String template= (session) getAttribute("template");
String colorId   = (session) getAttribute("colorId");
    	
template.id = " + props.getProperty("template.ids"));





%>

<SCRIPT language="JavaScript1.2">
function openWebPageWindow()
{
	
	var url = '<%=hostPath%>/agent?agent=<%=agentName%>_<%=agentId%>';
	
	window.open (url,"webWindow","resizable=yes, scrollbars=yes,width=780, height=600");
	
}
</SCRIPT>

<form  action="<%=hostPath%>/contactServlet">

<input type=hidden  name="contactTranType" value="editContact">

		<table width="100%">
			<tr>
				<td class="navLightGray" align="left" width="100%">WEBSITE MANAGEMENT >> WIZ2</td>
			</tr>
			<tr>
				<td align="center" width="100%" >
				    <table width="96%" class="tableRuler" border="0" cellspacing="0" cellpadding="0" >
				    	<tr>
				    		<td> Confirmation page for Creating or Updating a  Website<br><br><br>
				        	</td>
				    	</tr>
				    </table>				       
				</td>
			</tr>			
			<tr>
				<td width="100%" align="center">
				<br><br>
				  <table class="tableWizard">
				  	<tr>
				  		<td align="center" class="tableWizard">
							<a href="<%=hostPath%>/frameworkServlet?frameworkTranType=getFramework">Previous</a>&nbsp;&nbsp;&nbsp;&nbsp;	
    					</td>					
    					<td align="center" class="tableWizard">
							<a href="<%=hostPath%>/pages/admin/webwizard/webWizHome.jsp">Exit</a>			
    					</td>
					</tr>
				  </table>
				</td>
			</tr>		
			<tr>
				<td align="center" height="200">				    
					<table>
						<tr>
							<td align="center"  class="ablack">
								<br><br><%=message%> <br><br>				
							</td>							
						</tr>						
						<tr>
							<td align="center" class="notesRed"><br><br>
								The URL or Web Address for your website is:<br><br>
								<font color="blue" size="+1">
								www.AdvanceRealtyLLC.com/agent?agent=<%=agentName%>_<%=agentId%>
								</font>
								<br><br>
								Please, write it down, for this is the web address for you to give to your customers or clients
								<br><br>
							</td>							
						</tr>
						<tr>
							<td bgcolor="#157DEC" align="center">
								<a href="javascript:openWebPageWindow()">Click Here to View your Website</a>				
							</td>							
						</tr>						
					</table>
					<br><br><br><br><br>
				</td>
			</tr>
			<tr>
				<td class="navLightGray" align="center" width="100%">
				
			  	  <table class="tableWizard">
				  	<tr>
				  		<td align="center" class="tableWizard">
							<a href="<%=hostPath%>/frameworkServlet?frameworkTranType=getFramework">Previous</a>&nbsp;&nbsp;&nbsp;&nbsp;	
    					</td>						
    					<td align="center" class="tableWizard">
							<a href="<%=hostPath%>/pages/admin/webwizard/webWizHome.jsp">Exit</a>			
    					</td>
					</tr>
				  </table>				
			   </td>
			</tr>
		</table>
 </form> 

	<BR><BR>     

</template:put>
</template:insert>

