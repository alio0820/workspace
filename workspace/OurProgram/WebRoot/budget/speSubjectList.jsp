<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>专项款维护</title>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
<!--
table {font-size:9pt;}
th {font-size:12pt;font-family:宋体;}
-->
</style> 
<script language="JavaScript">
<!--
function _show(snumber,sname,sdate,saccount,summary){
	document.form1.snumber.value = snumber;
	document.form1.sname.value = sname;
	document.form1.sdate.value = sdate;
	document.form1.saccount.value = saccount;
	document.form1.summary.value = summary;
}
function _getDate(_txt)
{
	var w = 200;   // 宽度
	var h = 210;   // 高度
	var x = event.screenX - event.offsetX - w/2;   // + deltaX;
	var y = event.screenY - event.offsetY + 20;    // + deltaY;
	
	
	var state = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;dialogLeft:" + x + "px;dialogTop:" + y + "px;status:no;directories:yes;scrollbars:no;resizable=no;";
	//alert(state);
	var a = window.showModalDialog("datex.HTM","",state);
	if(a != null)
		_txt.value = a;
}
//-->
</script>
</head>

<body background="../images/grid.gif">
<form name="form1" method="post" action="">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
    <tr align="center" bgcolor="#6699CC"> 
      <th height="25" colspan="6"><strong><font color="#FFFFFF">专项款明细</font></strong></th>
    </tr>
    <tr bgcolor="#A6D0F2"> 
      <td align="center" width="5%"><strong>序号</strong></td>
      <td width="15%" align="center"><strong>时间</strong></td>
      <td width="25%" align="center"><strong>摘要</strong></td>
      <td width="20%" align="center"><strong>金额</strong></td>
      <td height="25" align="center"><strong>所属专项</strong></td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td height="25" align="center">1</td>
      <td><div align="center">2006-07-08</div></td>
      <td>&nbsp;</td>
      <td align="right">100,000.00</td>
      <td align="left">&nbsp;&nbsp;地方版一拖N改造专项</td>
    </tr>
    <tr bgcolor="EEF4FF"   onmouseover="this.bgColor='#EBEBEB';" onmouseout="this.bgColor='#EEF4FF';"> 
      <td height="24" align="center">2</td>
      <td align="center">2006-06-05</td>
      <td>&nbsp;</td>
      <td align="right">50,000.00</td>
      <td align="left">&nbsp;&nbsp;地方版一拖N改造专项补充</td>
    </tr>
  </table>
  <br>
  <!--table width="600" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#426199">
    <tr align="center" bgcolor="#6699CC"> 
      <th height="25" colspan="2"><strong><font color="#FFFFFF">专项款维护</font></strong></th>
    </tr>
    <tr> 
      <td width="20%" height="25" align="left" bgcolor="#A6D0F2"><strong>序号</strong></td>
      <td align="left" bgcolor="EEF4FF">&nbsp;<input type="text" name="snumber" style="width:98%" class="txt1"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>时间</strong></td>
      <td align="left" bgcolor="EEF4FF">&nbsp;<input name="sdate" type="text" class="txt1" id="sdate" style="width:92%" readonly>&nbsp;<img src="../images/calendar.gif" border="0" style="cursor:hand" onClick="_getDate(sdate)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>摘要</strong></td>
      <td align="left" bgcolor="EEF4FF">&nbsp;<input name="summary" type="text" class="txt1" id="summary" style="width:98%" value=""></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>金额</strong></td>
      <td align="left" bgcolor="EEF4FF">&nbsp;<input name="saccount" type="text" class="txt1" id="saccount" style="width:98%"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td height="25" align="left" bgcolor="#A6D0F2"><strong>所属专项</strong></td>
      <td align="left" bgcolor="EEF4FF">&nbsp;<input name="sname" type="text" class="txt1" id="sname" style="width:98%"></td>
    </tr>
  </table-->
  <table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="center"><!--img src="../images/add.gif" border="0" style="cursor:hand;" onclick='javascript:alert("添加成功！");'>&nbsp; 
        <img src="../images/modify.gif" border="0" style="cursor:hand;" onclick='javascript:alert("数据已修改！");'>&nbsp; 
        <img src="../images/delete.gif" border="0" style="cursor:hand;" onclick='javascript:alert("数据已删除！");'>&nbsp;-->
		<img src="../images/return.gif" border="0" style="cursor:hand;" onClick="javascript:window.history.go(-1);"></td>
    </tr>
  </table>
  </form>
</body>
</html>
