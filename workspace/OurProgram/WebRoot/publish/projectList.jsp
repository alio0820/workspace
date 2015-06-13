<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>项目管理</title>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
<!--
body {
	background-image: url(../images/grid.gif);
}
-->
</style>

<SCRIPT LANGUAGE="JavaScript">
<!--
	function _choose(url)
	{
		window.open(url,"PhoneTreeShow",'height=400, width=200,left=100,top=100, toolbar=yes, menubar=yes, scrollbars=yes,resizable=yes,location=no, status=yes')
	}
function _getDate(_txt)
{
	var w = 200;   // 宽度
	var h = 210;   // 高度
	var x = event.screenX - event.offsetX - w/2;   // + deltaX;
	var y = event.screenY - event.offsetY + 20;    // + deltaY;
	
	
	var state = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;dialogLeft:" + x + "px;dialogTop:" + y + "px;status:no;directories:yes;scrollbars:no;resizable=no;";
	//alert(state);
	var a = window.showModalDialog("../js/date.HTM","",state);
	if(a != null)
		_txt.value = a;
}
function changeInput(src,src1, src2) {
	if (src.value=="other") {
		document.getElementById(src1).style.display="none";	
		document.getElementById(src2).style.display="block";
	}
}
function radioChecked() {
	var rs = document.all.prjUuid;
	for (var i = 0; i < rs.length; i++) {
		if (rs[i].checked) {
			return true;
		}
	}
	return false;
}
function _editMaterials() {
	if (!radioChecked()) {
		alert('请先选择要维护资料的项目');
		return;
	}
	window.location='prjMaterials.htm';
}
function _delete() {
	if (!radioChecked()) {
		alert('请先选择要删除的项目');
		return;
	}
	window.location.reload();
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">

<br/>
<table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">项目列表</font></strong></td>
    <tr bgcolor="EEF4FF">
      <td width="17%" height="25"><div align="center"><strong>项目编号</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="16%" height="25"><div align="center"><strong>项目名称</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="15%" height="25"><div align="center"><strong>项目承担部门</strong></div></td>
      <td width="10%" height="25"><div align="center"><strong>责任人</strong></div></td>
      <td width="11%" height="25"><div align="center"><strong>项目结算</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="12%" height="25"><div align="center"><strong>开始日期</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="8%"><div align="center"><strong>备注</strong></div></td>
      <td width="6%">&nbsp;</td>
    </tr>
  </thead>
  <tbody>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="17%" height="25"><div align="left">ABCDE12345XYZ001</div></td>
      <td width="16%" height="25"><div align="left">关于xxx的项目</div></td>
      <td width="15%" height="25"><div align="left">部门A</div></td>
      <td width="10%" height="25"><div align="left">张三</div></td>
      <td width="11%" height="25"><div align="right">912,332.20</div></td>
      <td height="25"><div align="center">2006-12-21</div></td>
      <td height="25"><div align="left">备注信息..</div></td>
      <td height="25"><div align="center"><a href="projectMaterials.jsp">资料</a></div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="17%" height="25"><div align="left">ACDEF67890XYZ002</div></td>
      <td width="16%" height="25"><div align="left">关于yyy的项目</div></td>
      <td width="15%" height="25"><div align="left">部门B</div></td>
      <td width="10%" height="25"><div align="left">李四</div></td>
      <td width="11%" height="25"><div align="right">1,073,232.20</div></td>
      <td height="25"><div align="center">2006-08-12</div></td>
      <td height="25"><div align="left">备注信息..</div></td>
      <td height="25"><div align="center"><a href="projectMaterials.jsp">资料</a></div></td>
    </tr>
  </tbody>
</table>
<br/>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="4">
      <div align="center"><strong><font color="#FFFFFF" size="4">项目查询</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="12%" height="29">项目名称</td>
    <td width="39%">&nbsp;<input name="prjName" type="text" class="txt1" size="" style="width:98% ">
    </td>
    <td width="10%">开始日期</td>
    <td width="39%"> &nbsp;<input name="startDate1" type="text" class="txt1" readonly="true" style="width:39% ">
        <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(startDate1)"> 
  		-
		<input name="startDate2" type="text" class="txt1" readonly="true" style="width:39% ">
    <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(startDate2)"> </td>

  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td>项目承担部门</td>
    <td id="a01">&nbsp;<select name="prjDept1" style="width:98%" onchange="changeInput(this, 'a01','a02')">
          <option value="none" selected>--请选择--</option>
          <option value="0">部门A</option>
          <option value="1">部门B</option>
          <option value="2">部门C</option>
          <option value="other">其他..</option>
        </select>
  	</td><td id="a02" style="display:none "> &nbsp;<input name="prjDept2" type="text" class="txt1" style="width:98% "/></td>
    <td>责任人</td>
    <td align="left" id="b01">&nbsp;<select name="prjPerson1" style="width:98%" onchange="changeInput(this, 'b01','b02')">
          <option value="none" selected>--请选择--</option>
          <option value="0">张三</option>
          <option value="1">李四</option>
          <option value="2">王五</option>
          <option value="other">其他..</option>
        </select>
    </td><td id="b02" style="display:none "> &nbsp;<input name="prjDept2" type="text" class="txt1" style="width:98% "/></td>
  </tr>
</table>
<p align="center">  &nbsp;  &nbsp;
   <input type="button" value=" 查 询 " class="bt1" onClick="alert('查询')" />&nbsp;
  <input type="button" onClick="alert('生成Excel报表')" class="bt1" value="生成Excel"></p>
 <table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="2">
      <div align="center"><strong><font color="#FFFFFF" size="4">项目报表发布</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="17%" height="29">报表文件（Excel格式）</td>
    <td width="83%">&nbsp;
        <input name="prjName2" type="file" class="txt1" size="" style="width:98% ">
    </td>
  </tr>
</table>
<p align="center"><input name="" type="button" value="发布" onClick="if(confirm('您确定要发布该报表吗？')){alert('发布成功!')}" class="bt1"></p>
</body>
</html>
