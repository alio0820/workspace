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
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
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
    	<f:view locale="#{user.locale}">
    		<h:form>
    		<f:loadBundle var="msg" basename="message"/>
    		<h:outputText value="#{user.name} ,#{user.passWord}"></h:outputText>
    		<h:outputText value="#{msg.test}"></h:outputText>
    		<h:outputText id="dateField" value="#{user.date}">
    			<f:convertDateTime pattern="MM-dd-yyyy"/>
    		</h:outputText>
    		<h:message for="dateField" style="color:red"/>
    		<h:commandLink value="'查询'" action="#{user.queryUser}">
    		
    		</h:commandLink>
    		
    		
			</h:form>
    		<h:outputLink value="user.queryuser">查询</h:outputLink>
    	</f:view>
  </body>
</html>
