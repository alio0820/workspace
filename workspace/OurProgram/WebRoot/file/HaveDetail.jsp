<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>已归档项目详细资料</title>
    <link rel="stylesheet" href="../../css/style.css">
    <style type="text/css">
    </style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body background="../../images/grid.gif">
  <table width="800" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
	<thead align="center">
	<tr align="center" bgcolor="#6699CC">
	<th height="25" colspan="3"><s:property value="%{#parameters.projectName}"/><strong><font color="#FFFFFF">项目资料</font></strong></th>
	</tr>
	<tr bgcolor="#A6D0F2">
		<td align="center" width="10%">&nbsp;</td>
		<td height="25" align="center" width="30%"><strong>文档资料名称</strong></td>
		<td height="25" align="center" width="30%"><strong>资料属性</strong></td>
		<td height="25" align="center" width="30%"><strong>创建日期</strong></td>
	</tr>	
	</thead>  
	<s:iterator value="list" status="s" id="l">
	<s:if test="list.size() == 0">
		<tr bgcolor="#A6D0F2">
		    <td align="center" width="10%">&nbsp;</td>
			<td height="25" align="center" width="30%"><s:property value="datumName"/></td>
			<td height="25" align="center" width="30%"><s:property value="datumAttribute"/></td>
			<td height="25" align="center" width="30%"><s:property value="datumSetupDate"/></td>
		</tr>
	</s:if>
	<s:else>
		<tr bgcolor="#A6D0F2">
		    <td align="center" width="10%">&nbsp;</td>
			<td height="25" align="center" width="30%"><s:property value="datumName"/></td>
			<td height="25" align="center" width="30%"><s:property value="datumAttribute"/></td>
			<td height="25" align="center" width="30%"><div align="center"><s:property value="datumSetupDate"/></div></td>
		</tr>
	</s:else>
	</s:iterator>

</table>
  </body>
</html>
