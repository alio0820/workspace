<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <script type="text/javascript">
    	var rep;
    	function nameCheck(){
    	var idField=document.getElementById("userID"); 
    	alert(idField.value);
    	var url="ajaxNameCheck!nameCheck.action?userID="+escape(idField.value); 	
    	if(window.XMLHttpRequest){
    		rep=new XMLHttpRequest();
    	}else if(window.ActiveXObject){
    		req=new ActiveXObject("Microsoft.XMLHTTP");
    	}
    	req.open("GET",url,true);
    	req.onreadystatechange=callback;	
    	req.send(null);
    	}
    	
    	function callback(){
    	if(req.readyState==4){
				if(req.status==20){
					mdiv=document.getElementById("checkName");
					result=XMLHttpRequest().responseText;
					alert(result);
					mdiv.innerHTML="<font color='red'>sdfdf</font>";
					}
				}
			}
</script>
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
  <form action="register">
  <h3>
  用户名 <br/>
  <input id="userID" name="adminUserVO.name" type="text" onblur="nameCheck()"/><span id="checkName"></span><br/>
  密码<br/>
<input name="adminUserVO.password" type="password"/><br/>
确认密码<br/>
<input name="rePassword" type="password"/><br/>
</h3>
<input name="submit" type="submit" value="立即注册">
  </form>
  </body>
</html>
