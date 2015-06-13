<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>管理员登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <style type="text/css" >
	#body_div{position:relative; width:582px; height:385px; left:260px; top:50px; margin:0px auto; background:url(image/admin/login_div_bg.gif)}
	#login_div{ position:relative;left:220px;top:170px;width:300px;height:80px;}
	table{ width:100%; height:100%}
	.btn{background-image:url(image/admin/login.gif); width:52px; height:46px; border:0px}
	.text{width:150px; height:20px}
</style>
<script type="text/javascript">
	
	function checkLogin()
	{
		var name = document.getElementById("name");
		var pwd = document.getElementById("pwd");
		if(name.value == "")
		{
			document.getElementById("worn").innerHTML = "<span style=color:red>用户名不能为空</span>";	
			name.focus();
			return false;
		}
		if(pwd.value == "")
		{
			document.getElementById("worn").innerHTML = "<span style=color:red>密码不能为空</span>";
			pwd.focus();
			return false;
		}
		return true;
	}
	function inint()
	{
		document.frm.name.focus();//focus对象自动得到键盘输入焦点
	}
</script>
</head>
<body onload="inint();">
<div id="body_div">
	<div id="login_div">
	<form id="frm" action="admin/LoginServlet" method="POST" name="frm" onsubmit="return checkLogin();">
		<table>
			<tr>
				<td align="right">用户名：</td>
				<td><input type="text" name="name" id="name" class="text"/></td>
				<td rowspan="2"><input name="submit" type="submit" class="btn" value="" /></td>
			</tr>
			<tr>
				<td align="right">密码：</td>
				<td><input type="password" name="pwd" id="pwd" class="text"/></td>
			</tr>
			<tr>
				<td colspan="3" id="worn" align="center">&nbsp;</td>
			</tr>
	  </table>
	  </form>
	</div>
</div>
</body>
</html>
