<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.GoodsType"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%@page import="cn.edu.util.PageUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品信息管理</title>
<link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form action="GoodsTypeServlet" name="body_form" id="body_form">
<input type = 'hidden' name = "method" id = "method" value = "search"/>
<input type = 'hidden' name = "deleteValue" id = "deleteValue" value = "" />
<input type = 'hidden' name = "currentPage" id = "pageGO" value="" /> 
<div class="title_div">
		<div class="title">商品信息管理</div>
</div>
<div class="search"><input type="text" name="key" id="search" class="magnifier" size="50"/><input type="submit" class="btn" value="查询" />&nbsp;&nbsp;<input type="button" onClick="addData();" class="btn" value="添加类型" />&nbsp;&nbsp;<input type="button" onClick="deleteData();" class="btn" value="删除类型" />
</div>
<div id="middiv"></div>
<div>
	<table border="0" cellpadding="3" cellspacing="0" class="body_table">
		<tr>
			<th><input type="checkbox" class="chk" id="chkAll" onclick="select_All();" /></th>
			<th>类型编号</th>
			<th>类型名称</th>
			<th>操作</th>
		</tr>
		<%
			ArrayList<GoodsType> gtList = (ArrayList<GoodsType>)request.getAttribute("gtList");
			
			if(PublicUtil.publicCheckNull(gtList))
			{
				for(int i=0;i<gtList.size(); i++)
				{
					GoodsType gt = gtList.get(i);
					out.print("<tr>");
					out.print("<td align='center'><input type='checkbox' class='chk' name='chkitem' value="+gt.getTypeId()+"></td>");
					out.print("<td class='first_td'>"+gt.getTypeId()+"</td>");
					out.print("<td>"+gt.getTypeName()+"</td>");
					out.print("<td align='center'><a href='GoodsTypeServlet?method=rework&reworkValue="+gt.getTypeId()+"''>修改</a>&nbsp;&nbsp;<a href='GoodsTypeServlet?method=deleteOne&deleteValue="+gt.getTypeId()+"''>删除</a></td>");
					out.print("</tr>");
				}
			}
		%>
		<%
			out.print(PageUtil.getUrlInfo(request,"GoodsTypeServlet",4));
		%>
		<tr>
			<td colspan="4" width="80%">&nbsp;</td>
		</tr>
	</table>
</form>
</body>
</html>