package com.advanceRealty.upload;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
/**
* @author Deepak Kumar
* @Web http://www.roseindia.net
* @Email roseindia_net@yahoo.com
*/

import com.advanceRealty.dto.Agent;

/**
 * Struts File Upload Action Form.
 *
*/
public class StrutsUploadAction extends Action
{
  public ActionForward execute(
    ActionMapping mapping,
    ActionForm form,
    HttpServletRequest request,
    HttpServletResponse response) throws Exception{
    StrutsUploadForm myForm = (StrutsUploadForm)form;
    
    HttpSession session = request.getSession( true );
    
    Agent agent = (Agent) session.getAttribute("loggedAgent");
    
    if(agent == null){  
    	request.setAttribute("message", " Your session has expired. Please, login and try again.");     
    	mapping.findForward("success");    	
    }
    
    long agentId = agent.getAgentId();    
    
    // Process the FormFile
    FormFile myFile = myForm.getTheFile();
    String contentType = myFile.getContentType();
    String fileName    = myFile.getFileName();
    int fileSize       = myFile.getFileSize();
    byte[] fileData    = myFile.getFileData();
    String dirType     = myForm.getDirType(); 
    
    String fileNameDb = fileName;
 
 System.out.println("dirType = " + dirType);
 
    //If agents--append the agent_id to fileName
    if(dirType.equals("agentPicName") || dirType.equals("homePicName"))
    	fileNameDb = agentId + "_"+ fileName;    
    
    request.setAttribute("fileName", fileNameDb);       
    
    try
    {
     	
    	String fileOut=null;
    	if(dirType.equals("agentPicName") || dirType.equals("homePicName")){
    		fileOut ="C://jakarta-tomcat-5.5.2//webapps//advanceRealty//images//agents//"+ fileNameDb ;
    		//fileOut = "/home/advan31/public_html/images/agents/"+fileNameDb;    	
    	}else if(dirType.equals("images")){    		
    		fileOut ="C://jakarta-tomcat-5.5.2//webapps//advanceRealty//documents//images//"+ fileNameDb ;
    		//fileOut = "/home/advan31/public_html/documents/images/"+fileNameDb;    	
    	}else{
    		fileOut ="C://jakarta-tomcat-5.5.2//webapps//advanceRealty//documents//docs//"+ fileNameDb ;
    		//fileOut = "/home/advan31/public_html/documents/docs/"+fileNameDb;    	
    	}    		
    	
    	BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(fileOut));   
  
    	bos.write(fileData, 0, fileData.length);                                    									   
     
    	request.setAttribute("message", fileName + "  has been uploaded successfully, and renamed "+ fileNameDb);     
       
    	bos.flush();
    	bos.close();
    }
    catch (IOException e)
    {
    	request.setAttribute("message", "There was a problem uploading " +fileName);
    	System.out.println("Error Loading File");
    	e.printStackTrace();
    }
    
    return mapping.findForward("success");
  }
} 