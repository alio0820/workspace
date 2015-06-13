<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>导出数据页面</title>
  </head>
  
  <body>
    	<s:form name="form1" action="outPut.action" method="post">
    		<input type="hidden" name="format" value="xls" />
   			<s:submit name="sub" value="导出数据"></s:submit>
  		</s:form> 
  </body>
</html>
