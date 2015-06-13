<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<html>
  <head>
    <title>第一个JSF程序</title>
  </head>
  <body>
  	<f:view>
  		<h:outputText value="#{user.name}"></h:outputText>
  		<h3>欢迎使用 JavaServer Faces!</h3>
  	</f:view>
  </body>
</html>
