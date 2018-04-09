<%@ page import="com.advanceRealty.dto.Agent" %>
<%@ page import="com.advanceRealty.dto.Framework" %>
<%@ page import="com.advanceRealty.util.PropsLoader" %>

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
	
	//******* Agent Info*******************
	Agent agent      = (Agent) session.getAttribute("agent");	
	String firstName = agent.getFirstName();
	String lastName  = agent.getLastName();
	String tel       = agent.getTel();
	String fax       = agent.getFax();
	String email     = agent.getEmail();
	
	//******* End Agent Info*******************


%>	
<template:insert template="<%=pageTemplate%>">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

		<table border=0 class="navLightGray" width="100%">
			<tr>				
				<td valign="top" align="center"><br><br>
					Advance Realty<br><br>
					Agent: <%=firstName%>&nbsp; <%=lastName%><br><br>
					441 Suwanee Dam Rd. Suite 710<br>
					Suwanee, GA 30024<br><br>					
					Tel:<%=tel%><br><br>
					<%if(fax != null && fax.length() >0){%>
		   			   Fax:<%=fax%><br><br>
					<%}%>
					Email:<%=email%><br><br>					
				
				</td>
			</tr>
		</table>
		      
        

	<BR><BR>     

</template:put>
</template:insert>

