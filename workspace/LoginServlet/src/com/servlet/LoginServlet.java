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
		//1.��ȡǰ̨����Ĳ���
		request.setCharacterEncoding("UTF-8");//���ô����ַ��ı���
//		response.setContentType("text/html;charset=UTF-8");//�ֲ�ˢ��ʱ�����÷��ص��ַ����룬��ʱ������
		String name =request.getParameter("username");
		String pass =request.getParameter("password");
		String age  =request.getParameter("age");
		String bir  =request.getParameter("birthday");
		
		//2.ִ��ҵ���߼�
		//������������
		
		//3.����ִ�н����ת����Ӧ��ҳ��
		
		request.setAttribute("username", name);//���ô��ݵ�����
		request.setAttribute("password", pass);
		request.setAttribute("age", age);
		request.setAttribute("birthday", bir);
		request.getRequestDispatcher("/login.jsp").forward(request, response);//��ת
		
		System.out.println(name);
		System.out.println(pass);
		System.out.println(bir);
		System.out.println(age);
		
	}

}
