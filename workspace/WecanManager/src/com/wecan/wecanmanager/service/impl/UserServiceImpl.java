package com.wecan.wecanmanager.service.impl;

import java.util.List;

import com.wecan.wecanmanager.dao.IUserDao;
import com.wecan.wecanmanager.pojo.User;
import com.wecan.wecanmanager.service.IUserService;

/**
 * 管理员添加奖励者，在页面显示受奖励者
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 孙玲、孙显松
 * @modifyDate 修改的时间
 */
public class UserServiceImpl implements IUserService {

	private IUserDao iud;// user对应的dao层接口对象

	public IUserDao getIud() {
		return iud;
	}

	public void setIud(IUserDao iud) {
		this.iud = iud;
	}

	/*
	 * 添加管理员
	 */
	public boolean addManager(User user) {

		return iud.addManager(user);
	}

	/*
	 * 强制用户添加个人信息
	 */
	public boolean addUerMessage(User user) {

		return iud.addManager(user);
	}

	/*
	 * 添加成员
	 */
	public boolean addUser(User user) {

		return iud.addUser(user);
	}

	/*
	 * 刪除管理员
	 */
	public boolean delManager(User user) {

		return iud.delManager(user);
	}

	/*
	 * 删除成员
	 */
	public boolean delUser(User user) {

		return iud.delUser(user);
	}

	/*
	 * 用户登录
	 */
	public boolean login(User user) {

		return iud.login(user);
	}

	/*
	 * 修改管理员信息
	 */
	public boolean updateManager(User user) {

		return iud.updateManager(user);
	}

	/*
	 * 修改密码
	 */
	public boolean updatePasswd(User user) {

		return iud.updatePasswd(user);
	}

	/*
	 * 修改成员信息
	 */
	public boolean updateUser(User user) {

		return iud.updateUser(user);
	}

	/*
	 * 修改个人信息
	 */
	public boolean updateUserMessage(User user) {

		return iud.updateUserMessage(user);
	}
	
	/*
	 * 显示普通用户名字
	 */
	public List<User> showUserName() {	
		return iud.showUserName();
	}
	
	
	
	/*
	 * 显示管理员名字
	 */
	public List<User> showManagerName(){
	return iud.showManagerName();
	}
	
	/*
	 * 显示普通用户名字、部门、工号，用于修改用户信息
	 */
	public List<User> showUserNameForUpdate(){
		return iud.showUserNameForUpdate();
		
	}
	
	
	/*
	 * 显示管理员名字、部门、工号，用于修改管理员信息
	 */
	public List<User> showManagerNameForUpdate(){
		return iud.showManagerNameForUpdate();
		
	}
}
