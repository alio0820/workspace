<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>应用主菜单框架</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">


		<link rel="stylesheet" href="images/style.css">

		<script language=javascript>

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}

MM_reloadPage(true);

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}


function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

previous_index=0;
previous_src=0;
m_previous_index=0;
m_previous_src=0;
function over_change(index,src,clrOver){
	if(previous_index!=parseInt(index))
		if (!src.contains(event.fromElement))
	 		{

	 		src.style.cursor = 'hand';
	 //		src.bgColor = clrOver;
	        src.background="images/blue.gif";
	 		}
}

function out_change(index,src,clrIn){
	if(previous_index!=index)
		if (!src.contains(event.toElement))
			{
			src.style.cursor = 'default';
			//src.bgColor = clrIn;
			src.background="images/blue_2.gif";
			}
}

function click_change(index,src,clrIn){
 

	if(previous_src.contains)
		{
			if (!previous_src.contains(event.toElement))
	 			{
	 			previous_src.style.cursor = 'hand';
	 			//previous_src.bgColor = "#cccccc";
				previous_src.background="images/blue_2.gif";
	 			}
		}
	if (!src.contains(event.toElement))
		{
		src.style.cursor = 'default';
		//src.bgColor = clrIn;
		src.background="images/blue.gif";
		}

	previous_index=index;
	previous_src=src;
}

function onerror(aa,bb,cc)
{
alert(aa+"\n"+bb+"\n"+cc);
}
function mOvr(src,clrOver) {
	if (!src.contains(event.fromElement)) {
		src.style.cursor = 'hand'; src.bgColor = clrOver;
	}
}
function mOut(src,clrIn)
{
	if (!src.contains(event.toElement))
	{
		src.style.cursor = 'default'; src.bgColor = clrIn;
	}
}
function mClk(src)
{
	if(event.srcElement.tagName=='TD')
	{
		;
	}
}

function ModuleChange(index,src,clrclick,ModuleURL,ModuleNavURL,LeftFrameEnabled,Muuid,leftfirst)
{	
    // 将LeftFrameEnabled解析成整型就没问题了
    // 另外本文件的文件头<!DOC HTML......等必须存在才不会出错
    window.top._funNav(parseInt(LeftFrameEnabled));
	
    if((ModuleNavURL==null)||(ModuleNavURL=="")||(ModuleNavURL=="#")){

       window.top.leftFrame.location="Left.jsp?Muuid="+Muuid+"&leftfirst="+leftfirst;
    }
    else
    {
        window.top.leftFrame.location.href = ModuleNavURL;
    }
    
    if(ModuleURL!="")
    {
       window.top.mainFrame.location.href = ModuleURL;
    }
    
    if(m_previous_src.contains)
    {
        if (!m_previous_src.contains(event.toElement))
        {
            m_previous_src.bgColor = "";
        }
    }
    
    if (!src.contains(event.toElement))
    {
	    src.style.cursor = 'default';
	    src.bgColor = clrclick;
    }
    
    m_previous_index=index;
    m_previous_src=src;
}

function ModuleOver(index,src,clrover)
{
  if(m_previous_index!=parseInt(index))
	if (!src.contains(event.fromElement))
	{
 		src.style.cursor = 'hand';
		src.bgColor = clrover;
	}
  }
function ModuleOut(index,src,clrout)
{
    if(m_previous_index!=index)
		if (!src.contains(event.toElement))
			{
			src.style.cursor = 'default';
			src.bgColor = clrout;
		}
}


function changeToolUrl(url){
   window.top.mainFrame.location.href = url
}

function resetUserCustomize(){
   ok = confirm("该操作将恢复您的个性化设置为缺省设置,您确定吗?")
   if(ok){
     
     window.top.mainFrame.location.href = "/servlet/ResetUserCustomizeServlet";
   }
   else{
     return false;
   }
}

function saveMenu(){
   ok = confirm("该操作将保存您当前的菜单状态,下次登录将再现,确定吗?")
   if(ok){     
     _url="/servlet/SaveMenuStatusServlet?appgrpid=3&appuuid=b695649-f7672cb724-242060dc1d61ea155c793eea331b4ddd&moduleGrpKey="+previous_index+"&moduleKey="+m_previous_index;
     window.open(_url,"","toolbar=no,width=500,height=300,screenX="+screen.width/2+",screenY="+screen.height/2);
   }
   else{
     return false;
   }

}
function showonline(){
   
  _url="/resourceone/common/online.jsp";
  window.open(_url,"","scrollbars=yes,toolbar=no,width=220,screenX="+screen.width/2+",screenY="+screen.height/2);
  

}

function _addFavorite(){ 
url = "http://oa94.cnao.gov.cn:80"; 
title = "审计署机关辅助办公系统"; 
window.external.AddFavorite(url,title); 
}

function _changeModuleMenu(_moduleindex)
{   
   
   eval("document.all."+ _moduleindex +".click()");
   
}
function _changeModuleGroupMenu(_mpindex)
{   
   
   eval("document.all."+ _mpindex +".click()");
   
}

function _changeMenu(_mpindex,_moduleindex){

   if(_mpindex!="_mp0"){
     setTimeout("javascript:_changeModuleGroupMenu('"+_mpindex+"')",1000);
   }
   if(_moduleindex!="_module0"){
     setTimeout("javascript:_changeModuleMenu('"+_moduleindex+"')",1000);
   }
   
}  
function _showhelp(){
   
  _url="/resourceone/help/sitemap.jsp";
  window.open(_url,"","toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,width=800,screenX="+screen.width/2+",screenY="+screen.height/2);
  

}

</script>
	</head>
	<SCRIPT language=JavaScript type=text/javascript> //

var oPopup = window.createPopup();

function ShowMenu(WhichOne,Ypos,Height,width) {

  Xpos = document.body.scrollLeft + event.clientX - event.offsetX -3;

  Ypos = document.body.scrollTop + event.clientY - event.offsetY + Ypos;
  oPopup.document.body.style.backgroundColor = "#D9E6FF";

  oPopup.document.body.innerHTML = WhichOne.innerHTML;

  oPopup.show(Xpos,Ypos,width,Height,document.body);

}

// -->

function changeAppGroup(appgrpid)
{
   MM_showHideLayers('alertbox','','show');
   
   if(appgrpid == 3)
     window.top.topFrame.location="AppTop.htm";
   else if(appgrpid == 5)
     window.top.topFrame.location="AppTop_shenji.htm";
   else if(appgrpid == 7)
     window.top.topFrame.location="AppTop_xinxi.htm";
   else
     window.top.topFrame.location="AppTop.htm";
}

function appgrpover(src){

	src.style.cursor = 'hand';

}

function _logout(){
   
  // window.location.href="/resourceone/common/Logout.jsp";
}
</SCRIPT>


	<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0">

		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>

				<td background="images/sj_top_02.gif">
					<table width=100% border="0" cellpadding="0" cellspacing="0">
						<tr>
							<TD>
								<img src="images/sj_top_01.gif" height="50">
							</TD>
							<td>
								&nbsp;
							</td>
							<td width="58%" height="50" align="right" valign="bottom"
								background="images/top-bj.gif" class="background">

								<table border="0">
									<tr>

										<td>
											<img src="images/split.gif" border=0>

											<span style="CURSOR: hand"
												onclick="window.top.mainFrame.location.reload();"><img
													src="images/refresh.gif" border=0 alt=刷新><font
												color=#914800>刷新</font>
											</span>

											<img src="images/split.gif" border=0>

											<span style="CURSOR: hand"
												onclick='javascript:ShowMenu(menutool,20,142,130);'><img
													src="images/tools.gif"
													onmouseover='javascript:ShowMenu(menutool,20,142,130);'
													alt=工具 border=0><font color=#914800>工具</font>
											</span>

											<img src="images/split.gif" border=0>

											<span style="CURSOR: hand" onclick='javascript:_showhelp();'><img
													src="images/help.gif" alt=系统帮助 border=0 height=19 width=20><font
												color=#914800>帮助</font>
											</span>

											<img src="images/split.gif" border=0>

											<span style="CURSOR: hand"
												onclick='window.location.href="/resourceone/common/Logout.jsp";'><img
													src="images/exit.gif" alt=安全退出系统 border=0><font
												color=#914800>退出</font>
											</span>

											<img src="images/split.gif" border=0>
										</td>
									</tr>
								</table>
								<div id="alertbox"
									style="position: absolute; width: 196px; height: 24px; z-index: 1; left: 400px; top: 40px; visibility: hidden;">
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="#000000">
										<tr bgcolor="#EEFFF7">
											<td height="25" align=center>
												正在加载数据，请稍等...
											</td>
										</tr>
									</table>
								</div>
								<div id=menutool style="DISPLAY: none; POSITION: absolute">
									<table
										style="BORDER-RIGHT: #918e82 1px solid; BORDER-TOP: #918e82 1px solid; BORDER-LEFT: #918e82 1px solid; BORDER-BOTTOM: #918e82 1px solid"
										cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff
										border=0>
										<tr>
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FCFCF8';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';"
												onclick='parent.changeToolUrl("/servlet/EnterPasswordModifyServlet");'>
												<img src="images/module.gif" border=0>
												&nbsp;个人密码设置
											</td>
										</tr>
										<tr>
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FCFCF8';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';"
												onclick="parent._addFavorite();">
												<img src="images/module.gif" border=0>
												&nbsp;添加到收藏夹
											</td>
										</tr>
										<tr>
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FCFCF8';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';"
												onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('http://oa94.cnao.gov.cn:80');">
												<img src="images/module.gif" border=0>
												&nbsp;设为IE主页
											</td>
										</tr>
										<tr>
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FCFCF8';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';"
												onclick="parent.saveMenu();">
												<img src="images/module.gif" border=0>
												&nbsp;设为首页
											</td>
										</tr>
										<tr>
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FCFCF8';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';"
												onclick='parent.changeToolUrl("/servlet/CustomizeListServlet");'>
												<img src="images/module.gif" border=0>
												&nbsp;个性化设置
											</td>
										</tr>
										<tr>
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FCFCF8';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';"
												onclick='parent.resetUserCustomize();'>
												<img src="images/module.gif" border=0>
												&nbsp;回到默认设置
											</td>
										</tr>
										<tr>
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FCFCF8';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';"
												onclick='parent.showonline();'>
												<img src="images/module.gif" border=0>
												&nbsp;谁与我同在
											</td>
										</tr>

									</table>
								</div>



								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>


										<td align="right">
											<img src="images/jiao-1.gif">
										</td>

										<td background="images/jiao-3.jpg"
											onmouseover='appgrpover(this)' onclick='changeAppGroup(3)'>
											<div align="center">
												<font color=#FF0000>领导决策区</font>
											</div>
										</td>


										<td background="images/jiao-3.jpg">
											<img src="images/jiao-2.jpg" width="30" height="21">
										</td>

										<td background="images/jiao-3.jpg"
											onmouseover='appgrpover(this)'>
											<div align="center">
												公文流转区
											</div>
										</td>


										<td background="images/jiao-3.jpg">
											<img src="images/jiao-2.jpg" width="30" height="21">
										</td>

										<td background="images/jiao-3.jpg"
											onmouseover='appgrpover(this)' onclick='changeAppGroup(5)'>
											<div align="center">
												审计管理区
											</div>
										</td>


										<td background="images/jiao-3.jpg">
											<img src="images/jiao-2.jpg" width="30" height="21">
										</td>

										<td background="images/jiao-3.jpg"
											onmouseover='appgrpover(this)'>
											<div align="center">
												机关事务区
											</div>
										</td>


										<td background="images/jiao-3.jpg">
											<img src="images/jiao-2.jpg" width="30" height="21">
										</td>

										<td background="images/jiao-3.jpg"
											onmouseover='appgrpover(this)' onclick='changeAppGroup(7)'>
											<div align="center">
												信息资源区
											</div>
										</td>


									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<TABLE border=0 cellPadding=0 cellSpacing=0 width=100%>
			<TR>
				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp1','project/prjList.htm','html/blank.html',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=项目管理>
								<A style='cursor: hand;'><FONT color=#000000>项目管理</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>

				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp2 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(2,this,"#3366cc")'
						onmouseout='out_change(2,this,"#cccccc")'
						onclick="javascript:click_change(2,this,'#3366cc');MpChange('Mp2','contract/contractList.htm','html/blank.html',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=合同管理>
								<A style='cursor: hand;'><FONT color=#000000>合同管理</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>

				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp3','finance/financeList.htm','html/blank.html',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=财务管理>
								<A style='cursor: hand;'><FONT color=#000000>财务管理</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>
				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp4','capital/cptList.htm','html/blank.html',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=资产管理>
								<A style='cursor: hand;'><FONT color=#000000>资产管理</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>
				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp5','file/file_prjList.htm','html/blank.html',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=档案管理>
								<A style='cursor: hand;'><FONT color=#000000>档案管理</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>
				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp7','budget/budgetList.html','#',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=预算管理>
								<A style='cursor: hand;'><FONT color=#000000>预算管理</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>
				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp6','accountingSubject/accountingPreserve.jsp','html/blank.html',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=基础数据维护>
								<A style='cursor: hand;'><FONT color=#000000>基础数据维护</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>
				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp8','view/projectList.htm','html/blank.html',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=数据展现>
								<A style='cursor: hand;'><FONT color=#000000>数据展现</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>
				<TD width=110 background=images/sj_menu_bg_2.gif nowrap>
					<TABLE id=_mp1 width=100% border=0 cellPadding=0 cellSpacing=0
						height=21 vAlign=top onmouseover='over_change(1,this,"#3366cc")'
						onmouseout='out_change(1,this,"#cccccc")'
						onclick="javascript:click_change(1,this,'#3366cc');MpChange('Mp9','release/management.html','#',1);">
						<TR>
							<TD height=21 vAlign=top width=5>
								<IMG border=0 height=21 src="images/sj_menu_3.gif" width=2>
							</TD>
							<TD align="center" height=21 title=数据发布管理>
								<A style='cursor: hand;'><FONT color=#000000>数据发布管理</FONT>
								</A>
							</TD>


						</TR>
					</TABLE>
				</TD>

				<!--TD height=21 vAlign=top width=5 ><IMG border=0 height=21 src="images/sj_menu_3.gif" width=2></TD-->

				<td width="100%" background=images/sj_menu_bg_2.gif align=right>

					<script language="javascript">
function MpChange(MpID,MpURL,NavURL,LeftFrameEnabled)
{
	for(i=1;i<= 9; i++)
	{
		eval("document.all.Mp"+i).style.display = "none";
		//eval('document.all.Mp' + i).style.display ="none";
	}

       var MpObj = eval("document.all('"+MpID+"')");

	if(MpObj.style.display== "none")
		MpObj.style.display = "block";
		
	//window.top._funNav(LeftFrameEnabled)


        if((NavURL==null)||(NavURL=="")||(NavURL=="#")){
                // window.top.leftFrame.location="Left.jsp?
        }
        else{
           window.top.leftFrame.location="Left.jsp?navflag=mg&moduleGroupNav="+ escape(NavURL);
        }
        if((MpURL!="")&&(MpURL!="#")){
           window.top.mainFrame.location = MpURL;
        }
}
</script>

					<TABLE border=0 cellPadding=0 cellSpacing=0 height=22 vAlign=top>
						<TR>
							<TD align="right" height=22>



								<DIV id=MenuModuleGroup
									style="DISPLAY: none; POSITION: absolute">
									<table
										style="BORDER-RIGHT: #918e82 1px solid; BORDER-TOP: #918e82 1px solid; BORDER-LEFT: #918e82 1px solid; BORDER-BOTTOM: #918e82 1px solid"
										cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff
										border=0>

									</table>

								</DIV>

								<DIV id=MenuPullNew style="DISPLAY: none; POSITION: absolute">
									<script language=javascript>

 function changeApplication(appuuid)
{
   MM_showHideLayers('alertbox','','show');
   window.top.location="/login?userid=icss&personUuid=59e468d0-fb03d82598-fb7bf43fd4793156b1c53297a6a8a3b6&sysId="+2+"&curAppuuid="+appuuid+"&appgrpid=3&Way=login&entrymode=switch&ui=menu";
 
}
</script>
									<table
										style="BORDER-RIGHT: #918e82 1px solid; BORDER-TOP: #918e82 1px solid; BORDER-LEFT: #918e82 1px solid; BORDER-BOTTOM: #918e82 1px solid"
										cellSpacing=0 cellPadding=0 width="100%" bgColor=#ffffff
										border=0>


										<tr bgcolor="#FFEAAA">
											<td height="20"
												onmouseover="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #468BC7'; this.style.backgroundColor = '#C0D8EE'; this.style.font = '8pt Tahoma'; this.style.color = '#295E8C'; this.style.cursor = 'hand';"
												style="BORDER-RIGHT: #f3f3ee 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #f3f3ee 1px solid; PADDING-LEFT: 8px; FONT: 8pt Tahoma; BORDER-LEFT: #f3f3ee 1px solid; CURSOR: hand; COLOR: #282211; BORDER-BOTTOM: #f3f3ee 1px solid"
												onmouseout="this.style.paddingleft = '15px'; this.style.paddingright = '5px'; this.style.border = '1px solid #FCFCF8'; this.style.backgroundColor = '#FFEAAA';this.style.font = '8pt Tahoma'; this.style.color = '#282211'; this.style.cursor = 'hand';">
												<img src="images/app.gif" border=0>
												&nbsp;领导决策参阅
											</td>


										</tr>

									</table>
								</DIV>

							</TD>
						</TR>
					</TABLE>
				</td>
			</TR>
		</TABLE>

		<div id="App00"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #3366dd; layer-background-color: #FD7648; display: block;">
			<table bgColor=#227baf border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td align="right">
						<marquee behavior=alternate scrollamount=1>
							<font color="#ffffff">欢迎您进入[<font color=yellow>领导决策区</font>]->[<font
								color=yellow>领导决策参阅</font>]，来自 <font color="#cccc00">10.16.29.216</font>
								的 <font color="#cccc00">中软国际测试账号</font>，您上次登录时间是 <font
								color="#cccc00">2005-09-20 08:55</font> 祝您工作愉快！</font>
						</marquee>
					</td>

				</tr>
			</table>
		</div>



		<div id="Mp1"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','project/prjList.htm','',4,'','0');">
						<font color=#000000>项目管理</font>
					</td>
					<!-- td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
     onclick="ModuleChange(1,this,'#A7A7A7','html/weihu2/bsjdwlist22.html','html/weihu2/orgframe22.html',1,'','0');">
      <font color=#000000>浏览被审单位审计关系情况</font></a></td>
      <!--td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
     onclick="ModuleChange(1,this,'#A7A7A7','html/blank.html','html/weihu2/orgframe21.html',1,'','0');">
      <font color=#000000>浏览全部（署领导）</font></a></td>
<td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
     onclick="ModuleChange(1,this,'#A7A7A7','all.html','',4,'','0');">
      <font color=#000000>全国各特派办被审计单位地图（署领导）</font></a></td>
<td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
     onclick="ModuleChange(1,this,'#A7A7A7','a11.html','',4,'','0');">
      <font color=#000000>全国各省被审计单位地图（署领导）</font></a></td-->

					<!--td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
     onclick="ModuleChange(1,this,'#A7A7A7','html/blank.html','html/weihu2/orgframe2.html',1,'','0');">
      <font color=#000000>浏览归口</font></a></td-->
				</tr>
			</table>

		</div>


		<div id="Mp2"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<!--<td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
      onclick="ModuleChange(1,this,'#A7A7A7','tongji/leader/tongji_shenjishu.htm','search/navigator/tongjiniandutongjishuTree.htm',2,'','0');">
      <font color=#000000>审计覆盖面</font></a></td>
      
      <td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
      onclick="ModuleChange(1,this,'#A7A7A7','tongji/leader/tongji_zichanliang.htm','html/blank.html',3,'','0');">
      <font color=#000000>资产量统计</font></a></td>
     
      <td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
      onclick="ModuleChange(1,this,'#A7A7A7','tongji/leader/tongji_diyu.htm','html/blank.html',3,'','0');">
      <font color=#000000>地域分布统计</font></a></td>
  
      <td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
      onclick="ModuleChange(1,this,'#A7A7A7','tongji/leader/tongji_suoxiahangye.htm','html/blank.htm',3,'','0');">
      <font color=#000000>按行业和规模统计</font></a></td>
      <td id=_module1 align=center style='cursor:hand;' onmouseover="ModuleOver(1,this,'#A7A7A7');" onmouseout="ModuleOut(1,this,'');" 
      onclick="ModuleChange(1,this,'#A7A7A7','tongji/leader/tongji_hangyeshenji.htm','html/blank.htm',3,'','0');">
      <font color=#000000>行业和审计状态统计</font></a></td>
 -->
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','contract/contractList.htm','search/navigator/tongjitianbaopianshuTree1.htm',4,'','0');">
						<font color=#000000>合同管理</font>
					</td>



				</tr>
			</table>

		</div>

		<div id="Mp3"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','finance/financeList.htm','search/chaxuleader_orgtree.htm',4,'','0');">
						<font color=#000000>财务管理</font>
					</td>
				</tr>
			</table>

		</div>

		<div id="Mp4"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','capital/cptList.htm','search/chaxuleader_orgtree.htm',4,'','0');">
						<font color=#000000>资产管理</font>
					</td>
				</tr>
			</table>

		</div>

		<div id="Mp5"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','file/file_prjList.htm','search/chaxuleader_orgtree.htm',4,'','0');">
						<font color=#000000>档案管理</font>
					</td>
				</tr>
			</table>
		</div>

		<div id="Mp6"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','accountingSubject/accountingPreserve.jsp','#',4,'','0');">
						<font color=#000000>会计科目维护</font>
					</td>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','property/propertySortPreserve.jsp','#',4,'','0');">
						<font color=#000000>资产类别维护</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','fileSort/fileSort.jsp','',4,'','0');">
						<font color=#000000>归档类别维护</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','dataAttribute/dataAttribute.jsp','#',4,'','0');">
						<font color=#000000>资料属性维护</font>
					</td>
				</tr>
			</table>

		</div>

		<div id="Mp7"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','budget/budgetList.html','#',4,'','0');">
						<font color=#000000>预算管理</font>
					</td>
				</tr>
			</table>
		</div>

		<div id="Mp8"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>
					<!------------------------------------------------------------------------------------------------->
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','view/projectList.htm','#',4,'','0');">
						<font color=#000000>&nbsp;&nbsp;项目&nbsp;&nbsp;</font>
					</td>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','view/contractList.htm','#',4,'','0');">
						<font color=#000000>&nbsp;&nbsp;合同&nbsp;&nbsp;</font>
					</td>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','view/financeList.htm','#',4,'','0');">
						<font color=#000000>&nbsp;&nbsp;财务&nbsp;&nbsp;</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','view/capitalList.htm','#',4,'','0');">
						<font color=#000000>&nbsp;&nbsp;资产&nbsp;&nbsp;</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','view/fileList.htm','',4,'','0');">
						<font color=#000000>&nbsp;&nbsp;档案&nbsp;&nbsp;</font>
					</td>


					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','exhibit/accountList.html','#',4,'','0');">
						<font color=#000000>会计科目展现</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','exhibit/payModeList.html','#',4,'','0');">
						<font color=#000000>资金支付方式</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','exhibit/stockOrgList.html','#',4,'','0');">
						<font color=#000000>采购组织形式</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','exhibit/stockModeList.html','#',4,'','0');">
						<font color=#000000>采购方式</font>
					</td>
					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','exhibit/stockSubjectList.html','#',4,'','0');">
						<font color=#000000>采购项目类别</font>
					</td>



				</tr>
			</table>

		</div>
		<div id="Mp9"
			style="position: absolute; left: 0px; top: 71px; width: 100%; height: 20px; z-index: 6; background-color: #CCCCCC; layer-background-color: #CCCCCC; display: none;">
			<table bgColor=#CCCCCC border=0 cellPadding=0 cellSpacing=0
				width=100% height="20">
				<tr>

					<td id=_module1 align=center style='cursor: hand;'
						onmouseover="ModuleOver(1,this,'#A7A7A7');"
						onmouseout="ModuleOut(1,this,'');"
						onclick="ModuleChange(1,this,'#A7A7A7','release/management.html','#',4,'','0');">
						<font color=#000000>数据发布管理</font>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>

<script language="javascript">


 window.status ="您当前所在位置：[ xx 司]-->[领导决策区]-->[领导决策参阅]"


function SysChange(sysId){
	window.top.location="/login?userid=icss&personFlag=1&sysId="+sysId+"&Way=login";
}


</script>

