<%@ page contentType="text/html; charset=GBK" %>

<!-- <%@ taglib uri="/WEB-INF/j2ee-html.tld" prefix="html" %> -->

<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>

<SCRIPT language=JavaScript src="../../../include/calendar.js"></SCRIPT>
<html>
<head>
<title>�鿴�����ڿ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="/application/include/style.css">
</head>
<script language="JavaScript">
function opernNewWind(){
	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	retval = window.showModalDialog("unittemple.htm", "", "dialogWidth:350px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
window.MainDeliverDept.value=retval;
}
function opernNewWind2(obj){
	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	retval = window.showModalDialog("unittemple.htm", "", "dialogWidth:350px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
	if(retval!=null){
		obj.value=retval;
	}
}
function opernNewWind3(){
	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	retval = window.showModalDialog("unittemple.htm", "", "dialogWidth:350px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
window.SubDeliverDept.value=retval;
}
function opernNewWind5(obj){
	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	retval = window.showModalDialog("subject1.htm", "", "dialogWidth:350px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
	if(retval!=null){
		obj.value=retval;
	}
}
function opernNewWind6(obj){
	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	retval = window.showModalDialog("filenum.htm", "", "dialogWidth:350px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop?��???��?��?��?????��?����?�B���[??�ϳ���???????????����������H�בV��?��?����?�B���[???��?????�؛D��?????????���қϜ�?��?��ĵ�����׵�������̭�}?�ϳ���????????�x?�՘L��>:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
	if(retval!=null){
		obj.value=retval;
	}
}
function opernNewWind7(){
	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	retval = window.showModalDialog("unittemple.htm", "", "dialogWidth:350px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
	window.Subject2.value=retval;
}

function _newDoc(){
	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	retval = window.showModalDialog("/application/docmanage/receivmanage/inputdoc.jsp", "", "dialogWidth:450px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
	//window.open("/application/docmanage/dispatchmanage/selectWorkForm.jsp", "", "dialogWidth:430px; dialogHeight:280px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; dependent=yes"  );
	//alert(retval);
	if( retval != null ){
		window.form1.action="/application/docmanage/dispatchmanage/newdoc.jsp";
		window.form1.submit();
		return true;
	}else{
		//window.form1.action="/application/docmanage/dispatchmanage/newdoc.jsp";
		//return true;
	}
}

function _newDoc1(){

	showx = event.screenX - event.offsetX/2; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;
	retval="";
	//retval = window.showModalDialog("/application/docmanage/receivmanage/imputaccessory.jsp", "", "dialogWidth:450px; dialogHeight:380px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
	window.showModalDialog("/application/docmanage/receivmanage/imputaccessory.jsp", "", "dialogWidth:470px; dialogHeight:400px; dialogLeft:"+showx+"px; dialogT?��???��?��?��?????��?����?�B���[??�ϳ���???????????����������H�בV��?��?����?�B���[???��?????�؛D��?????????���қϜ�?��?��ĵ�����׵�������̭�}?�ϳ���????????�x?�՘L��>op:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; " );
	//window.open("/application/docmanage/dispatchmanage/selectWorkForm.jsp", "", "dialogWidth:430px; dialogHeight:280px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; dependent=yes"  );
	//alert(retval);
	//alert(retval);
	//if( retval != null ){
	//	window.form1.action="/application/docmanage/dispatchmanage/newdoc.jsp";
	//	window.form1.submit();
	//	return true;
//	}else{
		//window.form1.action="/application/docmanage/dispatchmanage/newdoc.jsp";
		//return true;
	//}
}
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("/application/include/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

</script>
<body bgcolor="#FFFFFF" text="#000000">
<table width="90%" border="0" cellpadding="0" cellspacing="0">
  <tr>
      <td>
      <form name="periodicalSelect"   method="post" onSubmit="return _check()">
        <table width="90%" border="1"      cellspacing="0" cellpadding="1" align="center" bordercolordark="#DFDFFF" bordercolorlight="#003366" bgcolor="#EEF4FF">
          <tr bgcolor="#A6D0F2" height="25"> 
            <td colspan="5" > <div align="center">�߼���ѯ 
                <input type="checkbox" name="checkbox" value="checkbox">
                ģ����ѯ</div></td>
          </tr>
          <tr > 
            <td width="13%"  > ����</td>
            <td height="30" colspan="3" align="left"><input type="text"  size="60" name="textfield4"> 
            </td>
            <td width="12%" align="center">
<select name="select">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td >���͵�λ</td>
            <td colspan="3" ><input type="text"  size="60" name="textfield5">
              <img src="..\..\images\edit.gif" style="cursor:hand" onClick="opernNewWind2(textfield5);" width="17" height="15"></td>
            <td align="center">
<select name="select3">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td>���͵�λ</td>
            <td colspan="3" ><input type="text" size="60" name="textfield6">
              <img src="..\..\images\edit.gif" style="cursor:hand" onClick="opernNewWind2(textfield6);" width="16" height="15"></td>
            <td align="center">
<select name="select4">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td >���ĵ�λ</td>
            <td colspan="3" ><input type="text" size="60" name="textfield7">
              <img src="..\..\images\edit.gif" style="cursor:hand" onClick="opernNewWind2(textfield7);" width="16" height="15"></td>
            <td align="center">
<select name="select5">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td  width="13%" >�����̶�</td>
            <td width="28%"  ><select name="select11">
                <option value="0">����</option>
                <option value="1">����</option>
                <option value="2">�ؼ�</option>
                <option value="3">һ��</option>
              </select></td>
            <td  width="11%">���ܵȼ�</td>
            <td width="31%" ><select name="select12">
                <option value="0">����</option>
                <option value="1">����</option>
                <option value="2">����</option>
                <option value="3">����</option>
                <option value="4">�ڲ�</option>
                <option value="5">����</option>
                <option value="6">����</option>
              </select></td>
            <td    width="12%" align="center">
<select name="select6">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td >�������</td>
            <td ><select name="select13">
                <option value="0">��������</option>
                <option value="1">�ۺϾ���</option>
                <option value="2">�����칫</option>
              </select></td>
            <td >�������</td>
            <td ><select name="select14">
                <option value="0">����</option>
                <option>��</option>
                <option>���</option>
              </select></td>
            <td align="center">
<select name="select7">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td >�����</td>
            <td > <input type="text" name="textfield"> <img src="..\..\images\edit.gif" style="cursor:hand" onClick="opernNewWind5(textfield);" width="16" height="15"></td>
            <td >�����ֺ�</td>
            <td > <input type="text" name="textfield8">
              <img src="..\..\images\edit.gif" style="cursor:hand" onClick="opernNewWind6(textfield8);" width="16" height="15"></td>
            <td align="center">
<select name="select8">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td height="28">����ʱ��</td>
            <td colspan="3" ><input type="text"  name="startTime" size="10" maxlength="10" class="bt1">
              <img src="../../images/calendar.gif" onClick="fPopUpCalendarDlg(startTime);"  style="cursor:hand" WIDTH="17" HEIGHT="17">�� 
              <input type="text" name="endTime" size="10" maxlength="10"  class="bt1"> 
              <img src="../../images/calendar.gif" onClick="fPopUpCalendarDlg(endTime);"  style="cursor:hand" WIDTH="17" HEIGHT="17"> 
            </td>
            <td align="center">
<select name="select9">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td >����ʱ��</td>
            <td colspan="3" ><input type="text"  name="startTime2" size="10" maxlength="10" class="bt1">
              <img src="../../images/calendar.gif" onClick="fPopUpCalendarDlg(startTime2);"  style="cursor:hand" WIDTH="17" HEIGHT="17">�� 
              <input type="text" name="endTime2" size="10" maxlength="10" class="bt1"> 
              <img src="../../images/calendar.gif" onClick="fPopUpCalendarDlg(endTime2);"  style="cursor:hand" WIDTH="17" HEIGHT="17"> 
            </td>
            <td align="center">
<select name="select10">
                <option value="1">��</option>
                <option value="0">��</option>
              </select></td>
          </tr>
          <tr > 
            <td  colspan="5"><div align="center"> 
                <input type="button" name="Submit" value="��ѯ" class="bt1" onClick="_check()">
              </div></td>
          </tr>
          <tr  id="searchList"  style="display:none"> 
            <td  colspan="5"> <table width="100%" border="1" cellspacing="0" cellpadding="1" align="center" bordercolordark="#DFDFFF" bordercolorlight="#003366">
                <tr> 
                  <td bgcolor="#A6D0F2" align="center">��ѯ�����б�</td>
                </tr>
                <tr> 
                  <td> <table width="100%" border="1" cellspacing="0" cellpadding="1" align="center" bordercolordark="#DFDFFF" bordercolorlight="#003366" bgcolor="#EEF4FF">
                      <tr > 
                        <td width="22%" height="23"><div align="center">��������</div></td>
                        <td width="21%" ><div align="center">�����ܼ�</div></td>
                        <td width="24%" ><div align="center">���ĵ�λ</div></td>
                        <td width="33%" ><div align="center">�յ�ʱ��</div></td>
                      </tr>
                      <tr > 
                        <td height="22"> <div align="center" onMouseOver="style.cursor='hand';"><a href="file://///youyou/ResourceOneApp.war/application/docmanage/receivmanage/detaildoc.jsp">����**�ľ���</a></div></td>
                        <td><div align="center">����</div></td>
                        <td><div align="center">�칫��</div></td>
                        <td><div align="center">1111��11��11</div></td>
                      </tr>
                      <tr > 
                        <td><div align="center" onMouseOver="style.cursor='hand';"><a href="file://///youyou/ResourceOneApp.war/application/docmanage/receivmanage/detaildoc.jsp">����**�ľ���</a></div></td>
                        <td><div align="center">����</div></td>
                        <td><div align="center">���������</div></td>
                        <td><div align="center">2222��22��22</div></td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
        </table>
        </form>
      </td>
    </tr>
</table>
</body>
</html>
<script language="javascript">
  function _check1() {
           if(!is_date(document.periodicalSelect.startTime)) {
             alert("������'yyyy-mm-dd'��ʽ����");
             document.periodicalSelect.startTime.focus();
             return false;
           }
           if(!is_date(document.periodicalSelect.endTime)) {
             alert("������'yyyy-mm-dd'��ʽ����");
             document.periodicalSelect.endTime.focus();
             return false;
           }
           if (!Is_Null(document.periodicalSelect.startTime) && !Is_Null(document.periodicalSelect.endTime) && _compareTwoDate(document.periodicalSelect.endTime,document.periodicalSelect.startTime))
           {
             alert("��������Ӧ�����ڿ�ʼ���ڣ�");
             document.periodicalSelect.endTime.focus();
             return false;
           }
           document.periodicalSelect.action="/servlet/com/icss/infocompile/periodicalquery/PeriodicalSelectServlet?typeName="+typeName;
           return true;
         }
		 
		 function _check()
		 {
		     if(document.all.searchList.style.display == "none"){
                   document.all.searchList.style.display = "";
            }else{
                  document.all.searchList.style.display = "none";
            }
		}
</script>
