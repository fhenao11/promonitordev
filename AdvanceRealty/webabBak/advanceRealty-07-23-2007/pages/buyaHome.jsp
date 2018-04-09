<%@ taglib uri='/tags/struts-template.tld' prefix='template' %>
<%@ taglib uri='/tags/struts-html.tld' prefix='html' %>  
<%@ taglib uri="/tags/struts-bean.tld" prefix="bean" %>


<template:insert template="../pages/template.jsp">
<template:put name='page_title' content='AdvanceRealtyLLC' direct='true'/>
<template:put name='content_title' direct='true'>    		
</template:put> 
<template:put name='content'>

		<script type="text/javascript">
		/***********************************************
		* IFRAME Scroller script- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
		* This notice MUST stay intact for legal use
		* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
		***********************************************/
	
		//specify path to your external page:
		var iframesrc="http://advancerealtyllc.listingware.com/search/index.cfm?MemberView=On";
	
		//You may change most attributes of iframe tag below, such as width and height:
		document.write('<iframe id="datamain" src="'+iframesrc+'" width="100%" height="750px" marginwidth="50" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="yes"></iframe>')
		</script>

</template:put>
</template:insert>

