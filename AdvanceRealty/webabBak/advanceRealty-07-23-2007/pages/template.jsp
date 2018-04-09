<%@ page language="java" %>
<%@ taglib uri="/tags/struts-template.tld" prefix="template" %>
<%@ taglib uri="/tags/struts-html.tld" prefix="html" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.setDateHeader ("Expires", 0); 			//prevents caching at the proxy server

	String hostPath = request.getContextPath();

%>
<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<%=hostPath%>/style/style.css">
	
	<TITLE>
		AdvanceRealtyLLC
	</TITLE> 
	
</HEAD>
<body   topmargin="0" bgcolor="#98AFC7" >
<div align=center>
<!-- START OUTER TABLE --->
<table width="780" height="600" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000">
<tr>
<td>
<!-- START INNER TABLE --->		
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
		<tr>
			<td valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="1"  valign="top">
				    <tr>
					<!-- START TOP DIV   -->					   		
						<td width="30%"><img src="<%=hostPath%>/images/advance_logo.jpg" ></td>						
						<td width="70%" align="right" align="right" valign="bottom" background="<%=hostPath%>/images/atlantapanorama1.jpg">
								<a href="<%=hostPath%>/pages/buyaHome.jsp"><img src="<%=hostPath%>/images/buyHome.jpg" border="0"></a>&nbsp;&nbsp;
							    <a href="<%=hostPath%>/pages/sellers.jsp"><img src="<%=hostPath%>/images/sellHome.jpg" border="0"></a> 	
						</td>
					<!-- END TOP DIV   -->						
					</tr>
					<tr>
					<!-- START MENU BAR   -->	
						<td colspan="2" width="100%" height="20" bgcolor="#990000" align="center">							
							<table bgcolor="gray" cellpadding="2" cellspacing="1">
								<tr>								
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/index.jsp" >Home</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/findAgents.jsp" >Find Agent</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/advrealtyListings.jsp" >AR Listings</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/searchListings.jsp" >Search Properties</a>&nbsp;&nbsp;</td>								
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/buyers.jsp" >Buyers</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/sellers.jsp" >Sellers</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/aboutUs.jsp" >About Us</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/contactUs.jsp" >Contact Us</a>&nbsp;&nbsp;</td>
		  					</tr>
							</table>							
						</td>
					<!-- END MENU BAR   -->	
					</tr>			
					<tr>					
						<td width="100%" height="510" align="center" colspan="2" valign="top"> 
						<!-- START MIDDLE CONTENT   -->	
							<br>
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
							<table bgcolor="gray" cellpadding="2" cellspacing="1">
								<tr>								
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/index.jsp" >Home</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/searchAgentServlet" >Find Agent</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/advrealtyListings.jsp" >AR Listings</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/searchListings.jsp" >Search Properties</a>&nbsp;&nbsp;</td>								
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/buyers.jsp" >Buyers</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/sellers.jsp" >Sellers</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/aboutUs.jsp" >About Us</a>&nbsp;&nbsp;</td>
								<td bgcolor="#990000">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/contactUs.jsp" >Contact Us</a>&nbsp;&nbsp;</td>
		  					</tr>
							</table>							
						</td>						
					</tr>	
					<tr>
						<td colspan="2" height="40" bgcolor="#191970" align="center" class="awhite">
						<br>						
						4411 Suwanee Dam Rd. Suite 730<br>
						Suwanee, GA 30024<br>
						Tel: (678) 546-6619&nbsp;&nbsp;|&nbsp;&nbsp;
						Fax: (678) 730-4880<br>
						contact@advancerealtyllc.com <br><br>
						&copy; 2006 ADVANCE REALTY LLC. All rights reserved 
						
						</td>
					</tr>
					<!-- END FOOTER  -->					
				</table>						
			</td>
		</tr>
	</table>		
<!-- END INNER TABLE --->		
	</td>
</tr>
</table>
<!-- END OUTER TABLE --->
</div>
</body>
</html>