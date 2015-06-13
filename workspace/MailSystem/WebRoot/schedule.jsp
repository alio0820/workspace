<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>日程安排子系统</title>
    <link rel="icon" href="images/fruit_mail.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="css/demo.css" type="text/css">
  </head>
  
  <body>
    <h1>日程安排</h1>
    <h6>[基于WEB的办公自动化系统]</h6>
  </body>
</html>
