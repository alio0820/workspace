package com.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.model.LoginInfo;

public class LoginController extends  SimpleFormController {
	
	private String fail_view ;
	private String success_view;	

	public String getFail_view() {
		return fail_view;
	}

	public void setFail_view(String fail_view) {
		this.fail_view = fail_view;
	}

	public String getSuccess_view() {
		return success_view;
	}

	public void setSuccess_view(String success_view) {
		this.success_view = success_view;
	}
	
	
	
	private int login(LoginInfo loginInfo) {
		if ("zhouqi".equalsIgnoreCase(loginInfo.getUsername())
		&& "123456".equals(loginInfo.getPassword())) {
			return 0;
		}
		return 1;
	}

	
	
	
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected org.springframework.web.servlet.ModelAndView onSubmit(
			Object command, BindException errors) throws Exception {
		
		LoginInfo loginInfo = (LoginInfo) command;
		System.out.println(loginInfo.getUsername());
		System.out.println(loginInfo.getPassword());
		if (login(loginInfo) == 0) {
			HashMap<String, Object> result_map = new HashMap<String, Object>();
			result_map.put("logininfo", loginInfo);
			List<String> msgList = new LinkedList<String>();
			msgList.add("msg1");
			msgList.add("msg2");
			msgList.add("msg3");
			result_map.put("messages", msgList);
			System.out.println(this.getSuccess_view());
			return new	ModelAndView(this.getSuccess_view(), result_map);
		}else{
			System.out.println(this.getFail_view());
			return new ModelAndView(this.getFail_view());
		}
	}
	
	
	

}
