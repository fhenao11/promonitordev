<%@ page import="com.advanceRealty.dto.Framework" %>
<%@ page import="com.advanceRealty.util.PropsLoader" %>

<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>

<%
	String hostPath = request.getContextPath();	
	PropsLoader props = new PropsLoader();	    	
	props.load();	
	
	Framework framework = (Framework) session.getAttribute("framework");
	String templateId = framework.getField1();	
	String templateName = props.getProperty("template."+templateId+".name");

	String pageTemplate = "/pages/web/templates/"+templateName+".jsp";

%>	
<template:insert template="<%=pageTemplate%>">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

<table>
		<tr>
			<td width="10">&nbsp;</td>
			<td>
				<font color="Black"> 
				<h3><strong>For Our Buyers: </strong></h3><br><br>
				<a href="<%=hostPath%>/pages/web/propertyUpdates.jsp"><font class="ablue"><u>Get Free Property Updates</u></font></a><br><br>
				<!--
				<a href="buyers-philosophy.asp" target="_blank"><font class="ablue"><u>View Our Buyers Philosophy</u></font></a><br><br>
				<a href="relocation.asp"><font class="ablue"><u>Get a Free Relocation Package</u></font></a><br><br>
				<a href="http://www.eschoolprofile.com/free/profile.asp?m=234653" target="_blank"><font class="ablue"><u>Get a Free School Report</u></font></a><br>
				-->
				<br><br>
				<h3>Home Buying Advice:</h3>
				<br><br>
				<p align="justify">
				Don't depend on luck to find your new home - enlist the services of a real estate representative; one who specializes in the sort of property you would like to buy. 
				<br><br>
				
				<img src="<%=hostPath%>/images/buying.jpg" align="left" hspace=16 vspace=16 border ="2">Choose a REALTOR you feel confident can turn your dreams into reality. Once you have, here's what to expect. 
				<br><br>
				<b> The Voice of Experience </b>
				<br><br>
				A REALTOR will not take it for granted that you know all the in's and out's of the buying/selling process. Instead, he or she will provide you with a full explanation of what to expect - and that's important so you're not faced with any surprises along the way. 
				<br><br>
				<b> Assessing Your Needs </b>
				<br><br>
				One of the first questions a REALTOR will ask is, Why are you moving?" A REALTOR will also explore any time constraints you might have (perhaps imposed by the need to relocate for employment), your financial situation and any future plans. 
				<br><br>
				A REALTOR will also help you decide where you want to live and what type of house is best for you. There are plenty of housing options available in the marketplace - new homes, resale homes, townhouses, condominiums. A REALTOR can help you choose the one that best suits your current and projected lifestyle. 
				<br><br>
				It's all part of getting to know you so your purchase will be handled to your complete satisfaction. 
				<br><br>
				<b>Targeting Your Dream Home </b>
				<br><br>
				A REALTOR will help you identify what you want in your new residence. A pool? A Garage? An extra room? A particular building design? What about the neighbourhood? Proximity to schools or work? 
				<br><br>
				A REALTOR will compare your needs, wants and budget with what is available on the market - and make recommendations that save you time and effort. 
				<br><br>
				He or she will also accompany you as you view houses and help you assess their suitability and price. As an expert on a property, a REALTOR can provide facts on the neighbourhood, the cost of heating, the condition of the furnace, and so on. 
				<br><br>
				<b>Access to MLS </b>
				<br><br>
				Multiple Listing Service or MLS is an exclusive service accessible only through a REALTOR - and it can be a valuable tool. Through MLS, the details of a wide variety of listed properties are made available to the REALTOR you work with. That can save you a tremendous amount of time and effort in your hunt for the right home. 
				<br><br>
				<b>Arranging Financing </b>
				<br><br>
				REALTORS have broad and current knowledge of the financing choices available to home buyers - and there are many of them, an often confusing array. At your request, a REALTOR will assist in evaluating mortgage options and obtaining financing at the most attractive prevailing rates and terms. 
				<br><br>
				<b> A Skillful Negotiator  </b>
				<br><br>
				REALTORS are experienced in arranging fair deals. He or she will assist in negotiating an offer, acting as a mediator to head off potential conflicts between you and the seller, and draw up a legally binding contract. 
				<br><br>
				<b>Who Pays?  </b>
				<br><br>
				Usually, the REALTOR will be paid from the proceeds of the sale. The listing agreement states the REALTOR's fee. 
				<br><br>
				Buying a home can be an exasperating and time-consuming experience. But not if you enlist the services of a REALTOR. A real estate professional understands the market, knows exactly what is available and can match your needs and budget to your new home efficiently and effectively. 
				<br><br>
				<a name="inspection"><b>Insist on a Home Inspection</a></b>
				<br>
				A professional home inspection protects you, the buyer. It allows
				the buyer and seller the opportunity to learn about the property's
				defects.
				<br><br>
				A home inspection usually covers the following:
				<br><br>
				<li>Plumbing conditions - if there is leakage or clogging
				<li>Roofing conditions - the extent of deterioration, if there is leakage
				<li>Electrical conditions - if there are inadequate circuits or potential
				fire hazards
				<li>Structural problems - if there are problems with the underlying
				foundation of your home
				</p> </font> 		
				
			</td>
		</tr>
	</table>
        
	
</template:put>
</template:insert>
