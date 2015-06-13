<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>user_control.jsp page</title>
  </head>
   <meta http-equiv="content-Type" content="text/html; charset=gb2312"> 
     
   <h2 align="center">
       <font color="green"> <br>用户管理<br> </font>
    </h2>
    
  <body>
    <table bordercolor="#000000" border="1" align="center" width="60%" height="40" cellspacing="0" bgcolor="#aadada">
     <tr>
     <td><a href="/OurProgram/login/login_admin.jsp">首页</a></td>
     <td><s:form action="queryUser" namespace="/query" method="post">
    			<input type="submit" value="查询用户"/>
            </s:form></td>
     <td>
    	<input type="button" value="添加用户" onclick="window.location.href='http://localhost:8080/OurProgram/login/add.jsp';"/>
    		</td>
     </tr> 
  </table>
  
  <br/><br> 
 <table bordercolor="#000000" border="1" align="center" width="60%" height="20" cellspacing="0" bgcolor="#aadada">
	<thead align="center">
	
	<tr bgcolor="#aadada">
	
		<td width="30%">userName</td>
		<td width="30%">password</td>
		<td width="30%">power</td>
		<td width="30%">department</td>
		<td width="30%">修&nbsp;改</td>
		<td width="30%">删&nbsp;除</td>
	</tr>
	</thead>
	
	<s:iterator value="list" status="s">
		<tr align="center">
		    
			<td><s:property value="username"/></td>
			<td><s:property value="password"/></td>
			<td><s:property value="power"/></td>
			<td><s:property value="department"/></td>
	
			<td><a href='<s:url value="/login/sonM.jsp" >   
               <s:param name="username" value="username" />   
               <s:param name="password" value="password" />
               <s:param name="power" value="power" />
               <s:param name="department" value="department" /></s:url>'>[修改]</a></td> 
               
			 <td><a href='<s:url value="/login/sonD.jsp" >   
               <s:param name="username" value="username" /></s:url>'>[删除]</a></td> 
			
	</s:iterator>	
</table>
  </body>
</html>
