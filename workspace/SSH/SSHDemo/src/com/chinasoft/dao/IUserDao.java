package com.chinasoft.dao;

import java.util.List;

import com.chinasoft.dto.User;

public interface IUserDao {
	public boolean userLogin(User user);
	public List<User> listUsers();
	public void addUser(User user);
	public void updateUser(User user);
	public void deleteUser(User user);
}
