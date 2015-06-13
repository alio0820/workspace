<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.CustomerDetailInfo"%>
<%@page import="cn.edu.dao.OrderInfoDAO"%>
<%@page import="cn.edu.model.OrderInfo"%>
<%@page import="cn.edu.util.DBConn"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="cn.edu.dao.GoodsInfoDAO"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>订单详细信息</title>
<link rel="stylesheet" type="text/css" href="../css/admin/table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
<style type="text/css">
	.title_td{width:120px; text-align:center; font-weight:bold;}
	#body_table{overflow-y:scroll;}
</style>
</head>
<%
	CustomerDetailInfo ctd = (CustomerDetailInfo)request.getAttribute("DetailCustomer"); 
	ArrayList<Integer> goodsIdList = (ArrayList<Integer>)request.getAttribute("goodsIdList");
	OrderInfo oi = (OrderInfo)request.getAttribute("DetailOrderInfo");
%>
<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form name="body_form" id="body_form" action="OrderServlet">
	<input type = "hidden" id="method" name = "method" value = ""/>
<div class="title_div">
		<div class="title">订单详细信息</div>
</div>
	<table border="0" cellpadding="3" cellspacing="0" class="body_table">
		<tr>
			<td class="title_td">订单编号:</td>
			<td><%=oi.getOrderId() %></td>
			<td class="title_td">订单状态:</td>
			<td><%=oi.getStatus() %></td>
			<td class="title_td">下单时间:</td>
			<td><%=oi.getOrderTime() %></td>
		</tr>
		<tr>
			<td class="title_td">客户编号:</td>
			<td><%=ctd.getCustomerId() %></td>
			<td class="title_td">客户账户/邮箱:</td>
			<td><%=DBConn.getCustomerEmailByCustomerId(ctd.getCustomerId()) %></td>
			<td class="title_td">注册时间:</td>
			<td><%=DBConn.getCustomerRegisterTimeByCustomerId(ctd.getCustomerId()) %></td>
		</tr>
		<tr>
			<td class="title_td">收货人姓名:</td>
			<td><%=ctd.getName() %></td>
			<td class="title_td">固定电话:</td>
			<td><%=ctd.getTelphone() %></td>
			<td class="title_td">移动电话:</td>
			<td><%=ctd.getMobilephone() %></td>
		</tr>
		<tr>
			<td class="title_td">收获地址:</td>
			<td colspan="5"><%=ctd.getAddress() %></td>
		</tr>
	</table>
	<div>
	<table border="0" cellpadding="3" cellspacing="0" id="body_table" class="body_table">
		<tr>
			<th>商品编号:</th>
			<th>商品类别:</th>
			<th>商品名称:</th>
			<th>商品价格:</th>
			<th>商品折扣:</th>
			<th>订购数量:</th>
			<th>小计:</th>
		</tr>
		<%
			double sum = 0;
			GoodsInfoDAO ciDAO = new GoodsInfoDAO();
			if(goodsIdList!=null)
			{
				for(int i=0;i<goodsIdList.size();i++)
				{
					GoodsInfo gd = ciDAO.getGoodsInfo(goodsIdList.get(i));
					out.print("<tr>");
					out.print("<td>"+gd.getGoodsId()+"</td>");
					out.print("<td>"+DBConn.getTypeNameByGoods(gd.getTypeId())+"</td>");
					out.print("<td>"+gd.getGoodsName()+"</td>");
					out.print("<td>"+gd.getPrice()+"</td>");
					out.print("<td>"+gd.getDiscount()+"</td>");
					out.print("<td>"+DBConn.getQuantityByGoodsId(gd.getGoodsId(),oi.getOrderId())+"</td>");
					out.print("<td>"+PublicUtil.Convert(gd.getPrice()*gd.getDiscount()*DBConn.getQuantityByGoodsId(gd.getGoodsId(),oi.getOrderId())/10)+"</td>");
					out.print("</tr>");
					sum += PublicUtil.Convert(gd.getPrice()*gd.getDiscount()*DBConn.getQuantityByGoodsId(gd.getGoodsId(),oi.getOrderId())/10);
				}
			} 
		%>
		<tr>
			<td class="title_td">总金额:</td>
			<td colspan="6">&yen;<%=PublicUtil.Convert(sum)%></td>
		</tr>
			<td colspan="7" align="right"><input type="button" onClick="goBack();" class="btn" value="返回"/></td>
		<tr>
		</tr>
	</table>
	</div>
</body>
</html>
