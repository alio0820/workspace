package com.chinasoft.web.action;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.chinasoft.web.vo.Person;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{
	
	
	
	
	private String password;
	private String userName;
	
	private Map session;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	private Person p;

	public Person getP() {
		return p;
	}

	public void setP(Person p) {
		this.p = p;
	}

	public String doLogin(){
		System.out.println("dologin");
		return "success";
	}
	
	public String execute(){
		//Map map = ActionContext.getContext().getSession();

		Locale locale = new Locale("en","US");
		HttpSession session = ServletActionContext.getRequest().getSession();
		//ActionContext getContext().getSession();
		System.out.println(p);
		System.out.println(p.getPersonName());
		System.out.println(p.getPersonpwd());	
		session.setAttribute("name", "123456");
		session.setAttribute(ActionContext.LOCALE, locale);
		this.getLocale();
		return "success";			
	}
	
	public String addUser(){
		System.out.println(p);
		System.out.println(p.getPersonName());
		System.out.println(p.getPersonpwd());		
		return "success";			
	}

	@Override
	public void validate() {
		if(userName==null||userName.equals("")){
			//addFieldError("a", "�û���Ϊ��");
			
			addFieldError("userName", getText("aa",new String[]{"aaaa","bbbb"}));
		}
		if(password==null||password.equals("")){
			addFieldError("b", "����Ϊ��");
			//addFieldError("password", getText("bb"));
		}
	}
	
//	public void validateExecute() {
//		if(password==null||password.equals("")){
//			String[] s = {"zhou","qi"};
//			
//			addActionError(getText("bb",s));
//			addActionError(getText("bb",s));
//			addActionError(getText("bb",s));
//			addActionError(getText("bb",s));
//			//addFieldError("password", getText("bb",s));
//		}
//	}

	public void setSession(Map arg0) {
		session = arg0;
	
	}
	
	

	
	
}
