package com.etc.OurProgram.web.action;

import com.etc.OurProgram.service.financeCreateFormService;
import com.etc.OurProgram.service.impl.financeCreateFormServiceImpl;

public class financeCreateFormAction {
    private int id;
  
    public String createForm(){
    	boolean bool = false;
    	financeCreateFormService c=new financeCreateFormServiceImpl();
    	bool=c.createForm(getId());
    	if(bool)
    		return  "success";
    	else 
    		return "false";
    	
    }
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
