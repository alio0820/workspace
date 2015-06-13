<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'generator.jsp' starting page</title>
    
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

This is list table. Use the Struts2.0 tag: s:iterator
 <table bordercolor="#000000" border="1" align="center" width="100%" cellspacing="0">
	<thead align="center">
	<tr bgcolor="#aadada">
		<td width="10%">id</td>
		<td width="50%">userName</td>
		<td>password</td>
	</tr>	
	</thead>
	<s:iterator value="list" status="s" id="l">
	<s:if test="list.size() == 0">
		<tr align="center" bgcolor="#hjhjhj">
			<td><s:property value="id"/></td>
			<td><s:property value="userName"/></td>
			<td><s:property value="password"/></td>
		</tr>
	</s:if>
	<s:else>
		<tr align="center">
			<td><s:property value="id"/></td>
			<td><s:property value="userName"/></td>
			<td><s:property value="password"/></td>
		</tr>
	</s:else>
	</s:iterator>

</table>

  </body>
</html>
