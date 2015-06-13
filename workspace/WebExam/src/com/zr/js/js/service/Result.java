package com.zr.js.js.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.zr.js.js.util.Conn;
public class Result extends HttpServlet {

	public boolean IsNumeric(String num)
	{
		 if (null == null || num.length() == 0) 
		 {
	           return false;
	     }
		Pattern intnumPattern = Pattern.compile("^[+-]?[\\d]+$");
	    return intnumPattern.matcher(num).find();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String message=null;
		String num =request.getParameter("num");
		String name=request.getParameter("name");
		System.out.println(num);
		System.out.println(name);
		String sql="select username,score,SingleChoice,MultipleChoice,JudgeIssues from userinfo where ";
		String SingleChoice =null;
		String MultipleChoice =null;
		String JudgeIssues =null;
		String Score=null;
		if(num!="" &&name!="")
		{
			sql=sql+" id = "+num +" and username ="+name;
			//System.out.println(sql);
		//PreparedStatement pstmt;
		try {
				Conn conn =new Conn();
				Connection connection =  conn.getConnection(null);
				Statement sta=connection.createStatement();
				ResultSet rs = sta.executeQuery(sql);
				if(!rs.next())
				{
					message ="0";
					System.out.println(message);
					response.sendRedirect("accountingSubject/display.jsp?message="+message);
				}
				else
				{
					SingleChoice =rs.getString("SingleChoice");
					MultipleChoice =rs.getString("MultipleChoice");
					JudgeIssues =rs.getString("JudgeIssues");
					name=rs.getString("username");
					Score=rs.getString("score");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
			
		//String docType = ;
		response.setContentType("text/html; charset=GB2312");
		PrintWriter out = response.getWriter();
		/***************************************************************/		
		out.println("<HTML>");
		out.println("<HEAD><TITLE>结果显示</TITLE></HEAD>");
		out.println("<BODY>");
		
		if(message!=null)
		{
			out.println("<p align='center'>姓名&nbsp&nbsp"+name+"&nbsp&nbsp总分&nbsp&nbsp"+Score+"&nbsp&nbsp"+message+"</p>" );
		}
		else
		{
			out.println("<p align='center'>姓名&nbsp&nbsp"+name+"&nbsp&nbsp总分&nbsp&nbsp"+Score+"</p>");
		}
		out.println("<form method ='post' id ='form' action ='accountingSubject/display.jsp'>");
		//out.println("<table style='width: 70%;' align='center' border='1' width='100%'><tr align='center'><td class='style7' colspan='10' bgcolor='#92b8e2'>答题结果</td></tr>");
		out.println("<table style='width: 70%;' align='center' border='1' > <tr align='center'><td colspan='20' bgcolor='#92b8e2'>答题结果</td></tr>");
		for(int j=0;j<4;j++)
		{	
			out.println("<tr>"); 
			for(int i=0;i<10;i++)
			{	
				out.println("<td  width='4%'>"+(i+j*10+1)+"</td>");
				if(SingleChoice!=null)
				{
					char temp =SingleChoice.charAt(i+j*10);
					out.println("<td width='6%'>"+temp+"</td>");
				}
				else
				{
					out.println("<td width='6%'></td>");
				}
			}
			out.println("</tr>");
		}
		 String s[] = null;
		if(MultipleChoice!=null)
		{
			s=MultipleChoice.split(";");
		}
		System.out.println();
		for(int j=0;j<2;j++)
		{
			out.println("<tr>");
			for(int i=1;i<=10;i++)
			{	
				if(s!=null)
				{
					out.println("<td>"+(i+j*10+40)+"</td>");
					out.println("<td>"+s[i+j*10]+"</td>");
				}
				else
				{
					out.println("<td></td>");
				}
			}
			out.println("</tr>");
		}
			out.println("<tr>");
			for(int j=0;j<2;j++)
			{	
				for(int i=0;i<10;i++)
				if(JudgeIssues!=null)
				{	
					out.println("<td>"+(i+j*10+61)+"</td>");
					char temp =JudgeIssues.charAt(i+j*10);
					out.println("<td>"+temp+"</td>");
				}
				else
				{
					out.println("<td></td>");
				}
				out.println("</tr>");
			}
			out.println("</table> <p align='center'> <input id='Button1' type='submit' value='返回'/></p></table></form>  </body></html>");
	/***************************************************************/	
		out.flush();
		out.close();
	}
}

