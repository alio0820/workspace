<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.GoodsType"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

   <title>查看/修改商品类型信息</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="GoodsTypeServlet" name="body_form" id="body_form">
<input type = "hidden" id="method" name = "method" value="update"/>
<div class="title_div">
			<div class="title">查看/修改商品类型信息</div>
</div>
<%
	GoodsType gt = (GoodsType)request.getAttribute("reworkGt"); 
%>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
	<tr>
		<td>类型编号:</td>
		<td><input type="text" name="typeId" value="<%=gt.getTypeId() %>"/></td>
	</tr>
	<tr>
		<td>类型名称:</td>
		<td><input type="text" name="typeName" value="<%=gt.getTypeName() %>"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" class="btn" value="提交表单" />
			&nbsp;&nbsp;&nbsp;<input type="reset" class="btn" value="重置表单" />
			&nbsp;&nbsp;&nbsp;<input type="button" onClick="goBack();" class="btn" value="返回" /></td>
	</tr>
</table>
</form>
</body>
</html>
