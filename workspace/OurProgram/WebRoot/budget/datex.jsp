<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD><TITLE>日期选择</TITLE>
<META content="text/html; charset=gb2312" http-equiv=Content-Type>
<META content="MSHTML 5.00.2920.0" name=GENERATOR></HEAD>
<BODY bgColor="#EEF4FF" onload=fload()>
<SCRIPT src="date.script" >
</SCRIPT>

<SCRIPT>
function fload()
{
	fPopCalendar(document.all.txt1, document.all.txt1); 
}

function fkeydown()
{
	//alert( event.keyCode );
	if(event.keyCode==27){
		event.returnValue = null;
		window.returnValue = null;
		window.close();
	}
}

document.onkeydown=fkeydown;
</SCRIPT>
<INPUT id=txt1 style="DISPLAY: none"> 
</BODY></HTML>
