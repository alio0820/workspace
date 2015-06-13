package com.chinasoft;

public class User {
	private String name;
	private String passWord;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	
	public String validate(){
		if(name.equals("zhouqi")&&passWord.equals("123456")){
			return "success";			
		}else{
			return "failure";			
		}
		
	}
	
}
