<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
   <title>查看/修改商品信息</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<% 
	GoodsInfo gd = (GoodsInfo)request.getAttribute("reworkGd");
%>
<form name="body_form" id="body_form" action="GoodsInfoServlet" onsubmit="return choosePhoto(file);">
<input type = "hidden" name = "method" value = "update"/> 
<input type = "hidden" name = "goodsId" value = <%=gd.getGoodsId() %>>
<div class="title_div">
		<div class="title">查看/修改商品信息</div>
</div>

	<table border="0" cellpadding="3" cellspacing="0" class="body_table">
		<tr>
			<td class="first_td">商品名称：</td>
			<td><input type="text" name="goodsName" value="<%=gd.getGoodsName()%>" size="50"/></td>
		</tr>
		<tr>
			<td class="first_td">商品分类：</td>
			<td><select name="select">
				<option value="1">野营帐篷</option>
				<option value="2">睡袋垫子</option>
				<option value="3">户外桌椅</option>
				<option value="4">运动手表</option>
				<option value="5">野营用品</option>
				<option value="6">登山攀岩器材</option>
				<option value="7">户外服装</option>
				</select></td>
		</tr>
		<tr >
			<td class="first_td">商品折扣/分类：</td>
			<td>价格：
		    <input type="text" name="price" size="5" value="<%=gd.getPrice() %>"/>&nbsp;&nbsp;折扣：<input type="text" name="discount" size="5" value="<%=gd.getDiscount() %>"/></td>
		</tr>
		<tr>
			<td class="first_td">上架/推荐/新品:</td>
			<td><label for="checkbox">上架:</label>
		    <input type="checkbox" name="checkbox" value="上架" id="up" />&nbsp;&nbsp;<label for="checkbox">推荐:</label>
		    <input type="checkbox" name="checkbox" value="推荐" id="recommend" />&nbsp;&nbsp;<label for="checkbox">新品:</label>
		    <input type="checkbox" name="checkbox" value="新品" id="new" />&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<td class="first_td">商品图片：</td>
			<td><input type="file" name="photo" id="file"n size="60" onchange="choosePhoto(this);"/></td>
		</tr>
		<tr>
			<td class="first_td">商品描述：</td>
			<td><textarea id="textarea" name="remark"><%=gd.getRemark() %></textarea></td>
		</tr>
		<tr>
			<td class="first_td">&nbsp;</td>
			<td><input type="submit" class="btn" value="修改信息" />
			&nbsp;&nbsp;&nbsp;<input type="reset" class="btn" value="重置表单" />
			&nbsp;&nbsp;&nbsp;<input type="button" onClick="goBack();" class="btn" value="返回" /></td>
		</tr>
	</table>
</form>
</body>
</html>