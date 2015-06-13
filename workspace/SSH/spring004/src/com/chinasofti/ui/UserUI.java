package com.chinasofti.ui;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import com.chinasofti.service.UserService;

public class UserUI implements IUser {
	
	private UserService userService;
	private String name;
	private Map map;
	private Set set;
	private List list;
	private Properties properties;
	private String[] ss;
	
	/* (non-Javadoc)
	 * @see com.chinasofti.ui.IUser#addUser()
	 */
	public void addUser(){
		
		userService.addUser();
		
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setMap(Map map) {
		this.map = map;
	}
	public void setSet(Set set) {
		this.set = set;
	}
	public void setList(List list) {
		this.list = list;
	}
	public void setProperties(Properties properties) {
		this.properties = properties;
	}
	public void setSs(String[] ss) {
		this.ss = ss;
	}
	
	
	
}
