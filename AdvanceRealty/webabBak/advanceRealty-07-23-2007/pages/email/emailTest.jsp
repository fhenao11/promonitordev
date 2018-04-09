<%@ page import="sun.net.smtp.SmtpClient, java.io.*" %>

<%
 String from="edgarhenao@advancerealtyllc.com";
 String to="fhenao@comcast.net";
 //String to="gov@jguru.com, govi@bigfoot.com";

 try{
     //SmtpClient client = new SmtpClient("mail.advancerealtyllc.com");
	 SmtpClient client = new SmtpClient("smtp.mail.advancerealtyllc.com");
     client.from(from);
     client.to(to);
     PrintStream message = client.startMessage();
     message.println("To: " + to);
     message.println("Subject:  Sending email from JSP!");
     message.println("This was sent from a JSP page!");
     message.println();
     message.println("Cool beans! :-)");
     message.println();     
     message.println();
     client.closeServer();
  }
  catch (IOException e){	
     System.out.println("ERROR SENDING EMAIL:"+e);
  }
%>

<html>


<head>
	<title>Untitled</title>
</head>

<body>

Check to see if email has been sent!11

</body>
</html>
