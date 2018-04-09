/*
 * Created on Oct 7, 2006
 *
 * To change the template for this generated file go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
package com.advanceRealty.dto;

/**
 * @author Owner
 *
 * To change the template for this generated type comment go to
 * Window>Preferences>Java>Code Generation>Code and Comments
 */
public class Agent {
	
	private long agentId;
	private String firstName;
	private String lastName;
	private String userName;
	private String password;
	private int    userType;	
	private String tel;
	private String fax;
	private String email;
	private String picPath;
	private String field1;
	private String field2;
	private String field3;
	
	public Agent(){
	
	}	

	/**
	 * @return
	 */
	public long getAgentId() {
		return agentId;
	}

	/**
	 * @return
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return
	 */
	public String getField1() {
		return field1;
	}

	/**
	 * @return
	 */
	public String getField2() {
		return field2;
	}

	/**
	 * @return
	 */
	public String getField3() {
		return field3;
	}

	/**
	 * @return
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @return
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @return
	 */
	public String getPicPath() {
		return picPath;
	}

	/**
	 * @return
	 */
	public String getTel() {
		return tel;
	}

	/**
	 * @param l
	 */
	public void setAgentId(long l) {
		agentId = l;
	}

	/**
	 * @param string
	 */
	public void setEmail(String string) {
		email = string;
	}

	/**
	 * @param string
	 */
	public void setField1(String string) {
		field1 = string;
	}

	/**
	 * @param string
	 */
	public void setField2(String string) {
		field2 = string;
	}

	/**
	 * @param string
	 */
	public void setField3(String string) {
		field3 = string;
	}

	/**
	 * @param string
	 */
	public void setFirstName(String string) {
		firstName = string;
	}

	/**
	 * @param string
	 */
	public void setLastName(String string) {
		lastName = string;
	}

	/**
	 * @param string
	 */
	public void setPicPath(String string) {
		picPath = string;
	}

	/**
	 * @param string
	 */
	public void setTel(String string) {
		tel = string;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	

	
}
