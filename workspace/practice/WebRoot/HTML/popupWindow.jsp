<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>弹出IE无边窗口</title>
    <script type="text/javascript">
    	function OpenWindow(){
    		var PFW;
    		PFW= window.open('css eg2_1.html','noscroll','left=120,top=70,fullscreen,width=550,height=450,scrollbars=no');
    		PFW.resizeTo(560,420);
    		PFW.moveTo(115,85);
    	}
    </script>
  </head>
  <body>
    	<input type="button" value="打开IE无边窗口" onclick="OpenWindow()"/>
  </body>
</html>
