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
.style1 {font-weight: bold}
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
	var rs = document.all.contractUuid;
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
	window.location='ctrctMaterials.htm';
}
function _delete() {
	if (!radioChecked()) {
		alert('请先选择要删除的项目');
		return;
	}
	window.location.reload();
}
function _showPrjs(_txt) {
	var w = 300;   // 宽度
	var h = 500;   // 高度
	var x = event.screenX - event.offsetX - w/2;   // + deltaX;
	var y = event.screenY - event.offsetY;    // + deltaY;
	
	
	var state = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;dialogLeft:" + x + "px;dialogTop:" + y + "px;status:no;directories:yes;scrollbars:no;resizable=no;";
	//alert(state);
	var a = window.showModalDialog("../project/miniPrjList.htm","",state);
	if(a) {
		for (var t = 0; t < a.length; t++) {
			_txt.value += a[t];
			if (t < a.length-1) {
				_txt.value += ",";
			}
		}
	}
		
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">

<br/>
<table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
<thead>
<tr bgcolor="#6699CC"><td height="25" colspan="11" align="center"><strong><font color="#FFFFFF" size="4">合同列表</font></strong></td><tr bgcolor="EEF4FF">
	<td width="6%" height="25"><div align="center"><strong>序号</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
	<td width="7%" height="25"><div align="center"><strong>编号</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
	<td width="18%" height="25"><div align="center"><strong>合同名称</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
	<td width="5%" height="25"><div align="center"><strong>甲方</strong></div></td>
	<td width="5%" height="25"><div align="center"><strong>乙方</strong></div></td>
	<td width="5%" height="25"><div align="center"><strong>丙方</strong></div></td>
	<td width="8%"><div align="center"><strong>签订日期</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
	<td width="12%"><div align="center"><strong>合同价款</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
	<td width="15%"><div align="center"><strong>所属项目</strong></div></td>
    <td width="11%"><div align="center"><strong>备注</strong></div></td>
    <td width="5%">&nbsp;</td>
</tr>
</thead>
<tbody>
	<tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
	<td width="6%" height="25"><div align="center">1</div></td>
	<td width="7%" height="25"><div align="center">001</div></td>
	<td width="18%" height="25"><div align="left">关于xxx的合同</div></td>
	<td width="5%" height="25"><div align="left">张三啊</div></td>
	<td width="5%" height="25"><div align="left">李四</div></td>
	<td height="25"><div align="left">王五</div></td>
	<td height="25" align="center">2006-12-12</td>
	<td height="25" align="center"><div align="right">3,232.53</div></td>
	<td align="center" title="xxx项目xxx项目"><div align="left">xxx项目..</div></td>
	<td align="center"  title="备注信息备注信息备注信息"><div align="left">备注信息..</div></td>
	<td align="center"  title="备注信息备注信息备注信息"><a href="contractMaterials.jsp">资料</a></td>
	</tr>
	<tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
	<td width="6%" height="25"><div align="center">2</div></td>
	<td width="7%" height="25"><div align="center">023</div></td>
	<td width="18%" height="25"><div align="left">关于yyy的合同</div></td>
	<td width="5%" height="25"><div align="left">李四</div></td>
	<td width="5%" height="25"><div align="left">张三</div></td>
	<td height="25"><div align="left">赵六</div></td>
	<td height="25" align="center">2006-10-20</td>
	<td height="25" align="center"><div align="right">1,322,335.23</div></td>
	<td align="center"  title="yyy项目yyy项目"><div align="left">yyy项目..</div></td>
	<td align="center" title="备注信息备注信息备注信息"><div align="left">备注信息..</div></td>
	<td align="center" title="备注信息备注信息备注信息"><a href="contractMaterials.jsp">资料</a></td>
	</tr>
</tbody>
</table>

<br/>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="4">
      <div align="center"><strong><font color="#FFFFFF" size="4">合同查询</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="12%" height="25">合同名称</td>
    <td width="39%" height="25"> &nbsp;<input name="prjName" type="text" class="txt1" size="32" style="width:97% ">
    </td>
    <td width="9%">合同价款</td>
    <td width="40%">&nbsp;<input name="startDate" type="text" class="txt1" size="18" style="width:97% ">
    </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">合同甲方</td>
    <td height="25" id="a01">&nbsp;<select name="prjDept1" style="width:97%" onChange="changeInput(this,'a01','a02')">
          <option value="none" selected>--请选择--</option>
          <option value="0">张三</option>
          <option value="1">李四</option>
          <option value="2">王五</option>
          <option value="other">其他..</option>
        </select>
    </td>
	<td id="a02" style="display:none ">
	&nbsp;<input name="jia" type="text" class="txt1" style="width:97% " />
	</td>
    <td>合同编号</td>
    <td align="left" nowrap>&nbsp;<input name="startDate2" type="text" class="txt1" size="18" style="width:97% ">
 </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">合同乙方</td>
    <td height="25" id="b01" >&nbsp;<select name="select" style="width:97%" onChange="changeInput(this, 'b01','b02')">
          <option value="none" selected>--请选择--</option>
          <option value="0">张三</option>
          <option value="1">李四</option>
          <option value="2">王五</option>
          <option value="other">其他..</option>
        </select>
    </td>
	<td id="b02" style="display:none ">
	&nbsp;<input name="yi" type="text" class="txt1" style="width:97% " />
	</td>
    <td >签订日期</td>
    <td width="40%"> &nbsp;<input name="_date1" type="text" class="txt1" size="18" style="width:38% ">
        <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(_date1)"> -
        <input name="_date2" type="text" class="txt1" size="18" style="width:38% ">
        <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(_date2)"></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">合同丙方</td>
    <td height="25" id="c01" >&nbsp;<select name="select2" style="width:97%" onChange="changeInput(this, 'c01', 'c02')">
          <option value="none" selected>--请选择--</option>
          <option value="0">张三</option>
          <option value="1">李四</option>
          <option value="2">王五</option>
          <option value="other">其他..</option>
        </select>
    </td>
	<td id="c02" style="display:none ">
	&nbsp;<input name="jia" type="text" class="txt1" style="width:97% " />
	</td>
    <!-- td style="display:none " >所属项目</td>
    <td style="display:none "><input name="belongedPrj" type="text" class="txt1" size="30">
        <img src="../images/clip.gif" onClick="_showPrjs(belongedPrj)" style="cursor:pointer "/></td -->
    <td>合同内容</td>
    <td>&nbsp;<input name="prjName" type="text" class="txt1" size="32" style="width:97% ">
    </td>
  </tr>
</table>
<p align="center">
<img src="../images/find.gif"  onClick="alert('查询')" style="cursor:pointer "/></p>
</body>
</html>
