<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%@page import="cn.edu.util.PageUtil"%>
<%@page import="cn.edu.util.DBConn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
	<title>商品信息</title>
	<link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
	<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
	<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="GoodsInfoServlet" id="body_form" name="body_form">
<input type="hidden" name="method" value="search"/>
<input type = 'hidden' name = "deleteValue" id = "deleteValue" value = "" />
<input type = 'hidden' name = "currentPage" id = "pageGO" value="" /> 
<div class="title_div">
		<div class="title">商品信息</div>
</div>
<div class="search"><input type="text" name="key" id="search" class="magnifier" size="50"/><input type="submit" class="btn" value="查询" />&nbsp;&nbsp;<input type="button" onClick='addData();' class="btn" value="添加商品" />&nbsp;&nbsp;<input type="button" onClick='deleteData();' class="btn" value="删除商品" />
</div>
</form>
<div id="middiv"></div>
<div class="table_div">
	<table border="0" cellpadding="0" cellspacing="0" class="body_table">
  <tr>
    <th><input type="checkbox" id="chkAll" class="chk" onclick="select_All();"/></th>
    <th>商品编号</th>
    <th>商品类别</th>
    <th>商品名称</th>
    <th>商品价格</th>
    <th>商品折扣</th>
    <th>商品图片</th>
    <th>是否新品</th>
    <th>是否推荐</th>
    <th>商品状态</th>
    <th>操作</th>
  </tr>
  <%
  	ArrayList<GoodsInfo> gdList = (ArrayList<GoodsInfo>)request.getAttribute("gdList");
  	
  	if(PublicUtil.publicCheckNull(gdList))
  	{
  		for(int i=0; i<gdList.size();i++)
  		{
  			GoodsInfo gd = gdList.get(i);
			out.print("<tr name='tr"+i+"'>");
			out.print("<td align='center'><input type='checkbox' class='chk' name='chkitem' value="+gd.getGoodsId()+" /></td>");
			out.print("<td>"+gd.getGoodsId()+"</td>");
			out.print("<td>"+DBConn.getTypeNameByGoods(gd.getTypeId())+"</td>");
			out.print("<td>"+gd.getGoodsName()+"</td>");
			out.print("<td>"+gd.getPrice()+"</td>");
			out.print("<td>"+gd.getDiscount()+"</td>");
			out.print("<td><img src='../image/products/"+gd.getPhoto()+"' width='40' height='23'/></td>");
			out.print("<td>"+gd.getIsNew()+"</td>");
			out.print("<td>"+gd.getIsRecommend()+"</td>");
			out.print("<td>"+gd.getStatus()+"</td>");
			out.print("<td align='center'><a href='GoodsInfoServlet?method=rework&reworkValue="+gd.getGoodsId()+"'>修改</a>&nbsp;&nbsp;<a href='GoodsInfoServlet?method=deleteOne&deleteValue="+gd.getGoodsId()+"'>删除</a></td>");
			out.print("</tr>");
  		} 
  	}
  	
  %>

  	<%
			out.print(PageUtil.getUrlInfo(request,"GoodsInfoServlet",11)); 
	%> 

</table>
</div>
</body>
</html>
