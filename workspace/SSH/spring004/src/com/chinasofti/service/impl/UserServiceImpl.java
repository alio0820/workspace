package com.chinasofti.service.impl;

import com.chinasofti.dao.UserDao;
import com.chinasofti.service.UserService;

public class UserServiceImpl implements UserService {

	
	private UserDao userDao;
	@Override
	public void addUser() {
		System.out.println("service---------->addUser");
		
		userDao.addUser();
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	

}
