<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>

<template:insert template="/pages/admin/adminTemplate.jsp">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

		<table width="100%">
			<tr>
				<td class="navLightGray" align="left" width="100%">HOME</td>
			</tr>
			<tr>
				<td width="100%" align="center">
					<img src="<%=request.getContextPath()%>/images/admin_big.jpg"	
				</td>
			</tr>
		</table>
        

	<BR><BR>     

</template:put>
</template:insert>

