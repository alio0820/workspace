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
    
    <title>已归档档案列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
<!--
.STYLE1 {
	color: #0033FF;
	font-weight: bold;
}
.STYLE2{
    font-weight:bold;
}
-->
</style>
  </head>
  
  <body>
 <table bordercolor="#0099FF" border="1" align="center" width="80%" cellspacing="0">
	<thead align="center">
	<tr>
	<td colspan="6" bgcolor="#0099FF" class="STYLE1" colspan="7"><div align="center">已归档档案列表</div></td>
	</tr>
	<tr bgcolor="#CCFFFF">
		<td width="9%"><div align="center" class="STYLE1">项目编号</div></td>
		<td width="40%"><div align="center" class="STYLE1">项目名称</div></td>
		<td width="10%"><div align="center" class="STYLE2">归档责任人 </div></td>
		<td width="10%"><div align="center" class="STYLE2">归档类别 </div></td>
		<td width="10%"><div align="center" class="STYLE2">审核人 </div></td>
		<td width="12%"><div align="center" class="STYLE1">归档时间</div></td>
		<td width="9%"><div align="center" class="STYLE1">详细</div>
	</tr>	
	</thead> 
	<s:iterator value="list" status="s" id="l">
	<s:if test="list.size() == 0">
		<tr  bgcolor="#CCFFFF">
			<td><div align="center"><s:property value="projectID"/></div></td>
			<td><div class="STYLE1"><s:property value="projectName"/></div></td>
			<td><div align="center"><s:property value="pigeonholeLeader"/></div></td>
			<td><div align="center"><s:property value="auditingAttitude"/></div></td>
			<td><div align="center"><s:property value="assessor"/></div></td>
			<td><div align="center"><s:property value="pigeonholeDate"/></div></td>
			<td><div align="center"><a href='<s:url value="haveUserDetail.action">
            <s:param name="projectName" value="projectName"/>
            </s:url>'>详细</a></div></td>
		</tr>
	</s:if>
	<s:else>
		<tr  bgcolor="#CCFFFF">
			<td><div align="center"><s:property value="projectID"/></div></td>
			<td><div class="STYLE1"><s:property value="projectName"/></div></td>
			<td><div align="center"><s:property value="pigeonholeLeader"/></div></td>
			<td><div align="center"><s:property value="auditingAttitude"/></div></td>
			<td><div align="center"><s:property value="assessor"/></div></td>
			<td><div align="center"><s:property value="pigeonholeDate"/></div></td>
            <td><div align="center"><a href='<s:url value="haveUserDetail.action">
            <s:param name="projectName" value="projectName"/>
            </s:url>'>详细</a></div></td>
		</tr>
	</s:else>
	</s:iterator>

</table>
  </body>
</html>
