package com.advanceRealty.servlets.contact;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.advanceRealty.dto.Agent;
import com.advanceRealty.dto.Contact;
import com.advanceRealty.dao.ContactDAO;

public class ContactServlet extends HttpServlet {
	  
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
		
		String contactTranType = (String) request.getAttribute("contactTranType");
		
		String nextPage="/pages/admin/webwizard/webWiz2.jsp";
		
		if(request.getAttribute("nextPage")!=null){
			nextPage = (String) request.getAttribute("nextPage");
		}
		
		Agent agent = (Agent) session.getAttribute("loggedAgent");			
				
		Contact contact = new Contact();
		
		if(agent == null) {
			
			nextPage="/admin";
		}	
	    else if(contactTranType == "getContact"){	    	
	    	//for tranType==null, we are coming from the wizard Home, and we need to s
			//see if this agent a framework created or not			
	    	try{
	    		contact = (new ContactDAO()).findByAgentId(agent.getAgentId());
	    		session.setAttribute("contact", contact);	    		
			
	    	}catch(Exception e){
			
	    		nextPage="pages/admin/error/error.jsp";
	    	}
			
		}		
		else{		
		
			try{					
		
				String firstName = request.getParameter("firstName");
				String lastName = request.getParameter("lastName");
				String tel = request.getParameter("tel");
				String fax = request.getParameter("fax");
				String email = request.getParameter("email");				
				long  agentId=  contact.getAgentId();  		
			
				//Reset framework with new values
				contact.setFirstName(firstName);
				contact.setLastName(lastName);
				contact.setTel(tel);
				contact.setEmail(email);
				contact.setAgentId(agentId);				
		
				session.setAttribute("contact",contact);
				
				nextPage="/pages/admin/webwizard/webWiz3.jsp";
				
				nextPage="/contactServlet";
			
			}catch(Exception e){
				
				nextPage="pages/admin/error/error.jsp";
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
