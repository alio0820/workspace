package com.rg.struts2.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	private User user = new User();
	
	public String execute(){
		System.out.println("name: " + user.getName());
		System.out.println("age: " + user.getAge());
		return SUCCESS;
	}

	@Override
	public User getModel() {
		return user;
	}

}
