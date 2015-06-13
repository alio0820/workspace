<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>导入页面</title>
  </head>
  
  <body>
    	<s:form action="userInfo" method="post" enctype="multipart/form-data"> 
    		<s:file name="excelFile"></s:file> <br/>
    		<s:submit value="导入"></s:submit> 
		</s:form>  
  </body>
</html>
