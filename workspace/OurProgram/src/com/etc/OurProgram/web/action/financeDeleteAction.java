package com.etc.OurProgram.web.action;

import com.etc.OurProgram.service.financeDeleteService;
import com.etc.OurProgram.service.impl.financeDeleteServiceImpl;

public class financeDeleteAction {
     private int id;
     

	public String delete(){
		  //id=Integer.getInteger(id1);
    	  boolean bool=false;
    	  financeDeleteService d=new financeDeleteServiceImpl();
    	  bool=d.delete(id);
    	  if(bool)
    		  return "success";
    	  else
    		  return "false";
     }
	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

}
