<%@ page import="com.advanceRealty.dto.Agent" %>
<%@ page import="java.util.List" %>

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
    	
	Agent loggedAgent = (Agent) session.getAttribute("loggedAgent");
	
	List agentList  = (List) request.getAttribute("agentList");

	//This is a web agent - not an admin
	if(loggedAgent.getUserType()> 0) {

		if (agentList != null) {
		
			for(int i=0;i<agentList.size();i++){
			
				Agent agent = (Agent) agentList.get(i);
			
				if(agent.getAgentId() == loggedAgent.getAgentId()) {
%>  
					<form name="agentUpdate" action="<%=hostPath%>/agentServlet" method="post">
							<input type=hidden  name=tranType value="updateDelete" >
							<input type=hidden  name=agentId value="<%=agent.getAgentId()%>" >
							<input type=hidden  name=operationType value="Update" >		
							<input type=hidden  name=userType value="1" >					
						    <br><br><br>
						    <b>Update your contact information<br>
						    <font class="ared">Leave blank picture Path,Field2 and Field3 below</font></b><br><br>
							<table border="1">
								<tr>																	
									<td>First Name:</td>
									<td><input type=text  name=firstName value="<%=agent.getFirstName()%>" ></td>									
								</tr>	
								<tr>								
									<td>Last Name:</td>	
									<td><input type=text  name=lastName value="<%=agent.getLastName()%>"></td>	
								</tr>	
								<tr>	
									<td>Username:</td>
									<td><input type=text  name=userName value="<%=agent.getUserName()%>"></td>	
								</tr>	
								<tr>	
									<td>Password:</td>
									<td><input type=password  name=password value="<%=agent.getPassword()%>"></td>	
								</tr>								
								<tr>				
									<td>Tel:</td>
									<td><input type=text  name=tel value="<%=agent.getTel()%>"></td>							
								</tr>	
								<tr>				
									<td>Fax:</td>
									<td><input type=text  name=fax value="<%=agent.getFax()%>"></td>							
								</tr>	
								<tr>	
									<td>Email:</td>
									<td><input type=text  name=email value="<%=agent.getEmail()%>"></td>									
								</tr>	
								<tr>	
									<td>picture Path:</td>
									<td><input type=text  name=picPath value="<%=agent.getPicPath()%>"></td>									
								</tr>	
								<tr>	
									<td>My Website:</td>
									<td><input type=text  name=field1 value="<%=agent.getField1()%>">
									 (example: www.mywebsite.com)</td>									
								</tr>	
								<tr>	
									<td>field2:</td>
									<td><input type=text  name=field2 value="<%=agent.getField2()%>"></td>									
								</tr>	
								<tr>	
									<td>field3:</td>	
									<td><input type=text  name=field3 value="<%=agent.getField3()%>"></td>																								
								</tr>						
								<tr>							
									<td colspan="2" align="center"><input type=submit   name=submit value="Submit"></td>																								
								</tr>								
								
							</table>
							
					</form>	
							
<% 
				}	
			}
		}
	}else{
	//This section only for Admins
%>

		           
		           	<table>
					<tr>
						<td width="100%" height="510" colspan="2" valign="top" align=middle>
						<br><br>
						<b>Create Agents</b>
						<div id='scroll_clipper' style='position:relative; width:750px; height: 80px; overflow:auto'>
						
						<form name="agentCreate" action="<%=hostPath%>/agentServlet" method="post">
						
						<input type=hidden  name=tranType value="create" >
							<table border="1">
								<tr>
									<td>First Name:</td>								
									<td>Last Name:</td>	
									<td>Username:</td>
									<td>Password:</td>	
									<td>User Type:</td>									
									<td>Tel:</td>
									<td>Fax:</td>
									<td>Email:</td>
									<td>picture Path:</td>
									<td>field1:</td>
									<td>field2:</td>
									<td>field3:</td>
									<td>&nbsp;</td>	
								</tr>	
								<tr>
									<td><input type=text  name=firstName ></td>								
									<td><input type=text  name=lastName ></td>	
									<td><input type=text  name=userName ></td>	
									<td><input type=text  name=password ></td>	
									<td>
										<SELECT NAME="userType">
										<OPTION VALUE="1">Web User
										<OPTION VALUE="0">Admin User									
										</SELECT>									
									</td>											
									<td><input type=text  name=tel ></td>
									<td><input type=text  name=fax ></td>
									<td><input type=text  name=email ></td>
									<td><input type=text  name=picPath ></td>
									<td><input type=text  name=field1 ></td>
									<td><input type=text  name=field2 ></td>
									<td><input type=text  name=field3 ></td>
									<td align="center"><input type=submit   name=submit value="Add"></td>																
								</tr>								
							</table>
						</form>
  					</div>
  					<br><hr><br>
  					<b>Update or Delete Agents</b>
  					<div id='scroll_clipper2' style='position:relative; width:750px; height: 300px; overflow:auto'>
  					
  						<%if (agentList != null) {%>  						
						
							<table border="1">
								<tr>
									<td>&nbsp;</td>	
									<td>Operation Type</td>	
									<td>First Name:</td>								
									<td>Last Name:</td>	
									<td>Username:</td>
									<td>Password:</td>
									<td>User Type:</td>				
									<td>Tel:</td>
									<td>Fax:</td>
									<td>Email:</td>
									<td>picture Path:</td>
									<td>field1:</td>
									<td>field2:</td>
									<td>field3:</td>																		
								</tr>	
								<%
								 				 
								 for(int i=0;i<agentList.size();i++){
								 
								 	Agent agent = (Agent) agentList.get(i);
								 	
								%>
								<form name="agentUpdate" action="<%=hostPath%>/agentServlet" method="post">
								<input type=hidden  name=tranType value="updateDelete" >
								<input type=hidden  name=agentId value="<%=agent.getAgentId()%>" >
								<tr>
									<td><input type=submit   name=submit value="Submit"></td>	
									<td>
										<SELECT NAME="operationType">
										<OPTION VALUE="Update">Update
										<OPTION VALUE="delete">Delete									
										</SELECT>									
									</td>		
									<td><input type=text  name=firstName value="<%=agent.getFirstName()%>" ></td>								
									<td><input type=text  name=lastName value="<%=agent.getLastName()%>"></td>	
									<td><input type=text  name=userName value="<%=agent.getUserName()%>"></td>	
									<td><input type=password  name=password value="<%=agent.getPassword()%>"></td>	
									<td>									
										<SELECT NAME="userType" value="<%=agent.getUserType()%>">
										<%if(agent.getUserType() == 0) {%>
										<OPTION VALUE="0" SELECTED>Admin User
										<OPTION VALUE="1">Web User										
										<%}else{ %>
										<OPTION VALUE="0" >Admin User
										<OPTION VALUE="1" SELECTED>Web User	
										<%} %>								
										</SELECT>									
									</td>		
									<td><input type=text  name=tel value="<%=agent.getTel()%>"></td>
									<td><input type=text  name=fax value="<%=agent.getFax()%>"></td>
									<td><input type=text  name=email value="<%=agent.getEmail()%>"></td>
									<td><input type=text  name=picPath value="<%=agent.getPicPath()%>"></td>
									<td><input type=text  name=field1 value="<%=agent.getField1()%>"></td>
									<td><input type=text  name=field2 value="<%=agent.getField2()%>"></td>
									<td><input type=text  name=field3 value="<%=agent.getField3()%>"></td>																															
								</tr>
								</form>
								<%
								 }
								%>
								
							</table>
					</div>	
						
						<%}%>
						</td>
					<!-- END MIDDLE CONTENT   -->	
					</tr>	
             	</table>

<% 
	}
%>
             	
             	

</template:put>
</template:insert>
