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

			  <table width="100%" border="0">
                <tr>
                  <!-- START LSEFT SECTION OF RIGHT CONTENT-->
				  <td width="70%" valign="top">
				      <font color="#666666">
				      <%if (framework.getHomeContent()!=null && framework.getHomePicName().length()>0){%>	
			    		<%=framework.getHomePicName()%>		
			    	  <%}else{ %>
			            <img src="<%=hostPath%>/images/homeHouseDefault.jpg">
			           <%} %>
			           
					   <%if (framework.getHomeContent()!=null && framework.getHomeContent().length()>0) {%>	
			    		<%=framework.getHomeContent()%>		
			    		<%} else {%>			       		 
                      		<center>
					  		<p><b> Welcome to my Website</b> </p>
					   		</center>
                     		 <p>I am here to help you with one of the biggest decisions 
                     		 of your life: buying or selling a home.</p>					 
					  		 </font>				 			    
			         <%} %>			                
			          <center>
			           </font>
			           <br><br> 	  
					  <table  border="1" bordercolor="#663300" cellpadding="14">
  						<tr>
    						<td align="center">
							<font color="#666666">							
							Search for properties instantly and quickly<br>
							 </font>
							<a href="<%=hostPath%>/pages/web/searchListings.jsp">Click here for Property Search</a></td>
 						 </tr>
					  </table>
					  </center>					 
					 					  
				  </td>
				  <!-- START RIGHT SECTION OF RIGHT CONTENT-->
                  <td width="30%" bgcolor="#CCCCCC" valign="top">				 
					<table width="100%" border="0" valign="top">
					  <tr>
						<td>		  
					
<script type="text/javascript">

/***********************************************
* Translucent Slideshow script- ? Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

var trans_width='200px' //slideshow width
var trans_height='225px' //slideshow height
var pause=3000 //SET PAUSE BETWEEN SLIDE (3000=3 seconds)
var degree=8 //animation speed. Greater is faster.

var slideshowcontent=new Array()
//Define slideshow contents: 
slideshowcontent[0]=["<%=hostPath%>/images/3289771_0.jpg"]
slideshowcontent[1]=["<%=hostPath%>/images/3289771_1.jpg"]
slideshowcontent[2]=["<%=hostPath%>/images/3289771_2.jpg"]
slideshowcontent[3]=["<%=hostPath%>/images/3289771_3.jpg"]
slideshowcontent[4]=["<%=hostPath%>/images/3289771_4.jpg"]
slideshowcontent[5]=["<%=hostPath%>/images/3289771_5.jpg"]
slideshowcontent[6]=["<%=hostPath%>/images/3289771_6.jpg"]
slideshowcontent[7]=["<%=hostPath%>/images/3289771_7.jpg"]


////NO need to edit beyond here/////////////

var bgcolor='images/navbasebg.jpg'

var imageholder=new Array()
for (i=0;i<slideshowcontent.length;i++){
imageholder[i]=new Image()
imageholder[i].src=slideshowcontent[i][0]
}

var ie4=document.all
var dom=document.getElementById&&navigator.userAgent.indexOf("Opera")==-1

if (ie4||dom)
document.write('<div style="position:relative;width:'+trans_width+';height:'+trans_height+';overflow:hidden"><div id="canvas0" style="position:absolute;background-color:'+bgcolor+';width:'+trans_width+';height:'+trans_height+';left:-'+trans_width+';filter:alpha(opacity=20);-moz-opacity:0.2;"></div><div id="canvas1" style="position:absolute;background-color:'+bgcolor+';width:'+trans_width+';height:'+trans_height+';left:-'+trans_width+';filter:alpha(opacity=20);-moz-opacity:0.2;"></div></div>')
else if (document.layers){
document.write('<ilayer id=tickernsmain visibility=hide width='+trans_width+' height='+trans_height+' bgColor='+bgcolor+'><layer id=tickernssub width='+trans_width+' height='+trans_height+' left=0 top=0>'+'<img src="'+slideshowcontent[0][0]+'"></layer></ilayer>')
}

var curpos=trans_width*(-1)
var curcanvas="canvas0"
var curindex=0
var nextindex=1

function getslidehtml(theslide){
var slidehtml=""
if (theslide[1]!="")
slidehtml+='<img src="'+theslide[0]+'" border="0" width="200" height="225">'
if (theslide[1]!="")
slidehtml+='</a>'
return slidehtml
}

function moveslide(){
if (curpos<0){
curpos=Math.min(curpos+degree,0)
tempobj.style.left=curpos+"px"
}
else{
clearInterval(dropslide)
if (crossobj.filters)
crossobj.filters.alpha.opacity=100
else if (crossobj.style.MozOpacity)
crossobj.style.MozOpacity=1
nextcanvas=(curcanvas=="canvas0")? "canvas0" : "canvas1"
tempobj=ie4? eval("document.all."+nextcanvas) : document.getElementById(nextcanvas)
tempobj.innerHTML=getslidehtml(slideshowcontent[curindex])
nextindex=(nextindex<slideshowcontent.length-1)? nextindex+1 : 0
setTimeout("rotateslide()",pause)
}
}

function rotateslide(){
if (ie4||dom){
resetit(curcanvas)
crossobj=tempobj=ie4? eval("document.all."+curcanvas) : document.getElementById(curcanvas)
crossobj.style.zIndex++
if (crossobj.filters)
document.all.canvas0.filters.alpha.opacity=document.all.canvas1.filters.alpha.opacity=20
else if (crossobj.style.MozOpacity)
document.getElementById("canvas0").style.MozOpacity=document.getElementById("canvas1").style.MozOpacity=0.2
var temp='setInterval("moveslide()",50)'
dropslide=eval(temp)
curcanvas=(curcanvas=="canvas0")? "canvas1" : "canvas0"
}
else if (document.layers){
crossobj.document.write(getslidehtml(slideshowcontent[curindex]))
crossobj.document.close()
}
curindex=(curindex<slideshowcontent.length-1)? curindex+1 : 0
}

function jumptoslide(which){
curindex=which
rotateslide()
}

function resetit(what){
curpos=parseInt(trans_width)*(-1)
var crossobj=ie4? eval("document.all."+what) : document.getElementById(what)
crossobj.style.left=curpos+"px"
}

function startit(){
crossobj=ie4? eval("document.all."+curcanvas) : dom? document.getElementById(curcanvas) : document.tickernsmain.document.tickernssub
if (ie4||dom){
crossobj.innerHTML=getslidehtml(slideshowcontent[curindex])
rotateslide()
}
else{
document.tickernsmain.visibility='show'
curindex++
setInterval("rotateslide()",pause)
}
}

if (window.addEventListener)
window.addEventListener("load", startit, false)
else if (window.attachEvent)
window.attachEvent("onload", startit)
else if (ie4||dom||document.layers)
window.onload=startit

</script>
	
						</td>
					  </tr>
					</table>				
					
<table width="100%" border="0">
  <tr>
    <td width="100%">
	
<form name="calc">
<table  cellspacing="0" width="100%" border="1" bordercolor="#FFFFFF" >
<tr>
<td align="center">

  <table width="100%" cellpadding="5" bgcolor="<%=framework.getLeftNavColor()%>">  
  	<tr>
		<td align="center">
			<font color="#FFFFFF"><b>Mortgage Calculator</b></font>  
  		</td>
	 </tr>
  	<tr>
		<td>
			<font color="#FFFFFF">Amount borrowed $&nbsp;&nbsp;</font>  <br>
      		<input maxlength="20" name="principal"> 
  		</td>
	 </tr>
	<tr>
		<td>
			<font color="#FFFFFF">Interest rate %&nbsp;&nbsp;</font>  <br>
            <input maxlength="20" name="interestrate"> 
  		</td>
	</tr>
	<tr>
		<td><font color="#FFFFFF">Months to pay&nbsp;&nbsp;</font><br>
      		<input maxlength="20" name="months1">
  		</td>
	</tr>
	<tr>
		<td><input onclick="compute1();" value="Compute" type="button">&nbsp;&nbsp;&nbsp;&nbsp; 
         <input onclick="listing1();" value="Listing" type="button">
  		</td>
	 </tr>
	 <tr>
	 	<td>
			<font color="#FFFFFF">Monthly payment $&nbsp;&nbsp;</font><br>
      		<input readonly="readonly" maxlength="20" name="payment">
  		</td>
	 </tr>
	 <tr>
	 	<td><font color="#FFFFFF">Total interest paid $&nbsp;&nbsp;</font><br>
      		<input readonly="readonly" maxlength="20" name="interest1"> 
  		</td>
	</tr>
	<tr>
	 	<td>&nbsp;<br></td>
	</tr>
	</table>
</td>
</tr>
<!--
<tr>
 <td>
  <table align="center"> 
    <tr>
	<td><b>Extra principal $&nbsp;&nbsp;</b><br>
      <input maxlength="20" name="extra"> 
  	</td>
	</tr>
	<tr>
	<td><input onclick="compute2();" value="Compute" type="button">$&nbsp;&nbsp;$&nbsp;&nbsp;
        <input onclick="listing2();" value="Listing" type="button">
    </td>
	</tr>
	<tr>
	   <td><b>Months to pay&nbsp;&nbsp;</b><br>
        <input readonly="readonly" maxlength="20" name="months2"> 
       </td>
	</tr>
	<tr><td><b>Total interest paid $&nbsp;&nbsp;</b><br>
        <input readonly="readonly" maxlength="20" name="interest2"> 
        </td>
	</tr>
</table>
</td>
</tr>
-->
</table>
</form>	

	</td>
  </tr>
</table>

					
					
									  
				  </td>
                </tr>
              </table> 
              
</template:put>
</template:insert>
             
 
              