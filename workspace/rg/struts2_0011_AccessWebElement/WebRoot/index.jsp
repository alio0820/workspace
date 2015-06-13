<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
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
		在struts中访问Web元素：<br/>
		取得request、session、application、HttpServletRequest、HttpSession、ServletContext的引用：<br/>
		<ol>
			<li>前三者：依赖于容器</li>
			<li>前三者：IOC</li>
			<li>后三者：依赖于容器</li>
			<li>后三者：IOC</li>
		</ol>
		<form name="f" action="" method="post">
			用户名：<input type="text" name="name" /><br/>
			密码：<input type="password" name="password" /><br/>
			<input type="button" value="实验一" onclick="javascript:document.f.action='login1';document.f.submit();" /> 
			<input type="button" value="实验二" onclick="javascript:document.f.action='login2';document.f.submit();" /> 
			<input type="button" value="实验三" onclick="javascript:document.f.action='login3';document.f.submit();" /> 
			<input type="button" value="实验四" onclick="javascript:document.f.action='login4';document.f.submit();" /> 
		</form>
	</body>
</html>
