package com.rg.struts2.action;

import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction2 extends ActionSupport implements RequestAware, SessionAware, ApplicationAware{
	
	private Map<String, Object> request;
	private Map<String, Object> session;
	private Map<String, Object> application;
	
	public String execute(){
		request.put("request1", "REQUEST");
		session.put("session1", "SESSION");
		application.put("application1", "APPLICATION");
		return SUCCESS;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

}
