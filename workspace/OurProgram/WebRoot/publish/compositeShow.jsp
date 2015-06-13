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
function composite() {
	var t = document.getElementById('theTable');
	t.style.display="block";
	document.getElementById("theP").style.display="block";
	var elems = document.form1.elements;
	var ar = new Array();
	var _counter = 0;
	for (var i = 0; i < elems.length; i++) {
		if (elems[i].type=="checkbox") {
			if (elems[i].checked) {
				ar[_counter] = elems[i].tag;
				_counter++;
			} 
		}
	}
	var _r = t.rows;
	for (var m = 1; m < _r.length; m++) {
		var _c = _r[m].cells;
		for (var n = 0; n < _c.length; n++) {
			if (_contains(ar,_c[n].tag)) {
				_c[n].style.display="block";
			} else {
				_c[n].style.display="none";
			}
		}
	}
}
function _contains(array, value) {
	if(!array.length)
		return false;
	for (var i  = 0; i < array.length; i++) {
		if (array[i]==value) 
			return true;
	}
	return false;
}
function changeCategory() {
	var theSelect = document.getElementById('categorySelector');
	var cat = theSelect.value;
	document.getElementById("cat_1").style.display="none";
	document.getElementById("cat_2").style.display="none";
	document.getElementById("cat_3").style.display="none";

	document.getElementById(cat).style.display="block";
	
}
function showTr(src) {
	var _tr = document.getElementById(src);
	var tag = src.substring(src.length-1);
	var sp_tag = "sp_" + tag;
	if (_tr.style.display=="none") {
		document.getElementById(sp_tag).innerHTML="-";
		_tr.style.display="block";
	}else {
		document.getElementById(sp_tag).innerHTML="+";
		_tr.style.display="none";
	}
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">

<br/>
<form name="form1">

<table id="cat_1" border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  
    <tr bgcolor="EEF4FF" onClick="showTr('tr_1')" style="cursor:pointer">
      <td height="25" colspan="7" id="td_1"><span id="sp_1">+</span>项目信息</td>
    </tr>
    <tr bgcolor="EEF4FF" style="display:none " id="tr_1">
      <td width="15%" height="31"><div align="center"><strong>项目编号</strong>
            <input type="checkbox" name="checkbox" value="" title="项目编号" tag="8">
      </div></td>
      
      <td width="14%"><div align="center"><strong>项目名称</strong>
            <input type="checkbox" name="checkbox23" value="" title="项目名称" tag="7">
      </div></td>
      <td width="19%" height="31"><div align="center"><strong>项目承担部门</strong>
            <input type="checkbox" name="checkbox" value="" title="项目承担部门"  tag="9">
      </div></td>
      <td width="14%" height="31"><div align="center"><strong>责任人
            <input type="checkbox" name="checkbox20" value=""   tag="10">
      </strong></div></td>
      <td width="19%" height="31"><div align="center"><strong>项目</strong><span class="style1">预算
            <input type="checkbox" name="checkbox21" value=""  tag="11">
      </span></div></td>
      <td width="19%" height="31"><div align="center"><strong>开始日期
            <input type="checkbox" name="checkbox22" value=""  tag="12">
      </strong></div></td>
    </tr>
 </table>
<table id="cat_2" border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
	<tr bgcolor="EEF4FF" onClick="showTr('tr_2')"  style="cursor:pointer">
      <td height="25" colspan="8" id="td_2"><span id="sp_2">+</span>合同信息</td>
    </tr>
    <tr bgcolor="EEF4FF" id="tr_2" style="display:none">
      <td width="15%" height="25"><div align="center"><strong>合同编号
        <input type="checkbox" id="checkbox11" name="checkbox12"  tag="14">
      </strong></div></td>
      <td width="14%" height="25"><div align="center"><strong>合同名称
        <input type="checkbox" id="checkbox12" name="checkbox13"  tag="13">
      </strong></div></td>
      <td width="8%" height="25"><div align="center"><strong>甲方
        <input type="checkbox" id="checkbox13" name="checkbox14"   tag="15">
      </strong></div></td>
      <td width="9%" height="25"><div align="center"><strong>乙方
        <input type="checkbox" id="checkbox14" name="checkbox15"   tag="16">
      </strong></div></td>
      <td width="10%" height="25"><div align="center"><strong>丙方
        <input type="checkbox" id="checkbox15" name="checkbox16"   tag="17">
      </strong></div></td>
      <td width="15%"><div align="center"><strong>签订日期
        <input type="checkbox" id="checkbox16" name="checkbox17"   tag="18">
      </strong></div></td>
      <td width="15%"><div align="center"><strong>合同价款
        <input type="checkbox" id="checkbox17" name="checkbox18"  tag="19">
      </strong></div></td>
      <td width="14%"><div align="center"><strong>所属项目
        <input type="checkbox" id="checkbox18" name="checkbox19"  tag="7">
      </strong></div></td>
    </tr>
</table>
<table id="cat_3" border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <thead>
    <tr bgcolor="EEF4FF"  onClick="showTr('tr_3')"  style="cursor:pointer">
      <td height="25" colspan="11" id="td_3"><span id="sp_3">+</span>财务信息</td>
      </tr>
    <tr bgcolor="EEF4FF"  id="tr_3" style="display:none">
      <td width="11%" height="25" id="td_1"><div align="center"><strong>日期 </strong><input type="checkbox" id="cb_1" name="checkbox" tag="1"></div></td>
      <td width="9%" height="25" id="td_2"><div align="center"><strong>凭证号 <input type="checkbox" id="cb_2" name="checkbox" checked disabled  tag="2"> </strong></div></td>
      <td width="8%" height="25" id="td_3"><div align="center"><strong>摘要</strong><input type="checkbox" id="cb_3" name="checkbox" tag="3"></div></td>
      <td width="8%" height="25" id="td_4"><div align="center"><strong>借方</strong><input type="checkbox" id="cb_4" name="checkbox" tag="4"></div></td>
      <td width="7%" height="25" id="td_5"><div align="center"><strong>贷方</strong><input type="checkbox" id="cb_5" name="checkbox" tag="5"></div></td>
      <td width="7%" height="25" id="td_6"><div align="center"><strong>金额</strong><input type="checkbox" id="cb_6" name="checkbox" tag="6"></div></td>
      <td width="11%" id="td_7"><div align="center"><strong>所属项目</strong><input type="checkbox" id="cb_7" name="checkbox" tag="7"></div></td>
      <td width="9%" id="td_8"><div align="center"><strong>所属合同 </strong><input type="checkbox" id="cb_8" name="checkbox" tag="13"></div></td>
      <td width="11%" id="td_9"><div align="center"><strong>资金支付方式</strong><input type="checkbox" id="cb_9" name="checkbox" tag="20"></div></td>
      <td width="9%" id="td_10"><div align="center"><strong>采购形式</strong><input type="checkbox" id="cb_10" name="checkbox" tag="21"></div></td>
      <td width="10%" id="td_11"><div align="center"><strong>项目分类</strong><input type="checkbox" id="cb_11" name="checkbox" tag="22"></div></td>
    </tr>
	<tr bgcolor="EEF4FF"   onClick="showTr('tr_4')" style="display:none ">
	  <td height="25" colspan="11" id="td_4"><span id="sp_4">+ </span>资产信息</td>
	  </tr>
	<tr bgcolor="EEF4FF"  style="display:none ">
	  <td height="25"><div align="center"><strong>编号
	    <input type="checkbox" id="checkbox" name="checkbox2">
	  </strong></div></td>
	  <td><div align="center"><strong>资产名称
	    <input type="checkbox" id="checkbox2" name="checkbox3">
	  </strong></div></td>
	  <td height="25"><div align="center"><strong>规格
	    <input type="checkbox" id="checkbox3" name="checkbox4"> 
	    </strong></div></td>
	  <td height="25"><div align="center"><span class="style1">型号
	    <input type="checkbox" id="checkbox4" name="checkbox5">
	  </span></div></td>
	  <td height="25"><div align="center"><strong>数量
	    <input type="checkbox" id="checkbox5" name="checkbox6">
	  </strong></div></td>
	  <td height="25"><div align="center"><strong>单价
	    <input type="checkbox" id="checkbox6" name="checkbox7">
	  </strong></div></td>
	  <td height="25"><div align="center"><strong>金额
	    <input type="checkbox" id="checkbox7" name="checkbox8">
	  </strong></div></td>
	  <td><div align="center"><strong>购置日期
	    <input type="checkbox" id="checkbox8" name="checkbox9">
	  </strong></div></td>
	  <td><div align="center"><span class="style1">经手人
	    <input type="checkbox" id="checkbox9" name="checkbox10">
	  </span></div></td>
	  <td colspan="2"><div align="center"><strong>使用部门
	    <input type="checkbox" id="checkbox10" name="checkbox11">
	  </strong></div></td>
      </tr>
  </thead>
  <tbody>
  </tbody>
</table>

<p align="center"><input type="button" onClick="composite();" value="组合生成列表"/></p>
</form>
<table id="theTable" style="display:none"  border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr bgcolor="#6699CC">
      <td height="25" colspan="22" align="center"><strong><font color="#FFFFFF" size="4">信息组合展现</font></strong></td>
  </tr>
    <tr bgcolor="EEF4FF">
      <td width="4%" height="25" tag="1"><div align="center" class="style1">
        <div align="center">日期 </div>
      </div></td>
      <td width="7%" height="25" tag="2"><div align="center" class="style1">
        <div align="center">凭证号</div>
      </div></td>
      <td width="3%" height="25" tag="3"><div align="center" class="style1">
        <div align="center">摘要</div>
      </div></td>
      <td width="3%" height="25" tag="4"><div align="center" class="style1">
        <div align="center">借方</div>
      </div></td>
      <td width="3%" height="25" tag="5"><div align="center" class="style1">
        <div align="center">贷方</div>
      </div></td>
      <td width="7%" height="25" tag="6"><div align="center" class="style1">
        <div align="center">金额</div>
      </div></td>
      <td width="4%" bgcolor="#CCFFFF"  tag="7"><div align="center" class="style1">
        <div align="center">所属项目</div>
      </div></td>
      <td width="8%" bgcolor="#CCFFFF"  tag="8"><div align="center"><span class="style1">项目编号</span></div></td>
      <td width="4%" bgcolor="#CCFFFF"  tag="9"><div align="center"><span class="style1"> 项目承担部门 </span></div></td>
      <td width="3%" bgcolor="#CCFFFF"  tag="10"><div align="center"><span class="style1"> 项目责任人 </span></div></td>
      <td width="7%" bgcolor="#CCFFFF"  tag="11"><div align="center"><span class="style1"> 项目预算 </span></div></td>
      <td width="5%" bgcolor="#CCFFFF"  tag="12"><div align="center"><span class="style1">项目开始日期</span></div></td>
      <td width="4%" bgcolor="#99FFFF"  tag="13"><div align="center" class="style1">
        <div align="center">所属合同 </div>
      </div></td>
      <td width="4%" bgcolor="#99FFFF"  tag="14"><div align="center"><span class="style1">合同编号</span></div></td>
      <td width="2%" bgcolor="#99FFFF"  tag="15"><div align="center"><span class="style1">甲方</span></div></td>
      <td width="2%" bgcolor="#99FFFF"  tag="16"><div align="center"><span class="style1">乙方</span></div></td>
      <td width="2%" bgcolor="#99FFFF"  tag="17"><div align="center"><span class="style1">丙方</span></div></td>
      <td width="4%" bgcolor="#99FFFF"  tag="18"><div align="center"><span class="style1">合同签订日期</span></div></td>
      <td width="7%" bgcolor="#99FFFF"  tag="19"><div align="center"><span class="style1">合同价款</span></div></td>
      <td width="7%"  tag="20"><div align="center" class="style1">
        <div align="center">资金支付方式</div>
      </div></td>
      <td width="4%"  tag="21"><div align="center" class="style1">
        <div align="center">采购形式</div>
      </div></td>
      <td width="5%"  tag="22"><div align="center" class="style1">
        <div align="center">项目分类</div>
      </div></td>
    </tr>
	<tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td width="4%" height="25"  tag="1"><div align="center">2006-12-12</div></td>
      <td width="7%" height="25"  tag="2"><div align="center">1234567890</div></td>
      <td width="3%" height="25" title="完整的摘要信息"  tag="3"><div align="left">摘要..</div></td>
      <td width="3%" height="25"  tag="4"><div align="left">银行存款</div></td>
      <td width="3%" height="25"  tag="5"><div align="left">应付款</div></td>
      <td height="25"  tag="6"><div align="right">321,113.23</div></td>
      <td height="25" align="center" bgcolor="#CCFFFF" title="完整的合同名称"  tag="7"><div align="left">项目aaa..</div></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="8"><div align="center">abcdefg12345</div></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="9"><div align="left">xxx部门</div></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="10"><div align="left">张三</div></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="11"><div align="right">323,121.10</div></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="12">2006-12-21</td>
      <td height="25" align="center" bgcolor="#99FFFF" title="完整的项目名称"  tag="13"><div align="left">关于xxx的合同 </div></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="14"><div align="center">12345</div></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="15"><div align="left">李四</div></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="16"><div align="left">王五</div></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="17"><div align="left">赵六</div></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="18"><div align="center">2006-12-21</div></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="19"><div align="right">232,124.00</div></td>
      <td align="center" title="xxx项目xxx项目"  tag="20"><div align="left">财政直接支付</div></td>
      <td align="center"  title="备注信息备注信息备注信息"  tag="21"><div align="left">自行组织分散采购</div></td>
      <td align="center"  title="备注信息备注信息备注信息"  tag="22"><div align="left">工程</div></td>
    </tr>
</table>
<p id="theP" align="center" style="display:none"><input type="button" onClick="alert('生成Excel报表')" class="bt1" value="生成Excel"></p>

<table style="display:none " width="95%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
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
    <td>借方科目</td>
    <td>&nbsp;<input type="text" class="txt1" size="40" name="jie_kemu"  style="width:90% "/>
        <img src="../images/clip.gif" onClick="getPopValue(jie_kemu,'../basedata/popups/accountant_subject.htm')" style="cursor:pointer "/> </td>
    <td>贷方科目</td>
    <td align="left" nowrap> <span class="style1"> &nbsp;<input type="text" class="txt1" size="40" name="dai_kemu"  style="width:90% "/>
          <img src="../images/clip.gif" onClick="getPopValue(dai_kemu,'../basedata/popups/accountant_subject.htm')" style="cursor:pointer "/> </span>
        <input name="prjPerson2" type="text" class="txt1" size="18" style="display:none "/>
        <span class="style1"> </span></td>
  </tr>
  <tr bgcolor="#EEF4FF" class="lc2">
    <td height="25">所属项目</td>
    <td >&nbsp;<input name="belongedPrj" type="text" class="txt1" size="60" style="width:90% ">
        <img src="../images/clip.gif" onClick="getPopValue(belongedPrj, '../project/miniPrjList0.htm')" style="cursor:pointer "/>
        <input name="yi" type="text" class="txt1" style="display:none " size="32" />
    </td>
    <td >所属合同</td>
    <td >&nbsp;<input name="belongedContract" type="text" class="txt1" size="60"  style="width:90% ">
        <img src="../images/clip.gif" onClick="getPopValue(belongedContract,'../contract/miniContractList.htm')" style="cursor:pointer "/></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">资金支付方式</td>
    <td >&nbsp;<input type="text" class="txt1" size="40" name="payment"  style="width:90% "/>
        <img src="../images/clip.gif" onClick="getPopValue(payment, '../basedata/popups/payment.htm')" style="cursor:pointer "/></td>
    <td >政府采购方式</td>
    <td > &nbsp;<input type="text" class="txt1" size="40" name="cai_gou"  style="width:90% " />
        <img src="../images/clip.gif" onClick="getPopValue(cai_gou, '../basedata/popups/cai_gou.htm')" style="cursor:pointer "/></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25">政府采购组织形式</td>
    <td >&nbsp;<input type="text" class="txt1" size="40" name="caigou_zz"  style="width:90% " />
        <img src="../images/clip.gif" onClick="getPopValue(caigou_zz, '../basedata/popups/caigou_zuzhi.htm')" style="cursor:pointer "/> </td>
    <td >政府采购项目分类</td>
    <td >&nbsp;<input type="text" class="txt1" size="40" name="caigou_xm"  style="width:90% " />
        <img src="../images/clip.gif" onClick="getPopValue(caigou_xm, '../basedata/popups/caigou_xm.htm')" style="cursor:pointer "/></td>
  </tr>
</table>
<p align="center">  <img src="../images/find.gif"  onClick="alert('查询')" style="cursor:pointere;display:none " />&nbsp;</p>
</body>
</html>
