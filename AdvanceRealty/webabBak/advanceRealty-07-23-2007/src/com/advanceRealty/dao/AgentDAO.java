package com.advanceRealty.dao;


import java.util.ArrayList;
import java.util.List;

import com.advanceRealty.dto.Agent;
import com.advanceRealty.util.ConnectionPool;

/**
 * @author fhenao
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class AgentDAO extends ConnectionPool {
	
	public AgentDAO(){
	
	}
	
	public List findAll() {
		
			List agentList = new ArrayList();
		
			try{
		
				getConnection();	
						
				String sql = "select * from agents order by firstName ASC ";
												
				getPreparedStmt(sql);
				
				_resultSet = _preparedStmt.executeQuery();
			
				while(_resultSet.next()){
					//_preparedStmt.commit();	
					Agent agent = new Agent();
					agent.setAgentId( _resultSet.getLong("AGENT_ID"));	
					agent.setFirstName(StringForNull(_resultSet.getString("FIRSTNAME")));	
					agent.setLastName(StringForNull(_resultSet.getString("LASTNAME")));;
					agent.setUserName(StringForNull(_resultSet.getString("USERNAME")));;
					agent.setPassword(StringForNull(_resultSet.getString("PASSWORD")));;
					agent.setUserType(_resultSet.getInt("USERTYPE"));
					agent.setTel(StringForNull(_resultSet.getString("TEL")));	
					agent.setFax(StringForNull(_resultSet.getString("FAX")));
					agent.setEmail(StringForNull(_resultSet.getString("EMAIL")));
					agent.setPicPath(StringForNull(_resultSet.getString("PICPATH")));	
					agent.setField1(StringForNull(_resultSet.getString("FIELD1")));	
					agent.setField2(StringForNull(_resultSet.getString("FIELD2")));
					agent.setField3(StringForNull(_resultSet.getString("FIELD3")));
					
					agentList.add(agent);								
					
				}			
		
			}catch(Exception e){
			
			}		
			finally{
				closeConnections();
			}
		
			return agentList;	
	
		}
		
	public List findByFirstName(String name) {
		
			List agentList = new ArrayList();
		
			try{
		
				getConnection();	
						
				String sql = "select * from agents " +
						     " where firstName like '"+ name + "%' order by firstName ASC ";
												
				getPreparedStmt(sql);
				
				_resultSet = _preparedStmt.executeQuery();
			
				while(_resultSet.next()){
					//_preparedStmt.commit();	
					Agent agent = new Agent();
					agent.setAgentId( _resultSet.getLong("AGENT_ID"));	
					agent.setFirstName(_resultSet.getString("FIRSTNAME"));	
					agent.setLastName(_resultSet.getString("LASTNAME"));
					agent.setUserName(_resultSet.getString("USERNAME"));
					agent.setPassword(_resultSet.getString("PASSWORD"));
					agent.setUserType(_resultSet.getInt("USERTYPE"));
					agent.setTel(_resultSet.getString("TEL"));	
					agent.setFax(_resultSet.getString("FAX"));
					agent.setEmail(_resultSet.getString("EMAIL"));	
					agent.setPicPath(_resultSet.getString("PICPATH"));	
					agent.setField1(_resultSet.getString("FIELD1"));	
					agent.setField2(_resultSet.getString("FIELD2"));	
					agent.setField3(_resultSet.getString("FIELD3"));	
					
					agentList.add(agent);								
					
				}				
		
			}catch(Exception e){
			
			}		
			finally{
				closeConnections();
			}
		
			return agentList;	
	
		}
	
	public Agent findByAgentId(long agentId) {
		
		Agent agent = null;
		
		try{
	
			getConnection();	
					
			String sql = "select * from agents " +
					     " where agent_id="+ agentId;
											
			getPreparedStmt(sql);
			
			_resultSet = _preparedStmt.executeQuery();
		
			while(_resultSet.next()){
				
				agent = new Agent();
							
				agent.setAgentId( agentId);	
				agent.setFirstName(StringForNull(_resultSet.getString("FIRSTNAME")));	
				agent.setLastName(StringForNull(_resultSet.getString("LASTNAME")));
				agent.setUserName(StringForNull(_resultSet.getString("USERNAME")));
				agent.setPassword(StringForNull(_resultSet.getString("PASSWORD")));
				agent.setUserType(_resultSet.getInt("USERTYPE"));
				agent.setTel(StringForNull(_resultSet.getString("TEL")));	
				agent.setFax(StringForNull(_resultSet.getString("FAX")));
				agent.setEmail(StringForNull(_resultSet.getString("EMAIL")));	
				agent.setPicPath(StringForNull(_resultSet.getString("PICPATH")));	
				agent.setField1(StringForNull(_resultSet.getString("FIELD1")));	
				agent.setField2(StringForNull(_resultSet.getString("FIELD2")));	
				agent.setField3(StringForNull(_resultSet.getString("FIELD3")));											
				
			}			
	
		}catch(Exception e){
		   e.printStackTrace();
		}		
		finally{
			closeConnections();
		}
	
		return agent;	

	}
		
	public List findByLastName(String name) {
		
		List agentList = new ArrayList();

		try{

			getConnection();	
				
			String sql = "select * from agents " +
						 " where lastName like '"+ name + "%' order by firstName ASC ";
										
			getPreparedStmt(sql);
		
			_resultSet = _preparedStmt.executeQuery();
	
			while(_resultSet.next()){
				//_preparedStmt.commit();	
				Agent agent = new Agent();
				agent.setAgentId( _resultSet.getLong("AGENT_ID"));	
				agent.setFirstName(_resultSet.getString("FIRSTNAME"));	
				agent.setLastName(_resultSet.getString("LASTNAME"));	
				agent.setUserName(_resultSet.getString("USERNAME"));
				agent.setPassword(_resultSet.getString("PASSWORD"));
				agent.setUserType(_resultSet.getInt("USERTYPE"));
				agent.setTel(_resultSet.getString("TEL"));	
				agent.setFax(_resultSet.getString("FAX"));
				agent.setEmail(_resultSet.getString("EMAIL"));	
				agent.setPicPath(_resultSet.getString("PICPATH"));	
				agent.setField1(_resultSet.getString("FIELD1"));	
				agent.setField2(_resultSet.getString("FIELD2"));	
				agent.setField3(_resultSet.getString("FIELD3"));	
			
				agentList.add(agent);
						
			
			}		
	

		}catch(Exception e){
	
		}		
		finally{
			closeConnections();
		}

		return agentList;	

	}

	public Agent findByUserName(String userName) {
		
		Agent agent = null;

		try{

			getConnection();	
				
			String sql = "select * from agents " +
						 " where userName='"+ userName + "'";
										
			getPreparedStmt(sql);
		
			_resultSet = _preparedStmt.executeQuery();
	
			while(_resultSet.next()){				
				agent = new Agent();
				agent.setAgentId( _resultSet.getLong("AGENT_ID"));	
				agent.setFirstName(_resultSet.getString("FIRSTNAME"));	
				agent.setLastName(_resultSet.getString("LASTNAME"));	
				agent.setUserName(_resultSet.getString("USERNAME"));
				agent.setPassword(_resultSet.getString("PASSWORD"));
				agent.setUserType(_resultSet.getInt("USERTYPE"));
				agent.setTel(_resultSet.getString("TEL"));
				agent.setFax(_resultSet.getString("FAX"));
				agent.setEmail(_resultSet.getString("EMAIL"));	
				agent.setPicPath(_resultSet.getString("PICPATH"));	
				agent.setField1(_resultSet.getString("FIELD1"));	
				agent.setField2(_resultSet.getString("FIELD2"));	
				agent.setField3(_resultSet.getString("FIELD3"));			
			
			}		
	

		}catch(Exception e){
	
		}		
		finally{
			closeConnections();
		}

		return agent;	

	}
	
	public boolean create(Agent agent) {
		
		boolean isSuccessful=false;
		
		try{
		
			getConnection();	
						
			String sql = "insert into agents (firstName,lastName,userName,password,userType,tel,fax,email,picPath,field1,field2,field3) " +
						"values (?,?,?,?,?,?,?,?,?,?,?,?)";						
									
			getPreparedStmt(sql);
			_preparedStmt.setString(1, agent.getFirstName());
			_preparedStmt.setString(2, agent.getLastName());
			_preparedStmt.setString(3, agent.getUserName());
			_preparedStmt.setString(4, agent.getPassword());			
			_preparedStmt.setInt(5, agent.getUserType());
			_preparedStmt.setString(6, agent.getTel());
			_preparedStmt.setString(7, agent.getFax());
			_preparedStmt.setString(8, agent.getEmail());
			_preparedStmt.setString(9, agent.getPicPath());
			_preparedStmt.setString(10, agent.getField1());
			_preparedStmt.setString(11, agent.getField2());
			_preparedStmt.setString(12, agent.getField3());
			
			int retVals = _preparedStmt.executeUpdate();
			
			if(retVals > 0){
				//_preparedStmt.commit();				
				isSuccessful= true;
			}		
			
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		finally{
			closeConnections();
		}
		
		return isSuccessful;	
	
	}
	
	public boolean update(Agent agent) {
		
			boolean isSuccessful=false;
		
			try{
		
				getConnection();	
						
				String sql = "update agents set firstName=?,lastName=?," +
				 			  "userName=?,password=?,userType=?,tel=?,fax=?, " +
				 			 "email=?,picPath=?,field1=?,field2=?,field3=? " +
							 " where agent_id=?";						
									
				getPreparedStmt(sql);
				_preparedStmt.setString(1, agent.getFirstName());
				_preparedStmt.setString(2, agent.getLastName());
				_preparedStmt.setString(3, agent.getUserName());
				_preparedStmt.setString(4, agent.getPassword());
				_preparedStmt.setInt(5, agent.getUserType());
				_preparedStmt.setString(6, agent.getTel());
				_preparedStmt.setString(7, agent.getFax());
				_preparedStmt.setString(8, agent.getEmail());
				_preparedStmt.setString(9, agent.getPicPath());
				_preparedStmt.setString(10, agent.getField1());
				_preparedStmt.setString(11, agent.getField2());
				_preparedStmt.setString(12, agent.getField3());
				_preparedStmt.setLong(13, agent.getAgentId());
			
				int retVals = _preparedStmt.executeUpdate();
			
				if(retVals > 0){
					//_preparedStmt.commit();				
					isSuccessful= true;
				}		
			
		
			}catch(Exception e){
				e.printStackTrace();
			}		
			finally{
				closeConnections();
			}
		
			return isSuccessful;	
	
		}
	
	
	public boolean delete(int agentId) {
		
		boolean isSuccessful=false;
		
		try{
		
			getConnection();	
						
			String sql = "delete from agents where agent_id=?";
												
									
			getPreparedStmt(sql);
			_preparedStmt.setInt(1, agentId);			
			
			int retVals = _preparedStmt.executeUpdate();
			
			if(retVals > 0){
				//_preparedStmt.commit();				
				isSuccessful= true;
			}		
			
		
		}catch(Exception e){
			e.printStackTrace();
		}		
		finally{
			closeConnections();
		}
		
		return isSuccessful;	
	
	}
	
  public String StringForNull(String str){
		
		if(str == null)
			return "";
		else
			return str;
	
	}


}
