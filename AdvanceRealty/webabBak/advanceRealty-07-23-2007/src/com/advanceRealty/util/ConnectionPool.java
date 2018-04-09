package com.advanceRealty.util;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.InitialContext;
import javax.sql.*;


/**
 * @author fhenao
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public abstract  class ConnectionPool
{
	protected Connection _connection;
	protected CallableStatement _callableStmt;
	protected ResultSet _resultSet;
	protected PreparedStatement _preparedStmt;

	protected ArrayList preparedStatements = new ArrayList();	

	private static DataSource _datasource = null;

	static 
	{
 
		//getDatasource();

	}


	private static void getDatasource()
	{
		String dbName = null;

		try {
			InitialContext ic = new InitialContext();

			//Get the name of the DB from the properties file
			//dbName = new Config().getStringProperty("JDBC_NAME");
			dbName = "java:comp/env/jdbc/dbDevJava";

			if (dbName == null) {
				throw new SQLException("JDBC_NAME property not found");
			} else {
				//Get the PoolDataSource
				_datasource = (DataSource) ic.lookup(dbName);
			}
			
		} catch (Exception e) {

		}		
	}

	protected void getConnection() throws Exception {

		try {

			String connectionURL = "jdbc:mysql://localhost:3306/advan31_DBPAR1";
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			_connection = DriverManager.getConnection(connectionURL, "advan31_ehenao", "ehenaodb");
		} catch (Exception e) {
			throw e;
		}
	}

	protected final CallableStatement getCallableStmt(String procToCall)
		throws Exception {
		try {
			_callableStmt =
				_connection.prepareCall(
					procToCall,
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);

			return _callableStmt;
		} catch (Exception e) {
			throw e;
		}
	}

	protected final PreparedStatement getPreparedStmt(String sqlString)
		throws Exception {
		try {
			_preparedStmt = _connection.prepareStatement(sqlString);

			preparedStatements.add(_preparedStmt);

			return _preparedStmt;

		} catch (Exception e) {
			throw e;
		}
	}

	protected final ResultSet getResultSet() throws Exception {
		try {
			//_callableStmt.registerOutParameter(1, OracleTypes.CURSOR);
			_callableStmt.registerOutParameter(1,1);

			_callableStmt.execute();

			_resultSet = (ResultSet) _callableStmt.getObject(1);

			return _resultSet;
		} catch (Exception e) {
			throw e;
		}
	}

	
	protected void closeConnections() {
		for (Iterator i = preparedStatements.iterator(); i.hasNext();) {
			try {
				PreparedStatement ps = (PreparedStatement) i.next();
				if (ps != null) {
					ps.close();
					ps = null;
				}
			} catch (Exception e) {
				//EventLog.warning(this, "Error closing preparedStatement");
			}
		}

		try {
			if (_resultSet != null)
				_resultSet.close();
		} catch (Exception e) {
			//EventLog.warning(this, "Error closing resultSet");
		}

		try {
			if (_callableStmt != null)
				_callableStmt.close();
		} catch (Exception e) {
			//EventLog.warning(this, "Error closing _callableStmt");
		}

		try {
			if (_connection != null) {

				//				_dbPool.releaseConnection( _connection );

				_connection.close();

			}
		} catch (Exception e) {
			//EventLog.warning(this, "Error closing connection");
		}

		_connection = null;
		_preparedStmt = null;
		_callableStmt = null;
		_resultSet = null;
	}
}
