<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>loginSuce.jsp</title>
  </head>
  
  <body>
            <%=request.getParameter("userID") %>
    		<%=request.getParameter("password") %><br/>
    		
    		下面是Struts2的标签:<br/>
    		<s:property value="userID"/>        <!-- userID直接来自于对应的action，与数据库的和user类的无关 -->
    		<s:property value="password"/>
    		
    		<table>
    			<tr height="20">
    				<td height="20"></td>
    			</tr>
    		</table>
    		<s:form action="queryUser" namespace="/query" method="post">
    			<input type="submit" value="查询"/>
    		</s:form>
  </body>
</html>
