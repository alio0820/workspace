package com.hp.login.login.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import com.hp.login.login.javabean.User;
import com.hp.login.login.service.RegisterService;
import com.hp.login.login.service.impl.RegisterServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport
{
	private String userID;
	private String password;

	public String getUserID()
	{
		return userID;
	}

	public void setUserID(String userID)
	{
		this.userID = userID;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String register()throws Exception
	{
		RegisterService registerService = new RegisterServiceImpl();
		boolean flag = registerService.register(userID, password);
		if (flag == true)
		{
			return "suce";
		} else
		{
			addActionError("用户名已存在，请重新注册");
			return INPUT;
		}

	}
	
	public void  nameCheck(){
		 try {
			 RegisterService registerService = new RegisterServiceImpl();
			 HttpServletRequest request=ServletActionContext.getRequest();
			 HttpServletResponse response=ServletActionContext.getResponse();
			 User user=new User();
			 String responseText="";
			 System.out.print(request.getParameter("name"));
			 user.setUserName(request.getParameter("name"));
			 Boolean bool=registerService.nameCheck(request.getParameter("name"));
			 System.out.print(bool);
			 if(bool.equals(true)){
				 responseText="恭喜你，用户名可用！";
			 System.out.print(responseText);
			 }
			else
				responseText= "此用户已被注册，请重新输入！";
			 response.setContentType("text/html;charset=UTF-8");   //编码规则必须写在out的前面！
			 PrintWriter out =response.getWriter(); 
			 
			 //response.setHeader("Cache-Control","no-cache");    
			 //request.setAttribute("responseText", responseTextt); 
			 out.print(responseText);    
			 out.flush();    
			 out.close();
			 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
