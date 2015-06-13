package com.chinasoft.web.action;

import com.chinasoft.web.vo.User;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction implements ModelDriven{
	
	private User user = new User();	


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String doLogin(){
		System.out.println("dologin");
		return "success";
	}
	
	public String execute(){
		System.out.println(user.getUserName());
		System.out.println(user.getPassword());
		System.out.println(user.getP().getPersonName());
		System.out.println(user.getList().length);
		Object o = user.getMap().get("m");
		System.out.println(user.getAge());
		System.out.println(user.getDate());
		if(user.getUserName().equals("zhouqi")&&user.getPassword().equals("123456")){
			return "success";
		}else{
			return "failer";
		}		
	}

	public Object getModel() {

		return user;
	}
}
