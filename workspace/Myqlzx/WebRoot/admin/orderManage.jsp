<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.dao.OrderInfoDAO"%>
<%@page import="cn.edu.model.OrderInfo"%>
<%@page import="cn.edu.dao.CustomerInfoDAO"%>
<%@page import="cn.edu.model.CustomerInfo"%>
<%@page import="cn.edu.model.CustomerDetailInfo"%>
<%@page import="cn.edu.dao.CustomerDetailInfoDAO"%>
<%@page import="cn.edu.util.DBConn"%>
<%@page import="cn.edu.util.PageUtil"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>订单列表</title>
<link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form method="POST" action="OrderServlet" id="body_form" name="body_form">
	<input type = 'hidden' name = "method" id = "method" value = "search"/>
	<input type = 'hidden' name = "deleteValue" id = "deleteValue" value = "" />
	<input type = 'hidden' name = "currentPage" id = "pageGO" value="" /> 
<div class="title_div">
		<div class="title">订单信息管理</div>
</div>
<div class="search"><input type="text" name="key" id="search" class="magnifier" size="50"/><input type="submit" class="btn" value="查询" />&nbsp;&nbsp;<input type="button" onClick='deleteData();' class="btn" value="删除订单" />
</div>
</form>
<div id="middiv"></div>
<div class="table_div">
	<table border="0" cellpadding="0" cellspacing="0" class="body_table">
  <tr>
    <th><input type="checkbox" id="chkAll" class="chk" onclick="select_All();" /></th>
    <th>订单编号</th>
    <th>订单状态</th>
    <th>下单时间</th>
    <th>客户账户/邮箱</th>
    <th>收货人</th>
    <th>固定电话</th>
    <th>移动电话</th>
    <th>操作</th>
  </tr>
  <%
  	 ArrayList<OrderInfo> oiList = (ArrayList<OrderInfo>)request.getAttribute("oiList");
	 CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
	 
  	 if(oiList!=null)
  	 {
  	 	for(int i = 0;i<oiList.size();i++)
  	 	{
  	 		OrderInfo oi = oiList.get(i);
  	 		CustomerDetailInfo ct = ctdDAO.getCustomerDetailByCustomerId(oi.getCustomerId());
  	 		out.print("<tr>");
  	 		out.print("<td align='center'><input type='checkbox' class='chk' name='chkitem' value='"+oi.getOrderId()+"' /></td>");
  	 		out.print("<td>"+oi.getOrderId()+"</td>");
  	 		out.print("<td>"+PublicUtil.Convert(oi.getStatus())+"</td>");
  	 		out.print("<td>"+oi.getOrderTime()+"</td>");
  	 		out.print("<td>"+DBConn.getCustomerEmailByCustomerId(oi.getCustomerId())+"</td>");
  	 		out.print("<td>"+ct.getName()+"</td>");
  	 		out.print("<td>"+ct.getTelphone()+"</td>");
  	 		out.print("<td>"+ct.getMobilephone()+"</td>");
  	 		out.print("<td align='center'><a href='OrderServlet?method=confirm&confirmId="+oi.getOrderId()+"&confirmStatus="+oi.getStatus()+"'>");
  	 			if(oi.getStatus()==0)
  	 			{
  	 				out.print("确认订单");
  	 			}
  	 			if(oi.getStatus()==1)
  	 			{
  	 				out.print("取消订单");
  	 			}
  	 		out.print("</a>&nbsp;&nbsp;<a href='OrderServlet?method=detail&detailCustomer="+oi.getCustomerId()+"&detailOrder="+oi.getOrderId()+"'>详情</a>&nbsp;&nbsp;<a href='OrderServlet?method=deleteOne&deleteValue="+oi.getOrderId()+"'>删除</a></td>");
  	 		out.print("</tr>");
  	 	}
  	 }
  %>
  <%
  	out.print(PageUtil.getUrlInfo(request,"OrderServlet",9)); 
  %>
</table>
</div>
</body>
</html>
