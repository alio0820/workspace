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
    
    <title>项目列表</title>
<link rel="stylesheet" href="../css/style.css">
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
  
  <body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">
    <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
	<thead align="center">
	<tr bgcolor="#6699CC">
	<td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">项目列表</font></strong></td>
	<td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4"></font></strong></td>

	</tr>
	<tr class="lc2" bgcolor="#EEF4FF">
		<td width="21%" ><div align="center">项目编号</div></td>
		<td width="21%" ><div align="center">项目名称</div></td>
		<td width="21%" ><div align="center">归档责任单位</div></td>
		<td width="21%" ><div align="center">归档责任人 </div></td>
		<td width="21%" ><div align="center">建立日期</div></td>
		<td width="21%" ><div align="center">状态</div></td>
		<td width="21%"><div align="center">操作</div></td>
		<td width="21%"><div align="center"></div></td>
		<td width="21%"><div align="center"></div></td>
	</tr>
	</thead>
	<s:iterator value="list" status="s" id="l">
	<s:if test="list.size() == 0">
		<tr class="lc2" bgcolor="#EEF4FF">  
			<td width="21%"><div align="center"><s:property value="projectID"/></div></td>
			<td width="21%"><s:property value="projectName"/></td>
			<td width="21%"><s:property value="unit"/></td>
			<td width="21%"><div align="center"><s:property value="pigeonholeLeader"/></div></td>
			<td width="21%"><div align="center"><s:property value="setupDate"/></div></td>
			<td width="21%"><div align="center"><s:property value="stutas"/></div></td>
			
			<s:if test = 'stutas=="进行中"'>
			<td width="21%"><div align="center">
			
			<a href='<s:url value="showListPrjdatum.action">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			</s:url>'>[维护资料]</a>
			
			<a href='<s:url value="submitprojectList">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			</s:url>'>[提交归档]</a>
			</div></td></s:if>
			
			<s:elseif test='stutas=="已提交"'>
			<td width="21%"><div align="center">
			
			<a href='<s:url value="showList.action">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			</s:url>'>[查看资料]</a>
			
			</div></td>
			</s:elseif>
			
			<s:else>
			<td width="21%"><div align="center"><a href='<s:url value="submitrecordprojectList">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			<s:param name="pigeonholeType" value="pigeonholeType"/>
			<s:param name="assessor" value="assessor"/>
			<s:param name="pigeonholeDate" value="pigeonholeDate"/>
			<s:param name="auditingAttitude" value="auditingAttitude"/>
			</s:url>'>[查看归档信息]</a>
			
			
			</div></td>
			</s:else>	
			
		</tr>
	</s:if>
	<s:else >
	<tr class="lc2" bgcolor="#EEF4FF">  
			<td width="21%"><div align="center"><s:property value="projectID"/></div></td>
			<td width="21%"><s:property value="projectName"/></td>
			<td width="21%"><s:property value="unit"/></td>
			<td width="21%"><div align="center"><s:property value="pigeonholeLeader"/></div></td>
			<td width="21%"><div align="center"><s:property value="setupDate"/></div></td>
			<td width="21%"><div align="center"><s:property value="stutas"/></div></td>
			
	        <s:if test = 'stutas=="进行中"'><td><div align="center" class="STYLE2">
			<a href='<s:url value="showListPrjdatum.action">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			</s:url>'>[维护资料]</a>
			
			<a href='<s:url value="submitprojectList">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			</s:url>'>[提交归档]</a>
			</div></td></s:if>
			
			<s:elseif test='stutas=="已提交"'>
			<td width="21%"><div align="center"><a href='<s:url value="showList.action">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			
			</s:url>'>[查看资料]</a>
			
			</div></td>
			</s:elseif>
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			<s:else>
			<td width="21%"><div align="center"><a href='<s:url value="submitrecordprojectList">
			<s:param name="projectName" value="projectName"/>
			<s:param name="projectID" value="id"/>
			<s:param name="pigeonholeType" value="pigeonholeType"/>
			<s:param name="assessor" value="assessor"/>
			<s:param name="pigeonholeDate" value="pigeonholeDate"/>
			<s:param name="auditingAttitude" value="auditingAttitude"/>
			</s:url>'>[查看归档信息]</a></div></td>
	    	</s:else>
		</tr>
		</s:else>
	</s:iterator>	
</table>
  </body>
</html>