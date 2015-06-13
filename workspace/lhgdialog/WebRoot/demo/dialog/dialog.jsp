<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>zhaicd的dialog模板库</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <link rel="icon" href="ico.ico" type="image/x-icon"/>
    <script type="text/javascript" src="lhgdialog/lhgcore.lhgdialog.min.js"></script>
    <script	src ="zdialog.js"></script>
    <style type="text/css">
    	html,body{
    		background:#EEEEEE;
    		color:#000000;
    		font-size:12px;
    		margin:0;
    		width:100%;    		    		
    	}
    	.main{   		   	
    		width:900px;	
    		min-height:320px;
    		padding:10px;
    		margin:10 auto;
    		text-align:center;
    		border: 1px solid #D3D3D3;
    		background:#FFFFFF;   		
    	}
    	.header {
		    height: 40px;
		    padding: 0 20px;
		}
		.hd_logo {
		    float: left;
		    padding-top: 10px;
		}
		a{
			text-decoration:none;
		}
		.hd_logo a{
			font-style:italic;
			font-size:19px;
		}
		.hd_nav {
		    float: right;
		    line-height: 18px;
		    padding-top: 15px;
		}
		
    	.button {
		    background: none repeat scroll 0 0 #F3F3F3;
		    border: 1px solid #DDDDDD;
		    cursor: pointer;
		    font-size: 12px;
		    margin: 0;
		    padding: 2px 8px;
		}
    	.cbody h2 {
		    background: none repeat scroll 0 0 #F2F2F2;
		    color: #FF4314;
		    font-size: 15px;
		    padding: 5px;
		    text-align:left;
		}
    	.div1{
    		line-height:35px;
    	}
    	.line {
		    background: none repeat scroll 0 0 #3B62A7;
		    font-size: 0;
		    height: 2px;
		    margin: 5px 0px;
		}
    </style>
    <script type="text/javascript">
    	function getElementsByClassName(n) {
		    var classElements = [],allElements = document.getElementsByTagName('*');
		    for (var i=0; i< allElements.length; i++ )
		   {
		       if (allElements[i].className == n ) {
		           classElements[classElements.length] = allElements[i];
		       }
		   }
		   return classElements;
		}
    	window.onload = function(){
    		getElementsByClassName("main")[0].style.height = document.body.clientHeight-42;
    	};
    	window.onresize = function(){
    		getElementsByClassName("main")[0].style.height = document.body.clientHeight-42;
    	};
    </script>
  </head>
  <body>
  <div class="main">
  	  <div class="header">
  	  	<div class="hd_logo">
  	  		<a href="#">Zhaicd.zdialog高级模板库</a>
  	  	</div>
  	  	<div class="hd_nav">
			<a href="#" title="首页">首页</a>
			|
			<a href="#" title="开发中...">API文档</a>
			| 基础示例 |
			<a href="#" title="开发中...">传值示例</a>
			|
			<a href="#" title="开发中...">动画示例</a>
			|
			<a href="#" title="开发中...">框架示例</a>
			|
			<a href="#" title="开发中...">更新记录</a>
		</div>
  	  </div>
  	  <div class="cbody">
	  	  <div class="line">&nbsp;</div>
		  <h2>配置参数演示</h2>
		  <div class="div1">
		    <input id="notice" type="button" class="button" value="公告" onclick="zdialog.notice()"/>
		    <input id="iframe" type="button" class="button" value="框架页" onclick="zdialog.iframe()"/>
		    <input id="okAndcancel" type="button" class="button" value="确定和取消" onclick="zdialog.okAndcancel()"/>
		    <input id="nomaxAndmin" type="button" class="button" value="取消最大最小化" onclick="zdialog.nomaxAndmin()"/>
		    <input id="maxAndmin" type="button" class="button" value="调用最大最小化" onclick="zdialog.maxAndmin()"/>
		    <input id="custombutton" type="button" class="button" value="自定义按钮" onclick="zdialog.custombutton()"/>
		    <input id="setsize" type="button" class="button" value="设置大小" onclick="zdialog.setsize()"/>
		    <input id="fixed" type="button" class="button" value="静止定位" onclick="zdialog.fixed()"/>
		    <input id="locked" type="button" class="button" value="锁屏" onclick="zdialog.locked()"/>
		    <input id="nodrag" type="button" class="button" value="禁止拖动" onclick="zdialog.nodrag()"/>
		    <input id="initAndclose" type="button" class="button" value="初始和关闭的回调" onclick="zdialog.initAndclose()"/>	    
		  </div>
		  <h2>扩展方法演示</h2>
		  <div class="div1">
		    <input id="reload" type="button" class="button" value="刷新" onclick="zdialog.reload()"/>
		  </div>
		  <h2>外部方法演示</h2>
		  <div class="div1">
		    <input id="dialogalert" type="button" class="button" value="dialog.alert" onclick="zdialog.dialogalert()"/>
		    <input id="dialogconfirm" type="button" class="button" value="dialog.confirm" onclick="zdialog.dialogconfirm()"/>
		    <input id="dialogprompt" type="button" class="button" value="dialog.prompt" onclick="zdialog.dialogprompt()"/>
		    <input id="dialogtips" type="button" class="button" value="dialog.tips" onclick="zdialog.dialogtips()"/>
		  </div>
	  </div>
  </div>
  </body>
</html>
