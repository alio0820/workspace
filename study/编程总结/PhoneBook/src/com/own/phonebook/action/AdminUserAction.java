package com.own.phonebook.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.own.phonebook.entity.AdminUser;
import com.own.phonebook.service.AdminUserService;
import com.own.phonebook.swich.AdminUserSwich;
import com.own.phonebook.vo.AdminUserVO;

public class AdminUserAction extends ActionSupport {
	private AdminUserVO adminUserVO;

	public AdminUserService adminUserService=new AdminUserService();
	public AdminUserSwich adminUserSwich=new AdminUserSwich();

	

	/**
	 * 登陆
	 * @return
	 */
	public String login(){
		AdminUser adminUser=new AdminUser();		
		adminUser=adminUserSwich.VOtoEntity(adminUserVO);
		AdminUserVO getVO=adminUserSwich.EntitytoVO(adminUserService.login(adminUser));
		if(getVO!=null)
		{
			if(getVO.getPassword().equals(adminUserVO.getPassword()))
				return SUCCESS;
			else 
				return ERROR;
		}
		else
			return ERROR;
		
	}
/**
 * 注册
 * @return
 */
	public String  register(){
		AdminUser adminUser=new AdminUser();
		adminUser=adminUserSwich.VOtoEntity(adminUserVO);
		Boolean bool=adminUserService.add(adminUser);
		System.out.print(bool.booleanValue());
		if(bool.equals(true))
			return SUCCESS;
		else
			return ERROR;
	}
	public String nameCheck(){
		 try {
			HttpServletRequest request=ServletActionContext.getRequest();
			 HttpServletResponse response=ServletActionContext.getResponse();
			 AdminUser adminUser=new AdminUser();
			 String responseTextt="";
			 System.out.print(request.getParameter("userID"));
			 adminUser.setName(request.getParameter("userID"));
			 Boolean bool=adminUserService.nameCheck(adminUser);
			 System.out.print(bool);
			 if(bool.equals(true)){
				 responseTextt="用户名可用!";
			 System.out.print(responseTextt);
			 }
			else
				responseTextt= "此用户以被注册，请重新输入！";
			 PrintWriter out =response.getWriter(); 
			 out.println(responseTextt);    
			 out.flush();    
			 out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}
	public String add(){
		return SUCCESS;
	}
	public String update(){
		return SUCCESS;
	}
	
	
	

	public AdminUserVO getAdminUserVO() {
		return adminUserVO;
	}

	public void setAdminUserVO(AdminUserVO adminUserVO) {
		this.adminUserVO = adminUserVO;
	}
	




}
