<%@ page import="com.advanceRealty.dto.Agent" %>
<%@ page import="com.advanceRealty.dto.Framework" %>
<%@ page import="com.advanceRealty.util.PropsLoader" %>
<%@ page import="java.util.List" %>

<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>

<%
	String hostPath = request.getContextPath();	
	PropsLoader props = new PropsLoader();	    	
	props.load();	
	
	Framework framework = (Framework) session.getAttribute("framework");
	String templateId = framework.getField1();	
	String templateName = props.getProperty("template."+templateId+".name");

	String pageTemplate = "/pages/web/templates/"+templateName+".jsp";
	
	List agentList  = (List) request.getAttribute("agentList");
%>	
<template:insert template="<%=pageTemplate%>">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

<br><br>
<form name="searchAgentForm" action="<%=hostPath%>/searchAgentServlet" method="doPost">

	 <b>Search by First Name:</b> 
	<input type="text"  name="firstName">
	<input type="hidden"  name="web" value="web">
	<input type="submit"  name="Submit" value="Submit">					
</form>						

<table>
	<tr>
		<td>
		<b>Search by Last Name:</b> <br><font class="notesRed"> Click on a letter to search by the Initial letter of the last name:</font><br>
		<a href="<%=hostPath%>/searchAgentServlet?lastName=A&web=web"><font class="ablue2">&nbsp;A&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=B&web=web"><font class="ablue2">&nbsp;B&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=C&web=web"><font class="ablue2">&nbsp;C&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=D&web=web"><font class="ablue2">&nbsp;D&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=E&web=web"><font class="ablue2">&nbsp;E&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=F&web=web"><font class="ablue2">&nbsp;F&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=G&web=web"><font class="ablue2">&nbsp;G&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=H&web=web"><font class="ablue2">&nbsp;H&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=I&web=web"><font class="ablue2">&nbsp;I&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=J&web=web"><font class="ablue2">&nbsp;J&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=K&web=web"><font class="ablue2">&nbsp;K&nbsp;</font></a>&nbsp;|&nbsp;<BR>
		<a href="<%=hostPath%>/searchAgentServlet?lastName=L&web=web"><font class="ablue2">&nbsp;L&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=M&web=web"><font class="ablue2">&nbsp;M&nbsp;</font></a>&nbsp;|&nbsp;     
		<a href="<%=hostPath%>/searchAgentServlet?lastName=N&web=web"><font class="ablue2">&nbsp;N&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=O&web=web"><font class="ablue2">&nbsp;O&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=P&web=web"><font class="ablue2">&nbsp;P&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=Q&web=web"><font class="ablue2">&nbsp;Q&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=R&web=web"><font class="ablue2">&nbsp;R&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=S&web=web"><font class="ablue2">&nbsp;S&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=T&web=web"><font class="ablue2">&nbsp;T&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=U&web=web"><font class="ablue2">&nbsp;U&nbsp;</font></a>&nbsp;|&nbsp;<BR>
		<a href="<%=hostPath%>/searchAgentServlet?lastName=V&web=web"><font class="ablue2">&nbsp;V&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=W&web=web"><font class="ablue2">&nbsp;W&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=X&web=web"><font class="ablue2">&nbsp;X&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=Y&web=web"><font class="ablue2">&nbsp;Y&nbsp;</font></a>&nbsp;|&nbsp;
		<a href="<%=hostPath%>/searchAgentServlet?lastName=Z&web=web"><font class="ablue2">&nbsp;Z&nbsp;</font></a>&nbsp;|&nbsp;						
		
		</td>
	</tr>
</table>				

 <br><br>
<%if (agentList != null && agentList.size()>0) {%>
		
	<table  width="98%">							
		<%
		 				 
		 for(int i=0;i<agentList.size();i++){
		 
		 	Agent agent = (Agent) agentList.get(i);
		 	
		    if(!agent.getFirstName().equals("Admin")) {
		
		%>
			
			
									
		<tr>
			<td align="center">
						<table width="500" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
	                      <tr>	                       
	                        <td width="400" bgcolor="#E3E4FA" bordercolor="#FFFFFF" valign="top">						     
					           <b>Agent: <%=agent.getFirstName()%>&nbsp;&nbsp;<%=agent.getLastName()%></b><br>
								<b>Phone:</b> <%=agent.getTel()%><br>
								<b>Email:</b> <%=agent.getEmail()%><br>
								<%if(agent.getField1()!=null && agent.getField1().length() > 0){%>
								 <b>Web Site:</b> <a href="http://<%=agent.getField1()%>" target="_blank"><font color="#151B8D"><%=agent.getField1()%></font></a>
								<%}%>	
					        </td>	
					        <%if(agent.getPicPath()!=null && agent.getPicPath().length() > 0){%>
								<td width="100" align="middle"><img src="images/agentSearch/<%=agent.getPicPath()%>"></td>	
							<%}else {%>	
								<td width="100" align="middle"><img src="images/agentSearch/noAgent.gif"></td>	
							<%}%>															
					        			       
				          </tr>
				  	   </table>				  
					   <br>					
			
			
				
			</td>																			
		</tr>		
		<%
		 	}
		 }
		%>
		
	</table>
	
<% } %>



</template:put>
</template:insert>