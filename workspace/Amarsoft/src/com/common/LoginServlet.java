package com.common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

	public LoginServlet() {
		super();
	}
	
	public void destroy() {
		System.out.println(Common.getLogPrefix()+" {Web Office System is Closing...}");
		String num=this.getServletContext().getAttribute("webCounter").toString();
		System.out.println(Common.getLogPrefix()+" {总访问量为:"+num+"}");
		WebCounter  wc=new WebCounter(new File(this.getServletContext().getRealPath("/")+"data/num.txt"));
		wc.setDestroyNumber(Integer.parseInt(num));
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
		String userId=request.getParameter("userId");			
		String password=request.getParameter("password");
		String incode = request.getParameter("incode");
		String rightcode = (String)request.getSession().getAttribute("numrand");//汉字验证码的话则是
		
		if (incode != null && rightcode != null) {
			if (rightcode.equals(incode)){				
				UserBean  ub=(new DBConnection()).isUserExistAndLegal(userId, password);									
				if (ub!=null) {
					out.print("<script>alert('登录成功，努力为您跳转中');</script>");	
					int num=Integer.parseInt(this.getServletContext().getAttribute("webCounter").toString());
					this.getServletContext().setAttribute("webCounter", ++num);
					HttpSession  session=request.getSession();	
					session.setAttribute("userBean", ub);						//把用户bean放到session中					
					if(!ub.getUserId().equalsIgnoreCase("")){
//						response.sendRedirect("mail.jsp");						//不知道这种方法为什么不行
						request.getRequestDispatcher("/index.jsp").forward(request,response);
						session.setAttribute("position", "系统管理员");
						//系统管理员页面
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
	 * 初始化servlet. <br>
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		ServletContext application=this.getServletContext();
		WebCounter  wc=new WebCounter(new File(this.getServletContext().getRealPath("/")+"data/num.txt"));
		application.setAttribute("webCounter", wc.getInitNumber());
		System.out.print(Common.getLogPrefix()+" {初访问量为:"+wc.getInitNumber()+"}");
	}

}
