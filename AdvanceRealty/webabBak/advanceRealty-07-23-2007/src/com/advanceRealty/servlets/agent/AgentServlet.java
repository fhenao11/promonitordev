package com.advanceRealty.servlets.agent;

import java.io.*;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.advanceRealty.dto.Agent;
import com.advanceRealty.dao.AgentDAO;

public class AgentServlet extends HttpServlet {
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
		
	String tranType = (String) request.getParameter("tranType");
	
	String nextPage = "/pages/admin/agentManagement/agents.jsp";
	
	String message = "";		
	
	if(tranType != null && tranType.equals("create")){	

		String firstName =  request.getParameter("firstName");
		String lastName  =  request.getParameter("lastName");
		String userName  =  request.getParameter("userName");
		String password  =  request.getParameter("password");
		String userType  =  request.getParameter("userType");
		String tel       =  request.getParameter("tel");
		String fax       =  request.getParameter("fax");
		String email     =  request.getParameter("email");
		String picPath   =  request.getParameter("picPath");
		String field1    =  request.getParameter("field1");
		String field2    =  request.getParameter("field2");
		String field3    =  request.getParameter("field3");
		
		Agent agent = new Agent();		
		agent.setFirstName(firstName);
		agent.setLastName(lastName);
		agent.setUserName(userName);
		agent.setPassword(password);
		agent.setUserType(Integer.parseInt(userType));
		agent.setTel(tel);
		agent.setFax(fax);
		agent.setEmail(email);
		agent.setPicPath(picPath);
		agent.setField1(field1);
		agent.setField2(field2);
		agent.setField3(field3);	
		
		AgentDAO agentDAO = new AgentDAO();
		
		try{
		
			if(agentDAO.findByUserName("userName") != null){	
				
				message = "User Name is already in use.";
				
			}else{
				boolean isCreate = agentDAO.create(agent); 
		
		
				if(isCreate == true)	
					message = "Agent has been created successfully";	
				else
					message = "There was a problem creating the Agent. Please Investigate.";	
			}
		}catch(Exception e){
			message = "There was a problem creating the Agent. Please Investigate.";
		}	
	
	}
		
	
	// Updating or Deleting the Agent
	if(tranType != null && tranType.equals("updateDelete")){

		String agentId = request.getParameter("agentId");
		String operationType = request.getParameter("operationType");
		
		if(operationType.equals("delete")){
		
			boolean isDelete = (new AgentDAO()).delete(Integer.parseInt(agentId));
		
			if(isDelete)
				message = "Agent has been deleted successfully";	
			else
				message = "There was a problem deleting the record";
		
		}else{
								
			String firstName =  request.getParameter("firstName");
			String lastName  =  request.getParameter("lastName");
			String userName  =  request.getParameter("userName");
			String password  =  request.getParameter("password");
			String userType  =  request.getParameter("userType");
			String tel       =  request.getParameter("tel");
			String fax       =  request.getParameter("fax");
			String email     =  request.getParameter("email");
			String picPath   =  request.getParameter("picPath");
			String field1    =  request.getParameter("field1");
			String field2    =  request.getParameter("field2");
			String field3    =  request.getParameter("field3");

			Agent agent = new Agent();	
			agent.setAgentId(Integer.parseInt(agentId));	
			agent.setFirstName(firstName);
			agent.setLastName(lastName);
			agent.setUserName(userName);
			agent.setPassword(password);
			agent.setUserType(Integer.parseInt(userType));
			agent.setTel(tel);
			agent.setFax(fax);
			agent.setEmail(email);
			agent.setPicPath(picPath);
			agent.setField1(field1);
			agent.setField2(field2);
			agent.setField3(field3);	

			
			AgentDAO agentDAO = new AgentDAO();
			
			try{
				if(agentDAO.findByUserName("userName") != null){	
				
					message = "User Name is already in use.";
				
				}else{			
			
					boolean isUpdate = agentDAO.update(agent); 

					if(isUpdate == true)	
						message = "Agent has been created successfully";	
					else
						message = "There was a problem creating the Agent. Please Investigate.";	
				}
			}catch(Exception e){
				message = "There was a problem creating the Agent. Please Investigate.";
			}		
		
		}			
			
	}	

	
	//Find all the records
	List agentList = (new AgentDAO()).findAll();
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

