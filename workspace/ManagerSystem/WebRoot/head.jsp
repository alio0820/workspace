<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Personal Portable System</title>
    <link rel="shortcut icon" href="images/fruit.ico">
    <link rel="stylesheet" type="text/css" href="css/comment.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<script src="js/jquery-1.7.2.min.js"></script>
	<script src="js/jquery.color.js"></script>
	<script src="js/comment.js"></script>
  </head>
  
  <body>
    <div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse" data-toggle="collapse" class="btn btn-navbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a href="javascript:void(0)" class="brand"> <img src="images/logo20.png" alt="Logo"> 
					<span>King Zhai</span><span style="margin-left:10px;margin-bottom:3px;font-size:15px;">Personal Portable System</span></a>
				
				<div class="btn-group pull-right theme-container" tabindex="0">
					<a href="javascript:void(0)" data-toggle="dropdown" class="btn dropdown-toggle">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul id="themes" class="dropdown-menu">
						<li><a href="javascript:void(0)" data-value="classic"><i class="icon-blank icon-ok"></i> Classic</a></li>
						<li><a href="javascript:void(0)" data-value="cerulean"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a href="javascript:void(0)" data-value="cyborg"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a href="javascript:void(0)" data-value="redy"><i class="icon-blank"></i> Redy</a></li>
						<li><a href="javascript:void(0)" data-value="journal"><i class="icon-blank"></i> Journal</a></li>
						<li><a href="javascript:void(0)" data-value="simplex"><i class="icon-blank"></i> Simplex</a></li>
						<li><a href="javascript:void(0)" data-value="slate"><i class="icon-blank"></i> Slate</a></li>
						<li><a href="javascript:void(0)" data-value="spacelab"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a href="javascript:void(0)" data-value="united"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				
				<div class="btn-group pull-right">
					<a href="javascript:void(0)" data-toggle="dropdown" class="btn dropdown-toggle">
						<i class="icon-user"></i><span class="hidden-phone"> admin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0)">Profile</a></li>
						<li class="divider"></li>
						<li><a href="login.html">Logout</a></li>
					</ul>
				</div>
				<div class="btn-group pull-right" style="line-height:28px">
			    	<span id="localTime"></span>
			    </div>
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="javascript:void(0)">Visit Site</a></li>
						<li>
							<form class="navbar-search">
								<input type="text" name="query" class="search-query span2" placeholder="Search">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
		<div class="tab">
			<ul id="navList">
				<li></li>
				<li><a href="myHome.jsp" class="menu" id="MyLinks1_MyHomeLink">首页</a></li>
				<li><a href="personalInformation.jsp" class="menu">个人白皮书</a></li>
				<li><a href="grow.jsp" class="menu">成长双轨道</a></li>
				<li><a href="movie.jsp" rel="nofollow" class="menu">电影人</a></li>
				<li><a href="attention.jsp" class="menu">Online关注点</a></li>
				<li><a href="wellKnownSaying.jsp" class="menu">深刻的话</a>
				<li><a href="celebrity.jsp" class="menu">牛逼的人</a></li>
				<li><a href="funPoints.jsp" class="menu">有趣的事儿</a></li>
				<li><a href="memo.jsp" class="menu">月度备忘及规划</a></li>
				<li><a href="contacts.jsp" class="menu">六度人脉</a></li>
				<li><a href="journey.jsp" class="menu">脚下发动机</a></li>
				<li><a href="goodHabitDevelop.jsp" class="menu">好习惯养成日记</a></li>
				<li><a href="goodBook.jsp" class="menu">好书籍</a></li>
				<li><a href="goodBrand.jsp" class="menu">好品牌</a></li>
				<li><a href="doBefore35.jsp" class="menu">35岁之前做人做事</a></li>
			</ul>
			<div class="blogStats">
				随笔- 82&nbsp;
				文章- 2&nbsp;
				评论- 19&nbsp;	
			</div>
	</div>
	</div>
    <div class="container">