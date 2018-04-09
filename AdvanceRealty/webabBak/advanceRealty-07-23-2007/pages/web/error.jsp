<%@ page language="java" %>
<%@ taglib uri="/tags/struts-template.tld" prefix="template" %>
<%@ taglib uri="/tags/struts-html.tld" prefix="html" %>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.setDateHeader ("Expires", 0); 			//prevents caching at the proxy server

	String hostPath = request.getContextPath();
	
    String message = (String) request.getAttribute("message");
%>

<html>
<head>
	<title>Untitled</title>
	<link rel="stylesheet" type="text/css" href="<%=hostPath%>/style/style.css">
</head>

<body topmargin="0">
<div align="center">
<table width="780" height="580" border=0  cellpadding="0" cellspacing="0" class="table_border">
	<tr>
		<td colspan=2 height="100">
		<!--START TOP HEADER -->
			<table width="780" cellpadding="0" cellspacing="0" border=0 bgcolor="#003366">
				<tr>
					<td width="200" height="80" valign="top">
						<table width="100%" height="100" border=0 cellpadding="0" cellspacing="0">
							<tr>
								<td height="30" align="center" bgcolor="#003366">
								<font color="#ffffff" size="+1"></font>
								</td>
							</tr>
							<tr>
								<td height="70" align="center"><img src="images/advance_logo.jpg" width="200" height="70"></td>
							</tr>
						</table>
					</td>
					<td width="580" height="80" valign="top"><img src="images/1.jpg" width="365" height="100"></td>					
				</tr>								
			</table>	
		<!--END TOP HEADER -->	
		</td>
	</tr>
	<tr>
		<td colspan=2 align="center" width="100%" height=20 bgcolor="#FF9966">
		<td>
	</tr>
	<tr>
		<td colspan=2 style="height:1px; width:100%" bgcolor="#003366" align="center"></td>
    </tr>   
	<tr>
		<td width="200" bgcolor="#FF9966" height="300"></td>
		<td width="580" height="300">
			<%=message%>
		
		</td>
	</tr>
	<tr>
		<td colspan=2 style="height:1px; width:100%" bgcolor="#003366" align="center"></td>
    </tr>   
	<tr>
		<td colspan=2 align="center" width="100%" height=20 bgcolor="#FF9966">
		<font color="#ffffff"><b>&copy; 2006 ADVANCE REALTY LLC. All rights reserved</b></td>
	</tr>
</table>
</div>

</body>
</html>
