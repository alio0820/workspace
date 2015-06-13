package com.etc.OurProgram.web.action;


import com.etc.OurProgram.service.LoginService;
import com.etc.OurProgram.service.impl.LoginServiceImpl;
import com.opensymphony.xwork2.ActionSupport;



@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{

	private String userID;
	private String password;
	private String power;
	private String department;
	private String qx;
	private String pigeonholeLeader;
	public String getQx() {
		return qx;
	}

	public void setQx(String qx) {
		this.qx = qx;
	}

	public String login() throws Exception {
		
		LoginService loginService = new LoginServiceImpl();
		
		boolean flag = loginService.login(userID,password,power,department);
		if(flag==true){
			if(power.equals("admin")){
				
				return "suceAdmin";
			}else{
				return "suceCommon";
			}
			
		}else{
			//前台s：接受
			addActionError("登录错误，重来！");
			return INPUT;
		}
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
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

	public String getPigeonholeLeader() {
		return pigeonholeLeader;
	}

	public void setPigeonholeLeader(String pigeonholeLeader) {
		this.pigeonholeLeader = pigeonholeLeader;
	}
	
}
