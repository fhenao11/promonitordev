package com.advanceRealty.servlets.logout;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {
  private String greeting;

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
	
	session.setAttribute("loggedAgent", null);
		
	String errorMessage = null;
	
	String nextPage = "/pages/admin/login.jsp";
	
	RequestDispatcher dispatch = getServletContext( ).getRequestDispatcher(nextPage);
	dispatch.forward(request, response);
	
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

