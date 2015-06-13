<%@ page language="java" import="java.util.*,com.chinasoft.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'searthresult.jsp' starting page</title>
    
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
  <form action="">
  请输入每页显示的个数：
  <input type="text" name="num" value="" >
  <table>
   
    
   <tr>
         <td ><%=s %></td>
   </tr>
   
   
    <a>下一页</a>跳转至： <input type="text" name="pagenum" onchange="f1(this.value);">
 
 	 <script type="text/javascript">
   
    fuction f1(pagenum){
	   document.getElementByName("page").value=pagenum;
    }
    
   
    
     </script>
 
  </body>
</html>
