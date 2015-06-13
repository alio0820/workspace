package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.service.HaveService;
import com.etc.OurProgram.service.impl.HaveServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class HaveAction extends ActionSupport{
	private List list;
	private HaveService userService;

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public String queryUserList(){
		userService = new HaveServiceImpl();
		this.setList(userService.queryUser());
		return SUCCESS;
	}
}
