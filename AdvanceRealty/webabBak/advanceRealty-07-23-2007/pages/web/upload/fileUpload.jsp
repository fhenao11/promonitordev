<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/tags/struts-html.tld" prefix="html" %>

<%
	String hostPath = request.getContextPath();
	
	String fieldName = request.getParameter("fieldName");
	
	//String dirType = fieldName.
	
	if(fieldName !=null && fieldName.length() > 0){
		session.setAttribute("fieldName",fieldName);
	}
	
	String fileName = (String) request.getAttribute("fileName");
	
	String message =  (String) request.getAttribute("message");
	
//System.out.println("fieldName = " + fieldName);
	


%>


<html:html locale="true">
<head>
<title>Advance Realty LLC</title>
<link rel="stylesheet" type="text/css" href="<%=hostPath%>/style/style.css">

<script language="JavaScript" type="text/javascript">

function closerAgent(){    
    window.opener.document.webForm.agentPicName.value='<%=fileName%>';         
    self.close();    
    return true;
}

function closerHome(){    
    window.opener.document.webForm.homePicName.value='<%=fileName%>';          
    self.close();    
    return true;
}

function closerDocs(){    
    //window.opener.document.webForm.homePicName.value='<%=fileName%>';     
    //window.opener.refresh();  
    opener.location.reload();     
    self.close();    
    return true;
}

</SCRIPT>

</head>
<body>
<center>

<%if(message ==null ||  message.length() <= 0) {%>
<html:form action="/FileUpload" method="post" enctype="multipart/form-data">
<html:hidden property="dirType" value="<%=fieldName%>" /> 
<table>
<tr>
<td align="center" colspan="2" class="notesRed">
Please Browse the Picture file on your computer you would like to use for your website, and then, click the Upload File Button<br><br><br>
</tr>
<tr>
<td align="left" colspan="2">
<font color="red"><html:errors/></font>
</tr>
<tr>
<td align="right">
File Name
</td>
<td align="left">
<html:file property="theFile"/> 
</td>
</tr>

<tr>
<td align="center" colspan="2">
<html:submit>Upload File</html:submit>
</td>
</tr>
</table>

</html:form>
<% } else {

String fieldNameIn = (String) session.getAttribute("fieldName");

%>

<br><br><br>
<b><%=message%><b><br><br><br><br><br>
<font class="notesRed">Click on the Close Window Button below to Save the Picture name.<br>
Do not close using the X on the upper right hand corner.  </font>
<br><br><br><br> 
<form name="formname">
<%if(fieldNameIn != null && fieldNameIn.equals("agentPicName")){%>
	<input type="button" value="Close Window" onClick="closerAgent();">
<%}else if(fieldNameIn != null && fieldNameIn.equals("homePicName")){%>
	<input type="button" value="Close Window" onClick="closerHome();">
<%}else{%>
	<input type="button" value="Close Window" onClick="closerDocs();">
<%}%>

</form>



<% } %>

</center>


</body>
</html:html>
