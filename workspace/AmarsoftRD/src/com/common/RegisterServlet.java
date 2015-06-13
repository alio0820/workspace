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

import com.bean.UserBean;


public class RegisterServlet extends HttpServlet {

	public RegisterServlet() {
		super();
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String nickName = request.getParameter("nickName");
		String remark = request.getParameter("remark");
		String incode = request.getParameter("incode");
		String rightcode = (String)request.getSession().getAttribute("numrand");//汉字验证码的话则是
		DBConnection db= new DBConnection();
		if (incode != null && rightcode != null) {
			if(userName.length()<=16&&password.length()<=16&&nickName.length()<=16&&remark.length()<=100){
				if (rightcode.equals(incode)){
					if (!db.isUserExist(userName)) {
						if(db.register(userName,password,nickName,remark))
							request.getRequestDispatcher("/register_success.jsp").forward(request,response);
						else
							out.print("<script>alert('注册用户失败...请稍等...我们正在排查原因...');history.back();</script>");
					}else {
						out.print("<script>alert('用户名已存在');history.back();</script>");
					}
				} else {
					out.print("<script>alert('验证码错误');history.back();</script>");
				}
			}else{
				out.print("<script>alert('用户名、密码、昵称或者签名档的长度超过限制');history.back();</script>");
			}
		}
	}
}
