<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="register_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>
       登录结果
    </title>
  </head>
	<body bgcolor="#ffffff">
    <div align="center">
       <h3><br>已经登录成功！<br></h3>
       <h1>
          <font color="red">
            <br>
            	欢迎<%=request.getAttribute("userName") %>！
            <br>
          </font>
       </h1>
    </div>
　</body>
</html>
  