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

                       <form method="POST" action="<%=hostPath%>/emailListServlet">                                                                         
								 
								 <table class="text_2">
								 	<tr>
								 		<td>Email From:</td>
								        <td><input type="text" name="emailFrom" size="40"></td>   
								    </tr>
								    <tr>
								 		<td>User Name:</td>
								        <td><input type="text" name="userName"></td>   
								    </tr>
								    <tr>
								 		<td>Password:</td>
								        <td><input type="text" name="password"></td>   
								    </tr>  	
								    <tr>
										<td>Email To (Separate emails by ;):</td>		
											<td>
												<TEXTAREA Name="emailTo" rows="10" cols="70"></TEXTAREA> 
											</td>								
									</tr>							  
								    <tr>
										  <td>Email Subject</td>		
										  <td><input type="text" Name="subject" size="80">	</td>								
									</tr>	
								    
								    <tr>
										<td>Email Message Content:</td>		
											<td>
												<TEXTAREA Name="emailContent" rows="25" cols="70"></TEXTAREA> 
											</td>								
									</tr>	
								    							   
								    <tr> 
								        <td>&nbsp;</td>		
								        <td align="center"><br><br>
								        	<input type="submit" name="submit" value="Submit">
								        </td>   
								    </tr>
								   
								    
								  </table>
								
								</form>
                                 
                                  </td>
                                </tr>
                              </table>
                            

</template:put>
</template:insert>
