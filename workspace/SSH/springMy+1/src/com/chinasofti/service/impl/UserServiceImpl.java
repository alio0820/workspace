package com.chinasofti.service.impl;
import com.chinasofti.dao.impl.UserDao;
import com.chinasofti.service.UserService;
public class UserServiceImpl implements UserService{

	public UserDao userDao;
	
	
	
	public UserServiceImpl(UserDao userDao)
	{
		super();
		this.userDao=userDao;
	}
	
	
	@Override
	public void addUser()
	{
		System.out.println("service--------->addUser");
		userDao.addUser();
	}
}
