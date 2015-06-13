<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>sonD.jsp page</title>
  </head>
  
  <body>
     <form method="post" action="deleteUser.action">
   	  <div align="center">
        <font color="green"><br>userName<br></font>
		   <s:textfield name="username" value="%{#parameters.username}" readonly="true"/>
     	<br><input type="submit" value="确定"/>
     </div>
    </form>
  </body>
</html>
