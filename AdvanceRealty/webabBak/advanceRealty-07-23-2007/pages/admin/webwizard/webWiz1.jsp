<%@ page import="com.advanceRealty.dto.Framework" %>

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
Framework framework = (Framework) session.getAttribute("framework");
   
%>

<SCRIPT language="JavaScript1.2">
function openwindow(fieldName)
{
	
	var url = '<%=hostPath%>/pages/web/upload/fileUpload.jsp?fieldName='+fieldName;
	
	window.open (url,"newwindow","resizable=no, scrollbars=yes,width=400, height=400");
	
}

function openMockUpwindow()
{
	
	var url = '<%=hostPath%>/pages/admin/webwizard/frameworkMockup.jsp';
	
	window.open (url,"mockUpWindow","resizable=no, scrollbars=yes,width=550, height=400");
	
}

</SCRIPT>

		<table width="100%">
			<tr>
				<td class="navLightGray" align="left" width="100%">WEBSITE MANAGEMENT >> WIZ1</td>
			</tr>
			<tr>
				<td align="center" width="100%" >
				    <table width="96%" class="tableRuler" border="0" cellspacing="0" cellpadding="0" >
				    	<tr>
				    		<td> Create the Main Navigational Links by checking the checkboxes below you wish to add to your website<br><br>
				       		</td>
				    	</tr>
				    </table>				       
				</td>
			</tr>
			<tr>
				<td align="center">&nbsp;<br>
				</td>
			<tr>
			<tr>
				<td align="center">
					Step 1: Select Your Web Design Template
				</td>
			<tr>					
			<tr><td><hr></td></tr>	
			<tr>
				<td align="center">
					<table>
						<tr>
							<td align="center"><a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz1&templateId=1"><font color="blue">Click here to select this template -- TEMPLATE 1</font></a></td>							
						</tr>
						<tr>
							<td><img src="images/template_01/template1_1_small.jpg"></td>
						</tr>
						<tr>
							<td align="center"><a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz1&templateId=1"><font color="blue">Click here to select this template -- TEMPLATE 1</font></a></td>							
						</tr>
					</table>
				</td>
			</tr>	
			<tr><td><hr></td></tr>	
			<tr>
				<td align="center">
					<table>
						<tr>
							<td align="center"><a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz1&templateId=2"><font color="blue">Click here to select this template -- TEMPLATE 2</font></a></td>							
						</tr>
						<tr>
							<td><img src="images/template_02/template2_1_small.jpg"></td>
						</tr>
						<tr>
							<td align="center"><a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz1&templateId=2"><font color="blue">Click here to select this template -- TEMPLATE 2</font></a></td>							
						</tr>
					</table>
				</td>
			</tr>					
		</table>
	<BR><BR>     

</template:put>
</template:insert>

