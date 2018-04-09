package com.advanceRealty.dao;

import java.util.ArrayList;
import java.util.List;

import com.advanceRealty.dto.Contact;
import com.advanceRealty.util.ConnectionPool;

public class ContactDAO extends ConnectionPool {
	
	public ContactDAO(){
	
	}
	
	public Contact findByAgentId(long agentId) {
		
		Contact contact = null;

		try{

			getConnection();	
				
			String sql = "select * from contact " +
						 " where agent_id="+ agentId;
										
			getPreparedStmt(sql);
		
			_resultSet = _preparedStmt.executeQuery();
	
			while(_resultSet.next()){				
				contact = new Contact();
				contact.setContactId(_resultSet.getLong("CONTACT_ID"));	
				contact.setFirstName(_resultSet.getString("FIRSTNAME"));	
				contact.setLastName(_resultSet.getString("LASTNAME"));	
				contact.setAddress(_resultSet.getString("ADDRESS"));
				contact.setEmail(_resultSet.getString("EMAIL"));
				contact.setTel(_resultSet.getString("TEL"));
				contact.setFax(_resultSet.getString("FAX"));	
				contact.setAgentId(_resultSet.getLong("AGENT_ID"));
				contact.setField1(_resultSet.getString("FIELD1"));	
				contact.setField2(_resultSet.getString("FIELD2"));	
				contact.setField3(_resultSet.getString("FIELD3"));	
			
			}		
	

		}catch(Exception e){
	
		}		
		finally{
			closeConnections();
		}

		return contact;	

	}
	
	public boolean create(Contact contact) {
		
		boolean isSuccessful=false;
		
		try{
		
			getConnection();	
						
			String sql = "insert into framework (firstName,lastName,address,tel,fax," +
						 "email,agent_id,field1,field2,field3) " +
						 "values (?,?,?,?,?,?,?,?,?,?)";						
									
			getPreparedStmt(sql);
			_preparedStmt.setString(1, contact.getFirstName());
			_preparedStmt.setString(2, contact.getLastName());
			_preparedStmt.setString(3, contact.getAddress());
			_preparedStmt.setString(4, contact.getTel());			
			_preparedStmt.setString(5, contact.getFax());			
			_preparedStmt.setString(6, contact.getEmail());
			_preparedStmt.setLong(7, contact.getAgentId());
			_preparedStmt.setString(8, contact.getField1());
			_preparedStmt.setString(9, contact.getField2());
			_preparedStmt.setString(10, contact.getField3());			
			
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
	
	public boolean update(Contact contact) {
		
			boolean isSuccessful=false;
		
			try{
		
				getConnection();	
						
				String sql = "update contact set firstName=?,lastName=?," +
				 			  "address=?,tel=?,fax=?,agent_id=?," +
				 			  "email=?,field2=?,field3=? " +				 			 
							  " where contact_id=?";						
									
				getPreparedStmt(sql);
				_preparedStmt.setString(1, contact.getFirstName());
				_preparedStmt.setString(2, contact.getLastName());
				_preparedStmt.setString(3, contact.getAddress());
				_preparedStmt.setString(4, contact.getTel());			
				_preparedStmt.setString(5, contact.getFax());			
				_preparedStmt.setString(6, contact.getEmail());
				_preparedStmt.setLong(7, contact.getAgentId());
				_preparedStmt.setString(8, contact.getField1());
				_preparedStmt.setString(9, contact.getField2());
				_preparedStmt.setString(10, contact.getField3());
				_preparedStmt.setLong(11, contact.getContactId());
			
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
	
	
	public boolean delete(int contactId) {
		
		boolean isSuccessful=false;
		
		try{
		
			getConnection();	
						
			String sql = "delete from contact where contact_id=?";
												
									
			getPreparedStmt(sql);
			_preparedStmt.setInt(1, contactId);			
			
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

}