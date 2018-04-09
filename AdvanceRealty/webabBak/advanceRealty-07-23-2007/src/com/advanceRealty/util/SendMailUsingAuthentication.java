package com.advanceRealty.util;

/*
Some SMTP servers require a username and password authentication before you
can use their Server for Sending mail. This is most common with couple
of ISP's who provide SMTP Address to Send Mail.

This Program gives any example on how to do SMTP Authentication
(User and Password verification)

This is a free source code and is provided as it is without any warranties and
it can be used in any your code for free.

Author : Sudhir Ancha
*/

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.io.*;


public class SendMailUsingAuthentication
{

	
  //private static final String SMTP_HOST_NAME = "mail.frugallyyours.net ";
  private static final String SMTP_HOST_NAME = "advancerealtyllc.com";
  //private static final String SMTP_HOST_NAME = "wend.lunarservers.com";
  private static String SMTP_AUTH_USER;
  private static String SMTP_AUTH_PWD; 
  
  public SendMailUsingAuthentication(String userName, String password){
	  
	  this.SMTP_AUTH_USER=userName;
	  this.SMTP_AUTH_PWD=password;
  }

  public static void main(String args[]) throws Exception
  {
	
	//String emailFromAddress = "info@frugallyyours.net";
	String emailFromAddress = "edgarhenao@advancerealtyllc.com";
	String emailToAddress = "fhenao@comcast.net";
	String emailSubjectTxt = "Email Subject from CLIENT 2 Standalone-Second Two EMAILS"; 
	String emailMsgTxt = "<b>Message to go with the email</b><br><br>End of Message";
	//String userName = "fhenao@frugallyyours.net";
	//String password = "ferhen11";
	
	String userName = "edgarhenao@advancerealtyllc.com";
	String password = "ehenao";
	
	//String frugalFriendName ="Fernando Henao";
	//String userName = "info@frugallyyours.net";
	//String password = "mitchmatt";
	
	for(int i=0;i<2;i++){
	
		if(i==0)
			emailToAddress = "fhenao@comcast.net";
		else
			emailToAddress = "fhenao2@hotmail.com";
	
		SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication(userName,password);
    
		smtpMailSender.postMail( emailToAddress, emailSubjectTxt, emailMsgTxt, emailFromAddress, userName, password);
    
	}
    System.out.println("Sucessfully Sent mail to All Users");
  }

  public void postMail(String to, String subject,
                      String message , String from,
                      String userName, String password) throws MessagingException
  {
    boolean debug = false;   
   
     //Set the host smtp address
     Properties props = new Properties();
     props.put("mail.smtp.host", SMTP_HOST_NAME);
     props.put("mail.smtp.auth", "true");

    Authenticator auth = new SMTPAuthenticator();      
    Session session = Session.getDefaultInstance(props, auth);

    session.setDebug(debug);

    // create a message
    Message msg = new MimeMessage(session);

    // set the from and to address
    InternetAddress addressFrom = new InternetAddress(from);
    msg.setFrom(addressFrom);

    InternetAddress addressTo = new InternetAddress(to);   
    msg.setRecipient(Message.RecipientType.TO, addressTo);

    // Setting the Subject and Content Type
    msg.setSubject(subject);
    msg.setContent(message, "text/html");
    Transport.send(msg);
 }


/**
* SimpleAuthenticator is used to do simple authentication
* when the SMTP server requires it.
*/
private class SMTPAuthenticator extends javax.mail.Authenticator
{
	
    public PasswordAuthentication getPasswordAuthentication()
    {
        String username = SMTP_AUTH_USER;
        String password = SMTP_AUTH_PWD;
    	
        return new PasswordAuthentication(username, password);
    }
}

}




