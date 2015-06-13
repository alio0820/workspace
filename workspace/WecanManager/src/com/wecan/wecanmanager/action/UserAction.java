package com.wecan.wecanmanager.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.opensymphony.xwork2.ActionSupport;
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

public class UserAction extends ActionSupport {

	private User user;// 用户对象

	private IUserService ius;// 用户service接口对象

	private List<User> list;// 显示用户真实名字

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public IUserService getIus() {
		return ius;
	}

	public void setIus(IUserService ius) {
		this.ius = ius;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	/*
	 * 添加管理员
	 */

	public String addManager() {
		boolean flag = ius.addManager(user);
		if (flag) {
			return "addManagerSucc";
		}
		return "error";
	}

	/*
	 * 刪除管理员
	 */

	public String delManager() {
		boolean flag = ius.delManager(user);
		if (flag) {
			return "delManagerSucc";
		}
		return "error";
	}

	/*
	 * 修改管理员信息
	 */

	public String updateManager() {
		boolean flag = ius.updateManager(user);
		if (flag) {
			return "updateManagerSucc";
		}
		return "error";
	}

	/*
	 * 添加成员
	 */

	public String addUser() {
		boolean flag = ius.addUser(user);
		if (flag) {
			return "addUserSucc";
		}
		return "error";
	}

	/*
	 * 删除成员
	 */

	public String delUser() {
		HttpServletRequest request = null;
		String id = request.getParameter("id");
		String[] arr = id.split(",");
		for (String s : arr) {
			user.setId(Integer.parseInt(s));
			ius.delUser(user);
		}
		return "delUserSucc";
	}

	/*
	 * 修改成员信息
	 */

	public String updateUser() {
		boolean flag = ius.updateUser(user);
		if (flag) {
			return "updateUserSucc";
		}
		return "error";
	}

	/*
	 * 修改个人信息
	 */

	public String updateUserMessage(User user) {

		return "";
	}

	/*
	 * 添加用户信息（用户自己添加）
	 */

	public String addUerMessage(User user) {
		boolean flag = ius.addUerMessage(user);
		if (flag) {
			return "suce";
		}
		return "error";

	}

	/*
	 * 修改密码
	 */

	public String updatePasswd(User user) {

		return "";
	}

	/*
	 * 用户登录
	 */

	public String login() {
		boolean flag = ius.login(user);
		if (flag == true) {
			return "login";
		}
		return "error";
	}

	/*
	 * 查询所有的user的真实名字（除超管和管理员）
	 */
	public String showUserName() {
		list = ius.showUserName();
		if (list.size() != 0) {
			return "addManager";
		}
		return "error";
	}

	/*
	 * 查询所有的user的真实名字（除超管和管理员）
	 */
	public String showManagerName() {
		list = ius.showManagerName();
		if (list.size() != 0) {
			return "delManager";
		}
		return "error";
	}

	/*
	 * 查询所有的user的真实名字、工号、部门（除超管和管理员）,用于更新用户信息
	 */
	public String showUserNameForUpdate() {
		list = ius.showUserNameForUpdate();
		if (list.size() != 0) {
			return "showUser";
		}
		return "error";
	}

	/*
	 * 查询管理员真实名字、工号、部门,用于更新用户信息
	 */
	public String showManagerNameForUpdate() {
		list = ius.showManagerNameForUpdate();
		if (list.size() != 0) {
			return "showManager";
		}
		return "error";
	}
}
