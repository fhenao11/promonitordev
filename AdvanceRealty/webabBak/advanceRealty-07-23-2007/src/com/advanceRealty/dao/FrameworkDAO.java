package com.advanceRealty.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.Clob;


import com.advanceRealty.dto.Framework;
import com.advanceRealty.util.ConnectionPool;

public class FrameworkDAO extends ConnectionPool {
	
	public FrameworkDAO(){
	
	}
	
	public Framework findByAgentId(long agentId) {

		Framework framework = null;

		try{

			getConnection();	
				
			String sql = "select * from framework " +
						 " where agent_id="+ agentId;
										
			getPreparedStmt(sql);
		
			_resultSet = _preparedStmt.executeQuery();
	
			while(_resultSet.next()){				
				framework = new Framework();
				framework.setFrameworkId( _resultSet.getLong("FRAMEWORK_ID"));	
				framework.setTopNameColor(StringForNull(_resultSet.getString("TOPNAMECOLOR")));	
				framework.setTopHeaderColor(StringForNull(_resultSet.getString("TOPHEADERCOLOR")));	
				framework.setLeftNavColor(StringForNull(_resultSet.getString("LEFTNAVCOLOR")));
				framework.setLeftNavTextColor(StringForNull(_resultSet.getString("LEFTNAVTEXTCOLOR")));
				framework.setNavItems(StringForNull(_resultSet.getString("NAVITEMS")));
				framework.setField1(StringForNull(_resultSet.getString("FIELD1")));	
				framework.setField2(StringForNull(_resultSet.getString("FIELD2")));	
				framework.setField3(StringForNull(_resultSet.getString("FIELD3")));		
				framework.setAgentId(_resultSet.getLong("AGENT_ID"));
				framework.setArListingsURL(StringForNull(_resultSet.getString("ARLISTINGSURL")));
				framework.setSearchPropertiesURL(StringForNull(_resultSet.getString("SEARCHPROPERTIESURL")));
				framework.setAgentPicName(StringForNull(_resultSet.getString("AGENTPICNAME")));
				framework.setHomePicName(StringForNull(_resultSet.getString("HOMEPICNAME")));
				//framework.setHomeContent(StringForNull(_resultSet.getString("HOMECONTENT")));
								
				Clob clob = _resultSet.getClob("HOMECONTENTBLOB");
				String homeContent="";
				
				if(clob !=null)
					homeContent = clob.getSubString(1, (int) clob.length());
			      
				framework.setHomeContent(StringForNull(homeContent));		
				
			}	

		}catch(Exception e){
	
		}		
		finally{
			closeConnections();
		}

		return framework;	

	}
	
	public boolean create(Framework framework) {
		
		boolean isSuccessful=false;
		
		String arURL="http://advancerealtyllc.listingware.com/search/searchresults.cfm?Reciprocity=No&PropertyTypeID=All&CFID=4745810&CFTOKEN=31637114";
		String searchPropsURL="http://advancerealtyllc.listingware.com/search/index.cfm?MemberView=On";
		
		if(framework.getArListingsURL()!=null && framework.getArListingsURL().length()>0){
			arURL=framework.getArListingsURL();
		}
			
		if(framework.getSearchPropertiesURL()==null || framework.getSearchPropertiesURL().length()==0){
			searchPropsURL=framework.getSearchPropertiesURL();	
		}
		
		try{
		
			getConnection();	
			
			/*
			String sql = "insert into framework (topNameColor,topHeaderColor,leftNavColor,leftNavTextColor," +
						 "navItems,field1,field2,field3,agent_id,arListingsURL,searchPropertiesURL," +
						 "agentPicName,homePicName,homeContent) " +
						 "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";						
			*/
			
			String sql = "insert into framework (topNameColor,topHeaderColor,leftNavColor,leftNavTextColor," +
			 "navItems,field1,field2,field3,agent_id,arListingsURL,searchPropertiesURL," +
			 "agentPicName,homePicName,homeContentBlob) " +
			 "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
			
			getPreparedStmt(sql);
			_preparedStmt.setString(1, framework.getTopNameColor());
			_preparedStmt.setString(2, framework.getTopHeaderColor());
			_preparedStmt.setString(3, framework.getLeftNavColor());
			_preparedStmt.setString(4, framework.getLeftNavTextColor());			
			_preparedStmt.setString(5, framework.getNavItems());			
			_preparedStmt.setString(6, framework.getField1());
			_preparedStmt.setString(7, framework.getField2());
			_preparedStmt.setString(8, framework.getField3());
			_preparedStmt.setLong(9, framework.getAgentId());
			_preparedStmt.setString(10, arURL);
			_preparedStmt.setString(11, searchPropsURL);
			_preparedStmt.setString(12, framework.getAgentPicName());
			_preparedStmt.setString(13, framework.getHomePicName());
			_preparedStmt.setString(14, framework.getHomeContent());
			
			int retVals = _preparedStmt.executeUpdate();
			
			if(retVals > 0){					
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
	
	public boolean update(Framework framework) {
		
			boolean isSuccessful=false;
		
			try{
		
				getConnection();	
						
				String sql = "update framework set topNameColor=?,topHeaderColor=?," +
				 			  "leftNavColor=?,leftNavTextColor=?,navItems=?," +
				 			  "field1=?,field2=?,field3=?,agent_id=?," +
				 			  "arListingsURL=?,searchPropertiesURL=?," +
				 			  "agentPicName=?,homePicName=?,homeContentBlob=? " +
							  " where framework_id=?";	
				
				getPreparedStmt(sql);
				_preparedStmt.setString(1, framework.getTopNameColor());
				_preparedStmt.setString(2, framework.getTopHeaderColor());
				_preparedStmt.setString(3, framework.getLeftNavColor());
				_preparedStmt.setString(4, framework.getLeftNavTextColor());			
				_preparedStmt.setString(5, framework.getNavItems());			
				_preparedStmt.setString(6, framework.getField1());
				_preparedStmt.setString(7, framework.getField2());
				_preparedStmt.setString(8, framework.getField3());
				_preparedStmt.setLong(9, framework.getAgentId());
				_preparedStmt.setString(10, framework.getArListingsURL());
				_preparedStmt.setString(11, framework.getSearchPropertiesURL());
				_preparedStmt.setString(12, framework.getAgentPicName());
				_preparedStmt.setString(13, framework.getHomePicName());
				_preparedStmt.setString(14, framework.getHomeContent());
				_preparedStmt.setLong(15, framework.getFrameworkId());
				
				int retVals = _preparedStmt.executeUpdate();
						
				if(retVals > 0){		

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
	
	
	public boolean delete(int frameworkId) {
		
		boolean isSuccessful=false;
		
		try{
		
			getConnection();	
						
			String sql = "delete from framework where framework_id=?";
												
									
			getPreparedStmt(sql);
			_preparedStmt.setInt(1, frameworkId);			
			
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