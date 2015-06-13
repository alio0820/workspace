package swu.edu.cn.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swu.edu.cn.sql.*;
import swu.edu.cn.examsystem.*;

public class AcceptServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public AcceptServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("GBK");
		  request.setCharacterEncoding("GBK");
		String id=request.getParameter("id");
		String user=request.getParameter("user");
		String userSingleAnswer=request.getParameter("userSingleAnswer");//"*"+"CCDCCCFCACCBCCBDACDDBADDAAABBCBCCABBCBCB";		
		String userMultipleAnswer=request.getParameter("userMultipleAnswer");
			//"*;ABCDEF;ABCD;BE;AD;ABCDEFGI;ABCD;ABD;ACD;AD;ABC;BC;ABCD;ABDE;AB;ABC;ABCDE;ABC;ABD;BC;ACE".split(";");
		String userJudgeAnswer=request.getParameter("userJudgeAnswer");      //"*TFTTTTTTTTTTFFFFFFFT";
		System.out.println(userSingleAnswer);	
		System.out.println(userMultipleAnswer);
		System.out.println(userJudgeAnswer);
		System.out.println(id);
		DBConnection DBConn=new DBConnection();
		DBConn.OpenDB();
		//�����û����
		if(DBConn.isUserExist(id)!=1){
			response.sendRedirect("/error.jsp");
		}
		
		String sql="update userinfo set flag='false', SingleChoice=?, MultipleChoice=?, JudgeIssues=?  where id=?;";
		PreparedStatement pst=null;
		Statistics sta=new Statistics();
		try {
			pst=DBConn.conn.prepareStatement(sql);
			pst.setString(1, userSingleAnswer);
			pst.setString(2, userMultipleAnswer);
			pst.setString(3, userJudgeAnswer);
			pst.setString(4, id);
			
			int res=pst.executeUpdate();
			System.out.println(res);
//				if(res>0){						//������ݱ�tongji		
//					sta.newOne(userSingleAnswer,userMultipleAnswer);
//				}
				System.out.println(res);
			int score=sta.getScore(userSingleAnswer,userMultipleAnswer,userJudgeAnswer);  //�û��ķ����
			double score2= (double)score;
			int id2= Integer.parseInt(id);
			DBConn.updateScore(id2, "score", score2);
//			response.setContentType("text/html;charset=GB2312");
//			
//			PrintWriter out = response.getWriter();
//			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
//			out.println("<HTML>");
//			out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
//			out.println("  <BODY>");
//			out.print("你的分数是："+score);
//			out.println("  </BODY>");
//			out.println("</HTML>");
//			out.flush();
//			out.close();
			request.setAttribute("score", score);
			request.setAttribute("user", user);
			RequestDispatcher dispatcher=request.getRequestDispatcher("/success.jsp");
			dispatcher.forward(request, response);			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		DBConn.CloseDB();

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
