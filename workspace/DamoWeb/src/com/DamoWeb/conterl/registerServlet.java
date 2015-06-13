package com.DamoWeb.conterl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Conn;


public class registerServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("this is get mo!");
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
		
		
		//用户登录
		//执行前台jsp传入的参数
		String userId = request.getParameter("userId");	
		System.out.println("my name:"+userId);
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		Conn conn = new Conn();
		
		Connection connection = conn.getConnection();						
		PreparedStatement pstmt;
		try 
		{	
			
			pstmt = connection.prepareStatement("SELECT * FROM stu WHERE name=?"); 
			pstmt.setString(1, userId);
			ResultSet rs0 = pstmt.executeQuery();
			if(rs0.next())				
			{
				request.setAttribute("userError", "用户名已存在！");
				request.getRequestDispatcher("/register.jsp").forward(request, response);			   
			}
			else
			{
				pstmt = connection.prepareStatement("insert into stu(name ,password) values(?,?)");
				pstmt.setString(1, userId);
				pstmt.setString(2, password);
				int rs = pstmt.executeUpdate();
					//String pw = rs.getString("password");
					if (rs>0) {
						request.setAttribute("userIdError", "恭喜你注册成功！你现在可以登录！");
						request.getRequestDispatcher("/login.jsp").forward(request, response);
//						response.sendRedirect("/DamoWeb/login.jsp");
					}
					else
					{
						request.setAttribute("userError", "注册失败！");
						request.getRequestDispatcher("/register.jsp").forward(request, response);
					}			
				try 
				{
					pstmt.close();
				} 
				catch (SQLException e1) 
				{
					e1.printStackTrace();
				}	
			}
		 } 
		catch (SQLException e) 
		{
			   e.printStackTrace();
		} 
		finally 
		{
			try 
			{
				connection.close();
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
	}
	
}
