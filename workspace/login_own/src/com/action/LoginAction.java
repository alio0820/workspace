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
        
		if ((username.equals("zcd"))&&(password.equals("111"))) return SUCCESS;   //�ַ����Ƚ�ʱ��Ҫ�õ�equals
		else
		return null;
	}
	
	
}
