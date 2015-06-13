package com.etc.OurProgram.web.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.etc.OurProgram.service.impl.UserServiceDetailImplTwo;
import com.opensymphony.xwork2.ActionSupport;

public class QueryActionDetailTwo extends ActionSupport{
	private List list;
	private String projectName;
	private String auditingAttitude;
	private String pigeonholeDate;
	private UserServiceDetailImplTwo userServiceDetailTwo;
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public String queryUserList(){
		//System.out.println(projectName); 
		//System.out.println(description);
		userServiceDetailTwo = new UserServiceDetailImplTwo();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		pigeonholeDate=format.format(date);
		this.setList(userServiceDetailTwo.queryUserDetailTwo(projectName,auditingAttitude,pigeonholeDate));
		return SUCCESS;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getAuditingAttitude() {
		return auditingAttitude;
	}

	public void setAuditingAttitude(String auditingAttitude) {
		this.auditingAttitude = auditingAttitude;
	}

	public String getPigeonholeDate() {
		return pigeonholeDate;
	}

	public void setPigeonholeDate(String pigeonholeDate) {
		this.pigeonholeDate = pigeonholeDate;
	}

	
}
