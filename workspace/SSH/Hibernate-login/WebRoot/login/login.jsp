<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="register_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
  <head>
    <title>
      用户登录
    </title>
    <script type="text/javascript">
    function a()
    {
        window.location.href="/login/login/register.jsp";
    }
    </script>
  </head>
  <body bgcolor="#ffffff">
    <h2 align="center">
       <font color="green"> <br>欢迎访问J2EE网站！<br> </font>
    </h2>
    <h1 align="center">
       <font color="red"><%
       						Object requestName = request.getAttribute("errorMassage");
	      					if(requestName != null && !requestName.toString().equals("")){ 
	      						%>
	      						<%=requestName %>
	      					<%}else{%>
	      						<br>请先登录<br></font>
	      					<%} %>
    </h1> 
    <h1 align="center">
       <font color="red"><s:actionerror/></font>
    </h1> 
    
    <form method="post" action="login.action">
       <div align="center">
          <br>用户ID：<input type="text" name="userID"><br>
          <br>密&nbsp;&nbsp;码：
          <input type="password" name="password"><br>
          <br><br>
          <input type="submit" name="Submit" value="提交" >
          &nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置" >
          &nbsp;&nbsp;&nbsp;
          <input type="button" value="注册" onclick="a()">
       </div>
    </form>
  </body>
 </html>