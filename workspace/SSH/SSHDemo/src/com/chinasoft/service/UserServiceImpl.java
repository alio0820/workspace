package com.chinasoft.service;

import java.util.List;

import com.chinasoft.dao.IUserDao;
import com.chinasoft.dto.User;

public class UserServiceImpl implements IUserService {
	private IUserDao userDao;
	
	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	public void addUser(User user) {
		// TODO Auto-generated method stub
		System.out.println("service: add user");
		userDao.addUser(user);
	}

	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		userDao.deleteUser(user);
	}

	public List<User> listUsers() {
		// TODO Auto-generated method stub
		return userDao.listUsers();
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}

	public boolean userLogin(User user) {
		// TODO Auto-generated method stub
		return userDao.userLogin(user);
	}

}
