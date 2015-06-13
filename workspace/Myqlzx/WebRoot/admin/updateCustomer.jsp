<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.CustomerInfo"%>
<%@page import="cn.edu.dao.CustomerDetailInfoDAO"%>
<%@page import="cn.edu.model.CustomerDetailInfo"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>查看/修改客户信息</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<style type="text/css">
<!--
.name_td {width:180px;}
-->
</style>
</head>
<%
	CustomerInfo ct = (CustomerInfo)request.getAttribute("reworkCt");
	CustomerDetailInfo ctd = (CustomerDetailInfo)request.getAttribute("reworkCtd");
%>
<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form name="body_form" id="body_form" action="CustomerManageServlet">
	<input type = "hidden" id="method" name = "method" value = "update"/> 
<div class="title_div">
			<div class="title"><span class="titlebar">查看/修改客户信息</span></div>
</div>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
	<tr>
		<td class="first_td">客户编号:</td>
		<td><input type="text" name="cid" value="<%=ct.getId() %>"/></td>
	</tr>
		<tr>
		<td class="first_td">客户账号/邮箱:</td>
		<td><input type="text" name="email" value="<%=ct.getEmail() %>"/></td>
	</tr>
		<tr>
		<td class="first_td">注册时间:</td>
		<td><input type="text" name="registerTime" value="<%=ct.getRegisterTime() %>"/></td>
	</tr>
		<tr>
		<td class="first_td">收货人姓名:</td>
		<td><input type="text" name="name" value="<%=ctd.getName() %>"/></td>
	</tr>
		<tr>
		<td class="first_td">固定电话:</td>
		<td><input type="text" name="telphone" value="<%=ctd.getTelphone() %>"/></td>
	</tr>
		<tr>
		<td class="first_td">移动电话:</td>
		<td><input type="text" name="movePhone" value="<%=ctd.getMobilephone() %>"/></td>
	</tr>
		<tr>
		<td class="first_td">收货地址:</td>
		<td><input type="text" name="address" value="<%=ctd.getAddress() %>"/></td>
	</tr>
		<tr>
		<td colspan="2" align="center">
		<input type="submit" class="btn" value="提交表单" />
			&nbsp;&nbsp;&nbsp;<input type="reset" class="btn" value="重置表单" />
			&nbsp;&nbsp;&nbsp;<input type="button" onClick="goBack();" class="btn" value="返回" /></td>
	</tr>
</table>
</form>
</body>
</html>
