package  com.advanceRealty.servlets.email;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.advanceRealty.util.SendMailUsingAuthentication;

public class EmailListServlet extends HttpServlet {
 
  public void init()
    throws ServletException
  {
    //greeting = getInitParameter("greeting");
  }

  public void doPost(HttpServletRequest request,
                    HttpServletResponse response)
    throws ServletException, IOException
  {    

	HttpSession session = request.getSession(true);		
	
	String nextPage = "/pages/admin/emailManagement/okEmail.jsp";
	
	String message = "";	
	
	//Email Parameters
	String emailFrom        =  request.getParameter("emailFrom");	
	String userName         =  request.getParameter("userName");
	String password         =  request.getParameter("password");
	String emailTo          =  request.getParameter("emailTo");
	String subject          =  request.getParameter("subject");
	String emailContent     =  request.getParameter("emailContent");
	//String emailFromAddress = "fhenao@frugallyyours.net";
	//String userName         = "fhenao@frugallyyours.net";
	//String password         = "ferhen11";
	
	String[] emailToList = emailTo.split(";");
	
	
	try{
			
		int emailsSentCounter=0;		 
		
		SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication(
				userName,password);
		
		//Send individual emails
		for(int i=0;i<emailToList.length;i++){

			if(emailToList[i]!=null && emailToList[i].length()>0){
			
				smtpMailSender.postMail( emailToList[i], 
										subject, 
										emailContent, 
										emailFrom,
										userName,
										password);												}	
			
			     emailsSentCounter++;
		
		    }	
		
		message = "Emails were sent successfully. <BR><BR>Number of Emails sent: " + emailsSentCounter; 	

		
				
	}catch(Exception e){
		message = "There was a problem processing your information. Please, try later. Thank you";
	}	
	
	request.setAttribute("message", message);	
	
	RequestDispatcher disp = null;
	
	disp = getServletContext( ).getRequestDispatcher(nextPage);
	disp.forward(request, response);

	
  }
  
  public void doGet(HttpServletRequest request,
					  HttpServletResponse response)
	   throws ServletException, IOException {
	  doPost(request, response);
   }
  

  
  public void destroy()
  {
    // nothing to do
  }
}

