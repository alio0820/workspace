<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>My JSP 'ResultManage.jsp' starting page</title>
    <style type="text/css">
    	body{
    		margin:0;
    		overflow:auto;
    		font-size:13px;
    		color:rgb(65,122,193);
    	}
    	.ResultM_1{
    		background:url(images/ResultManager_1.png);width:362px;height:57px;float:left;
    	}
    	.ResultM_2{
    		background:rgb(244,251,248);height:38px;padding-right:0px;
    	}
    	.ResultM_4{
    		background:rgb(244,251,248);height:38px;
    	}
    </style>
    <script>
    	function query(){
    	}
    </script>
  </head>  
  <body>
  	<div style="background-color:rgb(25,139,201);width:auto;height:100%;padding-right:8px;padding-left:8px;">
    	<div id="manager_right_main" style="background:white;width:100%;height:100%;">    	
	  		<div style="background:url(images/ResultManager_2.png);width:auto;height:57px;">
		    	<div class="ResultM_1"></div>
		    	<div style="float:right;height:57px;width:100px;padding-top:10px;"><input type="button" value="显示查询" onclick="query()"/></div>
	    	</div>
	    	<div class="ResultM_2">
	    		<table style="font-size:13px;">
		    		<tr>
		    			<td width="100px;">考试分类</td>
		    			<td width="250px;">考试名称</td>
		    			<td width="50px;">分数</td>
		    			<td width="50px;">时间</td>
		    			<td width="50px;">模式</td>
		    			<td width="50px;">应参加</td>
		    			<td width="50px;">实参加</td>
		    			<td width="540px">有效期</td>
		    			<td width="50px;">操作</td>
		    		</tr>
	    		</table>
	    	</div>
	    	<div class="ResultM_3">	    		
	    	</div>
	    	<div class="ResultM_4"></div>
		</div>
  </div>
  </body>
</html>
