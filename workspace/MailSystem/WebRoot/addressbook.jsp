<%@ page language="java" import="java.util.*,com.web.office.addressbook.AddressbookAction" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>通讯录子系统</title>
    <link rel="icon" href="images/fruit_mail.ico" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="css/addressbook.css"/>
    <script src="js/jquery-1.7.1.js"></script>
    <script src="js/lhgdialog/lhgdialog.min.js"></script>    
    
 	<link rel="stylesheet" href="css/demo.css" type="text/css">
	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="js/jquery.ztree.core-3.1.js"></script>
<!--	<script type="text/javascript" src="js/jquery.ztree.excheck-3.1.js"></script>-->
<!--	<script type="text/javascript" src="js/jquery.ztree.exedit-3.1.js"></script>-->
	<style type="text/css">
		.ztree li a.level0 {
			width:205px;
			height:20px;
			text-align:center;
			display:block;
			background:url(js/jqgrid/css/images/ui-bg_gloss-wave_55_5c9ccc_500x100.png);
			background-position:0px -40px;
			border:1px silver solid;
			border-right:none;
			border-top:none;
		}
		.ztree li a.level0.cur {background-color: #66A3D2; }
		.ztree li a.level0 span {display: block; color:#333333; padding-top:1px; font-size:12px;word-spacing: 2px;}
		.ztree li a.level0 button {	float:right; margin-left: 10px; visibility: visible;display:none;}
		.ztree li button.switch.level0 {display:none;}
		.ztree li button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
	</style>
		
	<!--下面的css路径和js路径请与你自己环境内的向匹配--> 
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqgrid/css/jquery-ui-1.8.2.custom.css" />
	<link rel="stylesheet" type="text/css" media="screen" href="js/jqgrid/css/ui.jqgrid.css" />
	<script type="text/javascript" src="js/jqgrid/js/i18n/grid.locale-en.js" ></script>
	<script type="text/javascript" src="js/jqgrid/js/jquery.jqGrid.min.js" ></script>
<!--	<script src="js/jqgrid/js/AppUtils.js" type="text/javascript"></script>-->
	
<!--	<script src="dwr/engine.js"></script>-->
<!--	<script src="dwr/util.js"></script>-->
<!--	<script src="dwr/interface/AddressbookAction.js"></script>-->
	<script src="js/addressbook.js"></script>
 </head>

<BODY>
<h1>通讯录管理</h1>
<h6>[基于WEB的办公自动化系统]</h6>
<div class="content_wrap">
	<div class="zTreeDemoBackground">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="right">
		<table id="list4"></table>
		<div id="s4pager"></div>
		<script type='text/javascript'>
			addressbookjs.jstreeData();
			addressbookjs.jqgridData();		
		</script>
	</div>
</div>
</BODY>
</HTML>

