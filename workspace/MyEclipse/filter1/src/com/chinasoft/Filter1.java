package com.chinasoft;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Filter1 implements Filter{

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		System.out.println("Fileter2");
		HttpServletRequest req=(HttpServletRequest)arg0;
		HttpSession session=req.getSession();
		if(session.getAttribute("name")!=null){
			arg2.doFilter(arg0, arg1);
			
		}else{
			req.getRequestDispatcher("/login.html").forward(arg0, arg1);
		}
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
