package com.chinasoft;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

public class User {
	private String name;
	private String passWord;
	private String locale;
	private Date date;
	private List<User> users;
	
	
	
	
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
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
		System.out.println("!!!!!!!!!!!");
		if(name.equals("zhouqi")&&passWord.equals("123456")){
			return "success";			
		}else{
			return "failure";			
		}
		
	}
	
	public void myListener(ActionEvent e){
		System.out.println("--------");
	
	}
	
	public String queryUser(){
		users = new ArrayList<User>();
		User user1 = new User();
		User user2 = new User();
		user1.setName("abc");
		user1.setPassWord("123");
		user2.setName("def");
		user2.setPassWord("456");
		users.add(user1);
		users.add(user2);
		return "queryuser";
	}
	
	public void removeUser(ActionEvent e){
		System.out.println("removeUser");
		int index =Integer.parseInt((e.getComponent().findComponent("deleteId").toString()));
		users.remove(index);

	}
}
