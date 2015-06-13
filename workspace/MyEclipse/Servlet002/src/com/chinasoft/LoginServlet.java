package com.chinasoft;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.SingleThreadModel;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet implements SingleThreadModel{

	public LoginServlet(){
		System.out.println("สตภýปฏ");
		
	}	
	
	@Override
	public void init() throws ServletException {
		System.out.println("init");
		System.out.println(this.getServletConfig().getInitParameter("uname"));
		System.out.println(this.getServletContext().getMajorVersion() );
		System.out.println(this.getServletContext().getContextPath());
		super.init();
	}

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
	
		doPost(request, response);
		
		
		
		//get 1
		//String userName = request.getParameter("userName");
		//System.out.println(new String(userName.getBytes("iso-8859-1"),"utf-8"));
		//get 2
		//System.out.println(java.net.URLDecoder.decode(userName, "utf-8"));
		//System.out.println(userName);	
		//request.setAttribute("name", "zhouqi");
		//request.getRequestDispatcher("LoginServlet1").forward(request, response);
		//response.sendRedirect("LoginServlet1?userName="+userName);
		//get 3
		//URIEncoding="UTF-8"
		
		
		
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
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {

			e.printStackTrace();
		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}





	@Override
	public void destroy() {
		  System.out.println("destroy");
		super.destroy();
	}
	
	

}
