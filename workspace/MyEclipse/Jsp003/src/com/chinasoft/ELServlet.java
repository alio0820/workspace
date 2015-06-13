package com.chinasoft;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ELServlet extends HttpServlet {

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
		
		List list = new ArrayList();
		
		Map map = new HashMap();
		
		
		
		Person p = new Person();
		String[] name = {"zhouqi","xiaozhu"};		
		p.setName(name);
		
		Person p1 = new Person();
		String[] name1 = {"........","1111111111"};
		
		p1.setName(name1);
		map.put("s1", p1);
		map.put("s2", p);
		
		list.add(map);
		request.setAttribute("p", list);
		request.getSession().setAttribute("p", p);
		request.getRequestDispatcher("../index.jsp?name=hehe").forward(request, response);
	}

}
