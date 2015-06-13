package com.chinasoft;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		String user = req.getParameter("userName");
		String pwd = req.getParameter("pwd");
		String[] s = req.getParameterValues("ckeck");
		System.out.println(user);
		System.out.println(pwd);
		System.out.println(s);
		Map map = req.getParameterMap();
		Enumeration  e = req.getParameterNames();
		while(e.hasMoreElements()){
			System.out.println(e.nextElement());
		}
		if("zhouqi".equals(user)&&"123456".equals(pwd)){
//			resp.sendRedirect("../page/AAAAA.html");
//			resp.sendRedirect("/Servlet001/page/AAAAA.html");
//			resp.sendRedirect("http://www.qq.com");
//			req.getRequestDispatcher("/page/AAAAA.html").forward(req, resp);
//			req.getRequestDispatcher("http://www.qq.com").forward(req, resp);
//			out.print("<html><head>" +
//					"<meta http-equiv='content-type' content='text/html; charset=UTF-8'>" +
//					"<title>成功</title></head>");
//			out.print("<body>成功</body></html>");
		}else{
//			resp.sendRedirect("../BBBBBB.html");
//			resp.sendRedirect("/Servlet001/BBBBBB.html");
//			out.print("<html><head>" +
//					"<meta http-equiv='content-type' content='text/html; charset=UTF-8'>" +
//					"<title>失败</title></head>");
//			out.print("<body>失败</body></html>");
		}
		
	}

	
}
