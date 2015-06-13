package com.chinasoft;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateUser extends HttpServlet {

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

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String userName= request.getParameter("userName");
		String path = request.getRealPath("/");

		FileInputStream fis = new FileInputStream(path+"user.txt");		
		Map<String,User>  map = null ;
		try {
			ObjectInputStream ois = new ObjectInputStream(fis);
			map = (Map)ois.readObject();
			ois.close();
		} catch (Exception e) {
			map = new HashMap();			
		}
		User user = map.get(userName);
		
		
		
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("  <form>");
		out.println("  <input type='text' name='userName' value='"+user.getUserName()+"' readOnly='readOnly' />");
		out.println("  <input type='text' name='age' value="+user.getAge()+" />");
		String flag = "0";
		String[] s = user.getXq();
		int len = s.length;
		if(len==0){
			flag = "0";
		}
		if(len==2){
			flag = "3";
		}
		if(s[0].equals("打游戏")){			
			flag = "1";
		}else{
			flag = "2";
		}
		if(flag.equals("0")){
			out.println("  <input type='checkbox' name='xq' value='打游戏' />");
			out.println("  <input type='checkbox' name='xq' value='上网' />");
		}else if(flag.equals("2")){
			out.println("  <input type='checkbox' name='xq' value='打游戏' checked='checked'/>");
			out.println("  <input type='checkbox' name='xq' value='上网' checked='checked'/>");
		}
		out.println("  <input type='submit' value='保存修改'/>");
		out.println("  </form>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
