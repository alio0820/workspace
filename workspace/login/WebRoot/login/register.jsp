<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户注册</title>
		<script>
	function f() {
		var reg1 = document.getElementById("userID").value;
		var reg2 = document.getElementById("password").value;
		var reg3 = document.getElementById("conpassword").value;
		var check1 = /^[a-zA-Z]+$/;
		var check2 = /^[0-9]+$/;
		// document.write(reg2);
		if (reg1 == "") {
			result.innerHTML="用户名不能为空！";
			return false;
		}
		if (reg2 == "") {
			alert("密码不能为空");

			return false;
		}
		if (!check1.test(reg1)) {
			alert("用户名必须由字母组成");
			return false;
		}
		if (!check2.test(reg2)) {
			alert("密码必须由数字组成");
			return false;
		}
		if (reg2 != reg3) {
			alert("密码输入不一致");
			return false;
		}

	}
	var xmlHttp;
	function createXDOM() {

		if (window.XMLHttpRequest) {

			xmlHttp = new XMLHttpRequest();

		} else if (window.ActiveXObject) {

			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} else {

			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}

	function getInfoByName(){
		var name = document.getElementsByName("userID")[0].value;
		if(name=="") 
		{
		    result.innerHTML="用户名不能为空！";
		    return false;
		}
		createXDOM();
		var url = "register!nameCheck.action";
		var param = "name=" + name;
		xmlHttp.open("post",url,true);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlHttp.onreadystatechange = display;//竟然是大小写的问题，是不是以后有问题就可以优先检查大小写
		xmlHttp.send(param);
	}
	function display() 
	{
		if (xmlHttp.readyState == 4) {
		    
			responseContext = trim(xmlHttp.responseText);//看来好像自动去掉了空格，不需要trim了哈！
			result.innerHTML = responseContext;
			xmlHttp.abort();
		} else {
			result.innerHTML = "请稍等...";
		}
	}
	function trim(str) {
		for ( var i = 0; i < str.length && str.charAt(i) == " "; i++)
			;
		for ( var j = str.length; j > 0 && str.charAt(j - 1) == " "; j--)
			;
		if (i > j)
			return "";
		return str.substring(i, j);
	}
</script>
	</head>
	<body bgcolor="#ffffff">
		<h2 align="center">
			<font color="green"> <br>欢迎访问J2EE网站！<br> </font>
		</h2>
		<h1 align="center">
			<font color="red"> <%
 	Object requestName = request.getAttribute("errorMassage");
 	if (requestName != null && !requestName.toString().equals("")) {
 %> <%=requestName%> <%
 	} else {
 %> <br>请先注册<br> </font>
			<%
				}
			%>
		</h1>
		<form method="post"  action="register.action">
		<br>
			<div align="center">
				用户ID：
				<input type="text" name="userID" id="userID"
					onblur="getInfoByName()"><label id="result"></label>
			</div>
				<br>
				<div align="center">
				密&nbsp;&nbsp;码：
				<input type="password" name="password" id="password">
				<br>
				<br>
				确认密码：
				<input type="password" name="conpassword" id="conpassword">
				<br>
				<br>
				<br>
				<input type="submit" name="Submit" value="提交" onclick="return f();">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置">
				<br>
			</div>
		</form>
	</body>
</html>