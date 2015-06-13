package com.chinasoft.web.intercept;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.opensymphony.xwork2.interceptor.PreResultListener;

public class LoginIntercept extends MethodFilterInterceptor   {

	private String name;	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void destroy() {
	}

	public void init() {
	}

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		PreResultListener p  = new PreResultListener(){
			public void beforeResult(ActionInvocation arg0, String arg1) {				
				System.out.println("------------:"+ arg1);
				
			}			
		};
		arg0.addPreResultListener(p);
		
		System.out.println(arg0.getAction());
		
		return arg0.invoke();
	}



}
