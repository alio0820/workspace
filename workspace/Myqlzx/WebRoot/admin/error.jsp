<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>访问资源出错！</title>
<link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<style type="text/css">
	.title{ position:absolute; left:450px;}
	.img_div{ height:200px; text-align:center; top:50px;}
	.content_div{ position:relative;}
	span{font-size:24pt;font-family:'黑体';color:#FF0000; vertical-align:top;}
</style>
</head>

<body>
<div class="title_div">
			<div class="title">访问资源出错！</div>
</div>
<div class="img_div">
	<div class="content_div">
	<table width="100%">
		<tr>
			<td align="center"><img src="../image/admin/error.jpg" /></td>
		</tr>
		<tr>
			<td align="center"><span>访问资源出错！</span></td>
		</tr>
	</table>
	</div>
</div>
<div><a href="welcome.jsp">返回</a></div>
</body>
</html>
