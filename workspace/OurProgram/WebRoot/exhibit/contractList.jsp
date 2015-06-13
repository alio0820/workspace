<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0044)http://www.hedgerwow.com/BLOG/owc/table1.htm -->
<html>
  <head>
    <title>合同列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <META content="MSHTML 6.00.2900.2963" name=GENERATOR>
    <link rel="stylesheet" href="../css/style.css">
 </head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">
<table>
<thead>
<tr>
	  <td width="6%" height="25"><b>序号</b></td>
	  <td width="7%" height="25"><b>编号</b></td>
	  <td width="18%" height="25"><b>合同名称</b></td>
	  <td width="5%" height="25"><b>甲方</b></td>
	  <td width="5%" height="25"><b>乙方</b></td>
	  <td width="5%" height="25"><b>丙方</b></td>
	  <td width="8%"><b>签订日期</b></td>
	  <td width="12%"><b>合同价款</b></td>
	  <td width="15%"><b>所属项目</b></td>
      <td width="11%"><b>备注</b></td>
    <td width="5%"><b>资料</b></td>
</tr>
</thead>
<tbody>
	<tr>
	  <td width="6%" height="25">1</td>  <td width="7%" height="25">001</td>  <td width="18%" height="25">关于xxx的合同</td>  <td width="5%" height="25">张三啊</td>  <td width="5%" height="25">李四</td>  <td height="25">王五</td>
	<td height="25" align="center">2006-12-12</td>
	  <td height="25" align="center">3,232.53</td>  <td align="center" title="xxx项目xxx项目">xxx项目..</td>  <td align="center"  title="备注信息备注信息备注信息">备注信息..</td>  <td align="center"  title="备注信息备注信息备注信息"><a href="contractMaterials.htm">查看</a></td>
	</tr>
	<tr>
	  <td width="6%" height="25">2</td>
	  <td width="7%" height="25">023</td>
	  <td width="18%" height="25">关于yyy的合同</td>
	  <td width="5%" height="25">李四</td>
	  <td width="5%" height="25">张三</td>
	  <td height="25">赵六</td>
	<td height="25" align="center">2006-10-20</td>
	  <td height="25" align="center">1,322,335.23</td>
	  <td align="center"  title="yyy项目yyy项目">yyy项目..</td>
	  <td align="center" title="备注信息备注信息备注信息">备注信息..</td>  <td align="center" title="备注信息备注信息备注信息"><a href="contractMaterials.htm">查看</a></td>
	</tr>
</tbody>
</table>
</body>
</html>
