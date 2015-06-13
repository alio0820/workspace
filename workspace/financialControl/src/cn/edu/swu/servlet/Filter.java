package cn.edu.swu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.swu.sql.UserManagement;

public class Filter extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Filter() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userName=request.getParameter("user");
		String password=request.getParameter("password");
		String radio=request.getParameter("radio");
		
		String target = null;				//��ת��Ŀ��ҳ�ĵ�ַ

		System.out.println(userName);
		System.out.println(password);
		System.out.println(radio);
		
		RequestDispatcher dispatcher=null;
		
	
		UserManagement userManager=new UserManagement();
		userManager.OpenDB();
		
		String name=userManager.ispwCorrect(userName,password,radio,request);				
		if(name!=null){		//��Ա���û�����
				HttpSession session = request.getSession();				
				session.setAttribute("name", name);
				if(radio.equals("yg")){			//Ա���û�
					System.out.println("����һ��Ա���û�");
					target="/index.htm";
				}
				else if(radio.equals("cwbm")){
					System.out.println("����һ���������û�");
					target="/index_cwbm.htm";
				}
				else {
					System.out.println("����һ��������û�");
					target="/index_admin.htm";
				}
			}else{
				System.out.println("���û�������");
				target="/loginError.jsp";
			}	
		userManager.CloseDB();
		request.setAttribute("wrong", "1");
		dispatcher = request.getRequestDispatcher(target);  //��ת��Ŀ��ҳ��
		dispatcher.forward(request, response);
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userName="donghai";
		String password="123456";
		String department="department";
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println(userName);
		out.println(password);
		out.println(department);
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();

		
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
