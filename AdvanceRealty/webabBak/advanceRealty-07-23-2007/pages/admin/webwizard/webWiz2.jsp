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

String templateId= (String) session.getAttribute("templateId");
String colorId   = (String) session.getAttribute("colorId");
String numColors = props.getProperty("template."+templateId+".numColors");
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
				<td class="navLightGray" align="left" width="100%">WEBSITE MANAGEMENT >> WIZ2</td>
			</tr>
			<tr>
				<td align="center" width="100%" >
				    <table width="96%" class="tableRuler" border="0" cellspacing="0" cellpadding="0" >
				    	<tr>
				    		<td> Click on any of the color boxes on the right of the template picture to select the colors for your website.<br>
				    		    Then, click Next to continue<br>
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
					Step 2: Select Colors<br><br>
				</td>
			<tr>	
			<tr>
				<td align="center">
					<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wizHome"><font color="blue"><< Previous&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
					<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz2&done=d"><font color="blue">Next >></font></a>
     			</td>
     		</tr>							
			<tr><td><hr></td></tr>	
			<tr>
				<td>
					<table>
						<tr>
							<td><img src="images/template_0<%=templateId%>/template<%=templateId%>_<%=colorId%>_small.jpg"></td>						
							<td width="20">&nbsp;</td>
							<td align="center">
							
								<%
														
									int colorNumbers=Integer.valueOf(numColors).intValue();
									for(int i=0;i<colorNumbers;i++){
										String colorProp = props.getProperty("template."+templateId+".color"+(i+1));
										String colors[] = colorProp.split(",");										
								%>
											
												<table cellpadding=0 cellspacing=0>
													<tr>
														<td width="10" height="5" bgcolor="<%=colors[3]%>">													
															<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz2&colorId=<%=(i+1)%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>	
														<td>
															<table cellpadding=0 cellspacing=0>
																<tr>
																	<td width="10" height="5" bgcolor="<%=colors[1]%>">
																		<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz2&colorId=<%=(i+1)%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>	
																</tr>
																<tr>
																	<td width="10" height="5" bgcolor="<%=colors[2]%>">
																		<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz2&colorId=<%=(i+1)%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>							
																</tr>
															</table>
														</td>
													</tr>
												</table>															
											
											<br><br>
								
								<% 		
										
									} 
								%>
							</td>							
						</tr>
					</table>					
				</td>
			</tr>	
			<tr><td><hr></td></tr>	
			<tr>
				<td align="center">
					<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wizHome"><font color="blue"><< Previous&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
					<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz2&done=d"><font color="blue">Next >></font></a>
     			</td>
     		</tr>			
		</table>
	<BR><BR>     

</template:put>
</template:insert>

