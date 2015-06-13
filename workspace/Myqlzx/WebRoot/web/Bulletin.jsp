<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.dao.BulletinDAO"%>
<%@page import="cn.edu.model.Bulletin"%>
<%@page import="cn.edu.util.DBConn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>公告信息</title>
	<link rel="stylesheet" href="common/css/common.css" type="text/css"></link>
	<style type="text/css">
	.div_bulletin {border: 1px solid #CCE3F1;padding:20px 10px 20px 10px;}
	.content {font-size: 14px;text-align: left;padding:10px;margin-left:auto;margin-right:auto;padding:10px 50px 10px 50px;}
	p{text-indent: 2em;word-spacing: 5px;line-height: 24px;}
	.title {font-size: 20px;margin-bottom:15px;text-align: center;font-weight: bold;}
	.info {font-size: 12px;margin: 3px;text-align: center;}
	</style>
</head>
			<%  
				String str_btid = request.getParameter("btid");
				int btid = Integer.parseInt(str_btid);
				BulletinDAO btDAO = new BulletinDAO();
				Bulletin bt = btDAO.getBulletin(btid); 
			%>
<body>&nbsp; 
	<iframe src="top_index.jsp" name="topFrame" width="100%" height="150px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
	<div id="middle_div">
	    <div class="sitemap">
			您现在所在的位置：<a target="_top" href="#">网站首页</a>&nbsp;&gt;&nbsp;
			<a href="showBulletinList.jsp?pageNo=1">网站公告</a>&nbsp;&gt;&nbsp;公告信息
		</div>
		<div class="div_bulletin">
			<div class="title"><%=bt.getTitle() %></div>
			<div class="info">&nbsp;&nbsp;<%=bt.getCreateTime() %>
				发布者：<%=DBConn.getUserNameByUserId(bt.getUserId()) %>	</div>
			<div class="content"><%=bt.getContent() %></div>
		</div>
	</div>
	<iframe src="bottom_index.jsp" name="bottomFrame" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
</body>
</html>