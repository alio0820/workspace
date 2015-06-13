package com.etc.OurProgram.web.action;


import com.etc.OurProgram.service.AddService;
import com.etc.OurProgram.service.impl.AddServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AddAction extends ActionSupport  {

	private String username;
	private String password;
	private String power;
	private String department;
	
	public String add() throws Exception {
		//HttpServletRequest request = ServletActionContext.getRequest();
		//request.setCharacterEncoding("utf-8");
		System.out.println(username);
		AddService addService = new AddServiceImpl();
		String uname=new String(username.getBytes("ISO-8859-1"),"utf-8");
		boolean flag = addService.add(uname,password,power,department);
		if(flag==true){
			return "success";
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

