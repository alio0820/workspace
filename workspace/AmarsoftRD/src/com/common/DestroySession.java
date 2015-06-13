 package com.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserBean;

public class DestroySession extends HttpServlet {

	public DestroySession() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nextUrl=request.getParameter("nextUrl");
		HttpSession  hs=request.getSession();
		Object user = hs==null?null:hs.getAttribute("userBean");
		String userName="";
		if(user!=null){
			userName = ((UserBean)user).getUserName();
			MyLog.getLogInfo("用户["+userName+"]已经注销...");
			hs.invalidate();
		}
		
		if(Common.isBlank(nextUrl)){		//清除session返回登录页面
			response.sendRedirect(request.getContextPath()+"/"+"login.htm");
		}else{											//清除session后打开新的页面,nextUrl是相对根的路径！
			response.sendRedirect(request.getContextPath()+"/"+nextUrl);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
