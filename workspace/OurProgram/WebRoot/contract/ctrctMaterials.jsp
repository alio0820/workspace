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
<tr  bgcolor="EEF4FF"  height="25"><td width="10%"><div align="center"><strong>资料名称</strong></div></td>
<td width="81%" align="center">&nbsp;<input name="searchName" type="text" class="txt1" size="70" style="width:98% "></td>
<td width="9%" align="center"><img src="../images/find.gif" onClick="alert('查询')" style="cursor:pointer "/></td>
</tr>
</table>
<br/>
<table width="95%" border="0" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199" valign="top">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="4" align="center"><strong><font color="#FFFFFF" size="4">xxx合同 合同资料</font></strong></td>
    <tr bgcolor="EEF4FF">
		<td width="4%" align="center">&nbsp;</td>
      <td width="37%" height="25"><div align="center"><strong>文档资料名称</strong></div></td>
      <td width="11%" height="25"><div align="center"><strong>成文时间</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="40%" height="25"><div align="center"><strong>备注</strong></div></td>
      
    </tr>
  </thead>
  <tbody>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
		<td width="4%" align="center"><input type="radio" name="mtUuid"/></td>
      <td width="37%" height="25"><div align="center"> <a href="#" onClick="alert('下载资料')">合同</a>  </div></td>
      <td width="11%" height="25"><div align="center">2006-08-15</div></td>
      <td width="40%" height="25"><div align="center">备注信息..</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
	<td width="4%" align="center"><input type="radio" name="mtUuid"/></td>
      <td width="37%" height="25"><div align="center"><a href="#" onClick="alert('下载资料')">履约保函</a></div></td>
      <td width="11%" height="25"><div align="center">2006-08-11</div></td>
      <td width="40%" height="25"><div align="center">备注信息..</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td align="center"><input type="radio" name="mtUuid"/></td>
      <td height="25"><div align="center"><a href="#" onClick="alert('下载资料')">验收单</a></div></td>
      <td height="25"><div align="center">2006-08-10</div></td>
      <td height="25"><div align="center">备注信息..</div></td>
    </tr>
  </tbody>
</table>
<p align="center">
<img src="../images/delete.gif"  onClick="alert('删除')" style="cursor:pointer "/>&nbsp;
<img src="../images/return.gif" onClick="window.location='contractList.jsp'"  style="cursor:pointer "/>
</p>
<br/>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
   <tr class="lc2" bgcolor="#6699CC"> 
    <td height="26" colspan="2"> <div align="center"><strong><font color="#FFFFFF" size="4">合同资料维护</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF"> 
    <td width="13%" height="29"><div align="left">资料名称</div></td>
    <td width="87%"> &nbsp;<input name="prjName" type="text" class="txt1" size="32" style="width:98% "> 
    </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF"> 
    <td><div align="left">资料上传</div></td>
    <td> &nbsp;<input type="file" style="width:98% "></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF"> 
    <td height="25"><div align="left">备注</div></td>
    <td >
	&nbsp;<textarea name="coment" rows="2" style="width:98% ">
	</textarea> 
    </td>
  </tr>
</table>
<p align="center"> 
  <img src="../images/add.gif"  onClick="alert('添加')" style="cursor:pointer "/>&nbsp;
<img src="../images/modify.gif"  onClick="alert('修改')" style="cursor:pointer "/>&nbsp;</p>
</body>
</html>
