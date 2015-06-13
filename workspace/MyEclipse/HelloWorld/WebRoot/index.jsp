<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core" %>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html" %>
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
    	<f:view>
    		<h:form>
	    		用户名:<h:inputText value="#{user.name}"></h:inputText>
	    		密码:<h:inputSecret value="#{user.passWord}"></h:inputSecret>
	    		语言:<h:inputText value="#{user.locale}"></h:inputText>
	    		日期:<h:inputText id="dateField" value="#{user.date}">
	    			<f:convertDateTime pattern="yyyy-MM-dd"/>
	    		</h:inputText>
	    		<h:message for="dateField" style="color:red" />
	    		<h:commandButton value="登录"  actionListener="#{user.myListener}" action="#{user.validate}">
	    			
	    		</h:commandButton>
    		</h:form>
    	</f:view>
  </body>
</html>
