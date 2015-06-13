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
<title>档案列表</title>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">

<!--
body {
	background-image: url(../images/grid.gif);
}
-->
</style>
<script>
function showDialog(url) {
	var w = 300;   // 宽度
	var h = 400;   // 高度
	var x = event.screenX - event.offsetX - w/2;   // + deltaX;
	var y = event.screenY - event.offsetY;    // + deltaY;
	var state = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;dialogLeft:" + x + "px;dialogTop:" + y + "px;status:no;directories:yes;scrollbars:no;resizable=no;";
	var a = window.showModalDialog(url,"",state);
	return a;
}
function getPopValue(_txt, url) {
	var a = window.showDialog(url);
	if(a) {
		_txt.value = "";
		for (var t = 0; t < a.length; t++) {
			_txt.value += a[t];
			if (t < a.length-1) {
				_txt.value += ",";
			}
		}
	}
}
</script>
</head>

<body>
<table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="5" align="center"><strong><font color="#FFFFFF" size="4">档案列表</font></strong></td>
    <tr bgcolor="EEF4FF">
      <td width="17%"><div align="center"><strong>档案名称&#13;</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a> </div></td>
      <td width="17%"><div align="center"><strong>所属项目 </strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="11%" height="25"><div align="center"><strong>归档时间</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="14%"><div align="center"><strong>归档负责人</strong></div></td>
      <td width="38%"><div align="center"><strong>备注</strong></div></td>
    </tr>
  </thead>
  <tbody>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="17%" height="25"><div align="left"><a href="javascript:alert('下载档案')">立项申请</a></div></td>
      <td width="17%" height="25">xxx项目</td>
      <td height="25"><div align="center">2007-01-01</div></td>
      <td height="25"><div align="left">张三</div></td>
      <td height="25" align="center"><div align="left">备注信息备注信息备注信息备注信息</div>      </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td height="25"><div align="left"><a href="javascript:alert('下载档案')">批复文件</a></div></td>
      <td height="25">yyy的A项目</td>
      <td height="25"><div align="center">2006-12-12</div></td>
      <td height="25"><div align="left">张三</div></td>
      <td height="25" align="center"><div align="left">备注信息备注信息备注信息备注信息备注信息备注信息</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td height="25"><div align="left"><a href="javascript:alert('下载档案')">需求报告</a></div></td>
      <td height="25">关于ACB的X项目</td>
      <td height="25"><div align="center">2006-08-31</div></td>
      <td height="25"><div align="left">李四</div></td>
      <td height="25" align="center"><div align="left">备注信息备注信息备注信息备注信息备注信息</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="17%" height="25"><div align="left"><a href="javascript:alert('下载档案')">需求分析报告</a></div></td>
      <td width="17%" height="25">yyy项目</td>
      <td height="25"><div align="center">2005-12-21</div></td>
      <td height="25"><div align="left">王五</div></td>
      <td height="25" align="center"><div align="left">备注信息备注信息备注信息备注信息备注信息备注信息</div></td>
    </tr>
  </tbody>
</table>
<br/>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="4">
      <div align="center"><strong><font color="#FFFFFF" size="4">档案查询</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="9%" height="29"><div align="left">档案名称</div></td>
    <td width="39%">
      &nbsp;<input name="prjName" type="text" class="txt1" size="32" style="width:97% ">
    </td>
    <td width="14%">所属项目</td>
    <td width="38%">&nbsp;<input name="belongedPrj" type="text" class="txt1" size="20" value="XXX项目" readonly="true"  style="width:90% ">
    <img src="../images/clip.gif" onClick="getPopValue(belongedPrj, '../project/miniPrjList0.jsp')" style="cursor:pointer "/></td>
  </tr>
</table>
<p align="center">  <img src="../images/find.gif"  onClick="alert('查询')" style="cursor:pointer "/>&nbsp;
  <input type="button" onClick="alert('生成Excel报表')" class="bt1" value="生成Excel"></p>
   <table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="2">
      <div align="center"><strong><font color="#FFFFFF" size="4">档案报表发布</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="17%" height="29">报表文件（Excel格式）</td>
    <td width="83%">&nbsp;
        <input name="prjName2" type="file" class="txt1" size="" style="width:98% ">
    </td>
  </tr>
</table>
<p align="center"><input name="" type="button" value="发布" class="bt1" onClick="if(confirm('您确定要发布该报表吗？')){alert('发布成功!')}"></p>
</body>
</html>
