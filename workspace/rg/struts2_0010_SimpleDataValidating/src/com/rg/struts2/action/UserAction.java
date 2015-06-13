package com.rg.struts2.action;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	
	private String name;
	private int age;
	
	public String execute(){
		if(!name.equals("admin") || name.equals("")){
			this.addFieldError("name", "username is not admin.");
		}
		return INPUT;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}
