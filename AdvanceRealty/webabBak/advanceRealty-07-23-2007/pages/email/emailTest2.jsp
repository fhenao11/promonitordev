<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

<%
  Properties props = new Properties();
  props.put("mail.smtp.host", "advancerealtyllc.com");
  
  Session s = Session.getInstance(props, null);
  MimeMessage message = new MimeMessage(s);
  InternetAddress from = new InternetAddress("edgarhenao@advancerealtyllc.com");
  message.setFrom(from);
  
  InternetAddress to = new InternetAddress(" you@example.comThis email address is being protected from spam bots, you need Javascript enabled to view it ");
  message.addRecipient(Message.RecipientType.TO, to);
  message.setSubject("Test from JavaMail.");
  message.setText("Hello from JavaMail!");

  Transport.send(message);
%>

<html>
<p align="center">
  A Message has been sent. <br>
   Check your inbox.
</p>

<p align="center">
   <a href="sendmail.jsp">Click here to send another!</a>
</p>
</html>  

