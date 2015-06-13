package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.service.financeUserService;
import com.etc.OurProgram.service.impl.financeUserServiceImpl;

public class financeSuccessShowAction {
   

	private List list;
	
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String successShow(){
    	financeUserService u=new financeUserServiceImpl();
    	this.setList(u.queryUser());
		return "success";
    }
	public String successShowTwo(){
    	financeUserService u=new financeUserServiceImpl();
    	this.setList(u.queryUser());
		return "success";
    }
}
