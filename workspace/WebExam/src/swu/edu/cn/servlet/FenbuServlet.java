package swu.edu.cn.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import swu.edu.cn.examsystem.Statistics;
import swu.edu.cn.sql.*;
import java.sql.*;

public class FenbuServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public FenbuServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

/*
 * (non-Javadoc)
 *�û���������ֲ���ӡ������ӡtongji���е�A��I��
 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 response.setCharacterEncoding("GBK");
		  request.setCharacterEncoding("GBK");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>�ֲ�ͳ��</TITLE></HEAD>");
		out.println("  <BODY>");
		out.println("<table style='width: 70%;' align='center' border='1' >");
		out.println("<tr align='center'><td colspan='20' bgcolor='#92b8e2'>����������ͳ�Ʊ�</td></tr>");
		out.println("<tr><td></td><td>A</td><td>B</td><td>C</td><td>D</td><td>E</td><td>F</td><td>G</td><td>H</td><td>I</td><td>ûѡ</td></tr>");
		//Statistics sta=new Statistics();
		//sta.getResult();			//�������ɱ�tongji
		DBConnection DBConn=new DBConnection();
		DBConn.OpenDB();
		ResultSet rs=DBConn.SelectDB("select * from tongji");
		try {
			while(rs.next()){

				out.println("<tr>");
				out.println("<td width='20%'>��"+rs.getInt(1)+"��</td>");
					for(int i=2;i<12;i++){
						out.println("<td width='8%'>");
						out.println(rs.getInt(i));
						out.println("</td>");
					}
				out.println("</tr>");
				
						
			}
			DBConn.CloseDB();		
			//��ӡtongji���A��I��	
			response.setContentType("text/html");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.println("</table>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
					this.doGet(request,response);
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
