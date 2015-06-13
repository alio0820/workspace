package swu.edu.cn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swu.edu.cn.sql.DBConnection;

public class Department extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public Department() {
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
PrintWriter out = response.getWriter();
out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
out.println("<HTML>");
out.println("  <HEAD><TITLE>������ȷ��ͳ��</TITLE></HEAD>");
out.println("  <BODY>");
out.println("<table style='width: 70%;' align='center' border='1' >");
out.println("<tr align='center'><td colspan='13' bgcolor='#92b8e2'>��������</td></tr>");
//out.println("<tr><td></td><td>A</td><td>B</td><td>C</td><td>D</td><td>E</td><td>F</td><td>G</td><td>H</td><td>I</td><td>ûѡ</td></tr>");

int i=1;
DBConnection  DBConn=new DBConnection();
DBConn.OpenDB();
String selectSQL="select  departmentID,departmentName,departmentClassify from Department";
ResultSet rs=DBConn.SelectDB(selectSQL);

try {
	
		while(rs.next() && rs.getString("departmentClassify").equals("��������")){
			
			if(i%13 ==0) {
				out.println("<tr>");
			}
//			out.println("<td width='11%' bgcolor='#92b8e2'>��"+rs.getInt("departmentID")+"��</td>");	
			out.println("<td >"+rs.getString("departmentName")+"</td>");	
			if((i+1)%13 ==0) {
				out.println("</tr>");
			}			
			i++;
					
		}
		
		
		out.println("<tr align='center'><td colspan='13' bgcolor='#92b8e2'>԰����ί��</td></tr>");
		while(rs.next() && rs.getString("departmentClassify").equals("԰����ί��")){
			
			if(i%13 ==0) {
				out.println("<tr>");
			}
//			out.println("<td width='11%' bgcolor='#92b8e2'>��"+rs.getInt("departmentID")+"��</td>");	
			out.println("<td >"+rs.getString("departmentName")+"</td>");	
			if((i+1)%13 ==0) {
				out.println("</tr>");
			}			
			i++;
					
		}
		
		
		out.println("<tr align='center'><td colspan='13' bgcolor='#92b8e2'>����ֵ�</td></tr>");
		while(rs.next() && rs.getString("departmentClassify").equals("����ֵ�")){
			
			if(i%13 ==0) {
				out.println("<tr>");
			}
//			out.println("<td width='11%' bgcolor='#92b8e2'>��"+rs.getInt("departmentID")+"��</td>");	
			out.println("<td >"+rs.getString("departmentName")+"</td>");	
			if((i+1)%13 ==0) {
				out.println("</tr>");
			}			
			i++;
					
		}
	

		DBConn.CloseDB();	
	//��ӡtongji���A��I��	
	response.setContentType("text/html");
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
out.println("</table>");

out.println("  </BODY>");
out.println("</HTML>");
out.flush();
out.close();
}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
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

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
