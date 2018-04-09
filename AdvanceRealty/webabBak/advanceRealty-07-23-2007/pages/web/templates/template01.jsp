<%@ page language="java" %>
<%@ page import="com.advanceRealty.dto.Framework" %>
<%@ page import="com.advanceRealty.dto.Agent" %>

<%@ taglib uri="/tags/struts-template.tld" prefix="template" %>
<%@ taglib uri="/tags/struts-html.tld" prefix="html" %>

<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.setDateHeader ("Expires", 0); 			//prevents caching at the proxy server

	String hostPath = request.getContextPath();
	
	//******* Agent Info*******************
	Agent agent      = (Agent) session.getAttribute("agent");	
	String firstName = agent.getFirstName();
	String lastName  = agent.getLastName();
	String tel       = agent.getTel();
	String fax       = agent.getFax();
	String email     = agent.getEmail();
	
	//******* End Agent Info*******************
	
	//******* Framework Info****************
	Framework framework = (Framework) session.getAttribute("framework");	
				
	String topNameColor     = framework.getTopNameColor();
	String topHeaderColor   = framework.getTopHeaderColor();
	String leftNavColor     = framework.getLeftNavColor();
	String leftNavTextColor = framework.getLeftNavTextColor();	
	String agentPicName     = framework.getAgentPicName();	
	String homePicName      = framework.getHomePicName();	
	
	String navItems = framework.getNavItems();

	boolean findAgentChecked=false;
	boolean ARListingsChecked=false;
	boolean searchPropertiesChecked=false;
	boolean buyersChecked=false;
	boolean sellersChecked=false;
	boolean aboutUsChecked=false;
	boolean contactUsChecked=false;

if(navItems!=null && navItems.indexOf("findAgent") > -1)
   findAgentChecked=true;
   
if(navItems!=null && navItems.length()>0 && navItems.indexOf("ARListings") > -1)
   ARListingsChecked=true;

if(navItems!=null && navItems.length()>0 && navItems.indexOf("searchProperties") > -1)
   searchPropertiesChecked=true;

if(navItems!=null && navItems.length()>0 && navItems.indexOf("buyers") > -1)
   buyersChecked=true;

if(navItems!=null && navItems.length()>0 && navItems.indexOf("sellers") > -1)
   sellersChecked=true;

if(navItems!=null && navItems.length()>0 && navItems.indexOf("aboutUs") > -1)
   aboutUsChecked=true;

if(navItems!=null && navItems.length()>0 && navItems.indexOf("contactUs") > -1)
   contactUsChecked=true;
   
	//******* End Framework Info****************
%>
<html>
<head>
	<title>Advance Realty LLC</title>
	<link rel="stylesheet" type="text/css" href="<%=hostPath%>/style/style.css">

<script language="JavaScript" type="text/javascript">
<!--
function breakout_of_frame()
{
  // see http://www.thesitewizard.com/archive/framebreak.shtml
  // for an explanation of this script and how to use it on your
  // own website
  if (top.location != location) {
    top.location.href = document.location.href ;
  }
}
-->
</script>
	
</head>

<body topmargin="0" onload="breakout_of_frame()">
<div align="center">
<table width="800" height="580" border="0"  cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td colspan=2 height="90" bgcolor="<%=topNameColor%>"><img src="<%=hostPath%>/images/top_home1.jpg" ><!--END TOP HEADER --></td>
	</tr>
	<tr><td colspan=2 class="horiz" bgcolor="<%=topHeaderColor%>"></td></tr>
	<tr>
		<td colspan=2 align="center" width="100%" height=20 bgcolor="<%=topHeaderColor%>">
				<table bgcolor="gray" cellpadding="2" cellspacing="1">
				<tr>								
					<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/index.jsp" >Home</a>&nbsp;&nbsp;</td>
					<%if(findAgentChecked==true){ %>
						<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/findAgents.jsp" >Find Agent</a>&nbsp;&nbsp;</td>
					<%}%>
					<%if(ARListingsChecked==true){ %>
					<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/advrealtyListings.jsp" >AR Listings</a>&nbsp;&nbsp;</td>
					<%}%>
					<%if(searchPropertiesChecked==true){ %>
					<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/searchListings.jsp" >Search Properties</a>&nbsp;&nbsp;</td>								
					<%}%>
					<%if(buyersChecked==true){ %>
					<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/buyers.jsp" >Buyers</a>&nbsp;&nbsp;</td>
					<%}%>
					<%if(sellersChecked==true){ %>
					<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/sellers.jsp" >Sellers</a>&nbsp;&nbsp;</td>
					<%}%>
					<%if(aboutUsChecked==true){ %>
					<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/aboutUs.jsp" >About Us</a>&nbsp;&nbsp;</td>
					<%}%>
					<%if(contactUsChecked==true){ %>
					<td bgcolor="<%=leftNavColor%>">&nbsp;&nbsp;<a href="<%=hostPath%>/pages/web/contactUs.jsp" >Contact Us</a>&nbsp;&nbsp;</td>
		  			<%}%>
		  		</tr>
			</table>					
		</td>
	</tr>
	<tr>
		<td colspan=2 style="height:1px; width:100%" bgcolor="#003366" align="center"></td>
    </tr>   
	<tr>
		<td width="180" align="center" valign="top" bgcolor="<%=leftNavColor%>">
		<!-- START LEFT CONTENT   -->			
		<br>
		<%if (agentPicName !=null && agentPicName.length()>0) {%>		
		  <img src="<%=hostPath%>/images/agents/<%=agentPicName%>"><br>
		<%}%>
		<font color="<%=leftNavTextColor%>"><b>			
		<%=firstName%>&nbsp; <%=lastName%><br>
		Tel:<%=tel%><br>
		<%if(fax != null && fax.length() >0){%>
		   Fax:<%=fax%><br>
		<%}%>
		<%if(email != null && email.length() >0){%>
		<marquee align="middle" width="170" height="10" border="0"><%=email%></marquee>
		<%}%>
		
		</b>	
		</font>
		<br><br><br><br><br>
		<img src="<%=hostPath%>/images/advance_logo_leftNav.jpg"><br>			
		<!-- END LEFT CONTENT   -->
		</td>
		<td width="620" valign="top">
		<!-- START MIDDLE CONTENT   -->	
			
		<table width="100%" border="0">
		<tr>						
			<!-- START LEFT CONTENT   -->	
			<td width="600" height="510" valign="top" align="center">	
			<!-- START MIDDLE CONTENT   -->	
					<br>							   	   				       
					<template:get name='content'/>
					</center>		
									
				<!-- END MIDDLE CONTENT   -->			
				
			</td>
		</tr>
		</table>
		
</td>
</tr>
<tr>
	<td colspan=2 style="height:1px; width:100%" bgcolor="#003366" align="center"></td>
</tr>   
<tr>
	<td colspan=2 align="center" width="100%" height=20 bgcolor="<%=leftNavColor%>">
		<font color="#FFFFFF"><b>&copy; 2007 ADVANCE REALTY LLC. All rights reserved</b></td>
</tr>
<tr>
	<td colspan="2" bgcolor="<%=topNameColor%>" align="center" class="awhite">
	<br>
	<font color="<%=leftNavColor%>">						
	4411 Suwanee Dam Rd. Suite 730<br>
	Suwanee, GA 30024<br>
	Tel: (678) 546-6619&nbsp;&nbsp;|&nbsp;&nbsp;
	Fax: (678) 730-4880<br>
	contact@advancerealtyllc.com <br><br>	
	</font>
	
	</td>
</tr>
</table>
</div>

</body>
</html>

