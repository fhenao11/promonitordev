<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>

<template:insert template="/pages/admin/adminTemplate.jsp">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

<%
String hostPath = request.getContextPath();
%>

		<table width="100%">
			<tr>
				<td class="navLightGray" align="left" width="100%">
				        WEBSITE MANAGEMENT >> WEB WIZARD HOME
				</td>
			</tr>			
			<tr>
				<td align="center" width="100%" >
				    <table width="96%" class="tableRuler" border="0" cellspacing="0" cellpadding="0" >
				    	<tr>
				    		<td> This is the Wizard to create or edit your Website. Click on the
				        	Start Link below to start the Wizard.<br><br><br>
				        	</td>
				    	</tr>
				    </table>				       
				</td>
			</tr>			
			<tr>
				<td align="center" width="100%" height="300">
					 <table bgcolor="#151B54"  cellspacing="0" cellpadding="5" >
				    	<tr>
				    	<td>													
							<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wizHome">				
							START WEB WIZARD CREATOR</a>	
						</td>
				    	</tr>
				    </table>					
				</td>			
			</tr>
		</table>
        

	<BR><BR>     

</template:put>
</template:insert>