package com.advanceRealty.servlets.framework;

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
import com.advanceRealty.dao.FrameworkDAO;

public class FrameworkServlet extends HttpServlet {
	  
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
		
		String frameworkTranType = (String) request.getParameter("frameworkTranType");

		String nextPage = "/pages/admin/webwizard/webWiz1.jsp";
		
		if(request.getAttribute("nextPage") !=null){
			
			nextPage = (String) request.getAttribute("nextPage");
		}
		
		Agent agent = (Agent) session.getAttribute("loggedAgent");			
				
		Framework framework = new Framework();
		
		if(agent == null) {
			
			nextPage="/admin";
		}	
	    else if(frameworkTranType == null || frameworkTranType.equals("getFramework")){	    	
	    	//for tranType==null, we are coming from the wizard Home, and we need to 
			//see if this agent has a framework created or not			
	    	try{
	
	    		framework = (new FrameworkDAO()).findByAgentId(agent.getAgentId());
	
	            if(framework == null)
	            	framework = new Framework();
	  
	    		session.setAttribute("framework", framework);	    		
	   

	    	}catch(Exception e){
			
	    		nextPage="/pages/admin/error/error.jsp";
	    	}
			
		}		
		else{		
		
			try{				
				
				String frameworkId = request.getParameter("frameworkId");
				String topNameColor = request.getParameter("topNameColor");
				String topHeaderColor = request.getParameter("topHeaderColor");
				String leftNavColor = request.getParameter("leftNavColor");
				String leftNavTextColor = request.getParameter("leftNavTextColor");
				String field1 = request.getParameter("field1");
				String field2 = request.getParameter("field2");
				String field3 = request.getParameter("field3");
				String arListingsURL = request.getParameter("arListingsURL");
				String searchPropertiesURL = request.getParameter("searchPropertiesURL");
				String agentPicName = request.getParameter("agentPicName");
				String homePicName = request.getParameter("homePicName");
				String homeContent = request.getParameter("homeContent");
				
				if(homeContent !=null && homeContent.length()>0){
					homeContent = homeContent.trim();
				}
				else{
					homeContent = "";
				}
				
				long agentId=  agent.getAgentId();  		
				
				//Reset framework with new values
				if(frameworkId!=null && frameworkId.length()>0){
					framework.setFrameworkId(Integer.parseInt(frameworkId));
				}
				framework.setAgentId(agentId);
				framework.setTopNameColor(topNameColor);
				framework.setTopHeaderColor(topHeaderColor);
				framework.setLeftNavColor(leftNavColor);
				framework.setLeftNavTextColor(leftNavTextColor);		
				framework.setField1(field1);
				framework.setField2(field2);
				framework.setField3(field3);
				framework.setAgentId(agentId);
				framework.setArListingsURL(arListingsURL);
				framework.setSearchPropertiesURL(searchPropertiesURL);
				framework.setAgentPicName(agentPicName);
				framework.setHomePicName(homePicName);					
				framework.setHomeContent(homeContent);				
				StringBuffer navItemsBuff = new StringBuffer();
				
				navItemsBuff.append("home");
				
				if(request.getParameter("findAgent") !=null)
					navItemsBuff.append("|findAgent");
				if(request.getParameter("ARListings") !=null)
					navItemsBuff.append("|ARListings");
				if(request.getParameter("searchProperties") !=null)
					navItemsBuff.append("|searchProperties");
				if(request.getParameter("buyers") !=null)
					navItemsBuff.append("|buyers");
				if(request.getParameter("sellers") !=null)
					navItemsBuff.append("|sellers");
				if(request.getParameter("aboutUs") !=null)
					navItemsBuff.append("|aboutUs");
				if(request.getParameter("contactUs") !=null)
					navItemsBuff.append("|contactUs");
				
							
				framework.setNavItems(navItemsBuff.toString());
		
				session.setAttribute("framework",framework);
				
				//See if this is a new website or update
				//Framework frameworkInDB = (new FrameworkDAO()).findByAgentId(agentId);
								
				boolean isUpdateSuccessful = false;
				
				//We are creating
				if(frameworkId==null || frameworkId.equals("0")){	
					isUpdateSuccessful = (new FrameworkDAO()).create(framework);
				}
				else{ //Updating
					isUpdateSuccessful = (new FrameworkDAO()).update(framework);
				}				
							
				String message="Your Website has been CREATED or UPDATED successfully.";
				
				if(!isUpdateSuccessful){
				
					message="There was a problem CREATING or UPDATING your website";
				}
				
				request.setAttribute("message", message);
				nextPage = "/pages/admin/webwizard/webWiz2.jsp";
				
			
			}catch(Exception e){
				
				e.printStackTrace();
				nextPage="/pages/admin/error/error.jsp";
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

