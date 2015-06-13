package com.etc.OurProgram.web.action;

import java.util.List;


import com.etc.OurProgram.service.UserService;
import com.etc.OurProgram.service.impl.UserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
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
