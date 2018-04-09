<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>

<template:insert template="/pages/admin/adminTemplate.jsp">
<template:put name='page_title' content='Frugallyyours' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

<%
	String hostPath = request.getContextPath();
	
	String message = (String) request.getAttribute("message");	
%>

              
                        <br> <br><br><br><br>
                        <center>
                        <strong>
                        <font color="#993300"><strong><%=message%>
                        </strong></font><br>                      
                        </center>
                        <br><br><br><br> <br><br><br><br>
</template:put>
</template:insert>