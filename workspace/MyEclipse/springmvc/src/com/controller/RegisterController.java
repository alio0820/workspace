package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class RegisterController extends MultiActionController {
	
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


	public ModelAndView register(HttpServletRequest request,HttpServletResponse response){	
		return new ModelAndView("register");		
	}
	
	
	public ModelAndView displayCatalog(HttpServletRequest request,HttpServletResponse response){
		return new ModelAndView("displayCatalog");
	}

}
