package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.service.fileUserService;
import com.etc.OurProgram.service.impl.fileUserServiceImpl;
import com.opensymphony.xwork2.ActionSupport;


public class fileQueryAction extends ActionSupport {

	private List list;
	

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public String filequeryUserList(){
		fileUserService fileuserService = new fileUserServiceImpl();
		this.setList(fileuserService.queryUser());
		return SUCCESS;
	}
}
