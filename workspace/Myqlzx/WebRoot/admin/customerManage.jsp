<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.CustomerInfo"%>
<%@page import="cn.edu.model.CustomerDetailInfo"%>
<%@page import="cn.edu.dao.CustomerDetailInfoDAO"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%@page import="cn.edu.util.PageUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <title>客户信息管理</title>
<link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form method="POST" action="CustomerManageServlet" id="body_form" name="body_form">
	<input type = 'hidden' name = "method" id = "method" value = "search"/>
	<input type = 'hidden' name = "deleteValue" id = "deleteValue" value = "" />
	<input type = 'hidden' name = "currentPage" id = "pageGO" value="" />
<div class="title_div">
		<div class="title">客户信息管理</div>
</div>
<div class="search">
<input type="text" name="key" id="search" class="magnifier" size="50"/>
<input type="submit" class="btn" value="查询" />&nbsp;&nbsp;<input type="button" onClick='deleteData();' class="btn" value="删除客户" />
</div>
<div id="middiv"></div>
<div>
<table border="0" cellpadding="3" cellspacing="0" class="body_table">
	<tr>
		<th><input type="checkbox" id="chkAll" class="chk" name="checkbox" onclick="select_All();" /></th>
		<th>客户编号</th>
		<th>客户账号/邮箱</th>
		<th>注册时间</th>
		<th>收货人姓名</th>
		<th>固定电话</th>
		<th>移动电话</th>
		<th>收货地址</th>
		<th>操作</th>
	</tr>
	<%
		ArrayList<CustomerInfo> ctList = (ArrayList<CustomerInfo>)request.getAttribute("ctList");
		CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
		
		if(ctList != null)
		{
			for(int i=0;i<ctList.size();i++)
			{
				CustomerInfo ct = ctList.get(i);
				CustomerDetailInfo ctd = ctdDAO.getCustomerDetailByCustomerId(ct.getId());
				out.print("<tr>");
				out.print("<td align='center'><input type='checkbox' class='chk' name='chkitem' value='"+ct.getId()+"'/></td>");
				out.print("<td>"+ct.getId()+"</td>");
				out.print("<td>"+ct.getEmail()+"</td>");
				out.print("<td>"+ct.getRegisterTime()+"</td>");
				out.print("<td>"+ctd.getName()+"</td>");
				out.print("<td>"+ctd.getTelphone()+"</td>");
				out.print("<td>"+ctd.getMobilephone()+"</td>");
				out.print("<td>"+ctd.getAddress()+"</td>");
				out.print("<td align='center'><a href='CustomerManageServlet?method=rework&reworkValue="+ct.getId()+"'>修改</a>&nbsp;&nbsp;<a href='CustomerManageServlet?method=deleteOne&deleteValue="+ct.getId()+"'>删除</a></td>");
				out.print("</tr>");
			}
		} 
	%>
	<%
		out.print(PageUtil.getUrlInfo(request,"CustomerManageServlet",9));
	%>
</table>
</div>
</form>
</body>
</html>
