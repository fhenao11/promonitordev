<%@ page language="java" %>
<%@ page import="com.advanceRealty.dto.Framework" %>
<%@ page import="com.advanceRealty.dto.Agent" %>

<%@ taglib uri="/tags/struts-template.tld" prefix="template" %>
<%@ taglib uri="/tags/struts-html.tld" prefix="html" %>

<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); 		//HTTP 1.0
	response.setDateHeader ("Expires", 0); 			//prevents caching at the proxy server

	//String hostPath = request.getContextPath();
	String hostPath = "http://www.advancerealtyllc.com";
	
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
	<!--<link rel="stylesheet" type="text/css" href="<%=hostPath%>/style/style2.css"> -->
	
<script language="JavaScript">
<!-- hide

function breakout_of_frame()
{
  // see http://www.thesitewizard.com/archive/framebreak.shtml
  // for an explanation of this script and how to use it on your
  // own website
  if (top.location != location) {
    top.location.href = document.location.href ;
  }
}

// initialize text windows
function init()
{

   breakout_of_frame();
    
  <%if(request.getContextPath().indexOf("index2")>0 ){%>
    calc.principal.value = "136283";  
    calc.interestrate.value  = "8";  
    calc.months1.value = "360";  
    calc.payment.value = "";    

    //calc.extra.value = "";  
    //calc.months2.value = "";  
  <%}%>
}

// format floating point number to show dollars and cents
function currency2str(f)
{
    var str = "";
    var pos = 1;

    if (f < 0) // negative number
    {
        f = -f
        pos = 0;
    }  

    // extract dollars and cents
    var dollars = Math.floor(f);
    var cents   = Math.round(100*(f - dollars));
    if (cents == 100) 
    {
        dollars += 1;
        cents = 0;
    }

    if (pos == 0) str += "("; // show as negative

    if (cents == 0)
        str += dollars + ".00";
    else if (cents < 10)
        str += dollars + ".0" + cents;
    else
        str += dollars + "." + cents;

    if (pos == 0) str += ")"; // show as negative

    return str;
}

// compute the size of a periodic payment to amortize a loan
function monthly_payment( p, apr, n )
{
    var i = apr/1200;
    var m = p*i*Math.pow((1 + i), n)/(Math.pow((1 + i), n) - 1);

    return (0.01*Math.ceil(100*m));   // round up
}

// total interest and payment size for a loan
function compute1()
{
    var principal = parseFloat(calc.principal.value);
    var int_rate  = parseFloat(calc.interestrate.value);
    var months1   = parseInt(calc.months1.value);
    var payment   = monthly_payment( principal, int_rate, months1 );
    var interest  = parseFloat("0");

    // compute total interest paid
    while (principal > 0.0)
    {
        var ip    = 0.01*Math.round(principal*int_rate/12);
        principal = principal + ip - payment;
        interest += ip;
    }

    calc.payment.value   = currency2str(payment);
    calc.interest1.value = currency2str(interest);
}

// interest and principal of each payment in a separate window
function listing1()
{
    var principal = parseFloat(calc.principal.value);
    var int_rate  = parseFloat(calc.interestrate.value);
    var months1   = parseInt(calc.months1.value);
    var payment   = monthly_payment( principal, int_rate, months1 );
    var count     = parseInt("0");

    msgWindow=window.open("","msgWindow","toolbar=no,status=no,menubar=yes,scrollbars=yes,width=550,height=400");
    msgWindow.document.open();
    msgWindow.document.writeln("<html><head><title>Principal and interest listing</title></head>");
    msgWindow.document.writeln("<body>");
    msgWindow.document.writeln("This may take a few moments...<br>");
    msgWindow.document.writeln("payment = $" + currency2str(payment));
    msgWindow.document.writeln("<table bordercolor=blue border=1 cellspacing=0>");
    msgWindow.document.writeln("<tr><th>month<th>principal<th>interest<th>balance</tr>");

    while (principal > 0.0)
    {
        var ip      = 0.01 * Math.round(principal*int_rate/12);
        if (payment > principal + ip) payment = principal + ip; 
        var pp      = payment - ip;
        var principal = principal + ip - payment;
        count++;

        msgWindow.document.write("<tr><td>");
        msgWindow.document.write(count);
        msgWindow.document.write("<td align=right>" + currency2str(pp));
        msgWindow.document.write("<td align=right>" + currency2str(ip));
        msgWindow.document.write("<td align=right>" + currency2str(principal));
        msgWindow.document.writeln("</tr>");
    }

    msgWindow.document.write("</table>");
    msgWindow.document.write("</body></html>");
    msgWindow.document.close();
}

// number of payments and total interest with extra principal
function compute2()
{
    var principal = parseFloat(calc.principal.value);
    var int_rate  = parseFloat(calc.interestrate.value);
    var months1   = parseInt(calc.months1.value);
    var payment   = monthly_payment( principal, int_rate, months1 );
    var extra     = parseFloat(calc.extra.value);
    var interest  = parseFloat("0");
    var count     = parseInt("0");

    if (isNaN(extra)) extra = parseFloat("0");

    while (principal > 0.0)
    {
        var ip    = 0.01*Math.round(principal*int_rate/12);
        principal = principal + ip - (payment + extra);
        interest += ip;
        count++;
    }

    calc.payment.value   = currency2str(payment);
    calc.interest2.value = currency2str(interest);
    calc.months2.value   = count;
}

// interest and principal of each payment in a separate window
function listing2()
{
    var principal = parseFloat(calc.principal.value);
    var int_rate  = parseFloat(calc.interestrate.value);
    var months1   = parseInt(calc.months1.value);
    var payment   = monthly_payment( principal, int_rate, months1 );
    var extra     = parseFloat(calc.extra.value);
    var count     = parseInt("0");

    if (isNaN(extra)) extra = parseFloat("0");

    msgWindow=window.open("","msgWindow","toolbar=no,status=no,menubar=yes,scrollbars=yes,width=550,height=400,resizable=yes");
    msgWindow.document.open();
    msgWindow.document.writeln("<html><head><title>Principal and interest listing</title></head>");
    msgWindow.document.writeln("<body>");
    msgWindow.document.writeln("This may take a few moments...<br>");
    msgWindow.document.writeln("payment = $" + currency2str(payment) + " + " + currency2str(extra));
    msgWindow.document.writeln("<table bordercolor=blue border=1 cellspacing=0>");
    msgWindow.document.writeln("<tr><th>Month<th>Principal<th>interest<th>balance</tr>");

    while (principal > 0.0)
    {
        var ip = 0.01 * Math.round(principal*int_rate/12);

        // last payments
        if (payment > principal + ip)
        {  
            payment = principal + ip; 
            extra   = 0.0;
        }
        else if (extra > principal + ip - payment)
            extra = principal + ip - payment;

        var pp = (payment + extra) - ip;
        var principal = principal + ip - (payment + extra);
        count++;

        msgWindow.document.write("<tr><td>");
        msgWindow.document.write(count);
        msgWindow.document.write("<td align=right>" + currency2str(pp));
        msgWindow.document.write("<td align=right>" + currency2str(ip));
        msgWindow.document.write("<td align=right>" + currency2str(principal));
        msgWindow.document.writeln("</tr>");
    }

    msgWindow.document.write("</table>");
    msgWindow.document.write("</body></html>");
    msgWindow.document.close();
}
// unhide -->
</script>
	
</head>
<body bgcolor="gray" onload="init()">
<center>
<table width="700" height="650" border="0" bgcolor="#FFFFFF" cellspacing="1">
	<tr>
		<td  bgcolor="<%=topNameColor%>" height="5" colspan="4">&nbsp;</td>
	</tr>
	<tr>		
		<td  width="175" height="128"  bgcolor="<%=topHeaderColor%>" valign="top">
		  <table width="226" height="128" cellspacing="1" border=0>
        	<tr><td valign="center" align="center" width="226" height="105">
			 <p><font color="<%=topNameColor%>"><b> 
			 
                <%=firstName%>&nbsp; <%=lastName%><br>
				Tel:<%=tel%><br>
				<%if(fax != null && fax.length() >0){%>
		   			Fax:<%=fax%><br>
				<%}%>
				<%if(email != null && email.length() >0){%>
				<marquee align="middle" width="170" height="10" border="0"><%=email%></marquee>
				<%}%>				
				</b></font></p>		  
			</td></tr>
			<tr><td  width="226" bgcolor="<%=topNameColor%>" height="5" >&nbsp;</td>
			</tr>
      	  </table>
		</td>
		<td  width="175" bgcolor="<%=topHeaderColor%>" valign="top"><img src="<%=hostPath%>/images/topHomePic.jpg" alt=""></td>
		<td  width="175"  bgcolor="<%=topHeaderColor%>" valign="top">	
					<table bgcolor="#FFFFFF" width="200" cellspacing=1 height="128">
						<tr>
							<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/index2.jsp" ><font color="#FFFFFF"><b>Home</b></a></td>
						</tr>
						<tr>
							<%if(buyersChecked==true){ %>
							<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/buyers.jsp" ><font color="#FFFFFF"><b>Buyers</b></a></td>
							<%}%>
						</tr>
						<tr>
							<%if(sellersChecked==true){ %>
								<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/sellers.jsp" ><font color="#FFFFFF"><b>Sellers</b></a></td>
							<%}%>
						</tr>
						<tr>							
							<%if(searchPropertiesChecked==true){ %>
								<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/searchListings.jsp" ><font color="#FFFFFF"><b>Search Properties</b></a></td>								
							<%}%>
						</tr>
					</table>	
		</td>
		<td width="175"  bgcolor="<%=topHeaderColor%>"><img src="<%=hostPath%>/images/keys_pic2.jpg" alt=""></td>
	</tr> 
	<!-- END TOP -->
	<tr>	
		<td colspan="4" valign="top">
		  <table width="100%" border="0"><!--DWLayoutTable-->
		    <tr>		       
            <td width="160" height="560" bgcolor="<%=leftNavColor%>" valign="top" align="center"> 
              <p>
              <% if (agentPicName !=null && agentPicName.length()>0) {%>		
		  		<img src="<%=hostPath%>/images/agents/<%=agentPicName%>">	
			  <%}else{%>
                 <img src="<%=hostPath%>/images/defaultAgentPic.jpg" width="153" height="139">  			 		  
			  <%} %>
			  </p>
			       <table bgcolor="#FFFFFF" width="100%" cellspacing=1 height="128">
						<tr>
							<%if(findAgentChecked==true){ %>
								<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/findAgents.jsp" ><font color="#FFFFFF"><b>Find Agent</b></a></td>
							<%}%>
						</tr>
						<tr>
							<%if(ARListingsChecked==true){ %>
								<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/advrealtyListings.jsp" ><font color="#FFFFFF"><b>AR Listings</b></a></td>
							<%}%>
						</tr>
						<tr>
							<%if(contactUsChecked==true){ %>
								<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/contactUs.jsp" ><font color="#FFFFFF"><b>Contact Us</b></a></td>
		  					<%}%>
						</tr>
						<tr>
							<%if(aboutUsChecked==true){ %>
								<td bgcolor="<%=leftNavColor%>"><a href="<%=hostPath%>/pages/web/aboutUs.jsp" ><font color="#FFFFFF"><b>About Us</b></a></td>
							<%}%>
						</tr>
					</table>				             
              <p>&nbsp;</p>
              <p><br>
                <img src="<%=hostPath%>/images/advance_logo_leftNav.jpg">                
              </p>
            </td>
			<!-- END LEFT CONTENT-->			
      		<td valign="top" bgcolor="#FFFFFF" >
      		  <!-- START RIGHT CONTENT-->      		
      		     <template:get name='content'/>
              <!-- END RIGHT CONTENT-->	
			</td>			
      		</tr>	
		  </table>
		</td>	
	</tr>
	
	<tr>
		<td bgcolor="<%=topNameColor%>" height="5" colspan="4">&nbsp;</td>
	</tr>
</table>
</center>
</body>
</html>