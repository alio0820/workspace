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
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
<!--
body {
	background-image: url(../images/grid.gif);
}
-->
</style>
</head>

<body>
<table width="95%" border="0" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199" valign="top">
  <tr  bgcolor="EEF4FF"  height="25">
    <td width="9%"><div align="center"><strong>资料名称</strong></div></td>
    <td width="81%" align="center">&nbsp;
        <input name="searchName" type="text" class="txt1" size="70" style="width:98% "></td>
    <td width="10%" align="center"><img src="../images/find.gif" onClick="alert('查询')" style="cursor:pointer "/></td>
  </tr>
</table>
<br/>
<table width="95%" border="0" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199" valign="top">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="4" align="center"><strong><font color="#FFFFFF" size="4">xxx合同 合同资料</font></strong></td>
    <tr bgcolor="EEF4FF">
	  <td width="7%" height="25" align="center"><strong>序号</strong></td>
      <td width="40%" height="25"><div align="center"><strong>文档资料名称</strong></div></td>
      <td width="9%" height="25"><div align="center"><strong>成文时间</strong></div></td>
      <td width="40%" height="25"><div align="center"><strong>备注</strong></div></td>
      
    </tr>
  </thead>
  <tbody>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
	  <td width="7%" height="25" align="center">1</td>
      <td width="40%" height="25"> <div align="left"><a href="#" onClick="alert('下载资料')">合同</a> </div></td><td width="9%" height="25"><div align="center">2006-08-15</div></td>
      <td width="40%" height="25"><div align="left">备注信息..</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
	<td width="7%" height="25"  align="center">2</td>
      <td width="40%" height="25"><div align="left"><a href="#" onClick="alert('下载资料')">履约保函</a></div></td>
      <td width="9%" height="25"><div align="center">2006-08-11</div></td>
      <td width="40%" height="25"><div align="left">备注信息备注信息..</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td height="25"  align="center">3</td>
      <td height="25"><div align="left"><a href="#" onClick="alert('下载资料')">验收单</a></div></td>
      <td height="25"><div align="center">2006-08-10</div></td>
      <td height="25"><div align="left">备注信息..</div></td>
    </tr>
  </tbody>
</table>
<p align="center">&nbsp;
<img src="../images/return.gif" onClick="window.location='contractList.jsp'"  style="cursor:pointer "/>
</p>
<br/>
</body>
</html>
