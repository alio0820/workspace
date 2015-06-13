package com.wecan.wecanmanager.dao;

import java.util.List;

import com.wecan.wecanmanager.pojo.Commend;
import com.wecan.wecanmanager.pojo.User;

/**
 * 管理员添加奖励者，在页面显示受奖励者
 * 
 * @author 孙玲
 * @createDate 2011、11、07
 * @modifyAuthor 孙玲、孙显松
 * @modifyDate 修改的时间
 */
public interface IUserDao {
	/*
	 * 添加管理员
	 */
	public boolean addManager(User user);

	/*
	 * 刪除管理员
	 */
	public boolean delManager(User user);

	/*
	 * 修改管理员信息
	 */
	public boolean updateManager(User user);

	/*
	 * 添加成员
	 */
	public boolean addUser(User user);

	/*
	 * 删除成员
	 */
	public boolean delUser(User user);

	/*
	 * 修改成员信息
	 */
	public boolean updateUser(User user);

	/*
	 * 用户登录
	 */

	public boolean login(User user);

	/*
	 * 强制用户添加个人信息
	 */
	public boolean addUerMessage(User user);

	/*
	 * 修改密码
	 */
	public boolean updatePasswd(User user);

	/*
	 * 修改个人信息
	 */
	public boolean updateUserMessage(User user);
	
	/*
	 * 显示普通用户名字
	 */
	public List<User> showUserName();
	
	/*
	 * 显示管理员名字
	 */
	public List<User> showManagerName();
	
	/*
	 * 显示普通用户名字、部门、工号，用于修改用户信息
	 */
	public List<User> showUserNameForUpdate();
	
	/*
	 * 显示管理员名字、部门、工号，用于修改管理员信息
	 */
	public List<User> showManagerNameForUpdate();
}
