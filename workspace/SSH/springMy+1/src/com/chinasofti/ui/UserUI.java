package com.chinasofti.ui;
import com.chinasofti.service.UserService;
public class UserUI implements IUser{

	private UserService userService;
	public UserUI(UserService userService)
	{
		super();
		this.userService=userService;
	}
	
	
	public void addUser()
	{
		userService.addUser();
	}
}
