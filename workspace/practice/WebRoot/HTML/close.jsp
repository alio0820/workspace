<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>关闭页面</title>
    <script type="text/javascript">
    function win_close(){
    	window.opener=null;
    	window.open("", "_self"); 
    	window.close();
    }
    </script>
  </head>
  <body>
    	<input type="button" value="关闭页面" onclick="win_close()"/>
  </body>
</html>
