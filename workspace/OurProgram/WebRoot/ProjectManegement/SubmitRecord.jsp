<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SubmitRecord.jsp' starting page</title>
    
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
   <table  border="1">
         <tr>
           <td colspan="2" bgcolor="#0099FF"><div align="center" ><%=request.getParameter("projectName") %> &nbsp; 归档信息</div></td>
         </tr>
        
         
         <s:iterator value="list" status="s" id="l">
          <tr>
           <td>项目名称</td>
           <td> <%=request.getAttribute("projectName") %></td>
         </tr>
         <tr>
           <td>档案类别</td>
           <td><%=request.getAttribute("pigeonholeType") %></td>
         </tr>
         <tr>
           <td>审核人</td>
           <td><%=request.getAttribute("assessor") %></td>
         </tr>
         <tr>
           <td>归档时间</td>
           <td><%=request.getAttribute("pigeonholeDate") %></td>
         </tr>
         <tr>
           <td>审核意见</td>
           <td><%=request.getAttribute("auditingAttitude") %></td>
         </tr>
 
  </s:iterator>
 </table>
     
  </body>
</html>
