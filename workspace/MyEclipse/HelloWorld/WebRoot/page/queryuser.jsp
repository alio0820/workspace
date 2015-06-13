<%@ page language="java" import="java.util.*;" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'sererch.jsp' starting page</title>

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
				<h:dataTable value="#{user.users}" var="u" border="1">


					<h:column>
						<f:facet name="header">
							<h:outputText value="'用户名'"></h:outputText>
						</f:facet>
						<h:outputText value="#{u.name}"></h:outputText>
						<!--   				<f:facet name="footer">-->
						<!--   					<h:outputText value="'用户名'"></h:outputText>-->
						<!--   				</f:facet>-->
					</h:column>

					<h:column>
						<f:facet name="header">
							<h:outputText value="'密码'"></h:outputText>
						</f:facet>
						<h:outputText value="#{u.passWord}"></h:outputText>
						<!--   				<f:facet name="footer">-->
						<!--   					<h:outputText value="'密码'"></h:outputText>-->
						<!--   				</f:facet>-->
					</h:column>
					<h:column>
						<h:commandButton actionListener="#{user.removeUser}" value="del" id="Delete" action="backList">
							<h:outputText value="" />
							<f:param name="index" value="1" id="deleteId">
							</f:param>
						</h:commandButton>
					</h:column>
				</h:dataTable>
			</h:form>
		</f:view>
	</body>
</html>
