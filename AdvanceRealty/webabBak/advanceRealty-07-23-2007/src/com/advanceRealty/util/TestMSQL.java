package com.advanceRealty.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestMSQL {

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Connection _connection=null;
		
		try {
			//DriverManager.getConnection("jdbc:microsoft:sqlserver://alawddbs002:2005;databaseName=ProjTracker;selectMethod=cursor", 

			//String connectionURL = "jdbc:microsoft:sqlserver://localhost:1433;databaseName=xplanner;selectMethod=cursor";
			
			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver").newInstance();
			
			String connectionURL = "jdbc:microsoft:sqlserver://localhost:1433;databaseName=xplanner;selectMethod=cursor";
			
			_connection = DriverManager.getConnection(connectionURL, "xplanner", "");
						
			if(_connection != null)
				_connection=null;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}

	}

}
