<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
  </head>
  
  <h2 align="center">
       <font color="green"><br>增加用户页面<br></font>
    </h2>
    <body>
    <form method="post" action="addUser.action">

   	  <div align="center">
        <font color="green"><br>userName<br></font>
		  <input type="text" name="username" >
        <font color="green"><br>password<br></font>
		  <input type="text" name="password" >
        <font color="green"><br>power<br></font>
		 <input type="text" name="power" >
        <font color="green"><br>department<br></font>
	     <input type="text" name="department" >
      </div>
      
      <div align="center">
	      <input type="submit" value="确定"/>
	  </div> 
	</form>
  </body>
</html>