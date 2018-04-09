<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>

<template:insert template="/pages/template.jsp">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

<%
	String hostPath = request.getContextPath();
%>	


<table width="100%" border="0">
<tr>						
<!-- START MIDDLE CONTENT   -->	
<td width="580" height="510" valign="top" align="center">
	<table width="100%" border="0" bgcolor="#6699FF">
		<tr>
			<td align="center">
			<img src="../images/3242843_0.jpg" width="400" height="293">
			</td>			
		</tr>
	</table>
	<br><br>		
	
	<table border="0" width="100%">
	<tr>		
		<td align="center" bgcolor="#CCCCCC"><font class="ablue2">
			Property Listings</font><br><br>
			<b>Sign up to save searches/listings<br> and get email alerts</b><br><br><br><br> 	 												
		</td>
		 <td width="40">&nbsp;&nbsp;</td>
		<td align="center" bgcolor="#CCCCCC">
			<font class="ablue2" >Area Listings Search</font><br><br>
			<b>Get Area Listings in any area<br>instantly
			and quickly</b><br><br><br><br> 												
		</td>		 
	</tr>
	<tr>
		<td align="center" bgcolor="#3366CC">												
			<table >				
				<tr>
					<td>&nbsp;&nbsp;</td>
					<td bgcolor="red" >&nbsp;&nbsp;<a href="<%=hostPath%>/pages/propertyUpdates.jsp">Click for Property Listings</a>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
				</tr>
			</table>																																		
		</td>
	 
		<td width="40">&nbsp;&nbsp;</td>
		<td align="center" bgcolor="#3366CC">
			<table>
				<tr>
					<td>&nbsp;&nbsp;</td>
					<td bgcolor="red" >&nbsp;&nbsp;<a href="<%=hostPath%>/pages/searchListings.jsp">Click for Area Listings Search</a>&nbsp;&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
				</tr>
			</table>																																		
		</td>
	</tr>
</table>																	
</td>	
<!-- END LEFT CONTENT   -->	
<!-- START RIGHT CONTENT   -->									
<td width="200" height="510" valign="top" align="center" bgcolor="#CCCCCC">									
	<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="5%" valign="top" align="center" bgcolor="#ffffff">
				<img src="<%=hostPath%>/images/swingingsold.gif">																			
			</td>
		</tr>
		<tr>
			<td width="5%" valign="top" align="center" bgcolor="#ffffff"><img src="<%=hostPath%>/images/adRealty_02.jpg"></td>
		</tr>
	</table>							

	<script type="text/javascript">

/***********************************************
* Translucent Slideshow script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
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
	<!-- END RIGHT CONTENT   -->	
	</td>
</tr>
</table>
</template:put>
</template:insert>
