<%@ page language="java" %>
<%@ page import="com.advanceRealty.dto.Agent" %>
<%@ taglib uri="/tags/struts-template.tld" prefix="template" %>
<%@ taglib uri="/tags/struts-html.tld" prefix="html" %>


<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.setDateHeader ("Expires", 0); 			//prevents caching at the proxy server

	String hostPath = request.getContextPath();
	
	Agent loggedAgent = null;
	
	if(session.getAttribute("loggedAgent") != null)
		loggedAgent= (Agent) session.getAttribute("loggedAgent");
	else{
%>
		<jsp:forward page="/pages/admin/login.jsp" /> 

<%  } %>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<%=hostPath%>/style/style.css">
<link rel="stylesheet" href="<%=hostPath%>/style/js_color_picker_v2.css" media="screen">

<script type="text/javascript" src="<%=hostPath%>/script/js_color_picker_v2.js"></script>
<script type="text/javascript" src="<%=hostPath%>/script/color_functions.js"></script>		
	
	<TITLE>
		AdvanceRealtyLLC
	</TITLE> 
	
</HEAD>
<body   topmargin="0" bgcolor="#E3E4FA" >
<div align=center>
<!-- START INNER TABLE --->		
				<table width="780" class="tableBorder" border="0" cellspacing="0" cellpadding="1"  valign="top">
				    <tr>
				    	<td>
						<!-- START TOP DIV   -->					   		
						<table width="100%">	
						<tr>			   		
							<td width="25%"><img src="<%=hostPath%>/images/advance_logoAdmin.jpg"></td>						
							<td width="50%" align="center">
							<font size="+2"><b>Advance Realty Administrator</b></font>
							</td>
							<td width="15%" bgcolor="#151B54" align="center" class="awhite">
							Welcome<br><%=loggedAgent.getFirstName()%> <%=loggedAgent.getLastName()%>
							</td>	
							<td width="10%" align="center" bgcolor="#151B54"><a href="<%=hostPath%>/logout">Log Out</font></td>					
						</tr>
						</table>
						<!-- END TOP DIV   -->						
						</td>
					</tr>
					<tr>
					<!-- START MENU BAR   -->	
						<td colspan="2" width="100%" height="20" bgcolor="#990000" align="center">							
							<table bgcolor="gray" cellpadding="2" cellspacing="1">
								<tr>								
									<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/admin/home.jsp" >Home</a>&nbsp;&nbsp;</td>
									<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/agentServlet" >Agent Management</a>&nbsp;&nbsp;</td>
									<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/frameworkWebServlet" >WebSite Management</a>&nbsp;&nbsp;</td>
		  							<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/docsManagementServlet" >Document Management</a>&nbsp;&nbsp;</td>
		  							<% if(loggedAgent!=null && loggedAgent.getUserType()==0) { %>
		  							<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/admin/emailManagement/emailList.jsp" >Email Management</a>&nbsp;&nbsp;</td>
		  							<% } %>
		  						</tr>
							</table>							
						</td>
					<!-- END MENU BAR   -->	
					</tr>			
					<tr>					
						<td width="100%" height="510" align="center" colspan="2" valign="top"> 
						<!-- START MIDDLE CONTENT   -->								
							<center>
							<H4><b><template:get name='content_title'/></b></H4>		   	   				       
							<template:get name='content'/>
							</center>		
							
						<!-- END MIDDLE CONTENT   -->					
						</td>
					
					</tr>
					<!-- START FOOTER  -->	
					<tr>
						<td colspan="2" width="100%" height="20" bgcolor="#990000" align="center">							
							<table class="tableNav">
							<tr>								
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/index.jsp" >Home</a>&nbsp;&nbsp;</td>
												    
		  					    <% if(loggedAgent!=null && loggedAgent.getUserType()==0) {%>
								
									<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/contactUs.jsp" >Agent Management</a>&nbsp;&nbsp;</td>
								
								<%} %>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/index.jsp" >WebSite Management</a>&nbsp;&nbsp;</td>
								
		  					</tr>
							</table>							
						</td>						
					</tr>	
					<tr>
						<td colspan="2" height="40"  align="center" class="awhite">
						<br>						
						4411 Suwanee Dam Rd. Suite 730<br>
						Suwanee, GA 30024<br>
						Tel: (678) 546-6619&nbsp;&nbsp;|&nbsp;&nbsp;
						Fax: (678) 807-1373<br>
						contact@advancerealtyllc.com <br><br>
						2006 ADVANCE REALTY LLC. All rights reserved 
						
						</td>
					</tr>
					<!-- END FOOTER  -->					
				</table>						

</div>
</body>
</html>