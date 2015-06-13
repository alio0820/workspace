<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  		<script>
  			function yincang_top(){
  				document.getElementById("top_manager_all").style.display="none";
  				parent.document.getElementById('frame1').rows="26,*,25";            //获取父窗口的frame1的rows属性
  			}
  			function zhankai_top(){
  				document.getElementById("top_manager_all").style.display="block";
  				parent.document.getElementById('frame1').rows="77,*,25";
  			}
  			function yincang_left(){
  				parent.document.getElementById('frame2').cols="0,*";
  			}
  			function zhankai_left(){
  				parent.document.getElementById('frame2').cols="181,*";
  			}
  		</script>
		<style type="text/css">
    	body{
    		font-size:13px;
    		margin:0;    		
    	}
    	.manager_top{
    		background:url(images/top.jpg);width:950px;height:51px;float:left;display:inline     <!--这个float:left必须加上-->
    	}
    	.manager_top_2{
    		background:url(images/top_manager_2.png);width:auto;height:51px;
    	}
    	.manager_top_3{
    		background:url(images/top.jpg);width:50px;height:51px;float:right;
    	}
    	.manager_top2{
    		background:url(images/top2_manager.png);width:auto;height:26px;padding-left:8px;padding-top:5px;z-index:100;color:rgb(0,122,195);
    	}
    	a{
    	text-decoration:none;
    	}
       </style>
  </head>
  
  <body>
 		<div id ="top_manager_all"style="width:auto;height:51px;overflow:hidden;">
	    	<div class="manager_top"></div>
	    	<div class="manager_top_2"></div>
    	</div>
    	<div style="background-color:rgb(25,139,201);padding-left:8px;padding-right:8px;">
	    	<div class="manager_top2" >
		    		<a href="#" onclick="zhankai_left()">展开菜单</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    		<a href="#" onclick="yincang_left()">隐藏菜单</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    		<a href="#" onclick="">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    		<a href="#" onclick="">刷新页面</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    		<a href="#" onclick="">刷新在线人员</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    		<a href="#" onclick="zhankai_top()">展开顶部</a>&nbsp;&nbsp;&nbsp;&nbsp;
		    		<a href="#" onclick="yincang_top()">隐藏顶部</a>&nbsp;&nbsp;&nbsp;&nbsp;
	    	</div>
    	</div>
  </body>
</html>
