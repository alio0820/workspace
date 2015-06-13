<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加商品类型</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="GoodsTypeServlet" id="body_form">
<input type = "hidden" name = "method" value="insert" />
<div class="title_div">
		<div class="title">添加商品类型</div>
</div>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
	<tr>
		<td class="first_td">类型名称:</td>
		<td><input type="text" name="typeName" size="30"/></td>
	</tr>
	<tr>
		<td class="first_td"></td>
		<td><input class="btn" type="submit" value="提交表单" />&nbsp;&nbsp;
			<input class="btn" type="reset" value="重置表单" />
		</td>
	</tr>
</table>
</form>
</body>
</html>
