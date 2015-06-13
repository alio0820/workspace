<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 错误重定向页面！ -->
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h1><font style="color:#FF0000">出错啦！！</font></h1><br />
<% exception.printStackTrace(new PrintWriter(out)); %>

</body>
</html>