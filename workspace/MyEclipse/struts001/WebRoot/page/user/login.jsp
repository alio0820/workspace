<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="login.action">
    	<input type="text" name="userName"/>
    	<input type="password" name="password"/>
    	<input type="text" name="p.personName"/>
    	<input type="checkbox" value="1" name="list"> 
    	<input type="checkbox" value="2" name="list"> 
    	<input type="checkbox" value="3" name="list"> 
    	<input type="text" value="3" name="map.m"> 
    	<input type="text" value="3" name="age"> 
    	<input type="text"  name="date"> 
    	<input type="text"  name="p"> 
    	<input type="submit"/>
    </form>
  </body>
</html>
