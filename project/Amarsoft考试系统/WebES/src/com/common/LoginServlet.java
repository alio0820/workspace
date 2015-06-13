package com.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserBean;
import com.init.WebCounter;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public LoginServlet() {
		super();
	}
	
	public void destroy() {
		ILog.sys("正在注销系统...");
		String num=this.getServletContext().getAttribute("visitNum").toString();
		ILog.init("总访问量为:"+num);
//		直接挂掉程序就行
//		WebCounter  wc = getWebCounter();
//		wc.setNumber(Integer.parseInt(num));
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String userName=request.getParameter("userName");			
		String password=request.getParameter("password");
		String incode = request.getParameter("incode");
		String rightcode = (String)request.getSession().getAttribute("numrand");//验证码
		if (true||incode != null && rightcode != null) {
			if (true||rightcode.equals(incode)){
				UserBean  ub=DBConnection.getInstance().isUserExistAndLegal(request, userName, password);							
				if (ub!=null) {
//					out.print("<script>alert('登录成功，努力为您跳转中');</script>");	
					int num=Integer.parseInt(this.getServletContext().getAttribute("visitNum").toString());
					this.getServletContext().setAttribute("webCounter", ++num);
					HttpSession  session=request.getSession();	
					session.setAttribute("userBean", ub);						//把用户bean放到session中
					ILog.info("用户["+userName+"]已经上线...");
					
//					ServletContext application=this.getServletContext();
//					String count=application.getAttribute("visitNum").toString();
//					countUserNum();
//					把数据的问题统统交给数据库！！！
					if(!ub.getUserName().equalsIgnoreCase("")){
						response.sendRedirect(request.getContextPath()+"");//相对于服务器跟路径
//						request.getRequestDispatcher("/index.jsp").forward(request,response);//相对于web应用跟路径
						ILog.jspInfo("打开主页");
					}
				}else {
					out.print("<script>alert('用户名或密码错误！');history.back();</script>");
				}
			} else {
				out.print("<script>alert('验证码错误');history.back();</script>");
			}
		}
	}
	/**
	 * 初始化servlet.
	 */
	public void init() throws ServletException {
		ServletContext application=this.getServletContext();	//this.getServletContext()获取到的相当于jsp页面的Application
		WebCounter wc = new WebCounter(application.getRealPath(""));
		application.setAttribute("visitNum", wc.getOnlineNumberFromFile());
		ILog.init("初始访问量为:"+wc.getOnlineNumberFromFile());
	}
}
