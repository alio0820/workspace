package com.etc.OurProgram.web.action;


import com.etc.OurProgram.service.DeleteService;
import com.etc.OurProgram.service.impl.DeleteServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class DeleteAction extends ActionSupport {

	private String username;
	
    public String delete() throws Exception {
		
		DeleteService deleteService = new DeleteServiceImpl();
		boolean flag = deleteService.delete(username);
		if(flag==true){
			return SUCCESS;
		}
		return "false";	
	}	
   

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
