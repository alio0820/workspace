/**
 * 
 */
package com.hp.login.login.web.action;

import java.util.List;
import com.hp.login.login.service.UserService;
import com.hp.login.login.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class QueryAction extends ActionSupport {

	private List list;
	private UserService userService;

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public String queryUserList(){
		userService = new UserServiceImpl();
		this.setList(userService.queryUser());
		return SUCCESS;
	}
}
