<%@ page language="java" import="java.util.*;" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort();
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
			Locale locale = new Locale("en", "US");
			pageContext.setAttribute("locale", locale);
			Date date = new Date();
			pageContext.setAttribute("date", date);

			
		%>

		<fmt:setLocale value="${pageScope.locale}" />
	
		<fmt:setBundle basename="message"  var="m"/>
		
		<fmt:bundle basename="${m}" prefix="haha.">
		<fmt:message key="hi">
			<fmt:param value="zhouqi">

			</fmt:param>
			<fmt:param value="shangsan">

			</fmt:param>
		</fmt:message>
		</fmt:bundle>
		<fmt:formatDate value="${pageScope.date}" type="both" dateStyle="full"
			timeStyle="full" pattern="yyyy-MM-dd HH:mm:ss" />
		<c:set var="usDateString">4/1/03 7:03 PM</c:set>
		<fmt:parseDate value="${usDateString}" parseLocale="en_US" type="both"
			dateStyle="short" timeStyle="short" var="usDate" />
			
		${usDate} 


	</body>
</html>
