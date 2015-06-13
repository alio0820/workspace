<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.util.PublicUtil"%><!--  -->
<%@page contentType= "text/html;charset=gb2312"%> 
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<title>发布公告信息</title>
<style type="text/css">
	.textTitle{ width:400px;}
</style>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="BulletinServlet" method="post" id="body_form">
	<input type = "hidden" name = "method" value = "insert">
<div class="title_div">
			<div class="title">发布公告信息</div>
</div>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
	<tr>
		<td class="first_td">标题：</td>
		<td><input type="text" name="textTitle" class="textTitle" /></td>
	</tr>
	<tr>
		<td class="first_td">内容：</td>
		<td><textarea id="textarea" name="textarea"></textarea></td>
	</tr>
	<tr>
		<td class="first_td">&nbsp;</td>
	  <td><input type="submit" class="btn" value="提交公告" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    <input type="reset" class="btn" value="重置信息" /></td>
	</tr>
</table>
</form>
</body>
</html>
