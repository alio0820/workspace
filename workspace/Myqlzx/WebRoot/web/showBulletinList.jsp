<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.model.Bulletin"%>
<%@page import="cn.edu.dao.BulletinDAO"%>
<%@page import="cn.edu.model.PageModel"%>
<%@page import="cn.edu.util.PageUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>公告列表-千里之行-在线销售旅游用品 登山攀岩器材、户外服装、户外桌椅、睡袋垫子、野营用品、野营帐篷、运动手表...</title>
	<link rel="stylesheet" href="../css/web/common.css" type="text/css"></link>
	<style type="text/css">
	#bulletinList{padding:10px 3px 3px 3px;}
	#bulletinList span{font-size:11pt;color:#727171;margin-left:30px;border:0px;}
	#bulletinList a{display:block;text-indent:1em;font-size:11pt;color:#4B8ECE;text-decoration:none;height:35px;line-height:35px;border-bottom:1px dashed #727171;}
	#bulletinList a:hover{color:#FE8802;}
	
	.pager{text-align:right;height:25px;line-height:25px;border-bottom:0px;font-size:10pt;}
	</style>
  </head>
  <%
  	 BulletinDAO btDAO = new BulletinDAO(); 
  	 PageModel pm = PageUtil.getPageInfo(request,btDAO.getSumCount());
  	 ArrayList<Bulletin> btList = btDAO.getAllBulletinList("",pm);
  %>
  <body>
  	<iframe src="top_index.jsp" name="topFrame" width="100%" height="150px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
    <div id="middle_div">
	    <div class="sitemap">
			您现在所在的位置：<a target="_top" href="index.jsp">网站首页</a>&nbsp;&gt;&nbsp;网站公告
		</div>
		<%
			if(btList!=null)
			{
				for(int i = 0;i<btList.size();i++)
				{
					Bulletin bt = btList.get(i);
					out.print("<div id='bulletinList'><a href='Bulletin.jsp?btid="+bt.getId()+"'>"+bt.getTitle()+"&nbsp;&nbsp;&nbsp;&nbsp;<span>"+bt.getCreateTime()+"</span></a></div>");
				}				 
			} 
			else
			{
				out.print("错误！");
			} 
		%>
		<div class="pager">
			共有<%=pm.getSumCount()%>条公告&nbsp;&nbsp;
			第<%=pm.getCurrentPage()%>/<%=pm.getSumPage()%>页&nbsp;&nbsp;
			<a href="showBulletinList.jsp?currentPage=<%=pm.getHomePage() %>">首页</a>
			<a href="showBulletinList.jsp?currentPage=<%=pm.getPrePage() %>">上一页</a>
			<a href="showBulletinList.jsp?currentPage=<%=pm.getNextPage() %>">下一页</a>
			<a href="showBulletinList.jsp?currentPage=<%=pm.getLastPage() %>">尾页</a>
		</div>
	</div>
	<iframe src="bottom_index.jsp" name="bottomFrame" width="100%" height="180px" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
  </body>
</html>
