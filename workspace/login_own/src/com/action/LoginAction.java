package com.action;

public class LoginAction {

	private String username;
	private String password;
	private String SUCCESS="success";
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String login() throws Exception{
        
		if ((username.equals("zcd"))&&(password.equals("111"))) return SUCCESS;   //字符串比较时需要用到equals
		else
		return null;
	}
	
	
}
