<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>未付款项目内容列表</title>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
<!--
table {font-size:9pt;}
th {font-size:12pt;font-family:宋体;}
a:link {color:#0000ff;text-decoration:none;}
a:visited {color:#0000ff;text-decoration:none;}
a:hover {color:#ff0000;text-decoration:none;}
-->
</style>
<script language="JavaScript">
<!--
function _show(snumber,paymode){
	document.form1.snumber.value = snumber;
	document.form1.paymode.value = paymode;
}
//-->
</script>
</head>

<body background="../images/grid.gif">
<form name="form1" method="post" action="">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
    <tr align="center" bgcolor="#6699CC"> 
      <th height="25" colspan="5"><strong><font color="#FFFFFF">未付款项目内容列表</font></strong></th>
    </tr>
    <tr bgcolor="#A6D0F2"> 
      <td align="center" width="5%"><strong>序号</strong></td>
      <td align="center"><strong>摘要</strong></td>
      <td height="25" align="center" width="15%"><strong>金额</strong></td>
      <td width="15%" align="center"><strong>建设内容</strong></td>
      <td width="25%" align="center"><strong>所属合同/专项</strong></td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td height="25" align="center">1</td>
      <td>&nbsp;&nbsp;合同款的70%</td>
      <td align="right">210,000.00</td>
      <td align="left">&nbsp;&nbsp;应用软件</td>
      <td>&nbsp;&nbsp;地方版一拖N改造合同</td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td height="25" align="center">2</td>
      <td>&nbsp;&nbsp;合同款的70%</td>
      <td align="right">70,000.00</td>
      <td align="left">&nbsp;&nbsp;应用软件</td>
      <td>&nbsp;&nbsp;地方版一拖N改造补充合同</td>
    </tr>
  </table>
  <br>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center"><img src="../images/return.gif" border="0" style="cursor:hand;" onClick="javascript:window.history.go(-1);"></td>
    </tr>
  </table>
</form>
</body>
</html>
