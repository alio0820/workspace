package com.chinasoft.web.action;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	private String userName;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String execute() throws Exception {	
		System.out.println("action");
		return super.execute();
	}
	
	
	public String add() throws Exception {
		System.out.println("add" + userName);
		System.out.println("action");
		return super.execute();
	}
	
	public String del() throws Exception {
		System.out.println("del" + userName);
		System.out.println("action");
		return super.execute();
	}
	
	
}
