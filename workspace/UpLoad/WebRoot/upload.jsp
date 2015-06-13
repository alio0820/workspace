<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'upload.jsp' starting page</title>
  </head>
   
  <body>
    	<form action="OutDataServlet" method="post" enctype="application/x-www-form-urlencoded">
    		<table style="text-align:right">
    			<tr>
    				<td>上传文件：</td>
    				<td><input type="file" name="file"/></td>
    			</tr>
    			<tr>
    				<td>请求参数：</td>
    				<td><input type="text" name="request" style="width:200px"/></td>
    			</tr>
    			<tr>
    				<td></td>
    				<td><input type="submit" value="提交" style="width:50px"/></td>
    			</tr>
    		</table>
    	</form>
  </body>
</html>
