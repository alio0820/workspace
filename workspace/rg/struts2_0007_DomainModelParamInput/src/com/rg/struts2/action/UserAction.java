package com.rg.struts2.action;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	
	private User user;
	
	public String execute(){
		System.out.println("name: " + user.getName());
		System.out.println("age: " + user.getAge());
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
