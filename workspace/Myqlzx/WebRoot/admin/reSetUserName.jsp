<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <title>修改用户名</title>

<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<style type="text/css">
	.textTitle{ width:150px;}
</style>
<script type="text/javascript">
	function checkUserName()
	{
		var userName = document.getElementById("userName");
		if(userName.value=="")
		{
			alert("用户名不能为空！");
			userName.focus();
			return false;
		}
	}
</script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="ReNameServlet" method="post" id="body_form" onsubmit="return checkUserName();">
<div class="title_div">
			<div class="title">修改用户名</div>
</div>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
	<tr>
		<td class="first_td">用户名称：</td>
		<td><input type="text" id="userName" name="reName" class="textTitle" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" class="btn" value="确认修改"/>&nbsp;&nbsp;<input type="reset" class="btn" value="重置信息" /></td>
	</tr>
</table>
</form>
</body>
</html>
