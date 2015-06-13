package com.chinasoft.web.action;

import java.util.List;

import com.chinasoft.dto.User;
import com.chinasoft.service.IUserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven{
	private IUserService userService;
	private User user = new User();
	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return super.execute();
	}
	public String userLogin(){
		if(userService.userLogin(user))
			return "list";
		else
			return "input";
	}
	public String addUser(){
		System.out.println("action: add user");
		userService.addUser(user);
		return "input1";
		/*return listUsers();*/
	}
	public String updateUser(){
		userService.updateUser(user);
		return listUsers();
	}
	public String listUsers(){
		List<User> userList = userService.listUsers();
		ActionContext.getContext().put("userList", userList);
		return "list";
	}

	public Object getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
}
