<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>sonM.jsp page</title>
  </head>
 
    <h2 align="center">
       <font color="green"><br>修改用户页面<br></font>
    </h2>
    <body>
    <form method="post" action="modifyUser.action">

   	  <div align="center">
        <font color="green"><br>userName<br></font>
		   <s:textfield name="username" value="%{#parameters.username}" readonly="true"/>
        <font color="green"><br>password<br></font>
		  <s:textfield name="password" value="%{#parameters.password}"/>
        <font color="green"><br>power<br></font>
		  <s:textfield name="power" value="%{#parameters.power}"/>
        <font color="green"><br>department<br></font>
	     <s:textfield name="department" value="%{#parameters.department}"/>   
      </div>
      
      <div align="center">
	      <input type="submit" value="确定"/>
	  </div> 
	</form>
  </body>
</html>
