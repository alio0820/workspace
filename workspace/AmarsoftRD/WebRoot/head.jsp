<%@ page language="java" import="java.util.*,com.bean.*,com.action.*,com.common.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBliC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<%session.setAttribute("basePath", basePath);%>
		<title><%if(title==null||title.equals("")){%>Amarsoft研发部信息平台<%}else{out.println(title);}%></title>
		<link rel="icon" href="images/fruit.ico" type="image/x-icon"/>
		<meta content="MSHTML 6.00.6000.16825" name=GENERATOR>
		<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
		<meta name="keywords" content="Amarsoft 研发部">
		<meta name="description" content="安硕研发部内部网站">
		<meta name="robots" content="all">
		<meta name="author" content="author zhaicandong">
<%--		<link href="css/stunicholls.css" type=text/css rel=stylesheet>--%>
        <link href="css/pro_left_right.css" type=text/css rel=stylesheet>
		<link href="css/jkstyle.css" rel="stylesheet" type="text/css">
		<link href="css/style.css" rel="stylesheet" type="text/css">		
		<link href="css/css.css" rel="stylesheet" type="text/css" />
		<link href="css/content.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="css/header.css">
		<link rel="stylesheet" type="text/css" href="css/minibox.css">
        <script src="js/jquery-1.7.1.js"></script>
	    <script src="js/jquery.color.js"></script>
	    <script src="js/content.js"></script>
	    <%
	    	Object  userBean = session.getAttribute("userBean");
	    	if(userBean==null){
	    %>
	    	<script>
		    	/*$(document).ready(function(){
		    		$(document).keyup(function(event){
		    			if(event.keyCode==13&&event.ctrlKey)
		    				$('#login_link').trigger('click');
		    		});
		 		});*/
	    	</script>
	    <%}
	    	UserBean user = null;
	    	if(userBean!=null) user = (UserBean)userBean;
	    	else {
	    		user = UserBean.getUserBean();
	    		session.setAttribute("userBean",user);
	    	}
	    	String userName = user.getUserName();
	    	int roleId = Integer.parseInt(user.getRoleId());
	    	String nickName = user.getNickName();
	    	if(Common.isBlank(nickName)) nickName = userName;
	    %>
	</head>
	<body>
	<a href="javascript:void(0)" name="top"></a>
	<img src="images/pic/top_arrow.png" class="top_arrow" id="top_arrow">
		<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a name="brand" class="brand" href="javascript:void(0)" style="white-space:nowrap;"> 
<%--					<img alt="Logo" src="images/logo20.png"> --%>
<%--					<span style="font-size:25px;">Amarsoft</span>--%>
						<img alt="logo" src="images/amarsoft_logo.png">
					<span style="margin-left:5px;margin-top:14px;font-size:15px;float:left">RD Information Platform</span>
				</a>
				
				<div tabindex="0" class="btn-group pull-right theme-container">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="javascript:void(0)"><i class="icon-blank icon-ok"></i> Classic</a></li>
						<li><a data-value="cerulean" href="javascript:void(0)"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="javascript:void(0)"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="javascript:void(0)"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="javascript:void(0)"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="javascript:void(0)"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="javascript:void(0)"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="javascript:void(0)"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="javascript:void(0)"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				
				<div class="btn-group pull-right">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)">
						<i class="icon-user"></i>
						<span id="user" class="hidden-phone"><%=nickName%></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li>
							<%if(roleId==4){%>
							<a id="login_link" href="javascript:void(0)" onclick="contentjs.login(this)">login</a>
							<%}else{%>
							<a href="personalInfo.jsp">Profile</a>
							<%}%>
						</li>
						<li class="divider"></li>
						<li><a href="servlet/DestroySession.do">Logout</a></li>
					</ul>
				</div>
				<div style="line-height:32px;margin-right:10px;" class="btn-group pull-right">
					<span style="font-size:13px;"><%=Common.getTodayByLC()%></span>
			    	<span id="localTime" style="margin-left:5px;"></span>
			    </div>
				<div class="top-nav nav-collapse" style="float:left;">
					<ul class="nav">
						<li><a href="javascript:void(0)">Visit Site</a></li>
						<li>
							<form class="navbar-search">
								<input type="text" placeholder="Search" class="search-query span2" name="query">
							</form>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div style="width:100%">