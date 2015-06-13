<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<script>			
    		var time=3;
    		function subBox(){	
    			time=time -1;
   				document.getElementById('subDiv').innerHTML=time;
    			if(time==0)		tijiao();
    		}
    		setInterval("subBox()",1000);											//马上执行一次，然后隔一秒执行一次
    	</script>
  </head>
  <body>
  		<div id="subDiv">3</div>
    	<input type="button" value="你好" onclick="box()">
    	
  </body>
</html>
