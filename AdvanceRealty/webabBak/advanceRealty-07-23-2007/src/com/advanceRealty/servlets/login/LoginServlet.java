package com.advanceRealty.servlets.login;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.advanceRealty.dto.Agent;
import com.advanceRealty.dao.AgentDAO;

public class LoginServlet extends HttpServlet {
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
	
	String userName =  request.getParameter("userName");
	String password =  request.getParameter("password");
	String firstVisit = request.getParameter("firstVisit");
	
	String nextPage = "/pages/admin/login.jsp"; 
	
	String errorMessage = null;
	
	RequestDispatcher dispatch = null;
	
	if( ((userName == null || userName.length()==0) ||
		(password == null || userName.length() == 0) ) &&
		firstVisit != null)
	{
		errorMessage = "Invalid Login. User Name and Password must contain a value. Please, try again!";
		request.setAttribute("errorMessage",errorMessage);
				
	}
	else {
	
		try{
		
			Agent loggedAgent = (new AgentDAO()).findByUserName(userName);	
					
			if(loggedAgent == null){
				
				errorMessage = "Invalid Login. Agent not Found. Please, try again!";
				request.setAttribute("errorMessage",errorMessage);			
				
			}
			else{				
				
				session.setAttribute("loggedAgent", loggedAgent);
				nextPage ="/pages/admin/home.jsp"; 							
			}
		
		}catch(Exception e){		
		
		}
	}
	
	dispatch = getServletContext( ).getRequestDispatcher(nextPage);
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

