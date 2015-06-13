<%@ page language="java" import="java.util.*,com.chinasoft.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
   		
   		<%
   		if(1==1)
   		
   		throw new MyException(); %>
   		
   		 
   		<jsp:useBean id="p"  scope="session" class="com.chinasoft.Person">   		
   			<jsp:setProperty property="name" name="p" value="zhouqi"/>
   		</jsp:useBean>
   		
   		
   		
   		<jsp:getProperty property="name" name="p" />
   		

   		
   		
   		 
   		<jsp:forward page="MyJsp.jsp">
   			<jsp:param value="zhangsan" name="userName"/> 
   		</jsp:forward>
   		
   		
   		<%p.getName(); %>
   		
   		
  </body>
</html>
