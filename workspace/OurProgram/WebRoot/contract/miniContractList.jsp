<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>合同列表</title>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
<!--
body {
	background-image: url(../images/grid.gif);
}
-->
</style>
<script>
function returnPrj(src) {
	if(!src.id)
		return;
	window.returnValue=src.id.substring(3);
	window.close();
}
function ok() {
	var a = new Array();
	var t = 0;
	var c = document.form1.elements;
	for (var i = 0; i < c.length; i++) {
		if (c[i].type=="radio" && c[i].checked) {
			a[t] = c[i].value;
			t++;
		}
	}
	window.returnValue=a;
	window.close();
}

</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">
<form name="form1">
<table width="95%" border="0" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199" valign="top">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="3" align="center"><strong><font color="#FFFFFF" size="4">项目列表</font></strong></td>
    <tr bgcolor="EEF4FF">
	  <td width="2%">&nbsp;</td>
	  <td width="30%" height="25"><div align="center"><strong>合同名称</strong></div></td>
      <td width="64%"><div align="center"><strong>备注</strong></div></td>
    </tr>
  </thead>
  <tbody>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"  id="tr_关于xxx的项目">
	  <td>	    <input type="radio" name="radiobutton" value="某某某合同A"></td>
      <td width="34%" height="25"><div align="center">某某某合同A</div></td>
      <td width="64%" height="25"><div align="center">备注信息备注信息备注信息..</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"  id="tr_关于yyy的项目">
	<td>	  <input type="radio" name="radiobutton" value="某某某合同B"></td><strong></strong>
      <td width="34%" height="25"><div align="center">某某某合同B</div></td>
      <td width="64%" height="25"><div align="center">备注信息备注信息备注信息..</div></td>
    </tr>
  </tbody>
</table>
<p align="center">
<img src="../images/confirm.gif"  onClick="ok();" style="cursor:pointer "/>
</p>
</form>
</body>
</html>
