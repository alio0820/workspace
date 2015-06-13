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
	//document.getElementById("theP").style.display="block";
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
		if (m == _r.length-1) {
			_r[m].style.display="block";
		} else {
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
}
function _clear() {
	var els = document.form1.elements;
	for (var i = 0; i < els.length; i++) {
		if (els[i].type=="text") {
			els[i].value="";
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
function showTb(tag) {
	for (var i = 1; i <=3; i++) {
		if(document.getElementById("tb_"+i).style.display=="none") {
			if(tag==i) {
				document.getElementById("tb_" + i).style.display="block";
				document.getElementById("sp_" + i).innerHTML="-";
			} else {
				document.getElementById("tb_" + i).style.display="none";
				document.getElementById("sp_" + i).innerHTML="+";
			}
		} else {
			document.getElementById("tb_"+i).style.display="none"
			document.getElementById("sp_" + i).innerHTML="+";
		}
	}
}
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">

<br/>
<form name="form1">




<table width="100%" border="0" align="center">
<tr>
<td width="12%" valign="top"><table id="cat_1" border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  
    <tr bgcolor="#6699CC" onClick="showTb(1)" style="cursor:pointer">
      <td height="25" colspan="2" id="td_1"><span id="sp_1">+</span><strong>项目信息</strong></td>
    </tr>
	<tbody  id="tb_1"  style="display:none ">
    <tr bgcolor="EEF4FF">
      <td height="31"><input type="checkbox" name="checkbox24" value="" title="项目编号" tag="8">
        项目编号              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="31"><input type="checkbox" name="checkbox23" value="" title="项目名称" tag="7">
        项目名称              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="31"><input type="checkbox" name="checkbox25" value="" title="项目承担部门"  tag="9">
        项目承担部门              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="31"><input type="checkbox" name="checkbox20" value=""   tag="10">
        责任人              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="31"><input type="checkbox" name="checkbox21" value=""  tag="11">
        项目预算              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="31"><div align="center">
      </div>        <div align="center">
          </div>      <div align="center">
          </div>        <div align="center">
          </div>      <div align="center"></div>      
      <div align="left">
        <input type="checkbox" name="checkbox22" value=""  tag="12">
        开始日期      </div></td>
      </tr>
	  </tbody>
 </table>
<table id="cat_2" border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
	<tr bgcolor="#6699CC" onClick="showTb(2)"  style="cursor:pointer">
      <td height="25" id="td_2"><span id="sp_2">+</span><span class="style1">合同信息</span></td>
    </tr>
	<tbody id="tb_2" style="display:none ">
    <tr bgcolor="EEF4FF">
      <td height="25"><input type="checkbox" id="checkbox123" name="checkbox12"  tag="14">
        合同编号              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="25"><input type="checkbox" id="checkbox133" name="checkbox13"  tag="13">
        合同名称              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="25"><input type="checkbox" id="checkbox144" name="checkbox14"   tag="15">
        甲方              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="25"><input type="checkbox" id="checkbox153" name="checkbox15"   tag="16">
        乙方              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="25"><input type="checkbox" id="checkbox163" name="checkbox16"   tag="17">
        丙方              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="25"><input type="checkbox" id="checkbox173" name="checkbox17"   tag="18">
        签订日期              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="25"><input type="checkbox" id="checkbox183" name="checkbox18"  tag="19">
        合同价款              </td>
      </tr>
    <tr bgcolor="EEF4FF">
      <td height="25"><div align="left">
        <input type="checkbox" id="checkbox192" name="checkbox19"  tag="7">
        所属项目
          
      </div></td>
      </tr>
	  </tbody>
</table>
<table id="cat_3" border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  
    <tr bgcolor="#6699CC"  onClick="showTb(3)"  style="cursor:pointer">
      <td width="81" height="25" colspan="11" id="td_3"><span id="sp_3">+</span><strong>财务信息</strong></td>
      </tr>
	 <tbody id="tb_3" style="display:none ">
    <tr bgcolor="EEF4FF"  id="tr_3">
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox262" name="checkbox26" tag="1">
        日期              </td>
      </tr>
    <tr bgcolor="EEF4FF"  id="tr_3">
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox272" name="checkbox27" checked disabled  tag="2">
        凭证号              </td>
      </tr>
    <tr bgcolor="EEF4FF"  id="tr_3">
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox282" name="checkbox28" tag="3">
        摘要              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox29" name="checkbox29" tag="4">
        借方              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox30" name="checkbox30" tag="5">
        贷方              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox31" name="checkbox31" tag="6">
        金额              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox32" name="checkbox32" tag="7">
        所属项目              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox33" name="checkbox33" tag="13">
        所属合同              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox34" name="checkbox34" tag="20">
        资金支付方式              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1"><input type="checkbox" id="checkbox35" name="checkbox35" tag="21">
        采购形式              </td>
      </tr>
    <tr bgcolor="EEF4FF" >
      <td height="25" colspan="11" id="td_1">       
        <div align="left">
          <input type="checkbox" id="checkbox36" name="checkbox" tag="22">
          项目分类        </div></td>
      </tr>
	  </tbody>
  </table>
  <p align="center">
  <input name="button" type="button" onClick="composite();" value="组合生成列表" class="bt1"/>
</p>
  </td>
<td width="88%" valign="top">
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
	<tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
      <td height="25"  tag="1"><input type="text" name="textfield" style="width:100% "></td>
      <td height="25"  tag="2"><input type="text" name="textfield2" style="width:100% "></td>
      <td height="25" title="完整的摘要信息"  tag="3"><input type="text" name="textfield3" style="width:100% "></td>
      <td height="25"  tag="4"><input type="text" name="textfield4" style="width:100% "></td>
      <td height="25"  tag="5"><input type="text" name="textfield5" style="width:100% "></td>
      <td height="25"  tag="6"><input type="text" name="textfield6" style="width:100% "></td>
      <td height="25" align="center" bgcolor="#CCFFFF" title="完整的合同名称"  tag="7"><input type="text" name="textfield7" style="width:100% "></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="8"><input type="text" name="textfield8" style="width:100% "></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="9"><input type="text" name="textfield9" style="width:100% "></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="10"><input type="text" name="textfield10" style="width:100% "></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="11"><input type="text" name="textfield11" style="width:100% "></td>
      <td align="center" bgcolor="#CCFFFF" title="完整的项目名称"  tag="12"><input type="text" name="textfield12" style="width:100% "></td>
      <td height="25" align="center" bgcolor="#99FFFF" title="完整的项目名称"  tag="13"><input type="text" name="textfield13" style="width:100% "></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="14"><input type="text" name="textfield14" style="width:100% "></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="15"><input type="text" name="textfield15" style="width:100% "></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="16"><input type="text" name="textfield16" style="width:100% "></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="17"><input type="text" name="textfield17" style="width:100% "></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="18"><input type="text" name="textfield18" style="width:100% "></td>
      <td align="center" bgcolor="#99FFFF" title="xxx项目xxx项目"  tag="19"><input type="text" name="textfield19" style="width:100% "></td>
      <td align="center" title="xxx项目xxx项目"  tag="20"><input type="text" name="textfield20" style="width:100% "></td>
      <td align="center"  title="备注信息备注信息备注信息"  tag="21"><input type="text" name="textfield21" style="width:100% "></td>
      <td align="center"  title="备注信息备注信息备注信息"  tag="22"><input type="text" name="textfield22" style="width:100% "></td>
  </tr>
	<tr bgcolor="EEF4FF" onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';">
	  <td height="25" colspan="22"  tag="1">
        <div align="right">
          <input type="button" value="过滤" onclick="alert('通过条件过滤列表')" class="bt1">
          <input name="按钮" type="button" value="全部" onclick="_clear()" class="bt1">
		  <input type="button" onClick="alert('生成Excel报表')" class="bt1" value="生成Excel">
        </div></td>
  </tr>
</table>
</td>
</tr>
</table>

<br/>
 <table width="100%" border="0" align="center" cellpadding="2" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr class="lc2" bgcolor="#6699CC">
    <td height="26" colspan="2">
      <div align="center"><strong><font color="#FFFFFF" size="4">组合报表发布</font></strong></div></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="17%" height="29">报表文件（Excel格式）</td>
    <td width="83%">&nbsp;
        <input name="prjName2" type="file" class="txt1" size="" style="width:98% ">
    </td>
  </tr>
</table>
<p align="center"><input name="" type="button" value="发布" class="bt1" onClick="if(confirm('您确定要发布该报表吗？')){alert('发布成功!')}"></p>
</form>
</body>
</html>
