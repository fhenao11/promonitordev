package com.advanceRealty.servlets.documents;

import java.io.*;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.advanceRealty.dto.Agent;


public class DocsManagementServlet extends HttpServlet {
  private String greeting;

  public void init()
    throws ServletException
  {
    
  }

  public void doPost(HttpServletRequest request,
                    HttpServletResponse response)
    throws ServletException, IOException
  {
	  
	HttpSession session = request.getSession(true);	

	Agent agent = (Agent) session.getAttribute("loggedAgent");
	
	//Used only if deleting the file
	String operationType = (String) request.getParameter("operationType");
	String typeDir = (String) request.getParameter("dirType");
	String fileName = (String) request.getParameter("fileName");	
	
	String nextPage = "/pages/admin/docsManagement/docsHome.jsp"; 
	RequestDispatcher dispatch = null;
	
	if(agent == null){
		nextPage= "/admin"; 
	}
	else{	
	
		try{
		
			String docsDir ="C:/jakarta-tomcat-5.5.2/webapps/advanceRealty/documents/docs/";
			//String docsDir = "/home/advan31/public_html/documents/docs/"; 
			//String docsDir = "/documents/docs/"; 
	 
			String imagesDir ="C:/jakarta-tomcat-5.5.2/webapps/advanceRealty/documents/images/";
			//String imagesDir = "/home/advan31/public_html/documents/images/"; 
			//String imagesDir = "/documents/images/";  

			session.setAttribute("docsDir", docsDir);
			session.setAttribute("imagesDir", imagesDir);
			
			if(operationType!=null && operationType.equals("delete")) {	

				File fileToDelete = null;
				
				if(typeDir.equals("docs")){				
					fileToDelete = new File(docsDir+fileName);
				}
				
				if(typeDir.equals("images")){
					fileToDelete = new File(imagesDir+fileName);					
				}
				
				fileToDelete.delete();			
			}
			
			File docsFileDir = new File(docsDir);    	
			String[] docsList = docsFileDir.list();
							   	
			File imagesFileDir = new File(imagesDir);    	
			String[] imagesList = imagesFileDir.list();
	   	
			request.setAttribute("docsList", docsList);
			request.setAttribute("imagesList", imagesList);
		
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