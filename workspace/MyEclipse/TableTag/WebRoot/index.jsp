<%@ page language="java" import="java.util.*,com.Person" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="zhouqi" uri="/WEB-INF/tableTag.tld" %>

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
    		com.Person p = new com.Person();
    	    		com.Person p1 = new com.Person();
    	    		com.Person p2 = new com.Person();
    	    		p.setName("zhouqi");
    	    		p1.setName("zhangsan");
    	    		p2.setName("lisi");
    	    		p.setAge(29);
    	    		p1.setAge(19);
    	    		p2.setAge(18);
    	    		List list = new ArrayList();
    	    		list.add(p);
    	    		list.add(p1);
    	    		list.add(p2);
    	    		pageContext.setAttribute("list",list);
    	%>
    	 
    	<zhouqi:table items="${pageScope.list}" pageSize="2">
    		<zhouqi:column name="name"/>
    		<zhouqi:column name="age"/>
    	
    	</zhouqi:table> 
    	 
  </body>
</html>
