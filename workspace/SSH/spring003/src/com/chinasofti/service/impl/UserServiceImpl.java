package com.chinasofti.service.impl;

import com.chinasofti.dao.UserDao;
import com.chinasofti.service.UserService;

public class UserServiceImpl implements UserService {

	
	private UserDao userDao;
	
	
	
	public UserServiceImpl(UserDao userDao) {
		super();
		this.userDao = userDao;
	}



	@Override
	public void addUser() {
		System.out.println("service---------->addUser");
		
		userDao.addUser();
	}
	
	
	

}
