<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<html>
  <head>
    <title>第一个JSF程序</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<h:outputScript library="javax.faces" name="jsf.js" target="head"/>
  </head>
  <body>
  	<f:view>
  		<h:form>
  			<h3>请输入您的名称</h3>
  			<h:inputText  id = "id1" style="width:200px;height:50px;" value="#{user.errMessage}"></h:inputText><p>
  			
  			名称：<h:inputText value="#{user.name}"></h:inputText><p>
  			密码：<h:inputText value="#{user.password}"></h:inputText><p>
  			<h:commandButton value="提交" action="#{user.verify}"></h:commandButton>
  			<f:view contentType="text/html"/>
  		</h:form>
  	</f:view>
  </body>
</html>
