package com.rg.struts2.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction3 extends ActionSupport{
	
	private HttpServletRequest request;
	private HttpSession session;
	private ServletContext application;
	
	public LoginAction3(){
		request = ServletActionContext.getRequest();
		session = request.getSession();
		application = session.getServletContext();
	}
	
	public String execute(){
		request.setAttribute("request1", "REQUEST");
		session.setAttribute("session1", "SESSION");
		application.setAttribute("application1", "APPLICATION");
		return SUCCESS;
	}

}
