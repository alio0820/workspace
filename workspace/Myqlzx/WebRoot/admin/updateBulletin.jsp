<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.Bulletin"%>
<%@page import="cn.edu.util.PublicUtil"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>查看/修改公告信息</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
<style type="text/css">
.name_td {width:100px;}
</style>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form name="body_form" id="body_form" action="BulletinServlet">
	<input type = "hidden" id="method" name = "method" value = "update"/> 
<div class="title_div">
			<div class="title">查看/修改公告信息</div>
</div>
		<%
			Bulletin bt = (Bulletin)request.getAttribute("reworkBt");	 
		%>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
		<tr>
			<td class="first_td">编号:</td>
			<td><input name="textId" type="text" size="2" value="<%=bt.getId()%>"/></td>
		</tr>
		<tr>
			<td class="first_td">标题：</td>
			<td><input name="textTitle" type="text" value="<%=bt.getTitle()%>"/></td>
		</tr>
		<tr >
			<td class="first_td">内容:</td>
			<td><textarea name="textarea" id="textarea"><%=bt.getContent() %></textarea></td>
		</tr>
		<tr>
			<td class="first_td">发布者:</td>
			<td><label for="checkbox"><%=bt.getUserId() %></label></td>
		</tr>
		<tr>
			<td class="first_td">发布时间：</td>
			<td><%=bt.getCreateTime() %></td>
		</tr>
		<tr>
			<td class="first_td">&nbsp;</td>
			<td><input type="submit" class="btn" value="提交表单" />
			&nbsp;&nbsp;&nbsp;<input type="reset" class="btn" value="重置表单" />
			&nbsp;&nbsp;&nbsp;<input type="button" onClick="goBack();" class="btn" value="返回" /></td>
		</tr>
  </table>
</form>
</body>
</html>
