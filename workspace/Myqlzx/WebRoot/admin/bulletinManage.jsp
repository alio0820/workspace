<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.Bulletin"%>
<%@page import="cn.edu.util.PublicUtil"%>
<%@page import="cn.edu.util.PageUtil"%>
<%@page import="cn.edu.util.DBConn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
	<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
	<script type="text/javascript" src="../js/admin/common.js"></script>
</head>

<body>
<%
	PublicUtil.CheckLogin(request,response);
%>
<form method="POST" action="BulletinServlet" id="body_form" name="body_form">
	<input type = 'hidden' name = "method" id = "method" value = "search"/>
	<input type = 'hidden' name = "deleteValue" id = "deleteValue" value = "" />
	<input type = 'hidden' name = "currentPage" id = "pageGO" value="" /> 
<div class="title_div">
		<div class="title">公告信息管理</div>
</div>
<div class="search"><input type="text" name="key" id="search" class="magnifier" size="50"/><input type="submit" class="btn" value="查询" />&nbsp;&nbsp;<input type="button" class="btn" onClick='addData();' value="添加公告" />&nbsp;&nbsp;<input type="button" onClick='deleteData();' class="btn" value="删除公告" />
</div>
<div id="middiv"></div>
<div>
	<table border="0" cellpadding="3" cellspacing="0" class="body_table">
		<tr>
			<th width="5%"><input type="checkbox" class="chk" id="chkAll" onclick="select_All();" /></th>
			<th width="10%">公告编号</th>
			<th width="40%">标题</th>
			<th width="10%">发布者</th>
			<th width="15%">发布时间</th>
			<th width="20%">操作</th>
		</tr>
		<%
			ArrayList<Bulletin> btList = (ArrayList<Bulletin>)request.getAttribute("btList");
			if(btList!=null)
			{
//				System.out.print(btList.size());
				for(int i = 0 ; i < btList.size();i++)
				{
					Bulletin bt = btList.get(i);
					out.print("<tr>");
					out.print("<td width='5%' align='center'><input type='checkbox' class='chk' name='chkitem' value='"+bt.getId()+"' /></td>");
					out.print("<td class='first_td'>"+bt.getId()+"</td>");
					out.print("<td class='second'>"+bt.getTitle()+"</td>");
					out.print("<td class='third'>"+DBConn.getUserNameByUserId(bt.getUserId())+"</td>");
					out.print("<td class='forth'>"+bt.getCreateTime()+"</td>");
					out.print("<td align='center'><a href='BulletinServlet?method=rework&reworkValue="+bt.getId()+"'>修改</a>&nbsp;&nbsp;<a href='BulletinServlet?method=deleteOne&deleteValue="+bt.getId()+"'>删除</a></td>");
					out.print("</tr>");
				}
			}
		%>
		<%
			out.print(PageUtil.getUrlInfo(request,"BulletinServlet",7)); 
		%>
	</table>
</form>
</body>
</html>
