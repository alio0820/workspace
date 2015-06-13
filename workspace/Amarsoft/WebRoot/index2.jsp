<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>安硕网上订餐系统</title>
    <link rel="icon" href="images/fruit.ico" type="image/x-icon"/>
    <link type="text/css" rel="stylesheet" href="css/order.css"/>
    <script src="js/jquery-1.7.1.js"></script>
	<script src="js/order.js"></script>
  </head> 
  <body>
  	<h2>安硕订餐系统</h2>
  	<h4>关注餐饮品质，只为提高研发效率</h4>
  	<div id="order_div">
  		<div class='tool'>
  			<div class='today menu'>今天订餐</div>
  			<div class='tomorow menu'>明天预订</div>
  			<div class='record menu'>饮食记录</div>
  		</div>
  		<div class="content" id="content1">
	  		<table>
	  			<tr>
	  				<td>套餐</td>
	  				<td>选项</td>
	  				<td>套餐品种</td>
	  			</tr>
	  			<tr>
	  				<td rowspan='3'></td>
	  				<td><input type="radio" name='foodType'/></td>
	  				<td>8元</td>
	  			</tr>
	  			<tr>
	  				<td><input type="radio" name='foodType'/></td>
	  				<td>10元</td>
	  			</tr>
	  			<tr>
	  				<td><input type="radio" name='foodType'/></td>
	  				<td>12元</td>
	  			</tr>
	  			<tr>
	  				<td colspan="3"><input type="button" value='订餐' style='float:right'/></td>
	  			</tr>
	  		</table>
  		</div>
  	</div>
  </body>
</html>