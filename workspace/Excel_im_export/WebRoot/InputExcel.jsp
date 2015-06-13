<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>显示导入的数据页面</title>
  </head>
  
  <body>
	    <h1><s:property value="excelWorkSheet.sheetName" /> </h1>
	  	<p>
	   <s:iterator value="excelWorkSheet.columns">
	    	<s:property />  ||
	   </s:iterator>
	  	</p>
	 
	  <s:iterator var="user" value="excelWorkSheet.data">
	   <p>
		    <s:property value="#user.id"/>  
		    <s:property value="#user.name"/>  
		    <s:property value="#user.pass"/>  
		    <s:property value="#user.lastname"/>  
		    <s:property value="#user.addres"/>   
		    <s:property value="#user.remark"/>   
	   </p>
	  </s:iterator> 
  </body>
</html>
