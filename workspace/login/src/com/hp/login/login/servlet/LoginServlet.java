package com.hp.login.login.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hp.login.login.service.LoginService;
import com.hp.login.login.service.impl.LoginServiceImpl;
import com.hp.login.login.service.impl.LoginServiceImplTwo;
import com.hp.login.login.util.Conn;

public class LoginServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 获取前台jsp传入的参数
		String password = request.getParameter("password");
		String userID = request.getParameter("userID");
		
		// 2. 执行我的业务逻辑
		LoginService loginService = new LoginServiceImpl();
		boolean flag = loginService.login(userID, password);
		
		// 3. 根据执行的结果进行对应的跳转
		if(flag){
			// 如果正确跳转到成功的界面
			request.setAttribute("username", userID);//---->设置传递的属性
			request.getRequestDispatcher("/login/loginSuce.jsp").forward(request, response);//---->跳转
		}else{
			// 如果错误跳转到登陆界面
			request.setAttribute("errorMassage", "this password or username is error!");
			request.getRequestDispatcher("/login/login.jsp").forward(request, response);
		}
		System.out.println(password);
	}

}
