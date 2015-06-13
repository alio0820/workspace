<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>welcome.jsp</title>
    
    <script>
  
var xmlHttp ;
function createXDOM() {
	
	if(window.XMLHttpRequest) {
		
		xmlHttp = new XMLHttpRequest;	
		
	} else if (window.ActiveXObject) {
		
		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	} else {
		
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}	 
}

function getInfoByName() 
{
	createXDOM();	
	var name = document.getElementsByName("username")[0].value;
	var url = "query.do";
	var param = "name="+name;
	xmlHttp.open("post",url,true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xmlHttp.onreadyStatechange=function()
	{
		if(xmlHttp.readyState==4) {
			//alert(xmlHttp.responseText);
			result.innerHTML=xmlHttp.responseText;
		} else {
			result.innerHTML="请稍等...";
		}
	}
	xmlHttp.send(param);
}
       function login()
       {
           form1.action="login";
           form1.submit();
       }
  </script>
  </head>
  <body>
    <h1 align="center"><font color="red">欢迎登录</font></h1> 
    <form name="form1" method="post">
          <div align="center"></div><!-- 居中显示 -->
          <center>
                                        登录&nbsp;<input type="text" name="users[0].name" value="zcd"><br><br>
                                        密码&nbsp;&nbsp;<input type="password" name="users[0].pass" value="1"><br><br>
               <input type="button" value="登录" onclick="login()">
          </center>
          <a href="user?name=RuanGong&pass=30">域模型传参</a>
    </form>
  </body>
</html>
