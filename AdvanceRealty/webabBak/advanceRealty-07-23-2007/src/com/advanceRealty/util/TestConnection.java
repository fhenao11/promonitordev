package com.advanceRealty.util;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.advanceRealty.dao.AgentDAO;
import com.advanceRealty.dto.Agent;

public class TestConnection extends ConnectionPool{

	public void getAgents(){	
		
	
        try{
        	
			getConnection();	
					
		    StringBuffer sqlBuff = new StringBuffer();
			//sqlBuff.append("SELECT * FROM test");	
		    sqlBuff.append("SELECT * FROM agents");	
						
								
			getPreparedStmt(sqlBuff.toString());
			_resultSet = _preparedStmt.executeQuery();	
			
			while (_resultSet.next()) {				
				System.out.println("userName: " + _resultSet.getString("userName"));
			
			}
		
        }catch(Exception e){
		
		}
		finally{
			closeConnections();
		}
 		
	
	}
	
	public static void main(String[] args){
	
		
		TestConnection test = new TestConnection();
		test.getAgents();
		//System.out.println("Testing ");
	/*
		Agent agent = new Agent();
		agent.setFirstName("Fernando");
		agent.setLastName("Smith");
		agent.setTel("12345566");
		agent.setEmail("fhenao@aol.com");
		agent.setPicPath("photo");
		agent.setField1("field1");
		agent.setField2("field2");
		agent.setField3("field3");
		
		boolean isCreate = new AgentDAO().create(agent); 
	*/
	
	}
}
