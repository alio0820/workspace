<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>项目资料维护</title>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
<!--
body {
	background-image: url(images/grid.gif);
}
-->
</style>
</head>

<body>
<br/>
<table width="95%" border="0" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199" valign="top">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="2" align="center"><strong><font color="#FFFFFF" size="4">金审工程工期选择</font></strong></td>
    <tr bgcolor="EEF4FF">
      <td width="20%" rowspan="2" align="center"><strong>金审工程工期</strong></td>
      <td height="25"><div align="center">金审一期<strong>          
        <input type="radio" name="radiobutton" value="radiobutton">
      </strong></div></td>
    </tr>
    <tr bgcolor="EEF4FF">
	  <td height="25"><div align="center"><strong>
      </strong></div>	    <div align="center">金审二期<strong>          
      <input type="radio" name="radiobutton" value="radiobutton" checked>
      </strong></div>	    <div align="center"></div></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<p align="center">&nbsp;
<img src="images/confirm.gif" onClick="alert('您选择的工期已保存！')"  style="cursor:pointer "/>
</p>
<br/>
</body>
</html>
