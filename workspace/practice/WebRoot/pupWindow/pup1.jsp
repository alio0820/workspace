<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>弹出窗口</title>
    <link rel="stylesheet" type="text/css" href="motaiduihk.css"/>
    <script type="text/javascript" src="../jquery-1.7.1.js"></script>
	<script type="text/javascript" src="pup.js"></script>
	<script type="text/javascript" src="motaiduihk.js"></script>
    <script  type= "text/javascript">
    function test(){
				var str = document.getElementById('ps111').innerHTML;
				var dialog = new ModelDialog({
				template : str,
				//shadowOpy : 0.1,
				//dragable : false
				dragInWin : false
				//area : [0,500,0,500]
				});
					dialog['onbi'] = function(){
						;
					};
	}
	
	function winopen(){
		window.open( 'pup2.jsp','newwindow','height=100, width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');  
	}
	</script>
  </head>
  <body style='height:1200px;background:rgb(255,255,255)'>
    <input type='button' value='点击-弹出窗口' onclick='winopen()' />
    <input type='button' value='弹出模态对话框' onclick='test()' />
    <div  style='width:40px;height:30px;right:0px;top:200px;position:fixed;background:lightblue;'>
    	<img id='pp' src='../images/tt.jpg' style='width:40px;height:30px'></img>
    </div>
    <div id='ps111' style='margin:0 auto;width:300px;height:200px;border:solid 1px lightblue;display:none;'>
    </div>
  </body>
</html>
