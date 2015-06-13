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
import com.init.WebCounter;

public class MLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String userName=request.getParameter("userName");			
		String password=request.getParameter("password");
		UserBean  ub=DBConnection.getInstance().isUserExistAndLegal(request, userName, password);							
		if (ub!=null) {
			HttpSession  session=request.getSession();
			Object user = session.getAttribute("userBean");
			String visitor=null;
			if(user!=null){
				visitor = ((UserBean)user).getUserName();
			}
			session.setAttribute("userBean", ub);						//把用户bean放到session中
			if(visitor==null)
				ILog.info("用户["+userName+"]已经登录...");
			else
				ILog.info("浏览用户["+visitor+"]切换为["+userName+"]已经登录...");
			countUserNum();
			if(!Common.isBlank(ub.getNickName()))
				userName = ub.getNickName();
			out.print("{status:'success',userName:'"+userName+"'}");
		}else {
			out.print("{status:'failure'}");
		}
	}
	
	public void countUserNum(){
		ServletContext application=this.getServletContext();
		String count=application.getAttribute("visitNum").toString();
		if(!Common.isBlank(count))
			count = Integer.parseInt(count)+1+"";
		application.setAttribute("visitNum",count);
		WebCounter  wc=new WebCounter(new File(this.getServletContext().getRealPath("")+"/data/num.txt"));
		wc.setOnlineNumberToFile(Integer.parseInt(count));
	}
}
