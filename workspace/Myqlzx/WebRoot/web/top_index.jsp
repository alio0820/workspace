<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.util.PublicUtil"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>千里之行-顶部</title>
<style type="text/css">
body{text-align:center;margin:0px;background:url(../image/web/bg.jpg) repeat-x 0% 0%;}
#div_all{width:980px;text-align:left;margin-left:auto;margin-right:auto;padding:10px 5px 10px 0px;}
/*顶部*/
#top_left_div{float:left;}
#top_right_div{float:right;margin-top:-10px;}
#search_div{clear:both;height:30px;line-height:30px;font-size:12px;padding:3px;text-align:right;}
.btn_search{width:52px;height:22px;line-height:22px;border:0px;cursor:pointer;background:url(../image/web/btn_search.gif) no-repeat 0px 0px;margin:0px;padding:0px;}
#search_div input{vertical-align:middle;}
#search_div span{color:#797979;}
.cart{background:url(../image/web/cart.gif) no-repeat left center;padding-left:18px;}
.help{background:url(../image/web/help.gif) no-repeat left center;padding-left:16px;}
.shoucang{background:url(../image/web/shoucang.gif) no-repeat left 0px;padding-left:17px;}
.userinfo{background:url(../image/web/user_info.gif) no-repeat left center;padding-left:18px;}
.loginout{background:url(../image/web/loginOut.gif) no-repeat left 0px;padding-left:17px;}
.home{background:url(../image/web/home.gif) no-repeat left center;padding-left:13px;}
#top_right_div .menu{width:420px;height:28px;line-height:28px;font-size:10pt;background:url(../image/web/head_top.gif) no-repeat 0px 0px;text-align:center;padding-top:3px;}
#top_right_div .menu a{color:#7C7C7C;text-decoration:none;}
#top_right_div .menu a:hover{color:#DE6705;text-decoration:underline;}
#top_right_div .menu span{color:#D8D8D8;padding-top:1px;}

#welcome{position:absolute;left:0px;top:60px;width:100%;color:#5A5A5A;font-size:10pt;text-align:center;z-index:1000;}
#welcome a{text-decoration:none;color:#5A5A5A;line-height:28px;}
#welcome a:hover{color:#F7A70F;}
</style>
<script type="text/javascript">
function add_shouchang(){
	var url = ""; //主页地址 
	var title = "千里之行-在线购买旅游用品"; //主页名称 
	window.external.AddFavorite(url,title);
}
</script>
</head>
<body>
<% 
	session = request.getSession();
	if(session.getAttribute("isRegister")==null)
	{
		session.setAttribute("isRegister","false");
	}
	String isRegister = session.getAttribute("isRegister")+"";
	if(isRegister.equals("false"))
	{
		//没有登录将显示欢迎div
		out.print("<div id='welcome'>");
		out.print("您好，欢迎光临千里之行购买旅游用品!&nbsp;&nbsp;[<a target='_top' href='login_register.jsp'>请登录</a>]&nbsp;");
		out.print("[<a target='_top' href='login_register.jsp'>免费注册</a>]");
		out.print("</div>");
	}
%>
	<div id="div_all">
		<div id="top_left_div">
			<img align="left"src="../image/web/logo.gif" />
		</div>
		<div id="top_right_div">
			<!-- <img height="87px;" src="../image/web/kefu.png" />-->
			<div class="menu">
				<a class="home" target="_top" href="../index.jsp">首页</a>
				<span>|</span>
				<a class="cart" target="_top" href="cart.jsp">购物车</a>
				<span>|</span>
				<a class="userinfo" href="javascript:;">我的信息</a>
				<span>|</span>
				<a target="_top" class="loginout" href="RegisterServlet?method=loginOut">退出</a>
				<span>|</span>				
				<a class="shoucang" href="javascript:add_shouchang();">收藏本站</a>
				<span>|</span>
				<a class="help" href="javascript:;">帮助</a>
			</div>
		</div>
		<div id="search_div">
			商品关键词：<input type="text" name="keywords" />
			<input type="button" class="btn_search" value="搜索" />&nbsp;&nbsp;
			<span>热门商品：登山攀岩器材、户外服装、户外桌椅、睡袋垫子、野营用品、野营帐篷、运动手表...</span>
		</div>
	</div>
</body>
</html>