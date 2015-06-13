package com.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserBean;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public LoginServlet() {
		super();
	}
	
	public void destroy() {
		System.out.println(MyLog.getLogPrefix()+" {Web Office System is Closing...}");
		String num=this.getServletContext().getAttribute("webCounter").toString();
		MyLog.getLogInfo("总访问量为:"+num);
		WebCounter  wc=new WebCounter(new File(this.getServletContext().getRealPath("/")+"data/num.txt"));
		wc.setNumber(Integer.parseInt(num));
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
		if (incode != null && rightcode != null) {
			if (rightcode.equals(incode)){				
				UserBean  ub=(new DBConnection()).isUserExistAndLegal(userName, password);							
				if (ub!=null) {
//					out.print("<script>alert('登录成功，努力为您跳转中');</script>");	
					int num=Integer.parseInt(this.getServletContext().getAttribute("webCounter").toString());
					this.getServletContext().setAttribute("webCounter", ++num);
					HttpSession  session=request.getSession();	
					session.setAttribute("userBean", ub);						//把用户bean放到session中
					MyLog.getLogInfo("用户["+userName+"]已经上线...");
					countUserNum();
					if(!ub.getUserName().equalsIgnoreCase("")){
						response.sendRedirect(request.getContextPath()+"/index.jsp");//相对于服务器跟路径
//						request.getRequestDispatcher("/index.jsp").forward(request,response);//相对于web应用跟路径
						MyLog.getLogInfo("打开页面index.jsp");
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
		//this.getServletContext()获取到的相当于jsp页面的Application
		ServletContext application=this.getServletContext();
		WebCounter  wc=new WebCounter(new File(this.getServletContext().getRealPath("/")+"data/num.txt"));
		application.setAttribute("webCounter", wc.getInitNumber());
		MyLog.getLogInfo("初访问量为:"+wc.getInitNumber());
	}
	public void countUserNum(){
		ServletContext application=this.getServletContext();
		String count=application.getAttribute("webCounter").toString();
		if(!Common.isBlank(count))
			count = Integer.parseInt(count)+1+"";
		application.setAttribute("webCounter",count);
		WebCounter  wc=new WebCounter(new File(this.getServletContext().getRealPath("/")+"data/num.txt"));
		wc.setNumber(Integer.parseInt(count));
	}
}
