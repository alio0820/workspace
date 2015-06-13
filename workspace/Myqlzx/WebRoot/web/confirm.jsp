<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.GoodsInfo"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%@page import="cn.edu.dao.CustomerInfoDAO"%>
<%@page import="cn.edu.dao.CustomerDetailInfoDAO"%>
<%@page import="cn.edu.model.CustomerInfo"%>
<%@page import="cn.edu.model.CustomerDetailInfo"%>
<%@page import="cn.edu.dao.OrderGoodsInfoDAO"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单确认-千里之行，在线销售旅游产品</title>
</head>

<link rel="stylesheet" href="../css/web/common.css" type="text/css"></link>
<style type="text/css">
div.title{text-align:center;font-size:14pt;font-family:'黑体';height:28px;line-height:28px;margin:5px;}
div.title span{font-family:'华文行楷','楷体','黑体';font-size:18pt;margin-right:3px;}

div.item_title{text-align:left;margin-top:3px;border:1px solid #ccc;color:#000;font-size:10pt;background:url(images/item.gif) no-repeat 3px 7px #E6F0F9;height:28px;line-height:28px;text-indent:15px;}
div.item_content{text-align:center;padding:10px 0px 10px 0px;border:1px solid #ccc;border-top-width:0px;}

table {border:1px solid #ccc;border-collapse:collapse;width:960px;text-align:left;color:#484848;font-size:11pt;}
td{height:30px;line-height:30px;border:1px solid #ccc;text-indent:1em;}
th{height:30px;line-height:30px;border:1px solid #ccc;}
td.title{width:120px;text-align:left;background-color:#F6F6F6;}

th{font-size:11pt;height:24px;line-height:24px;background-color:#F6F6F6;text-align:center;}
.goodsImg{width:50px;height:50px;float:left;margin:3px;}
.goodsName{float:left;height:50px;line-height:50px;}
td.sum span{font-size:18pt;font-family:Georgia,'Times new roman,serif';color:#FF6600;font-weight:bold;}

div.op{height:40px;line-height:40px;text-align:center;}
.btn61_21 {width:61px;height:21px;vertical-align:middle;line-height:21px;border-width: 0px;border-style:none;padding: 0px;font-size:12px;margin-right: 3px;background: url(../image/web/btn.png) no-repeat 0 0;cursor: pointer;}
</style>

<body>
<%
		String str_loginId = session.getAttribute("loginId")+""; 
		int  loginId = Integer.parseInt(str_loginId);
		System.out.println("loginId in confirm = "+loginId);
		
		CustomerInfoDAO ctDAO = new CustomerInfoDAO();
		CustomerInfo ct = ctDAO.getCustomerInfoById(loginId);
		CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
		CustomerDetailInfo ctd = ctdDAO.getCustomerDetailByCustomerId(loginId);
		
%>
<iframe src="top_index.jsp" name="topFrame" width="100%" height="150px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
<div id="middle_div">
	<div class="sitemap">
		您现在所在的位置：<a target="_top" href="index.jsp">网站首页</a>&nbsp;&gt;&nbsp;
		<a target="_top" href="cart.jsp">购物车</a>&nbsp;&gt;&nbsp;订单确认
	</div>
	<div class="title"><span>千里之行</span>购物订单确认表</div>
	<div>
		<div class="item_title">客户信息</div>
		<div class="item_content">
			<table align="center">
				<tr>
					<td class="title">客户编号</td>
					<td><%=loginId %></td>
					<td class="title">注册时间</td>
					<td><%=ct.getRegisterTime() %></td>
				</tr>
				<tr>
					<td class="title">客户账户/邮箱</td>
					<td><%=ct.getEmail() %></td>
					<td class="title">收货人姓名</td>
					<td><%=ctd.getName() %></td>
				</tr>
				<tr>
					<td class="title">固定电话</td>
					<td><%=ctd.getTelphone() %></td>
					<td class="title">移动电话</td>
					<td><%=ctd.getMobilephone() %></td>
				</tr>
				<tr>
					<td class="title">收货地址</td>
					<td colspan="3"><%=ctd.getAddress() %></td>
				</tr>
			</table>
		</div>
		<div class="item_title">订单信息</div>
		<div class="item_content">
			<table align="center">
				<tr>
					<th>编号</th>
					<th>商品名称</th>
					<th>商品类型</th>
					<th>价格</th>
					<th>折扣</th>
					<th>数量</th>
					<th>小计</th>
				</tr>
				<%
					session = request.getSession();
					ArrayList<GoodsInfo> hasBuyList = (ArrayList<GoodsInfo>)session.getAttribute("hasBuyList");
					System.out.println("hasBuyList In confirm:"+hasBuyList);
					if(hasBuyList!=null)
					{
							for(int i=0;i<hasBuyList.size();i++)
							{
								GoodsInfo gdInfo = hasBuyList.get(i);
								System.out.println("hasBuyList In confirm:"+hasBuyList.get(i));
								out.print("<tr>");
								out.print("<td>"+gdInfo.getGoodsId()+"</td>");
								out.print("<td>");
								out.print("<img src='../image/products/"+gdInfo.getPhoto()+"' class='goodsImg' />");
								out.print("<div class='goodsName'>"+gdInfo.getGoodsName()+"</div>");
								out.print("</td>");
								out.print("<td>"+gdInfo.getTypeId()+"</td>");
								out.print("<td>"+gdInfo.getPrice()+"元</td>");
								out.print("<td>"+gdInfo.getDiscount()+"</td>");
								out.print("<td align='center'>"+gdInfo.getCount()+"</td>");
								out.print("<td>"+PublicUtil.Convert(gdInfo.getPrice()*gdInfo.getDiscount()*gdInfo.getCount()/10)+"元</td>");
								out.print("</tr>");	
							}
					}
				%>
				<tr>
					<td colspan="7" class="sum">
						此订单中共有<span><%=hasBuyList.size() %></span>件商品，总计<span><%=session.getAttribute("sum") %></span>金额元！					</td>
				</tr>
			</table>
		</div>
		
	</div>
	<div class="op">
		<form action="OrderInfoServlet" method="post">
			<input type="hidden" name="method" value="insert" />
			<input type="submit" class="btn61_21" value="确认订单" />&nbsp;&nbsp;
			<input type="button" onClick="window.top.location.href='cart.jsp'" class="btn61_21" value="返&nbsp;回" />
		</form>
	</div>
</div>
<iframe src="bottom_index.jsp" name="bottomFrame" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
</body>
</html>