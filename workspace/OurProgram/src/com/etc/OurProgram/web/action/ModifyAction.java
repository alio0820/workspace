package com.etc.OurProgram.web.action;


import com.etc.OurProgram.service.ModifyService;
import com.etc.OurProgram.service.impl.ModifyServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ModifyAction extends ActionSupport {

	private String username;
	private String password;
	private String power;
	private String department;
	
	public String modify() throws Exception {
		
		ModifyService modifyService = new ModifyServiceImpl();
		boolean flag = modifyService.modify(username,password,power,department);
		if(flag==true){
			return SUCCESS;
		}
		return "false";	
	}	
   

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}

	
}
