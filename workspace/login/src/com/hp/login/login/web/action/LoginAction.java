package com.hp.login.login.web.action;

import com.google.gson.Gson;
import com.hp.login.login.javabean.User;
import com.hp.login.login.service.LoginService;
import com.hp.login.login.service.impl.LoginServiceImpl;
import com.opensymphony.xwork2.ActionSupport;


@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{

	private String userID;
	private String password;
	
	public String login() throws Exception {
		
		System.out.println("userID:" + userID);
		System.out.println("password:" + password);
		System.out.println("this is my first action!");
		
		LoginService loginService = new LoginServiceImpl();
		boolean flag = loginService.login(userID, password);
		if(flag==true){
			return "suce";
		}else{
			addActionError("请输入正确的用户名和密码");
			return INPUT;
		}
	}
	public static void main(String []args){
		Gson gson = new Gson();
		User user = new User();
		user.setId("1");
		user.setPassword("你好");
		user.setUserName("翟");
		String string = gson.toJson(user);
		System.out.println(string);
	}
	
	
	public String insertUser() throws Exception {
		System.out.println("this is insertUser!");
		return null;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
