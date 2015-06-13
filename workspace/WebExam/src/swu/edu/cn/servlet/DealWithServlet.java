package swu.edu.cn.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swu.edu.cn.sql.*;

public class DealWithServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public DealWithServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				response.setCharacterEncoding("GBK");
				request.setCharacterEncoding("GBK");
				String id=request.getParameter("id");		//request.getPa....
				String user=request.getParameter("user");
				String password = request.getParameter("password");
				DBConnection DBConn=new DBConnection();
				RequestDispatcher dispatcher=null;
				DBConn.OpenDB();
				int res=DBConn.isUserExist(id);
				DBConn.CloseDB();
				request.setAttribute("id",id);
				request.setAttribute("user",user);
				if(res==1){
					dispatcher = request.getRequestDispatcher("/exam.jsp");
				}else if(res==-1){
					dispatcher = request.getRequestDispatcher("/error.jsp");
					System.out.println("���Ѿ���¼��ϵͳ�������ٴε�¼");
				}else{
					dispatcher = request.getRequestDispatcher("/error.jsp");
					System.out.println("ϵͳû�������Ϣ��");
				}
				dispatcher.forward(request, response);

	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//		out.println("<HTML>");
//		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//		out.println("  <BODY>");
//		out.print("    This is ");
//		out.print(this.getClass());
//		out.println(", using the GET method");
//		out.println("  </BODY>");
//		out.println("</HTML>");
//		out.flush();
//		out.close();
		this.doGet(request, response);
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
