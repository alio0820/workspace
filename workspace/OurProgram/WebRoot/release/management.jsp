<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>数据展现</title>
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
function _show(cred_code,cred_date,summary,borrow,lend,remain,paymode,stockorg,stockmode,stocksubject,accountsubject){
	document.form1.cred_code.value = cred_code;
	document.form1.cred_date.value = cred_date;
	document.form1.summary.value = summary;
	chooseSelected("accountsubject",accountsubject);
	document.form1.borrow.value = borrow;
	document.form1.lend.value = lend;
	document.form1.remain.value = remain;
	chooseSelected("paymode",paymode);
	chooseSelected("stockorg",stockorg);
	chooseSelected("stockmode",stockmode);
	chooseSelected("stocksubject",stocksubject);
	
}
function chooseSelected(where,txt){
	var element = document.getElementById(where);
	for (var i = 0;i<element.options.length;i++){
	  if (element.options[i].text == txt){
	    element.options[i].selected = true;
		break;
	  }
	}
}
function changeTdContent(txt){
	/*for (var i = 0;i<2;i++){
		document.getElementById('varTd'+i).innerHTML = '&nbsp;'+txt;
	}*/
}
function changeTdColor(tr_index,td_index){
	var trs = document.getElementById("nav").getElementsByTagName("tr");
	for (var i = 0;i<trs.length;i++){
	  for (var j = 0;j<trs[i].cells.length;j++){
	    trs[i].cells[j].bgColor = "#FFFFFF";
	  }
	}
	trs[tr_index].cells[td_index].bgColor = "#cccccc";
}
function _getDate(_txt)
{
	var w = 200;   // 宽度
	var h = 210;   // 高度
	var x = event.screenX - event.offsetX - w/2;   // + deltaX;
	var y = event.screenY - event.offsetY + 20;    // + deltaY;
	
	
	var state = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;dialogLeft:" + x + "px;dialogTop:" + y + "px;status:no;directories:yes;scrollbars:no;resizable=no;";
	//alert(state);
	var a = window.showModalDialog("../budget/datex.HTM","",state);
	if(a != null)
		_txt.value = a;
}
function chgPic(param){
	if (param == 'x'){
		document.all("old").src = "../images/no.gif";
		document.all("old").title = "未发布数据";
	}else{
		document.all("old").src = "../images/yes.gif";
		document.all("old").title = "已发布数据";
	}
}
//-->
</script>
</head>

<body background="../images/grid.gif">
<form name="form1" method="post" action="">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
    <tr align="center" bgcolor="#6699CC"> 
      <th height="25" colspan="13"><strong><font color="#FFFFFF">待发布信息列表</font></strong></th>
    </tr>
    <tr bgcolor="#A6D0F2"> 
      <td width="3%" align="center" bgcolor="#A6D0F2">&nbsp;</td>
      <td width="5%" height="25" align="center"><strong>凭证号</strong></td>
      <td width="8%" align="center" bgcolor="#A6D0F2"><strong>日期</strong></td>
      <td width="8%" align="center" bgcolor="#A6D0F2"><strong>摘要</strong></td>
	  <td width="10%" align="center" bgcolor="#A6D0F2"><strong>会计科目</strong></td>
      <td width="9%" align="center" bgcolor="#A6D0F2"><strong>借方金额</strong></td>
      <td width="9%" align="center" bgcolor="#A6D0F2"><strong>贷方金额</strong></td>
      <td width="10%" align="center"><strong>余款</strong></td>
      <td width="10%" align="center"><strong>支付方式</strong></td>
      <td align="center"><strong>采购形式</strong></td>
      <td width="8%" align="center"><strong>采购方式</strong></td>
      <td width="8%" align="center"><strong>项目分类</strong></td>
      <td width="3%" align="center" bgcolor="#A6D0F2">&nbsp;</td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td align="center" bgcolor="EEF4FF"><input type="radio" name="radiobutton" value="radiobutton" onClick="_show('003','2006-07-08','财政拨款','5000000','0','5000000','财政直接支付','自行组织集中采购机构采购','公开招标','货物','在建工程');"></td>
      <td height="25" align="center">003</td>
      <td><div align="center">2006-07-08</div></td>
      <td title="财政拨款">&nbsp;财政拨款</td>
      <td id="td01">&nbsp;在建工程</td>
      <td align="right">5,000,000.00</td>
      <td align="right">0.00</td>
      <td align="right">5,000,000.00</td>
      <td>&nbsp;财政直接支付</td>
      <td>&nbsp;自行组织集中采购机构采购</td>
      <td>&nbsp;公开招标</td>
      <td>&nbsp;货物</td>
      <td align="center" bgcolor="EEF4FF"><img src="../images/yes.gif" width="13" height="13" title="已发布数据"></td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td align="center" bgcolor="EEF4FF"><input type="radio" name="radiobutton" value="radiobutton" onClick="_show('004','2006-08-08','金审工程一期-应用软件','0','90000','4910000','财政直接支付','自行组织集中采购机构采购','公开招标','货物','银行存款');"></td>
      <td height="25" align="center">004</td>
      <td><div align="center">2006-08-08</div></td>
      <td title="金审工程一期-应用软件">&nbsp;金审工程...</td>
      <td id="td02">&nbsp;银行存款</td>
      <td align="right">0.00</td>
      <td align="right">90,000.00</td>
      <td align="right">4,910,000.00</td>
      <td>&nbsp;财政直接支付</td>
      <td>&nbsp;自行组织集中采购机构采购</td>
      <td>&nbsp;公开招标</td>
      <td>&nbsp;货物</td>
      <td align="center" bgcolor="EEF4FF"><img src="../images/no.gif" width="13" height="13" title="未发布数据" id="old"></td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td align="center" bgcolor="EEF4FF"><input type="radio" name="radiobutton" value="radiobutton" onClick="_show('005','2006-08-08','金审工程一期-应用软件','0','200000','4710000','实拨资金','自行组织部门集中采购','单一来源','服务','银行存款');"></td>
      <td height="25" align="center">005</td>
      <td><div align="center">2006-08-08</div></td>
      <td title="金审工程一期-应用软件">&nbsp;金审工程...</td>
      <td id="td02">&nbsp;银行存款</td>
      <td align="right">0.00</td>
      <td align="right">200,000.00</td>
      <td align="right">4,710,000.00</td>
      <td>&nbsp;实拨资金</td>
      <td>&nbsp;自行组织部门集中采购</td>
      <td>&nbsp;单一来源</td>
      <td>&nbsp;服务</td>
      <td align="center" bgcolor="EEF4FF"><img src="../images/no.gif" width="13" height="13" title="未发布数据"></td>
    </tr>
  </table>
  <br>
  <table width="80%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
    <tr align="center" bgcolor="#6699CC"> 
      <th height="25" colspan="4"><strong><font color="#FFFFFF">数据发布维护</font></strong></th>
    </tr>
    <tr> 
      <td width="15%" height="25" align="left" bgcolor="#A6D0F2"><strong>凭证号</strong></td>
      <td width="35%" align="left" bgcolor="EEF4FF">
<input name="cred_code" type="text" class="txt1" id="cred_code" style="width:98%">
      </td>
      <td width="15%" align="left" bgcolor="#A6D0F2"><strong>日期</strong></td>
      <td width="35%" align="left" bgcolor="EEF4FF"> 
        <input name="cred_date" type="text" class="txt1" id="cred_date" style="width:88%" readonly>
        <img src="../images/calendar.gif" border="0" style="cursor:hand" onClick="_getDate(cred_date)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>摘要</strong></td>
      <td align="left" bgcolor="EEF4FF"><input name="summary" type="text" class="txt1" id="summary" style="width:98%"></td>
      <td align="left" bgcolor="#A6D0F2"><strong>会计科目</strong></td>
      <td align="left" bgcolor="EEF4FF"><select name="accountsubject" id="accountsubject" style="width:97%">
          <option>----</option>
          <option>银行存款</option>
          <option>建筑安装投资</option>
          <option>设备投资</option>
          <option>待摊投资</option>
          <option>其他投资</option>
          <option>应付款</option>
          <option>基建拨款</option>
          <option>交付使用资产</option>
          <option>在建工程</option>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>借方金额</strong></td>
      <td align="left" bgcolor="EEF4FF"><input name="borrow" type="text" class="txt1" id="borrow" style="width:98%"></td>
      <td align="left" bgcolor="#A6D0F2"><strong>贷方金额</strong></td>
      <td align="left" bgcolor="EEF4FF"><input name="lend" type="text" class="txt1" id="lend" style="width:97%"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>余款</strong></td>
      <td align="left" bgcolor="EEF4FF"><input name="remain" type="text" class="txt1" id="remain" style="width:98%"></td>
      <td align="left" bgcolor="#A6D0F2"><strong>支付方式</strong></td>
      <td align="left" bgcolor="EEF4FF"><select name="paymode" id="select2" style="width:97%">
          <option>----</option>
          <option>财政直接支付</option>
          <option>财政授权支付</option>
          <option>实拨资金</option>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>采购形式</strong></td>
      <td align="left" bgcolor="EEF4FF"><select name="stockorg" id="select3" style="width:98%">
          <option>----</option>
          <option>自行组织集中采购机构采购</option>
          <option>委托组织集中采购机构采购</option>
          <option>自行组织部门集中采购</option>
          <option>委托组织部门集中采购</option>
          <option>自行组织分散采购</option>
          <option>委托组织分散采购</option>
        </select></td>
      <td align="left" bgcolor="#A6D0F2"><strong>采购方式</strong></td>
      <td align="left" bgcolor="EEF4FF"><select name="stockmode" id="select4" style="width:97%">
          <option>----</option>
          <option>公开招标</option>
          <option>邀请招标</option>
          <option>竞争性谈判</option>
          <option>询价</option>
          <option>单一来源</option>
          <option>其他</option>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>项目分类</strong></td>
      <td colspan="3" align="left" bgcolor="EEF4FF"><select name="stocksubject" id="stocksubject" style="width:99%">
          <option>----</option>
          <option>货物</option>
          <option>工程</option>
          <option>服务</option>
        </select></td>
    </tr>
  </table>
  <!--table width="600" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
    <tr align="center" bgcolor="#6699CC"> 
      <th height="25" colspan="2"><strong><font color="#FFFFFF">数据发布维护</font></strong></th>
    </tr>
    <tr> 
      <td width="20%" height="25" align="left" bgcolor="#A6D0F2"><strong>凭证号</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<input name="cred_code" type="text" class="txt1" id="cred_code" style="width:98%"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>日期</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<input name="cred_date" type="text" class="txt1" id="cred_date" style="width:92%" readonly>
        <img src="../images/calendar.gif" border="0" style="cursor:hand" onClick="_getDate(cred_date)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>摘要</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<input name="summary" type="text" class="txt1" id="summary" style="width:98%"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>会计科目</strong></td>
      <td align="left" bgcolor="EEF4FF"> &nbsp;<select name="accountsubject" id="accountsubject" style="width:98%">
          <option>----</option>
          <option>银行存款</option>
          <option>建筑安装投资</option>
          <option>设备投资</option>
          <option>待摊投资</option>
          <option>其他投资</option>
          <option>应付款</option>
          <option>基建拨款</option>
          <option>交付使用资产</option>
          <option>在建工程</option>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>借方金额</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<input name="borrow" type="text" class="txt1" id="borrow" style="width:98%"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>贷方金额</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<input name="lend" type="text" class="txt1" id="lend" style="width:98%"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>余款</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<input name="remain" type="text" class="txt1" id="remain" style="width:98%"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>支付方式</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<select name="paymode" id="paymode" style="width:98%">
          <option>----</option>
          <option>财政直接支付</option>
          <option>财政授权支付</option>
          <option>实拨资金</option>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>采购形式</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<select name="stockorg" id="stockorg" style="width:98%">
          <option>----</option>
          <option>自行组织集中采购机构采购</option>
          <option>委托组织集中采购机构采购</option>
          <option>自行组织部门集中采购</option>
          <option>委托组织部门集中采购</option>
          <option>自行组织分散采购</option>
          <option>委托组织分散采购</option>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>采购方式</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<select name="stockmode" id="stockmode" style="width:98%">
          <option>----</option>
          <option>公开招标</option>
          <option>邀请招标</option>
          <option>竞争性谈判</option>
          <option>询价</option>
          <option>单一来源</option>
          <option>其他</option>
        </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>项目分类</strong></td>
      <td align="left" bgcolor="EEF4FF">
&nbsp;<select name="stocksubject" id="stocksubject" style="width:98%">
          <option>----</option>
          <option>货物</option>
          <option>工程</option>
          <option>服务</option>
        </select></td>
    </tr>
  </table-->
  <br>
  <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="center"><input type="button" name="Submit" value=" 修 改 " onClick="alert('数据已修改！');">
        &nbsp;
        <input type="button" name="Submit2" value=" 发 布 " onClick="alert('数据已发布！');chgPic();">
        &nbsp;
        <input type="button" name="Submit3" value="取消发布" onClick="alert('发布已取消！');chgPic('x');"></td>
    </tr>
  </table>
</form>
</body>
</html>
