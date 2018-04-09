package com.advanceRealty.servlets.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.advanceRealty.dto.Agent;
import com.advanceRealty.dto.Framework;
import com.advanceRealty.dao.AgentDAO;
import com.advanceRealty.dao.FrameworkDAO;

public class WebAgentConfigServlet extends HttpServlet {
	  
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
		
		String agentIn = (String) request.getParameter("agent");
		
		String agentId = agentIn.substring(agentIn.lastIndexOf('_')+1);

		String nextPage = "/pages/web/index1.jsp";
		
		String message ="You have entered an invalid agent.<br> Please, verify that the agent is valid!"; 
		
		if(agentId ==null || agentId.length()==0){
			
			request.setAttribute("message",message);
			nextPage = "/pages/web/error.jsp";
		}
		else{
		
			try{
				Agent agent = (new AgentDAO()).findByAgentId(Integer.parseInt(agentId));

				if(agent == null){
				
					request.setAttribute("message","Invalid agent");
				
					nextPage ="/pages/web/error.jsp"; 
				
				}
				else{
			
					Framework framework = (new FrameworkDAO()).findByAgentId(agent.getAgentId());

					if(framework == null) {
						
						message = "No Website has been set up for this Agent";
						
						request.setAttribute("message",message);
						
						nextPage ="/pages/web/error.jsp"; 
					}	
					else{						
						//Get the index page to use for this template
						if(framework.getField1()!=null && framework.getField1().length()>0){ 
							nextPage = "/pages/web/index"+framework.getField1()+".jsp";
						}
						session.setAttribute("framework", framework);
						session.setAttribute("agent", agent);
					}
				
				}
			
			}catch(Exception e){
				
				message = "There was a problem with this address. Pleas, try again later";
				nextPage ="/pages/web/error.jsp"; 
			}		
	   
		}

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

