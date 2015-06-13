<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<title>TouchPal OEM 运营系统</title>
	<link rel="shortcut icon" href="images/a.ico">
	<meta name="description" content="Amarsoft, a fully featured, responsive, HTML5,Exam.">
	<meta name="author" content="cdzhai">
	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="js/html5.js"></script>
	<![endif]-->
	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-classic.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>
	<link href='css/content.css' rel='stylesheet'>
</head>

<body>
		<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a href="javascript:void(0)" class="brand" name="brand" style=""> 
					<img src="images/touchpal-title.png" alt="logo">
					<!-- <span style="margin-left:5px;margin-top:14px;font-size:15px;float:left">Life Service Operation platform</span> -->
					<span>TouchPal-OEM运营系统</span>
				</a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> admin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Profile</a></li>
						<li class="divider"></li>
						<li><a href="login.html">Logout</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="#">Visit Site</a></li>
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</form>
						</li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
		<div class="container-fluid">
		<div class="row-fluid" id='main'>
				
			<!-- left menu starts -->
			<div class="span2 main-menu-span">
				<div class="well nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li class="nav-header hidden-tablet">Main</li>
						<li><a class="ajax-link" href="#" tar='dashboard'><i class="icon-home"></i><span class="hidden-tablet"> 首页</span></a></li>
						<li><a class="ajax-link" href="javascript:void(0)" tar='ui'><i class="icon-edit"></i><span class="hidden-tablet"> 在线考试</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='myTestPaper'><i class="icon-star-empty"></i><span class="hidden-tablet"> 我的试卷</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='checkPaper'><i class="icon-star-empty"></i><span class="hidden-tablet"> 查看答卷</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='applyTest'><i class="icon-star-empty"></i><span class="hidden-tablet"> 申请考试</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='myPractice'><i class="icon-star-empty"></i><span class="hidden-tablet"> 我的练习</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='applyPractice'><i class="icon-star-empty"></i><span class="hidden-tablet"> 申请练习</span></a></li>
						<li><a class="ajax-link" href="javascript:void(0)" tar='ui'><i class="icon-leaf"></i><span class="hidden-tablet"> 考试设计</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='businessPoint'><i class="icon-star-empty"></i><span class="hidden-tablet"> 试题点管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='topicDesign'><i class="icon-star-empty"></i><span class="hidden-tablet"> 题目设计</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='topicTypeManage'><i class="icon-star-empty"></i><span class="hidden-tablet"> 题型管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='topicBank'><i class="icon-star-empty"></i><span class="hidden-tablet"> 题库管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='topicCollect'><i class="icon-star-empty"></i><span class="hidden-tablet"> 试题征集管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='topicForCollect'><i class="icon-star-empty"></i><span class="hidden-tablet"> 试题应征管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='examSort'><i class="icon-star-empty"></i><span class="hidden-tablet"> 考试类别管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='testPaper'><i class="icon-star-empty"></i><span class="hidden-tablet"> 试卷管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='testPaperGenerate'><i class="icon-star-empty"></i><span class="hidden-tablet"> 试卷生成</span></a></li>
						<li><a class="ajax-link" href="javascript:void(0)" tar='ui'><i class="icon-cog"></i><span class="hidden-tablet"> 考试管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='testArrange'><i class="icon-star-empty"></i><span class="hidden-tablet"> 考试安排</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='testPackage'><i class="icon-star-empty"></i><span class="hidden-tablet"> 考试包安排</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='practiceArrange'><i class="icon-star-empty"></i><span class="hidden-tablet"> 练习安排</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='re-evaluation'><i class="icon-star-empty"></i><span class="hidden-tablet"> 人工复评</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='resultManage'><i class="icon-star-empty"></i><span class="hidden-tablet"> 成绩管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='addmission'><i class="icon-star-empty"></i><span class="hidden-tablet"> 准考证管理</span></a></li>
						<li><a class="ajax-link" href="javascript:void(0)" tar='ui'><i class="icon-eye-open"></i><span class="hidden-tablet"> 监控管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='testMonitoring'><i class="icon-star-empty"></i><span class="hidden-tablet"> 考试监控</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='testProgress'><i class="icon-star-empty"></i><span class="hidden-tablet"> 考试进度监控</span></a></li>
						<li><a class="ajax-link" href="javascript:void(0)" tar='ui'><i class="icon-screenshot"></i><span class="hidden-tablet"> 数据分析</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='scoreDistribution'><i class="icon-star-empty"></i><span class="hidden-tablet"> 分数分布</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='optionDistribution'><i class="icon-star-empty"></i><span class="hidden-tablet"> 选项分布</span></a></li>
						<li><a class="ajax-link" href="javascript:void(0)" tar='ui'><i class="icon-user"></i><span class="hidden-tablet"> 系统管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='userManage'><i class="icon-star-empty"></i><span class="hidden-tablet"> 用户管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='roleManage'><i class="icon-star-empty"></i><span class="hidden-tablet"> 角色管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='departmentManage'><i class="icon-star-empty"></i><span class="hidden-tablet"> 部门管理</span></a></li>
						<li class='sub-menu'><a class="ajax-link" href="#" tar='layoutSet'><i class="icon-star-empty"></i><span class="hidden-tablet"> 布局设置</span></a></li>
						<li><a class="ajax-link" href="#" tar='ui'><i class="icon-eye-open"></i><span class="hidden-tablet"> UI Features</span></a></li>
						<li><a class="ajax-link" href="#" tar='form'><i class="icon-edit"></i><span class="hidden-tablet"> Forms</span></a></li>
						<li><a class="ajax-link" href="#" tar='chart'><i class="icon-list-alt"></i><span class="hidden-tablet"> Charts</span></a></li>
						<li><a class="ajax-link" href="#" tar='typography'><i class="icon-font"></i><span class="hidden-tablet"> Typography</span></a></li>
						<li><a class="ajax-link" href="#" tar='gallery'><i class="icon-picture"></i><span class="hidden-tablet"> Gallery</span></a></li>
						<li class="nav-header hidden-tablet">Sample Section</li>
						<li><a class="ajax-link" href="#" tar='table'><i class="icon-align-justify"></i><span class="hidden-tablet"> Tables</span></a></li>
						<li><a class="ajax-link" href="#" tar='calendar'><i class="icon-calendar"></i><span class="hidden-tablet"> Calendar</span></a></li>
						<li><a class="ajax-link" href="#" tar='grid'><i class="icon-th"></i><span class="hidden-tablet"> Grid</span></a></li>
						<li><a class="ajax-link" href="#" tar='file-manager'><i class="icon-folder-open"></i><span class="hidden-tablet"> File Manager</span></a></li>
						<li><a href="#" tar='tour'><i class="icon-globe"></i><span class="hidden-tablet"> Tour</span></a></li>
						<li><a class="ajax-link" href="#" tar='icon'><i class="icon-star"></i><span class="hidden-tablet"> Icons</span></a></li>
						<li><a href="#" tar='error'><i class="icon-ban-circle"></i><span class="hidden-tablet"> Error Page</span></a></li>
						<li><a href="#" tar='login'><i class="icon-lock"></i><span class="hidden-tablet"> Login Page</span></a></li>
					</ul>
					<label id="for-is-ajax" class="hidden-tablet" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
				</div><!--/.well -->
			</div>
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			<%@ include file="dashboard.jsp"%>
		</div>
		
		<hr>
		<div class="modal hide fade" id="myModal">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3>Settings</h3>
			</div>
			<div class="modal-body">
				<p>Here settings can be configured...</p>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">Close</a>
				<a href="#" class="btn btn-primary">Save changes</a>
			</div>
		</div>

		<footer>
			<p class="pull-left">&copy; <a href="http://weibo.com/xingyez" target="_blank">cdzhai</a> 2013</p>
			<p class="pull-right">Powered by: <a href="http://www.amarsoft.com" target="_blank">Amarsoft</a></p>
		</footer>
		<div style='display:none'>
			<input type='button'id='save_success' class="btn btn-primary noty" data-noty-options='{"text":"保存成功","layout":"topLeft","type":"success"}'/>
			<input type='button'id='publish_success' class="btn btn-primary noty" data-noty-options='{"text":"发布成功","layout":"topLeft","type":"success"}'/>
			<input type='button'id='save_error' class="btn btn-primary noty" data-noty-options='{"text":"保存失败","layout":"bottomLeft","type":"error"}'/>
			<input type='button'id='del_success' class="btn btn-primary noty" data-noty-options='{"text":"删除成功","layout":"topLeft","type":"success"}'/>
			<input type='button'id='action_error' class="btn btn-primary noty" data-noty-options='{"text":"操作失败","layout":"bottomLeft","type":"error"}'/>
		</div>
	</div>

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	<script src="js/content-app.js"></script>
	<script src="js/content-plug.js"></script>
	<script src="dwr/engine.js"></script>
	<script src="dwr/util.js"></script>
</body>
</html>
