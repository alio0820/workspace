<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.dao.GoodsTypeDAO"%>
<%@page import="cn.edu.model.GoodsType"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<title>添加商品</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="GoodsInfoServlet" method = "post" id="body_form" onsubmit="return choosePhoto(file)">
<input type = "hidden" name = "method" value = "insert"> 
<div class="title_div">
			<div class="title">添加商品</div>
</div>
	<table border="0" cellpadding="3" cellspacing="0" class="body_table">
		<tr>
			<td class="first_td">商品名称：</td>
			<td><input type="text" name="textName" /></td>
		</tr>
		<tr>
			<td class="first_td">商品分类：</td>
			<td><select name="select">
				<%
					 GoodsTypeDAO gdDAO = new GoodsTypeDAO();
					 ArrayList<GoodsType> gdlist = gdDAO.getAllGoodsType();
					 for(int i = 0;i<gdlist.size();i++)
					 {
					 	GoodsType gd = gdlist.get(i);
					 	out.print("<option value='"+gd.getTypeId()+"'>");
					 	out.print(gd.getTypeName());
					 	out.print("</option>");
					 }					 
				%>
				</select></td>
		</tr>
		<tr >
			<td class="first_td">商品折扣/分类：</td>
			<td>价格：
		    <input type="text" name="textPrice" size="5"/>&nbsp;&nbsp;折扣：<input type="text" name="textDiscount" size="5" /></td>
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
			<td>
				<input type="hidden" id="photo_hidden" />
				<input type="file" name="file" id="file" size="60" onchange="choosePhoto(this)" />
			</td>
		</tr>
		<tr>
			<td class="first_td">商品描述：</td>
			<td><textarea id="textarea" name="textarea"></textarea></td>
		</tr>
		<tr>
			<td class="first_td">&nbsp;</td>
			<td><input type="submit" class="btn" value="添加商品" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置表单" class="btn" /></td>
		</tr>
	</table>
</form>
</body>
</html>
