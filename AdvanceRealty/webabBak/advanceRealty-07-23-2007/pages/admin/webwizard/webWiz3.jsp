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

String navItems = framework.getNavItems();

String findAgentChecked="";
String ARListingsChecked="";
String searchPropertiesChecked="";
String buyersChecked="";
String sellersChecked="";
String aboutUsChecked="";
String contactUsChecked="";

if(navItems!=null && navItems.indexOf("findAgent") > -1)
   findAgentChecked="checked";

if(navItems!=null && navItems.length()>0 && navItems.indexOf("ARListings") > -1)
   ARListingsChecked="checked";

if(navItems!=null && navItems.length()>0 && navItems.indexOf("searchProperties") > -1)
   searchPropertiesChecked="CHECKED";

if(navItems!=null && navItems.length()>0 && navItems.indexOf("buyers") > -1)
   buyersChecked="checked";

if(navItems!=null && navItems.length()>0 && navItems.indexOf("sellers") > -1)
   sellersChecked="checked";

if(navItems!=null && navItems.length()>0 && navItems.indexOf("aboutUs") > -1)
   aboutUsChecked="checked";

if(navItems!=null && navItems.length()>0 && navItems.indexOf("contactUs") > -1)
   contactUsChecked="checked";
System.out.println("CCCC");
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

<form name="webForm" action="<%=hostPath%>/frameworkWebServlet">

<input type="hidden" name="frameworkTranType" value="editFramework">


		<table width="100%">
			<tr>
				<td class="navLightGray" align="left" width="100%">WEBSITE MANAGEMENT >> WIZ3</td>
			</tr>
			<tr>
				<td align="center" width="100%" >
				    <table width="96%" class="tableRuler" border="0" cellspacing="0" cellpadding="0" >
				    	<tr>
				    		<td> Create the Main Navigational Links by checking the checkboxes below you wish to add to your website<br>
                            Load pictures and add text content to your website.<br><br>
				    		<b>Note:</b><br>If the Property Listings checkbox is checked, and the Enter URL input box is left blank, the default value listed below will be used.<br>
				    		If the Search Properties checkbox is checked, and the Enter URL input box is left blank, the default value listed below will be used.
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
					<table bgcolor="#157DEC">
						<tr>
							<td>
								<a href="javascript:openMockUpwindow()">Click Here to View Template Sections</a><br>
							</td>
						</tr>
					</table>
					<br><br>
				</td>
			<tr>			
			<tr><td align="center"><b>Step 3: Add Web Content (Menu Navigation, Text and Pictures)</b><br><br></td></tr>
			<tr>
				<td align="center"> 
					<a href="<%=hostPath%>/frameworkWebServlet?frameworkTranType=wiz2"><font color="blue"><< Previous&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
				</td>
     		</tr>							
			<tr><td><hr></td></tr>		
			<tr><td><hr></td></tr>		
			<tr>
				<td width="100%" align="left" height="300">
					<br><br>
					<b><font class="agents">1. Create Navigation Links:</font></b>
					<table cellpadding="2" cellspacing="20">
						<tr>
							<td>
								<input type="checkbox" name="home" disabled="true" checked >Home		
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="findAgent" <%=findAgentChecked%> >Find Agent		
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="ARListings" <%=ARListingsChecked%>>Property Listings		
							</td>
							<td>
								Enter URL: <input type="text" name="arListingsURL" value="<%=framework.getArListingsURL()%>" size="50"> 							
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="searchProperties" <%=searchPropertiesChecked%>>Search Properties		
							</td>
							<td>Enter URL: <input type="text" name="searchPropertiesURL" value="<%=framework.getSearchPropertiesURL()%>" size="50" >							
							</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="buyers" <%=buyersChecked%>>Buyers		
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="sellers" <%=sellersChecked%>>Sellers		
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="aboutUs" <%=aboutUsChecked%>>About Us	
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
								<input type="checkbox" name="contactUs" <%=contactUsChecked%>>Contact Us	
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>						
				</td>
			</tr>
			<tr>
				<td width="100%" >				
				<font class="notesRed">AR Listings Default Value:</font><br> http://advancerealtyllc.listingware.com/search/searchresults.cfm?Reciprocity=No&PropertyTypeID=All&CFID=4745810&CFTOKEN=31637114<br><br>
				<font class="notesRed">Property Listings Default Value:</font> http://advancerealtyllc.listingware.com/search/index.cfm?MemberView=On				
				<br><br>
				</td>
			</tr>
			<tr><td><hr></td></tr>	
			<tr>
				<td>
					<b><font class="agents">2. Picture Name and Home Content:</font></b>
					<table cellpadding="2" cellspacing="20">
						<tr>
							<td bgcolor="#157DEC" align="center">
								<a href="javascript:openwindow('agentPicName')">Click Here to Upload Agent Picture</a><br>
								(For Template 1- Picture should have a width of 200 px or less)
								 For Template 2- Picture should have a width of 153 px or less--
							</td>
							<td>
								<font color="red">(**Picture Uploaded was: <%=framework.getAgentPicName()%></font>
								<input type="text" name="agentPicName" value="<%=framework.getAgentPicName()%>" >)<br>
								(Clear this text box to use the default picture for this website)
							</td>
						</tr>
						<tr>
							<td bgcolor="#157DEC">
								<a href="javascript: openwindow('homePicName')">Click Here to Upload Home Picture</a><br>
								(Picture should have a width of 400 px or less)
							</td>
							<td>
								 <font color="red">(**Picture Uploaded was: <%=framework.getHomePicName()%></font>
								<input type="text" name="homePicName" value="<%=framework.getHomePicName()%>"  >)
								(Clear this text box to use the default picture for this website)
							</td>
						</tr>
						<tr>
							<td colspan="2" class="navLightGray">
								Home Page Content: 
								<TEXTAREA NAME="homeContent" ROWS=8 COLS=84>
									<%=framework.getHomeContent()%>
								</TEXTAREA>							
								(*Content should not exceed more than 4,000 characters)
							</td>													
						</tr>
					</table>
				<td>
			</tr>			
			<tr><td><hr></td></tr>	
			<tr>
				<td width="100%"  align="center">
				  <table class="tableWizard">
				  	<tr>
						<td align="center" class="tableWizard">							
							<input type="submit" name="submit" value="Submit">	 
						</td>
    					<td align="center" class="tableWizard">
							<a href="<%=hostPath%>/pages/admin/webwizard/webWizHome.jsp">Cancel </a>
	   					</td>
					</tr>
				   </table>
				</td>			
			</tr>
		</table>
 </form>       

	<BR><BR>     

</template:put>
</template:insert>

