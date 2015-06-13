package com.citrus.info.filter;

import java.io.IOException; 
import java.util.ArrayList; 
import java.util.Arrays; 
import java.util.List; 
 
import javax.servlet.Filter; 
import javax.servlet.FilterChain; 
import javax.servlet.FilterConfig; 
import javax.servlet.ServletException; 
import javax.servlet.ServletRequest; 
import javax.servlet.ServletResponse; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
 
 
public class ServletFilter implements Filter { 
 
    private List<String> targets = new ArrayList<String>(); 
     
    public void destroy() { 
        // TODO Auto-generated method stub 
 
    } 
 
    public void doFilter(ServletRequest request, ServletResponse response, 
            FilterChain chain) throws IOException, ServletException { 
        // TODO Auto-generated method stub 
        HttpServletRequest req = (HttpServletRequest)request; 
        HttpServletResponse resp = (HttpServletResponse)response; 
        String uri = req.getRequestURI(); 
        String target = uri.indexOf("?") > 0 ? uri.substring((uri.lastIndexOf("/")+1),uri.indexOf("?")) : uri.substring(uri.lastIndexOf("/")+1); 
        //servlet的URL用的都是servlet/servlet的名称 
        if (uri.contains("Service") && targets.contains(target)) { 
            req.getRequestDispatcher(uri.substring(9)).forward(req, resp); 
        } else { 
            chain.doFilter(req, resp); 
        } 
    } 
 
    public void init(FilterConfig config) throws ServletException { 
        // TODO Auto-generated method stub 
        String targets = config.getInitParameter("targets");//在web.xml里面声明的filter里面的参数指定哪些servlet是需要过滤的，也可以不指定，直接过滤所有的servlet 
        if(targets!=null)
        this.targets.addAll(Arrays.asList(targets.split(","))); 
    } 
 
}  