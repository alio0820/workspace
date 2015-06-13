<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>预算管理</title>
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
      <th height="25" colspan="8"><strong><font color="#FFFFFF">预算管理</font></strong></th>
    </tr>
    <tr bgcolor="#A6D0F2"> 
      <td height="25" align="center" width="5%"><strong>序号</strong></td>
      <td width="25%" align="center"><strong>项目名称</strong></td>
      <td width="10%" align="center"><strong>项目时间</strong></td>
      <td width="12%" align="center"><strong>项目总预算</strong></td>
      <td width="12%" align="center"><strong>合同款</strong></td>
      <td width="12%" align="center"><strong>专项款</strong></td>
      <td width="12%" align="center"><strong>已付款</strong></td>
      <td width="12%" align="center"><strong>余款</strong></td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td height="25" align="center">1</td>
      <td align="left">&nbsp;&nbsp;地方版一拖N项目</td>
      <td><div align="center">2006-07-08</div></td>
      <td align="right"><a href="prjBudgetList.jsp">550,000.00</a></td>
      <td align="right"><a href="contractBudgetList.jsp">400,000.00</a></td>
      <td align="right"><a href="speSubjectList.jsp">150,000.00</a></td>
      <td align="right"><a href="hasPayedList.jsp">270,000.00</a></td>
      <td align="right"><a href="notPayedList.jsp">280,000.00</a></td>
    </tr>    
  </table>
</form>
</body>
</html>
