<%@ page language="java" import="java.util.*,com.chinasoft.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<% request.setAttribute("aaa",new Person()); 
	
	
	 request.setAttribute("name","zhangsan"); 
	 
	 List list = new ArrayList();
	 list.add("aaa");
	 list.add("bbb");
	 list.add("ccc");
	 list.add("ddd");
	 
	 pageContext.setAttribute("list",list);
	 
	 request.setAttribute("list1","111,222,333,444"); 

	 %>
	
	
	
  </head>
  
  <body> 
	<!--  输出
  		<c:out value="${requestScope.aaa}" default="ccc"></c:out>
  	-->
	<!-- 设置1
		<c:set var="ddd" value="${requestScope.aaa}" scope="request"></c:set>
		
		<c:out value="${requestScope.ddd}" ></c:out>
	-->
	
	<!-- 设置2	
		<c:set  property="name" target="${requestScope.aaa}" value="zhouqi" ></c:set>
		
		${requestScope.aaa.name}
	-->
	
	<c:if test="${requestScope.name == 'zhouqi'}"  var="abc">
		你好			
	</c:if>
	${abc}
	
	<c:choose>
		<c:when test="${requestScope.name == 'zhouqi'}">
			你好	
		</c:when>
		
		<c:when test="${requestScope.name == 'zhangsan'}">
			你不好
		</c:when>
		
		<c:otherwise>
			不想理你
		</c:otherwise>
	
	</c:choose>
	
	<table>
	<c:forEach items="${pageScope.list}"  var="it" begin="0" end="3" step="2"  varStatus="s">
		<tr><td>${it}</td><td>${s.index}</td></tr>		
	</c:forEach>

	
	
	<c:forTokens items="${requestScope.list1}" delims="," var="it1" varStatus="s">
	
		<tr><td>${it1}</td><td>${s.first}</td></tr>		
	</c:forTokens>
	
	</table>
	
	<c:catch var="ex">
	<%	 if(1==1)
	 throw new Exception("dfsfs"); %>		
	</c:catch>
	${ex}
	
	<%--	<c:import url="MyJsp.jsp">
		<c:param name="name" value="zhouqi"></c:param>
	</c:import>
	
	<c:redirect url="MyJsp.jsp"></c:redirect>--%>
	
	
	<c:set var="ddd" value="${requestScope.aaa}" scope="request"></c:set>
	${requestScope.ddd} 
	<c:remove var="ddd" scope="request"/>
	${requestScope.ddd} 

	<c:url value="aaa"></c:url>
	
  </body>
</html>
