<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>千里之行 后台管理</title>
<link rel="stylesheet" type="text/css" href="../css/admin/another_table.css" />
<link rel="stylesheet" type="text/css" href="../css/admin/common.css" />
<style type="text/css">
	body 
	{
		width:100%;
		height:100%;
		margin: 0px;
		background-color: #9FC0EC;
		text-align: center;
	}
	#top_div{width:998px; height:90px; margin:0px auto; text-align:left;}
	#middle_div{width:100%; height:30px; background:url(../image/admin/middle.png) repeat-x;}
	#down_div{height:650px;}
	#middle_div2
	{
		position:absolute;
		height:138px;
		width:10px;
		left: 224px;
		top: 107px;
		vertical-align:middle;
		margin-top:180px;
		cursor: pointer;
	}
	#left_div
	{
		position:absolute;
		height:477px;
		width:217px;
		left: 6px;
		top: 122px;
	}
	#right_div
	{
		position:absolute;
		height:476px;
		width:78%;
		left: 236px;
		top: 123px;
		float:left;
	}
	a{
		margin-left:0px;
		display:block;
		color:#1276C6;
		height:16px;
		line-height:16px;
		font-size: 14px;
		text-decoration: none;
		border-bottom:1px dashed #ccc;
		margin:3px 0px 3px 0px;
		text-align: left;
		text-indent:40px;
		background: url(../image/admin/doc.gif) no-repeat 24px 1px #F0F0F0;
		padding:3px;
	}
	#title_div{
		border:0px;
		height:24px;
		line-height:24px;
		text-indent:1em;
		color:#fff;
		font-weight:bold;
		font-size:14px;
		background:url(../image/admin/menubar.png) repeat-x 0 0;
	}
	#userInfo
	{
		height:30px;
		line-height:15px;
		background:url(../image/admin/macback.png) #F0F0F0;
		padding:10px 0px 0px 5px;
		font-size:13px;
		padding-left:2em;
	}
	ul
	{
		margin:0px;
		padding: 0px;
		list-style: none;
		background-color: #F0F0F0;
	}
	#down
	{
		position:absolute;
		background:url(../image/admin/middle.jpg);
		text-align:center;
		float:none;
		padding-top:10px;
		font-size:12px;
		height:30px;
		right:-4px;
		width:100%;
		top: 601px;
	}
</style>
<script type="text/javascript">
	function changeBar(imgBtn)
	{
		var left_div = document.getElementById("left_div");
		var right_div = document.getElementById("right_div");
		
		if(left_div.style.display=='block'||left_div.style.display=='')
		{
			left_div.style.display = 'none';
			imgBtn.src="../image/admin/open_left.gif";
			right_div.style.width = "978px";
			middle_div2.style.left = '55px';
			right_div.style.left='64px';
			
		}
		else
		{
			left_div.style.display = 'block';
			imgBtn.src="../image/admin/close_left.gif";
			right_div.style.width = "978px";
			middle_div2.style.left = '224px';
			right_div.style.left='236px';
		}
	}
</script>
</head>
<%
	String name = (String)session.getAttribute("name");
	String pwd = (String)session.getAttribute("pwd");
	if(name==null||pwd==null)
	{
		response.sendRedirect("../login.jsp");
	}
	Date df = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<body>
<div id="top_div"><img src="../image/admin/logo.gif" />
</div>
<div id="middle_div"></div>
<div id="down_div">
  <div id="left_div">
	 <div id="middle_left_div">
	    <div id="userInfo">
	   		登录用户:<%=name %><br />
			登录时间:<%=sdf.format(df) %>
        </div>
		<div id="title_div">
			公告管理
		</div>
		<ul>
			<li>
				<a href="addBulletin.jsp" target="mainFrame">发布公告</a>	
			</li>
			<li>
				<a href="BulletinServlet?method=search" target="mainFrame">公告管理</a>
			</li>
		</ul>
		<div id="title_div">
			商品管理
		</div>
		<ul>
			<li>
				<a href="addGoods.jsp" target="mainFrame">添加商品</a>
			</li>
			<li>
				<a href="GoodsInfoServlet?method=search" target="mainFrame">商品信息管理</a>
			</li>
			<li>
				<a href="addGoodsType.jsp" target="mainFrame">添加商品类型</a>
			</li>
			<li>
				<a href="GoodsTypeServlet?method=search" target="mainFrame">商品类型管理</a>
			</li>
		</ul>
		<div id="title_div">
			订单管理
		</div>
		<ul>
			<li>
				<a href="OrderServlet?method=search" target="mainFrame">订单信息管理</a>
			</li>
		</ul>
		<div id="title_div">
			客户管理
		</div>
		<ul>
			<li>
				<a href="CustomerManageServlet?method=search" target="mainFrame">客户信息管理</a>
			</li>
		</ul>
		<div id="title_div">
			系统管理
		</div>
		<ul>
			<li>
				<a href="reSetPass.jsp" target="mainFrame">修改密码</a>
			</li>
			<li>
				<a href="reSetUserName.jsp" target="mainFrame">修改用户名</a>
			</li>
			<li>
				<a href="OutServlet?method=post">退出系统</a>
			</li>
		</ul>
     </div>
  </div>
	<div id="middle_div2"><img src="../image/admin/close_left.gif" onclick="changeBar(this);"/></div>
	<div id="right_div">
  		<iframe name="mainFrame" src="welcome.jsp" frameborder="0" marginwidth="0" marginheight="0" width="100%" height="100%"></iframe>
  </div>
</div>
<div id="down">千里之行购物网有限公司&copy;(2011年7月29日)版权所有.</div>
</body>
</html>
