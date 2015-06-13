package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.service.UserServiceDetail;
import com.etc.OurProgram.service.impl.UserServiceDetailImpl;
import com.opensymphony.xwork2.ActionSupport;

public class QueryActionDetail extends ActionSupport{
	
	private List list;
	private String projectName;
	private UserServiceDetail userServiceDetail;
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public String queryUserList(){
	
		userServiceDetail = new UserServiceDetailImpl();
		this.setList(userServiceDetail.queryUserDetail(projectName));
		return SUCCESS;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
}
