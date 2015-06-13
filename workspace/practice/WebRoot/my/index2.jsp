<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>My JSP 'index2.jsp' starting page</title>
  </head>
  
  <body>
    	<%String str_null="";
    	  str_null=(String)session.getAttribute("str");
    	  out.println("从session中取出得值为："+str_null+request.getParameter("num")+request.getParameter("user"));
    	  %>
    	  	
  </body>
</html>
