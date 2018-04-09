package com.advanceRealty.servlets.agent;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.advanceRealty.dto.Agent;
import com.advanceRealty.dao.AgentDAO;

public class SearchAgentServlet extends HttpServlet {
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
	
	String firstName = (String) request.getParameter("firstName");
	String lastName  = (String) request.getParameter("lastName");
	
	//Default web page
	String nextPage = "/pages/findAgents.jsp";
	
	//If we need to go the agents web pages
	if(request.getParameter("web") !=null){
		
		nextPage = "/pages/web/findAgents.jsp";
	}
		
	List agentList = new ArrayList();	
		
	if(firstName != null && firstName.length() > 0){
	 
		agentList = (new AgentDAO()).findByFirstName(firstName);
			
	}
	
	if(lastName != null && lastName.length() > 0){
	 
		agentList = (new AgentDAO()).findByLastName(lastName);
			
	}
		
	request.setAttribute("agentList",agentList);
	
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