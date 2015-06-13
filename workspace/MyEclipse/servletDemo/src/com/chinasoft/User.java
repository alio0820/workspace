package com.chinasoft;

import java.io.Serializable;

public class User implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 937027212724407427L;
	
	private String userName;
	private String age;
	private String sex;
	private String city;
	private String[] xq;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String[] getXq() {
		return xq;
	}
	public void setXq(String[] xq) {
		this.xq = xq;
	}
	
	@Override
	public boolean equals(Object obj) {
		User u = (User)obj;
		return this.userName.equals(u.getUserName());
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return 1;
	}
	
	
}
