package com.advanceRealty.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
	
	public class PropsLoader extends Properties {

		private static String dirFileName ="C:/jakarta-tomcat-5.5.2/webapps/advanceRealty/WEB-INF/classes/templates.properties";
		//private static String dirFileName ="/home/advan31/public_html/properties/templates.properties";
		
	    public  void load() {

	        InputStream is = null;

	        // try to load from the dirFileName
	        try {	          
	           is = new FileInputStream(dirFileName);	                
	        } catch( IOException e ) {
	            is = null;
	        }
	       
	        try {
	            if( is != null ) {
	                load(is);
	            }
	        } catch (IOException e ) {
	            System.err.println("can not load properties : " + e );	            
	        }       
	        
	    }
	    
	    public static void main(String[] args) {	    	
	    	
	    	PropsLoader props = new PropsLoader();	    	
	    	props.load();	    	
	    	System.out.println("template.ids = " + props.getProperty("template.ids"));
	    	System.out.println("template.1.name = " + props.getProperty("template.1.name"));
	    	
	    	String color1 =props.getProperty("template.1.color1");   	
	    	
	    	int col = Integer.valueOf(color1);
	    	
	    	System.out.println("color1 = " + color1);
	    	
	    	String colors[] = color1.split(",");
	    	
	    	for(int j=0;j<colors.length;j++){
	    		
	    		System.out.println("color = " + colors[j]);
	    		
	    	}
	    	
	    }
}
