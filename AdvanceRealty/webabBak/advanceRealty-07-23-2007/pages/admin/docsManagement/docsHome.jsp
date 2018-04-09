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
	String imagesDir = (String) session.getAttribute("imagesDir");
	String docsDir = (String) session.getAttribute("docsDir");	
	String[] docsList = (String[]) request.getAttribute("docsList");
	String[] imagesList = (String[]) request.getAttribute("imagesList");
%>  

<SCRIPT language="JavaScript1.2">
function openwindow(fieldName)
{	
	var url = '<%=hostPath%>/pages/web/upload/fileUpload.jsp?fieldName='+fieldName;	
	window.open (url,"newwindow","resizable=no, scrollbars=yes,width=400, height=400");	
}
</SCRIPT>
<%
	//This section only for Admins
	if(loggedAgent.getUserType()== 0) {
%>  
	<br>
		<table width="90%" border=0 bgcolor="#151B54" class="awhite">
			<tr>
				<td  align="center" >
					<b>Upload Documents and Images:</b>	<br><br>
				</td>	
				<td  align="center" >
					<a href="javascript:openwindow('docs')">**Click Here to Upload Documents**</a>
				</td>				
				<td  align="center" >
					<a href="javascript:openwindow('images')">**Click Here to Upload Images**</a>
				</td>	
			</tr>	
		</table>			
<%	} %>
<br>
		<table width="90%" border=1 bgcolor="#ffffff">
			<tr>
				<td valign="top">
					<table width="100%">
						<tr>
							<td><img src=images/win_folder1.jpg></td>
							<td>Download Documents</td>
						</tr>						
						
					<%for(int i=0;i<docsList.length;i++){%>
						<tr>
							<td>&nbsp;</td>
							<td valign="top">
								<table width="100%">
									<tr>									
										<%
										//This section only for Admins
										if(loggedAgent.getUserType()== 0) {
										%> 										
										<td valign="top">										
											<table width="100%" border=0>
												<tr>												   
													<td>
														<table>
															<tr>
																<td>
																	<a href="/documents/docs/<%=docsList[i]%>">
																	<img src="images/win_file_icon1.gif" border="0" >
																	</a>
																</td>
																<td>																
																	<a href="/documents/docs/<%=docsList[i]%>"> 
																	<font color="blue"><%=docsList[i]%></font>
																	</a>
																</td>
															</tr>
														</table>																
													</td>
													<td align="right">										
														<a href="<%=hostPath%>/docsManagementServlet?operationType=delete&dirType=docs&fileName=<%=docsList[i]%>">
															<font color="#000000">delete</font>
														</a>
													</td>
												</tr>
											</table>
										</td>
										<% } else {%>
										<td valign="top">										
											<table border=0>
												<tr>									
													<td>
														<a href="/documents/docs/<%=docsList[i]%>">
														<img src="images/win_file_icon1.gif" border="0" >
														</a>
													</td>
													<td valign="top">										
														<a href="/documents/docs/<%=docsList[i]%>">
														<font color="blue"><%=docsList[i]%></font>
														</a>										
													</td>
												</tr>	
											</table>	
										</td>										
										<% } %>
										
									</tr>	
								</table>	
							</td>
						</tr>
					<%}%>
					</table>
				</td>
				<td valign="top">
					<table width="100%">
						<tr>
							<td><img src=images/win_folder1.jpg></td>
							<td>Download Images</td>
						</tr>						
						
					<%for(int i=0;i<imagesList.length;i++){%>
						<tr>
							<td>&nbsp;</td>
							<td valign="top">
								<table width="100%">
									<tr>										
										<%
										//This section only for Admins
										if(loggedAgent.getUserType()== 0) {
										%> 										
										<td valign="top">										
											<table width="100%" border=0>
												<tr>
													<td>
														<table>
															<tr>
																<td>
																	<a href="/documents/images/<%=imagesList[i]%>">
																	<img src=images/win_img2.jpg border=0>
																	</a>
																</td>
																<td>
																<a href="/documents/images/<%=imagesList[i]%>">
																<font color="blue"><%=imagesList[i]%></font>
																</a>
																</td>
															</tr>
														</table>
													</td>
													<td align="right">&nbsp;&nbsp;&nbsp;&nbsp;										
														<a href="<%=hostPath%>/docsManagementServlet?operationType=delete&dirType=images&fileName=<%=imagesList[i]%>">
															<font color="#000000">delete</font>
														</a>
													</td>
												</tr>
											</table>
										</td>
										<% } else {%>
										<td valign="top">										
											<table border=0>
												<tr>
													<td>
														<a href="/documents/images/<%=imagesList[i]%>">
														<img src=images/win_img2.jpg border=0>
														</a>
													</td>
													<td valign="top">										
														<a href="/documents/images/<%=imagesList[i]%>">
														<font color="blue"><%=imagesList[i]%></font>
														</a>										
													</td>
												</tr>	
											</table>											
										</td>
										<% } %>
									</tr>	
								</table>	
							</td>
						</tr>
					<%}%>
					 </table>
				</td>
			</tr>	
		</table>			


	    	

</template:put>
</template:insert>
