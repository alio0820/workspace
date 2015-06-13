package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet
{

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		//1.获取前台传入的参数
		request.setCharacterEncoding("UTF-8");//设置传入字符的编码
//		response.setContentType("text/html;charset=UTF-8");//局部刷新时，设置返回的字符编码，此时不可用
		String name =request.getParameter("username");
		String pass =request.getParameter("password");
		String age  =request.getParameter("age");
		String bir  =request.getParameter("birthday");
		
		//2.执行业务逻辑
		//。。。。。。
		
		//3.根据执行结果跳转到对应的页面
		
		request.setAttribute("username", name);//设置传递的属性
		request.setAttribute("password", pass);
		request.setAttribute("age", age);
		request.setAttribute("birthday", bir);
		request.getRequestDispatcher("/login.jsp").forward(request, response);//跳转
		
		System.out.println(name);
		System.out.println(pass);
		System.out.println(bir);
		System.out.println(age);
		
	}

}
