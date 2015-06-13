<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0071)http://midi/servlet/OrgListTreeServlet?Url=/servlet/EnterOrgListServlet -->
<HTML><HEAD><TITLE>Ä¿Â¼·þÎñÆ÷¡ª×éÖ¯½á¹¹</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK 
href="css/style.css" rel=stylesheet>
<SCRIPT language=javascript>
function TreeDisplay(OutLineID,imgID)
{
	if (OutLineID != 0)
	{
		if (OutLineID.style.display == "none") {
		    OutLineID.style.display = "block";
			imgID.src="images/midminus.gif"
		}
		else {
		    OutLineID.style.display = "none";
			imgID.src="images/midplus.gif"
		}
	}
}
function _displayTree(){
		if (TreeList.style.display == "none") {
		    TreeList.style.display = "block";
			topOrg.src="images/midminus.gif"
		}else{
		    TreeList.style.display = "none";
			topOrg.src="images/midplus.gif"
		}
}
previous_index=0;
previous_src=0;

function over_change(index,src,clrOver){
	if(previous_index!=parseInt(index))
		if (!src.contains(event.fromElement))
	 		{
	 		src.style.cursor = 'hand';
	 		src.bgColor = clrOver;
	 		}
}

function out_change(index,src,clrIn){
	if(previous_index!=index)
		if (!src.contains(event.toElement))
			{
			src.style.cursor = 'default';
			src.bgColor = clrIn;
			}
}

function click_change(index,src,clrIn,URL){
	if(previous_src.contains)
		{
			if (!previous_src.contains(event.toElement))
	 			{
	 			previous_src.style.cursor = 'hand';
	 			previous_src.bgColor = "#eeeeee";
	 			}
		}
	if (!src.contains(event.toElement))
		{
		src.style.cursor = 'default';
		src.bgColor = clrIn;
		}

	previous_index=index;
	previous_src=src;
	window.top.mainFrame.location=URL;
}

function onerror(aa,bb,cc)
{
alert(aa+"\n"+bb+"\n"+cc);
}

function mOvr(src,clrOver) { if (!src.contains(event.fromElement)) {
src.style.cursor = 'hand'; src.bgColor = clrOver; }}
function mOut(src,clrIn) { if (!src.contains(event.toElement)) {
src.style.cursor = 'default'; src.bgColor = clrIn; }}
function mClk(src) { if(event.srcElement.tagName=='TD'){;} }

function orgTree(){
	if(screen.height == 768){
		document.all.orgDiv.style.height = 445;
		document.all.orgDiv.style.width = 145;
	}else{
		document.all.orgDiv.style.height = 280;
		document.all.orgDiv.style.width = 160;
	}
}
</SCRIPT>

<META content="MSHTML 6.00.2800.1170" name=GENERATOR></HEAD>
<BODY text=#eeeeee bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width=160 border=0>
  <TR>
    <TD vAlign=top width=160 height=778>
      <P><IMG height=62 src="images/b1.gif" width=146></P>
    </TD>
  </TR>
</TABLE>
</BODY></HTML>
