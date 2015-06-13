<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--path: \application\docmanage\readmanage\DocTranAndDocFinishTreeAudit.jsp   modify by wuyan  at 2005-06-17-->




<html>
<head>
<title>待办文件导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/style.css">
<!--script language="JavaScript" src="/docmanage/application/include/common.js"></script-->
<script language="JavaScript">
<!--
function changeTdContent(id,txt){
	alert(top.mainFrame);
	for (var i = 1;i<=2;i++){
		document.getElementById(id+i).innerHTML = '&nbsp;'+txt;
	}
}
//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background = "../images/grid.gif">
<table width="146" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="146" height="778" valign="top" >
      <p><img height=100 src="../images/b.gif" width=162></p>
      <table width="145" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr >
              <tr>
                <td class= "TreeSign" bgcolor="" id="TreeList" align="center" ></td>
              </tr>
            </table>
          </td>
        </tr>
        </table>
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language="JavaScript">
//-------------有关图片-------------//
var TreeImg = new Array();
        TreeImg[0] = new Image();
        TreeImg[1] = new Image();
        TreeImg[2] = new Image();

        TreeImg[0].src = "/docmanage/application/images/minus.gif";
        TreeImg[1].src = "/docmanage/application/images/plus.gif";
        TreeImg[2].src = "/resourceone/images/Treeline.gif";

//-------------制造菜单--------------------//
function MakeTree(newObj,oldObj,explain,imageUrl,leaf,num,title,url,target,uuid)
{
        if(num==0)
        {
                pointClass = "";
        }
        if(num==1)
        {
                pointClass = "";
        }

        if(title&&title!="")
        {
                title = ' title="'+title+'" ';
        }
        else
        {
                title = "";
        }

        if(!url)
                url = "#";
        if(!target)
                target = "_top";

        var word = '<table width=100% border="0" cellspacing="0" cellpadding="0">';

                word+= '<tr valign=center>';
								 if(leaf == "false") {                  word+= '<td width=5% class="TreeSign">';
                	 word+= '&nbsp;<img class="TreeNodeImg" border="0" src="'+TreeImg[0].src+'" id="sign_'+newObj+'"  onclick="SiblingClick(this.id);">&nbsp;'
                  word+= '</td>';
                  word+= '<td width=95% >';
								 }								 else {                  word+= '<td width=0%>';
                  word+= '</td>';
                  word+= '<td width=100% >';
								 }                //word+= '<a href="'+url+'" target="'+target+'"><nobr>'+explain+'</nobr></a>';
                word+= '<nobr>&nbsp;<img class="TreeNodeImg" src="' + imageUrl + '"/>' + '<span class="ExplainOFF2" onclick=TreeControl("'+url+'","'+target+'","'+uuid+'","sign_'+newObj+'") value="'+newObj+'" '+title+' >&nbsp;'+ explain+'</span></nobr>';
                word+= '</td>';
                word+= '</tr>';
                word+= '<tr style="display: block"  id="'+newObj+'">';
                word+= '<td class="'+pointClass+'"> </td> ';
                word+= '<td  valign="top" width="54" id="td_'+newObj+'"></td>';
                word+= '</tr>';

                word+= '</table>';

                eval(oldObj+".innerHTML+='"+ word +"'");

                word = null;

}

//-------------制造连接--------------------//
function MakeLine(newObj,oldObj,explain,url,ltarget,title)
{

        var the_target = "";

        if(ltarget&&ltarget!="")
        {
                the_target += 'target="'+ltarget+'"';
        }

        if(title&&title!="")
        {
                title = ' title="'+title+'" '
        }
        else
        {
                title = ""
        }

        var word = '<table border="0" cellspacing="0" cellpadding="0">';

                word+= '<tr>';
                word+= '<td class="TreeSign">';
                word+= '<img border="0" src="'+TreeImg[2].src+'">'
                word+= '</td>';
                word+= '<td>'
                if(url != '#')
                word+= '<a href="'+url+'"   '+the_target+title+' ><span class="ExplainOFF2" onclick="LineControl(this.value)"><nobr>'+explain+'</nobr></span></a>';
                else
                word+= '<span class="ExplainOFFNoHand"><nobr>'+explain+'</nobr></span>';
                word+= '</td>';
                word+= '</tr>';
                word+= '</table>';

                eval(oldObj+".innerHTML+='"+ word +"'");

                word = null;
}


//--------- 建立 菜单 框架 对象 ----------//

function GoodTree(objName)
{
        this.id  	 = "tree_"+objName;
        this.obj 	 = objName;
        this.length  = 0;

        this.addTree = addTree;
        this.addLine = addLine;

        this.addEndTree = addEndTree;

        this.endTree = endTree;

        document.body.innerHTML += '<div id="stage_'+this.id+'" style="display: none"><table border="0" cellspacing="0" cellpadding="0"><tr><td id="td_'+this.id+'"></td></tr></table></div>';
}

//-----------建立 子菜单 对象 ---------//

function SubTree(objName,objID)
{
        this.obj = objName;
        this.id  = objID;

        this.addTree = addTree;
        this.addLine = addLine;

        this.addEndTree = addEndTree;

        this.length  = 0;
}

//---------- 菜单 方法 addTree ------------//

function addTree(explain,imageUrl,leaf,title,url,target,uuid)
{
        var subID    = this.id + "_" + this.length;
        var subObj  = this.obj+"["+this.length+"]";

        var oldID  = "td_"+ this.id;

        eval(subObj+"= new SubTree('"+subObj+"','"+subID+"')");

         MakeTree(subID,oldID,explain,imageUrl,leaf,1,title,url,target,uuid);

         this.length++;
}


//---------- 菜单 方法 addEndTree ------------//

function addEndTree(explain,imageUrl,leaf,title)
{

        var subID    = this.id + "_" + this.length;
        var subObj  = this.obj+"["+this.length+"]";

        var oldID  = "td_"+ this.id;

        eval(subObj+"= new SubTree('"+subObj+"','"+subID+"')");

         MakeTree(subID,oldID,explain,imageUrl,leaf,0,title);

         this.length++;
}

//----------- 菜单 方法 addLine -----------//

function addLine(explain,url,target,title)
{
        var subID    = this.id + "_" + this.length;
        var oldID  = "td_"+ this.id;

         MakeLine(subID,oldID,explain,url,target,title);

         this.length++;
}


//--------- 完成 菜单 和 消去 变量和 源蓝图 并且输出  -------------//

function endTree(place)
{

        var the_stage = eval("stage_"+ this.id);
        var obj = eval(place);

        obj.innerHTML += the_stage.innerHTML;

        document.getElementById("stage_"+ this.id).outerHTML ="";

        eval(this.obj+"=null");

}

//-----------菜单的 隐藏 和显示 ------------//

var temp_tree_index = null;   //纪录点击的TD的 sourceIndex

function TreeControl(url,target,uuid,id)
{
SiblingClick(id);

	if(temp_tree_index)
	{
		document.all(temp_tree_index).className = "ExplainOFF2"
	}
	
	       event.srcElement.className = "ExplainON2";

	       temp_tree_index = event.srcElement.sourceIndex;
        if(url!='#'){
               open(url,target);}
}


//-----------Line的 方法 ------------//


function LineControl()
{
        if(temp_tree_index)
        {
                document.all(temp_tree_index).className = "ExplainOFF2"
        }

        event.srcElement.className = "ExplainON2";

        temp_tree_index = event.srcElement.sourceIndex;
}


//------------Sign TD的方法----------------//
function SiblingClick(obj)
{
        var tr_obj = eval(obj.substring(5));
        var sign_obj = eval("document.all.item('"+obj+"')");


if(sign_obj!=null){
        if(tr_obj.style.display=="none")
        {
                tr_obj.style.display = "block";
                sign_obj.src         = TreeImg[0].src;

                return;
        }
        if(tr_obj.style.display=="block")
        {
                tr_obj.style.display = "none";
                sign_obj.src         = TreeImg[1].src;

                return;
        }
    }

}
var One = new GoodTree("One");
One.addTree("银行存款","../images/tree_level_0.gif","true","银行存款","#","mainFrame","");
One.addTree("建筑安装投资","../images/tree_level_0.gif","true","建筑安装投资","#","mainFrame","");
One.addTree("设备投资","../images/tree_level_0.gif","true","设备投资","#","mainFrame","");
One.addTree("待摊投资","../images/tree_level_0.gif","true","待摊投资","#","mainFrame","");
One.addTree("其他投资","../images/tree_level_0.gif","true","其他投资","#","mainFrame","");
One.addTree("应付款","../images/tree_level_0.gif","true","应付款","#","mainFrame","");
One.addTree("基建拨款","../images/tree_level_0.gif","true","基建拨款","#","mainFrame","");
One.addTree("交付使用资产","../images/tree_level_0.gif","true","交付使用资产","#","mainFrame","");
One.addTree("在建工程","../images/tree_level_0.gif","true","在建工程","#","mainFrame","");

One.endTree("TreeList");
</SCRIPT>
<!--body leftmargin="0" topmargin="0"  background = "/docmanage/application/images/bg-04.jpg">
<table>
  <tr>
    <td height=62>
     <p>
      <img height=62 src="/docmanage/application/images/b.gif" width=146></p>
    </td>
  </tr>
  <tr>
    <td>
      <table border="0">
        <tr height="10">
          <td></td>
        </tr>
        <tr height="20">
          <td>
          <img src="/docmanage/application/images/tree_level_0.gif">
          <a href="/docmanage/servlet/OrgDoneReceiverDocListServlet?WfType=DispatchManage&isDrafter=1&hasDelete=0&hasTeSong=0&jspNum=1&processStatus=1&xxx=444" target="mainFrame" class="ExplainON2"><font color="black">行政公文</font></a>
          </td>
        </tr>
        <tr height="20">
          <td>
          <img src="/docmanage/application/images/tree_level_0.gif">
          <a href="/docmanage/servlet/OrgDoneReceiverDocListServlet?WfType=DispatchAuditManage&isDrafter=1&hasDelete=0&hasTeSong=0&jspNum=0&processStatus=1&xxx=444" target="mainFrame" class="ExplainON2"><font color="black">审计文书</font></a>
          </td>
        </tr>
        <tr height="20">
          <td>
          <img src="/docmanage/application/images/tree_level_0.gif">
          <a href="/docmanage/servlet/DeptDoneReportListServlet?WfType=InnerReport&hasDelete=0&hasTeSong=0&isDrafter=1&processStatus=1&xxx=444" target="mainFrame" class="ExplainON2"><font color="black">签报</font></a>
          </td>
        </tr>

        <tr height="20">
          <td>
          <img src="/docmanage/application/images/tree_level_0.gif">
          <a href="/docmanage/servlet/OrgDoneReceiverDocListServlet?WfType=InnerDoc&isDrafter=1&hasDelete=0&hasTeSong=0&jspNum=2&processStatus=1&xxx=444" target="mainFrame" class="ExplainON2"><font color="black">其他</font></a>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html-->
