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
import com.advanceRealty.util.PropsLoader;

public class FrameworkWebServlet extends HttpServlet {
	  
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

		String nextPage = "/pages/admin/webwizard/webWizHome.jsp";
		
		if(request.getAttribute("nextPage") !=null){
			
			nextPage = (String) request.getAttribute("nextPage");
		}
				
		Agent agent = (Agent) session.getAttribute("loggedAgent");			
				
		Framework framework = new Framework();
		
		try{
		
		if(agent == null) {
			
			nextPage="/admin";
		}	
	    else if(frameworkTranType == null || frameworkTranType.length() == 0){	    	
	    	//for tranType==null, we are coming from the wizard Home, and we need to 
			//see if this agent has a framework created or not		

	    	framework = (new FrameworkDAO()).findByAgentId(agent.getAgentId());	
            if(framework == null)
            	framework = new Framework();	
    		
            session.setAttribute("framework", framework);	    		
		}
	    else if(frameworkTranType.equals("wizHome")){
	    	nextPage = "/pages/admin/webwizard/webWiz1.jsp";
	    }		
	    else if(frameworkTranType.equals("wiz1")){	    	
	    	String templateId = request.getParameter("templateId");	    	   	
	    	session.setAttribute("templateId", templateId);	
	    	session.setAttribute("colorId", "1");
	    	nextPage = "/pages/admin/webwizard/webWiz2.jsp";
	    }
	    else if(frameworkTranType.equals("wiz2")){	    	
	    	String colorId = request.getParameter("colorId");	    	
	    	if(colorId != null)
	    		session.setAttribute("colorId", colorId);
	    	if(request.getParameter("done") !=null )
	    	    nextPage = "/pages/admin/webwizard/webWiz3.jsp";
	    	else
	    		nextPage = "/pages/admin/webwizard/webWiz2.jsp";
	    }	    
		else{	
			
			framework = (Framework) session.getAttribute("framework");
			PropsLoader props = new PropsLoader();	    	
			props.load();	
			
			String templateId= (String) session.getAttribute("templateId");	
			String colorId= (String) session.getAttribute("colorId");	
			String colorProp = props.getProperty("template."+templateId+".color"+colorId);
			String colors[] = colorProp.split(",");
	
			//String frameworkId = request.getParameter("frameworkId");
			long frameworkId = framework.getFrameworkId();
			String topNameColor = colors[1];
			String topHeaderColor = colors[2];
			String leftNavColor = colors[3];
			String leftNavTextColor = colors[0];
			//String field1 = request.getParameter("field1");
			String field1 = (String) session.getAttribute("templateId");
			String field2 = colorId;
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
			if(frameworkId>0){
				framework.setFrameworkId(frameworkId);
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
			if(frameworkId <=0){	
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
			nextPage = "/pages/admin/webwizard/webWiz4.jsp";	

		}
			
		}catch(Exception e){
			
			e.printStackTrace();
			nextPage="/pages/admin/error/error.jsp";
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