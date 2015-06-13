<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>">
	<link rel="icon" href="images/fruit.ico" type="image/x-icon"/>
	<title>Amarsoft研发部信息平台-注册成功</title>
	<link href="css/login.css" type=text/css rel=stylesheet>
</head>
<body>
	<div id=div1>
	  	<table id=login height="100%" cellSpacing=0 cellPadding=0 width=800 align=center>
		    <tbody>
		      <TR id=main style="background-image:none">
		        <TD><table height="100%" cellspacing=0 cellpadding=0 width="100%">
		          <tbody>
		            <tr height=120>
		              <td colspan=4 style="font-size:45px;text-align:center;padding-left:40px;overflow:hidden;">
		              	<img src='images/logo2.png'></img>
		              </td>
		            </tr>
		            <tr height="60">
		              <td colspan=4 style="font-size:36px;text-align:center;font-weight:bold">注册成功！</td>
		            </tr>
		            <tr height="40">
		              <td colspan=4 style="font-size:20px;text-align:center;">
		              	<a href='login.htm' style="color:#F09B21;text-decoration:underline">返回登陆页面</a>
		              </td>
		            </tr>
		            
		            <tr>
		              <td colspan=4>&nbsp;</td>
		            </tr>
		          </tbody>
		        </table></TD>
		      </TR>
		      <TR id=root height=104>
		        <TD>&nbsp;</TD>
		      </TR>
		    </tbody>
	  	</table>
	</div>
</body>
</html>