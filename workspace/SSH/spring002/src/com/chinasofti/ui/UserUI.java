package com.chinasofti.ui;

import com.chinasofti.service.UserService;

public class UserUI implements IUser {
	
	private UserService userService;
	/* (non-Javadoc)
	 * @see com.chinasofti.ui.IUser#addUser()
	 */
	public void addUser(){
		
		userService.addUser();
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
