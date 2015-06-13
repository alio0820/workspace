<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD><TITLE>审计署机关辅助办公系统(机关领导)</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">

<SCRIPT>
N=(document.all)? 0:1;         //表示页面下载完毕时N=0，没完全下载完N=1
function _expend(){
	if(N){
	    main_frmObj = document.getElementById("main_frm");
		main_frmObj.cols="160,10,*";
	}else{
		main_frm.cols="160,10,*";
	}
}
function _close(){
	if(N){
	    main_frmObj = document.getElementById("main_frm");
		main_frmObj.cols="0,10,*";
	}else{
		main_frm.cols="0,10,*";
	}
}

mNav=1;//判断leftFrame是否打开的参数（0：关闭；1：打开）
function _funNav(typeID){
	//typeID：调用_funNav()的参数（0－按钮调用；菜单调用：1、常开，不能关闭;2、开始显示，但可不显示;3、开始不显示，但可显示;4、常闭，不能打开）
	if(typeID==0){
		if(mNav==0){
			_expend();
			window.top.navFrame.imgNav.src="images/1.gif";
			window.top.navFrame.divNav.style.display="block";
			mNav=1;
		}else{
			_close();
			window.top.navFrame.imgNav.src="images/2.gif";
			window.top.navFrame.divNav.style.display="block";
			mNav=0;
		}
	}
	if(typeID==1){
		_expend();
		window.top.navFrame.imgNav.src="images/1.gif";
		window.top.navFrame.divNav.style.display="none";
		mNav=1;
	}
	if(typeID==2){
		_expend();
		window.top.navFrame.imgNav.src="images/1.gif";
		window.top.navFrame.divNav.style.display="block";
		mNav=1;
	}
	if(typeID==3){
		_close();
		window.top.navFrame.imgNav.src="images/2.gif";
		window.top.navFrame.divNav.style.display="block";
		mNav=0;
	}
	if(typeID==4){
		_close();
		window.top.navFrame.imgNav.src="images/2.gif";
		window.top.navFrame.divNav.style.display="none";
		mNav=0;
	}
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1170" name=GENERATOR>
</HEAD>
<FRAMESET border=0 frameSpacing=0 rows=90,* frameBorder=NO cols=*>
	<FRAME name=topFrame src="AppTop.jsp" noResize scrolling=no>
	<FRAMESET id=main_frm border=0 name=main_frm frameSpacing=0 frameBorder=NO cols=0,10,*>
		<FRAME name=leftFrame src="Left.jsp" noResize scrolling=no>
		<FRAME name=navFrame borderColor=#ff6600 src="FrameControl.jsp" noResize scrolling=no>
		<FRAME name=mainFrame src="choose.jsp">
	</FRAMESET>
</FRAMESET>
</HTML>