package com.rg.struts2.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction1 extends ActionSupport{
	
	private Map request;
	private Map session;
	private Map application;
	
	public LoginAction1(){
		request = (Map)ActionContext.getContext().get("request");
		session = ActionContext.getContext().getSession();
		application = ActionContext.getContext().getApplication();
	}
	
	public String execute(){
		request.put("request1", "REQUEST");
		session.put("session1", "SESSION");
		application.put("application1", "APPLICATION");
		return SUCCESS;
	}

}
