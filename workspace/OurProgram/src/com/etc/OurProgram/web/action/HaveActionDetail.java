package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.service.impl.HaveServiceDetailImpl;
import com.opensymphony.xwork2.ActionSupport;

public class HaveActionDetail extends ActionSupport{
	private List list;
	private String projectName;
	private HaveServiceDetailImpl userServiceDetail;
	public List getList() {
		return list;
	}
    
	public void setList(List list) {
		this.list = list;
	}
	
	public String queryUserList(){
	//	System.out.println(projectName);     ���ڲ����
		userServiceDetail = new HaveServiceDetailImpl();
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
