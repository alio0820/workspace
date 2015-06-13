<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <title>修改密码</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<style type="text/css">
	.textTitle{ width:150px;}
</style>
<script type="text/javascript">
	function checkPass()
	{
		var oldPass = document.getElementById("oldPass");
		var newPass = document.getElementById("newPass");
		var cfmNewPass = document.getElementById("cfmNewPass");
		
		if(oldPass.value=="")
		{
			alert("您的旧密码不能为空！");
			oldPass.focus();
			return false;
		}
		if(newPass.value=="")
		{
			alert("您的新密码不能为空！");
			newPass.focus();
			return false;
		}
		if(cfmNewPass.value=="")
		{
			alert("您的确认密码不能为空！");
			cmfNewPass.focus();
			return false;
		}
		if(newPass.value!=cfmNewPass.value)
		{
			alert("两次输入不一致！请确认输入！");
			cmfNewPass.focus();
			return false;
		}
	}
</script>


<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="ReSetPwdServlet" method="post" id="body_form" onsubmit="return checkPass();">
<div class="title_div">
			<div class="title">修改密码</div>
</div>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
	<tr>
		<td class="first_td">旧密码：</td>
		<td><input type="password" id="oldPass" name="oldPass" class="textTitle" /></td>
	</tr>
	<tr>
		<td class="first_td">新密码：</td>
		<td><input type="password" id="newPass" name="newPass" class="textTitle" /></td>
	</tr>
	<tr>
		<td class="first_td">确认新密码：</td>
		<td><input type="password" id="cfmNewPass" name="confirmNewPass" class="textTitle" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" class="btn" value="确认修改" />&nbsp;&nbsp;<input type="reset" class="btn" value="重置信息" /></td>
	</tr>
</table>
</form>
</body>
</html>
