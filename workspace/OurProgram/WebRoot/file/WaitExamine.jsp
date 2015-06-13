<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>待审核档案列表</title>
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
  <s:form action="queryUserDetail" namespace="/" method="post">
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
	<thead align="center">
	<tr align="center" bgcolor="#6699CC">
	<th height="25" colspan="3"><s:property value="%{#parameters.projectName}"/><strong><font color="#FFFFFF">待审核档案列表</font></strong></th>
	
	<tr bgcolor="EEF4FF">
		<td height="25" align="center" width="30%"><strong>项目编号</strong></td>
		<td height="25" align="center" width="30%"><strong>项目名称</strong></td>
		<td height="25" align="center" width="30%"><strong>归档责任人</strong></td>
		<td height="25" align="center" width="30%"><strong>建立时间</strong></td>
		<td height="25" align="center" width="30%"><strong>提交归档时间</strong></td>
		<td height="25" align="center" width="30%"><strong>操作</strong></td>
	</tr>	
	</thead> 
	
	<s:iterator value="list" status="s" id="l">
	<s:if test="list.size() == 0">
		<tr bgcolor="EEF4FF">  
			<td height="25" align="center" width="30%"><s:property value="projectID"/></td>
			<td height="25" align="center" width="30%"><s:property value="projectName"/></td>
			<td height="25" align="center" width="30%"><s:property value="pigeonholeLeader"/></td>
			<td height="25" align="center" width="30%"><s:property value="setupDate"/></td>
			<td height="25" align="center" width="30%"><s:property value="submitDate"/></td>
			<td height="25" align="center" width="30%"><td height="25" align="center" width="30%">		
            <a href='<s:url value="queryUserDetail.action">
            <s:param name="projectName" value="projectName"/>
            <s:param name="assessor" value="assessor"/>
            <s:param name="auditingAttitude" value="auditingAttitude"/>
            </s:url>'>[审核]</a>
            </td>
		</tr>
	</s:if>
	<s:else >
	<tr align="center" bgcolor="EEF4FF">  
			<td width="7%"><s:property value="projectID"/></td>
			<td width="43%"><s:property value="projectName"/></td>
			<td width="11%"><s:property value="pigeonholeLeader"/></td>
			<td width="16%"><s:property value="setupDate"/></td>
			<td width="16%"><s:property value="submitDate"/></td>
            <td width="7%"><div class="STYLE2">
           
            <a href='<s:url value="queryUserDetail.action">
            <s:param name="projectName" value="projectName"/>
            <s:param name="assessor" value="assessor"/>
            <s:param name="auditingAttitude" value="auditingAttitude"/>
            </s:url>'>[审核]</a>
            </div></td>
           
		</tr>
		</s:else>
	</s:iterator>
	
</table>
</s:form>
  </body>
</html>
