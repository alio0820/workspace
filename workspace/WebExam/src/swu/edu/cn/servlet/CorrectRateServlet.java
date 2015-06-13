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

import swu.edu.cn.examsystem.Statistics;
import swu.edu.cn.sql.DBConnection;

public class CorrectRateServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public CorrectRateServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

/*
 * (non-Javadoc)
 *�û����������ȷ��ͳ��
 */
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
		out.println("<tr align='center'><td colspan='10' bgcolor='#92b8e2'>������ȷ��ͳ�Ʊ�</td></tr>");
		//out.println("<tr><td></td><td>A</td><td>B</td><td>C</td><td>D</td><td>E</td><td>F</td><td>G</td><td>H</td><td>I</td><td>ûѡ</td></tr>");
		Statistics sta=new Statistics();
		sta.getCorrectRate();			//�������ɱ�tongji
		sta.getTotalResult();
		DBConnection DBConn=new DBConnection();
		DBConn.OpenDB();
		ResultSet rs=DBConn.SelectDB("select id,rate from tongji");
		int i=0;
		try {
			
				while(rs.next()){
					
					if(i%5 ==0) {
						out.println("<tr>");
					}
					out.println("<td width='11%' bgcolor='#92b8e2'>��"+rs.getInt(1)+"��</td>");	
					DecimalFormat df = new DecimalFormat("###0.0#");
					
					out.println("<td width='9%'>"+df.format(rs.getDouble(2)*100.00)+"%"+"</td>");
					if((i+1)%5 ==0) {
						out.println("</tr>");
					}			
					i++;
				}
			
		
					
			//��ӡtongji���A��I��	
			response.setContentType("text/html");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.println("</table>");
		
		out.println("�ο�������Ϊ"+sta.number[0]+"<br>");
		out.println("90��100������Ϊ"+sta.number[1]+"<br>");
		out.println("80��90������Ϊ"+sta.number[2]+"<br>");
		out.println("70��80������Ϊ"+sta.number[3]+"<br>");
		out.println("60��70������Ϊ"+sta.number[4]+"<br>");
		out.println("����������Ϊ"+sta.number[5]+"<br>");
		
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
