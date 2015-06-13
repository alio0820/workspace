<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>提交成功</title>
  </head>
  
  <body>
 尊敬的老师，
      恭喜你圆满完成试卷，你的得分为：<%=request.getAttribute("score") %>
  </body>
</html>
