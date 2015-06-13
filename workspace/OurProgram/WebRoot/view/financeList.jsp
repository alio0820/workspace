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
function showDialog(url) {
	var w = 300;   // 宽度
	var h = 400;   // 高度
	var x = event.screenX - event.offsetX - w/2;   // + deltaX;
	var y = event.screenY - event.offsetY;    // + deltaY;
	var state = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;dialogLeft:" + x + "px;dialogTop:" + y + "px;status:no;directories:yes;scrollbars:no;resizable=no;";
	var a = window.showModalDialog(url,"",state);
	return a;
}
function _showPrjs(_txt) {
	var a = window.showDialog("../project/miniPrjList.htm");
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
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">

<br/>
<table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <thead>
    <tr bgcolor="#6699CC">
      <td height="25" colspan="11" align="center"><strong><font color="#FFFFFF" size="4">财务信息列表</font></strong></td>
    </tr>
    <tr bgcolor="EEF4FF">
      <td width="8%" height="25"><div align="center"><strong>日期 <a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a> </strong></div></td>
      <td width="11%" height="25"><div align="center"><strong>凭证号 <a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a> </strong></div></td>
      <td width="8%" height="25"><div align="center"><strong>摘要</strong></div></td>
      <td width="7%" height="25"><div align="center"><strong>借方</strong></div></td>
      <td width="7%" height="25"><div align="center"><strong>贷方</strong></div></td>
      <td width="8%" height="25"><div align="center"><strong>金额<a href="#" onClick="alert('排序')" style="cursor:pointer ">▼</a></strong></div></td>
      <td width="9%"><div align="center"><strong>所属项目</strong></div></td>
      <td width="10%"><div align="center"><strong>所属合同 </strong></div></td>
      <td width="10%"><div align="center"><strong>资金支付方式</strong></div></td>
      <td width="13%"><div align="center"><strong>采购形式</strong></div></td>
      <td width="6%"><div align="center"><strong>项目分类</strong></div></td>
    </tr>
  </thead>
  <tbody>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="8%" height="25"><div align="center">2006-12-12</div></td>
      <td width="11%" height="25"><div align="center">1234567890</div></td>
      <td width="8%" height="25" title="完整的摘要信息"><div align="left">摘要..</div></td>
      <td width="7%" height="25"><div align="left">银行存款</div></td>
      <td width="7%" height="25"><div align="left">应付款</div></td>
      <td height="25"><div align="right">321,113.23</div></td>
      <td height="25" align="center" title="完整的合同名称"><div align="left">项目aaa..</div></td>
      <td height="25" align="center" title="完整的项目名称"><div align="left">关于xxx的合同 </div></td>
      <td align="center" title="xxx项目xxx项目"><div align="left">财政直接支付</div></td>
      <td align="center"  title="备注信息备注信息备注信息"><div align="left">自行组织分散采购</div></td>
      <td align="center"  title="备注信息备注信息备注信息"><div align="left">工程</div></td>
    </tr>
    <tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="8%" height="25"><div align="center">2006-10-20</div></td>
      <td width="11%" height="25"><div align="center">0123456870</div></td>
      <td width="8%" height="25"  title="完整的摘要信息"><div align="left">摘要..</div></td>
      <td width="7%" height="25"><div align="left">银行存款</div></td>
      <td width="7%" height="25"><div align="left">基建拨款</div></td>
      <td height="25"><div align="right">12,342.00</div></td>
      <td height="25" align="center"  title="完整的合同名称"><div align="left">项目bbbb..</div></td>
      <td height="25" align="center"  title="完整的项目名称"><div align="left">关于yyy的合同</div></td>
      <td align="center"  title="yyy项目yyy项目"><div align="left">实拨资金</div></td>
      <td align="center" title="委托组织集中采购机构采购"><div align="left">委托组织集中采购..</div></td>
      <td align="center" title="备注信息备注信息备注信息"><div align="left">货物</div></td>
    </tr>
  </tbody>
</table>
<br/>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="4">
      <div align="center"><strong><font color="#FFFFFF" size="4">财务信息维护</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="13%" height="30">日期</td>
    <td width="37%"> &nbsp;<input name="_date1" type="text" class="txt1" size="18" style="width:38% ">
        <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(_date1)"> -
		<input name="_date2" type="text" class="txt1" size="18" style="width:38% ">
        <IMG SRC="../images/calendar.gif" STYLE="cursor:hand;" WIDTH="18" HEIGHT="18" BORDER="0" ALIGN="absmiddle" ALT="" onClick="_getDate(_date2)"></td>
    <td width="12%">凭证号</td>
    <td width="38%">&nbsp;<input name="startDate" type="text" class="txt1" size="18" style="width:97% ">
    </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">摘要</td>
    <td height="25">&nbsp;<input type="text" class="txt1" size="40" name="zhaiyao" style="width:97% "/></td>
    <td height="25">金额</td>
    <td height="25" align="left" nowrap><span class="style1"> &nbsp;<input name="startDate22" type="text" class="txt1" size="18"  style="width:97% ">
    </span></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td>会计科目</td>
    <td colspan="3">&nbsp;<input type="text" class="txt1" size="40" name="jie_kemu"  style="width:38% "/>
	
        <img src="../images/clip.gif" onClick="getPopValue(jie_kemu,'../basedata/popups/accountant_subject.jsp')" style="cursor:pointer "/>&nbsp;查询方式：
		借方
        <input name="r" type="radio" value="">
		贷方<input name="r" type="radio" value="">
		借方或贷方<input name="r" type="radio" value="" checked>
		借方且贷方<input name="r" type="radio" value="">
		
		</td>
  </tr>
  <tr bgcolor="#EEF4FF" class="lc2">
    <td height="25">所属项目</td>
    <td >&nbsp;<input name="belongedPrj" type="text" class="txt1" size="60" style="width:90% ">
        <img src="../images/clip.gif" onClick="getPopValue(belongedPrj, '../project/miniPrjList0.jsp')" style="cursor:pointer "/>
        <input name="yi" type="text" class="txt1" style="display:none " size="32" />
    </td>
    <td >所属合同</td>
    <td >&nbsp;<input name="belongedContract" type="text" class="txt1" size="60"  style="width:90% ">
        <img src="../images/clip.gif" onClick="getPopValue(belongedContract,'../contract/miniContractList.jsp')" style="cursor:pointer "/></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">资金支付方式</td>
    <td >&nbsp;<input type="text" class="txt1" size="40" name="payment"  style="width:90% "/>
        <img src="../images/clip.gif" onClick="getPopValue(payment, '../basedata/popups/payment.jsp')" style="cursor:pointer "/></td>
    <td >政府采购方式</td>
    <td > &nbsp;<input type="text" class="txt1" size="40" name="cai_gou"  style="width:90% " />
        <img src="../images/clip.gif" onClick="getPopValue(cai_gou, '../basedata/popups/cai_gou.jsp')" style="cursor:pointer "/></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">政府采购组织形式</td>
    <td >&nbsp;<input type="text" class="txt1" size="40" name="caigou_zz"  style="width:90% " />
        <img src="../images/clip.gif" onClick="getPopValue(caigou_zz, '../basedata/popups/caigou_zuzhi.jsp')" style="cursor:pointer "/> </td>
    <td >政府采购项目分类</td>
    <td >&nbsp;<input type="text" class="txt1" size="40" name="caigou_xm"  style="width:90% " />
        <img src="../images/clip.gif" onClick="getPopValue(caigou_xm, '../basedata/popups/caigou_xm.jsp')" style="cursor:pointer "/></td>
  </tr>
</table>
<p align="center">  <img src="../images/find.gif"  onClick="alert('查询')" style="cursor:pointer "/>&nbsp;
  <input type="button" value="形成拨款通知单" class="bt1" onClick="window.open('拨款通知单.doc','','height=900,width=900')" />
</p>
</body>
</html>
