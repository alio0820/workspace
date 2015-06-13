<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>财务管理</title>
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
function changeInput(src1, src2) {
	if (src1.value=="other") {
		src1.style.display="none";	
		src2.style.display="block";
		src2.focus();
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
		alert('请先选择要维护资料的财务凭证');
		return;
	}
	window.location='ctrctMaterials.htm';
}
function _delete() {
	if (!radioChecked()) {
		alert('请先选择要删除的条目');
		return;
	}
	window.location.reload();
}
function _showPrjs(_txt) {
	var w = 200;   // 宽度
	var h = 210;   // 高度
	var x = event.screenX - event.offsetX - w/2;   // + deltaX;
	var y = event.screenY - event.offsetY;    // + deltaY;
	
	
	var state = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;dialogLeft:" + x + "px;dialogTop:" + y + "px;status:no;directories:yes;scrollbars:no;resizable=no;";
	//alert(state);
	var a = window.showModalDialog("../project/miniPrjList.htm","",state);
	if(a != null)
		_txt.value = a;
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">

<br/>
<table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="11" align="center"><strong><font color="#FFFFFF" size="4">资产列表</font></strong></td>
    <tr bgcolor="EEF4FF">
      <td width="8%" height="25"><div align="center"><strong>编号</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="14%"><div align="center"><strong>资产名称 <a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></strong></div></td>
      <td width="7%" height="25"><div align="center"><strong>规格 </strong></div></td>
      <td width="8%" height="25"><div align="center"><span class="style1">型号</span></div></td>
      <td width="6%" height="25"><div align="center"><strong>数量</strong></div></td>
      <td width="9%" height="25"><div align="center"><strong>单价</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="10%" height="25"><div align="center"><strong>金额<a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></strong></div></td>
      <td width="9%"><div align="center"><strong>购置日期</strong><a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></div></td>
      <td width="6%"><div align="center"><span class="style1">经手人</span></div></td>
      <td width="9%"><div align="center"><strong>使用部门</strong></div></td>
      <td width="10%"><div align="center"><strong>备注</strong></div></td>
    </tr>
  </thead>
  <tbody>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="8%" height="25"><div align="center">003</div></td>
      <td width="14%"><div align="left">资产名称A</div></td>
      <td width="7%" height="25"><div align="left">规格a</div></td>
      <td width="8%" height="25" title="完整的摘要信息"><div align="left">型号xtz</div></td>
      <td width="6%" height="25"><div align="right">1,332</div></td>
      <td width="9%" height="25"><div align="right">10.30</div></td>
      <td height="25"><div align="right">32,328,320.00</div></td>
      <td height="25" align="center" title="完整的合同名称">2006-10-20</td>
      <td height="25" align="center" title="完整的项目名称"><div align="left">张三</div></td>
      <td align="center" title="xxx项目xxx项目"><div align="left">AAA部门</div></td>
      <td align="center"  title="备注信息备注信息备注信息"><div align="left">备注信息..</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="8%" height="25"><div align="center">002</div></td>
      <td width="14%"><div align="left">资产名称B</div></td>
      <td width="7%" height="25"><div align="left">规格b</div></td>
      <td width="8%" height="25"  title="完整的摘要信息"><div align="left">型号y</div></td>
      <td width="6%" height="25"><div align="right">7</div></td>
      <td width="9%" height="25"><div align="right">1,350.00</div></td>
      <td height="25"><div align="right">7,495.00</div></td>
      <td height="25" align="center"  title="完整的合同名称">2005-12-12</td>
      <td height="25" align="center"  title="完整的项目名称"><div align="left">李四</div></td>
      <td align="center"  title="yyy项目yyy项目"><div align="left">BBB部门</div></td>
      <td align="center" title="委托组织集中采购机构采购"><div align="left">备注信息..</div></td>
    </tr>
  </tbody>
</table>
<br/>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="4">
      <div align="center"><strong><font color="#FFFFFF" size="4">资产信息查询</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="10%" height="30">资产名称</td>
    <td width="35%"> &nbsp;<input name="_date" type="text" class="txt1" size="18" style="width:97% ">
    </td>
    <td width="11%">规格</td>
    <td width="44%"> &nbsp;<input name="startDate" type="text" class="txt1" size="18" style="width:97% ">
    </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td>型号</td>
    <td  height="25">&nbsp;<input type="text" class="txt1" name="zhaiyao" style="width:97% " /></td>
    <td>数量</td>
    <td align="left" nowrap><span class="style1"> &nbsp;<input name="startDate23" type="text" class="txt1" size="18" style="width:97% ">
    </span></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td>单价</td>
    <td><span class="style1"> &nbsp;<input name="startDate2" type="text" class="txt1" size="18" readonly="true" style="width:97% ">
    </span> </td>
    <td>金额</td>
    <td align="left" nowrap><span class="style1"> &nbsp;<input name="startDate22" type="text" class="txt1" size="18"  style="width:97% ">
      </span>
        <input name="prjPerson2" type="text" class="txt1" size="18" style="display:none "/>
    </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">购置日期</td>
    <td width="37%"> &nbsp;<input name="_date1" type="text" class="txt1" size="18" style="width:38% ">
        <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(_date1)"> -
        <input name="_date3" type="text" class="txt1" size="18" style="width:38% ">
        <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(_date3)"></td>
    <td >经手人</td>
    <td > &nbsp;<input name="belongedPrj2" type="text" class="txt1" size="18" readonly="true"  style="width:97% ">
    </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">使用部门</td>
    <td >&nbsp;<input name="_date2" type="text" class="txt1" size="18"  style="width:97% "></td>
    <td >编号</td>
    <td > &nbsp;<input name="_date22" type="text" class="txt1" size="18"  style="width:97% "></td>
  </tr>
</table>
  <p align="center">
  <img src="../images/find.gif"  onClick="alert('查询')" style="cursor:pointer "/></p>

</body>
</html>
