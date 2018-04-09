<%@ page import="com.advanceRealty.dto.Agent" %>

<%
	String hostPath = request.getContextPath();
	
	String errorMessage = (String) request.getAttribute("errorMessage");
	
	if(errorMessage == null)   errorMessage = "";
		
%>

<html>
<head>
	<title>Advance Realty LLC</title>
	<link rel="stylesheet" type="text/css" href="<%=hostPath%>/style/style.css">
</head>

<body   topmargin="0" bgcolor="#ffffff" >
<div align=center>
<!-- START OUTER TABLE --->
	
				<table width="780"  class="tableBorder" cellspacing="0" cellpadding="0"  valign="top" >
				    <tr>
				    <td>
					<!-- START TOP DIV   -->	
					<table>	
					<tr>			   		
						<td width="20%"><img src="<%=hostPath%>/images/advance_logoAdmin.jpg"></td>						
						<td width="60%" align="center">
							<font size="+2"><b>Advance Realty Administrator</b></font>
						</td>
						<td width="20%">&nbsp;</td>						
						</tr>
					</table>
					<!-- END TOP DIV   -->	
					 </td>					
					</tr>
					<tr>
					<!-- START MENU BAR   -->	
						<td  width="100%" height="20" bgcolor="#990000" align="center">							
					         
						</td>
					<!-- END MENU BAR   -->	
					</tr>			
					<tr>
					<!-- START MIDDLE CONTENT   -->	
						<td width="100%" height="510"  valign="top" align=middle>
						<br><br>
						<font color="red"><b><%=errorMessage%></b></font><br><br>						
						<form name="Login" action="<%=hostPath%>/admin" method="post">
						<input type=hidden  name="firstVisit" value="N">							
							<table border="1">
								<tr>
									<td colspan=2 align=middle  nowrap>
									<br><h1>Admin Login</h1><br>
									</td>
								</tr>								
								<tr>
									<td>User Name:</td>
									<td><input type=text  name=userName>	</td>
								</tr>
								<tr>
									<td>Password:</td>
									<td valign="top"><input type=password  name=password></td>
								</tr>
								<tr>
									<td valign="top" colspan=2 align=middle>											
										<input type=submit  name=submit  value=Login>									
									</td>
								</tr>
							</table>
						</form>
  
						</td>
					<!-- END MIDDLE CONTENT   -->	
					</tr>	
				<!-- START FOOTER  -->	
					<tr>
						<td width="100%" height="20" bgcolor="#990000" align="center">							

						</td>						
					</tr>	
					<tr>
						<td  height="40"  align="center" >
						<br>						
						441 Suwanee Dam Rd. Suite 710<br>
						Suwanee, GA 30024<br>
						Tel: 678 546 6619&nbsp;&nbsp;|&nbsp;&nbsp;
						Fax: 678 807 1373<br>
						contact@advancerealtyllc.com <br><br>
						© 2006 ADVANCE REALTY LLC. All rights reserved 
						
						</td>
					</tr>
					<!-- END FOOTER  -->											
				</table>		
	

<!-- END OUTER TABLE --->
</div>
</body>
</html>