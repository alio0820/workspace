package com.chinasoft;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddUser extends HttpServlet {

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
	@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String userName = request.getParameter("userName");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String city = request.getParameter("city");
		String[] xq = request.getParameterValues("xq");
		User user = new User();
		user.setUserName(userName);
		user.setAge(age);
		user.setSex(sex);
		user.setCity(city);
		user.setXq(xq);
		
		
		String path = request.getRealPath("/");
		System.out.println(path);
		FileInputStream fis = new FileInputStream(path+"user.txt");		
		Map<String,User>  map = null ;
		try {
			ObjectInputStream ois = new ObjectInputStream(fis);
			map = (Map)ois.readObject();
			ois.close();
		} catch (Exception e) {
			map = new HashMap();			
		}
		map.put(user.getUserName(), user);
		FileOutputStream fos = new FileOutputStream(path+"user.txt");
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		oos.writeObject(map);		
		oos.close();
		
		
		PrintWriter out = response.getWriter();
		Set<String> keys = map.keySet();
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>用户列表</TITLE></HEAD>");
		out.println("  <BODY><table>");	
		out.println("  <tr><td>用户名</td><td>年龄</td><td>性别</td><td>城市</td><td>兴趣</td><td>操作</td></tr>");	
		for(String key:keys){
			out.println("<tr>");
			out.println("<td>"+map.get(key).getUserName()+"</td>");
			out.println("<td>"+map.get(key).getAge()+"</td>");
			out.println("<td>"+map.get(key).getSex()+"</td>");
			out.println("<td>"+map.get(key).getCity()+"</td>");
			out.println("<td>"+map.get(key).getXq()+"</td>");
			out.println("<td><a href=UpdateServlet?userName="+map.get(key).getUserName()+">删除</a><a href=UpdateServlet?userName="+map.get(key).getUserName()+">修改</a></td>");
			out.println("</tr>");
		}
		out.println(" </table></BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
