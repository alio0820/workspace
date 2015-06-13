<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
  <head>
    <title>My JSP 'ProjectManegement.jsp' starting page</title>
    <style type="text/css">
    </style>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<script language="javascript" src="PopupCalendar.js" ></script>
	
<script type="text/javascript">
var oCalendarEn=new PopupCalendar("oCalendarEn");	//初始化控件时,请给出实例名称如:oCalendarEn
oCalendarEn.Init();

function tosub(){
   if(document.forms[0].title.value.length<1){
      document.getElementById("same").innerHTML="the <font color='red'>title</font> must fill.";
      document.forms[0].title.focus();
      return false;
    }
   var cdate=new Date();
   var filldate=document.getElementById("begintime").value;
   if(filldate.length<1){
       document.getElementById("same").innerHTML="the <font color='red'>begintime</font> must fill.";
       return false;
   }
   
   var ds=filldate.split('-');
     
   if(ds[0]<cdate.getYear()){
       document.getElementById("same").innerHTML="the <font color='red'>year</font> of the begin-time is error.";
       return false;
   }else if(ds[0]==cdate.getYear()){
	       if(eval(ds[1])<(cdate.getMonth()+1)){
	           document.getElementById("same").innerHTML="the <font color='red'>month</font> of the begin-time is error.";
	           return false;
	       }else if(eval(ds[1])==(cdate.getMonth()+1)){
		       if(eval(ds[2])<cdate.getDate()){
		           document.getElementById("same").innerHTML="the <font color='red'>date</font> of the begin-time is error.";
		           return false;
		       }else if(eval(ds[2])==cdate.getDate()){
		           var ehour=document.getElementById("ehour").value;
		           var epam=document.getElementById("apm").value;
		           var eminute=document.getElementById("eminute").value;
		           if(epam==1)
		               ehour=eval(ehour)+12;
		           if(eval(ehour)<cdate.getHours()){
		               document.getElementById("same").innerHTML="the <font color='red'>hour</font> of the begin-time is error.";
		               return false;
		           }
		           if(eval(ehour)==cdate.getHours()&&eval(eminute)<cdate.getMinutes()){
		               document.getElementById("same").innerHTML="the <font color='red'>minute</font> of the begin-time is error.";
		               return false;
		           }
		       }
	       }
   }
   
}

function comparedate(){
   var filldate=document.getElementById("begintime");
   if(filldate.value.length>0)
      alert(filldate.value);
}
function loadInfo(){
window.location="showListPrjManage.action";
}

function del(){
         var str=form1.radiovalue.value;
        window.location="deleteProjectPrjManage.action?id="+str;
      
}
function update(){
        var str=form1.radiovalue.value;
        form1.action = "updateProjectPrjManage.action?id="+str;
        form1.submit();
}
function subm(){
form1.action="addPrjManage.action";
form1.submit();
}
 function test()
       {        
       	  var temp = document.getElementsByName("radio1");
       	  var r;
          for(var i=0;i<temp.length;i++)
          {
               
               if(temp[i].checked)
                r = temp[i].value;
              
          }
         
          form1.projectName.value=document.getElementsByName(r)[0].value;
          form1.unit.value=document.getElementsByName(r)[1].value;
          form1.projectID.value=document.getElementsByName(r)[2].value;
          form1.lineNumber.value=document.getElementsByName(r)[3].value;
          form1.setupDate.value=document.getElementsByName(r)[4].value;
          form1.pigeonholeLeader.value=document.getElementsByName(r)[5].value;
          form1.teammates.value=document.getElementsByName(r)[6].value;
          form1.describe.value=document.getElementsByName(r)[7].value;
          form1.radiovalue.value=r; 
       
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
  
</script>
 </head>
	  
	  <body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">  
	    <s:form name="form1" action="executePrjManage.action" method="post"  >
<br/>

	
	   <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
	   <tr bgcolor="#6699CC"> 
	   <td height="25" colspan="7" align="center"><strong><font color="#FFFFFF" size="4">项目信息维护</font></strong></td>               
	   </tr>
	   <tr class="lc2" bgcolor="#EEF4FF">
	    	<td><div align="left">
	                项目名称<font color='red'>* </font></div>
	  		</td>
	  		<td >
	  		 <input type="text" name="projectName" size="50"/>
	  		</td>
	  		<td><div align="left">
	  		项目责任单位<font color='red'>* </font></div>
	  		</td>
	  		<td>
	  		 <input type="text" name="unit" />
	  		 <img src="/OurProgram/images/clip.gif"   onClick="getPopValue(unit,'showUnitLiulan')" />
	  		</td>		
	  		<td>
	  		&nbsp;
	  		
	  		</td>	  		<td>
	  		
	  		&nbsp;
	  		</td>
	   </tr>
	   <tr class="lc2" bgcolor="#EEF4FF">
	      	<td><div align="left">
				    项目编号<font color='red'>* </font></div>
				
	  		</td>
	  		<td >
	  		<input type="text" name="projectID"/>
	  		  <img src="/OurProgram/images/clip.gif"  onClick="getPopValue(projectID,'showProjectIDLiulan')"/>
	  		</td>
	  		<td ><div align="left"> 
	  		
				    流水号<font color='red'>* </font></div>
				  
	  		</td>
	  		<td>
	  		<input type="text" name="lineNumber" />
	  		</td>
	  		<td><div align="left"> 
	  		    建立日期<font color='red'>* </font></div>
	  		 
	  		  
	  		</td>
	  		<td>
	  		<input readonly type="text" name="setupDate" id="begintime" onClick="getDateString(this,oCalendarEn);"/>
	  		</td>
	   </tr>
	   <tr class="lc2" bgcolor="#EEF4FF">
	   <td><div align="left">
	             归档负责人<font color='red'>* </font></div>
	   </td>
	  
	   <td colspan=3>
	  		 <input type="text" name="pigeonholeLeader"/>
	  		 <img src="/OurProgram/images/clip.gif" onClick="getPopValue(pigeonholeLeader,'showPigeonholeLeaderLiulan')"/>
	   </td>
	   <td>
	   
	  		项目组成员
	   </td>
	   <td>
	    <input type="text" name="teammates"/>
	   	<img src="/OurProgram/images/clip.gif"   onClick="getPopValue(teammates,'showTeammatesLiulan')" />
	   </td>
	   </tr>
	   <tr class="lc2" bgcolor="#EEF4FF">
		   <td><div align="left">
		   		备注</div>
		   </td>
	   <td>
	    <input type="text" name="describe" size="130"/>
	   </td>
       <td></td>
	    <td></td>
	    <td></td>
	    <td></td>
	   </tr>
	   <tr><td><input type="hidden" name="radiovalue" value="0"/></td></tr>
	   </table>
	<table align="center">
	<tr>
		  
		 <td>  
		 	<img src="/OurProgram/images/add.gif" onclick="subm();"/>
		 </td>
		  <td> <img src="/OurProgram/images/modify.gif"  onclick="update()"/></td>
	      <td> <img src="/OurProgram/images/delete.gif"  onclick="del();"/></td>
	      <td> <input type="button" name="button7" value="加载资料" onclick="loadInfo();"/></td>
	       </tr>
	 </table>     
	   
 </s:form>
	   
	   
	   
		   
   <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr bgcolor="#6699CC">
  <td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">项目列表</font></strong></td>
   <td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4"></font></strong></td>
   
  </tr>
  <tr bgcolor="#A6D0F2">
    <td height="32" >
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td height="25" align="center" width="5%">项目编号</td>
    <td height="25" align="center" width="5%">项目名称</td>
    <td height="25" align="center" width="5%">资源总数</td>
    <td height="25" align="center" width="5%">项目责任单位</td>
    <td height="25" align="center" width="5%">归档责任人</td>
    <td height="25" align="center" width="5%">建立日期</td>
    <td height="25" align="center" width="5%">状态</td>
    <td height="25" align="center" width="5%"></td>
  </tr>



	<s:iterator value="list" status="s" id="l">
	
		<tr bgcolor="#A6D0F2">
		<td>
		<input type="radio"   name="radio1"    value= "<s:property value="id" />"    onclick="test();"/>
		</td>
		  <td>
		  <s:property value="projectID"/>
		  <input id="${s.index}" type="hidden" name="<s:property value="id"/>" value="<s:property value="projectName"/>"/> 
		  </td>
			<td> 
			<s:property value="projectName"/>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="unit"/>"/>
			</td>
			<td>
			<a href="showListPrjdatum.action?projectName=<s:property value="projectName"/>&projectID=<s:property value="id" />&pageNow=<s:property value="pageNow"/>"><s:property value="datumNumber"/>
			</a>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="projectID"/>"/>
			</td>
			<td>
			<s:property value="unit"/>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="lineNumber"/>"/>
			</td>
			<td>
			<s:property value="pigeonholeLeader"/>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="setupDate"/>"/>
			</td>
			<td>
			<s:property value="setupDate"/>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="pigeonholeLeader"/>"/>
			</td>
			<td>
			<s:property value="stutas"/>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="teammates"/>"/>
			</td>		 
			<td> 
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="describe"/>"/>
			</td>	    
		</tr>
	</s:iterator>
</table>

       <center>
        共<s:property value="intRowCount"/>&nbsp;&nbsp;条记录
        第<s:property value="pageNow"/>&nbsp;&nbsp;页
         <s:url id="url_pre" value="executePrjManage.action">   
         <s:param name="pageNow" value="pageNow-1"></s:param>   
     </s:url>   
  
     <s:url id="url_next" value="executePrjManage.action">   
         <s:param name="pageNow" value="pageNow+1"></s:param>   
     </s:url>   
     <s:iterator value="Newss" status="status">   
        <s:url id="url" value="executePrjManage.action">   
            <s:param name="pageNow" value="pageNow"/>   
        </s:url>   
     </s:iterator>    
     <s:if test="pageNow==1">
    <s:a href="%{url_pre}">首页</s:a>
     </s:if>
     <s:else>
     <s:a href="%{url_pre}">上一页</s:a>
     </s:else>
     <s:if test="pageNow==k">
     <s:a href="%{url_next}">尾页</s:a>
       </s:if>
       <s:else>
       <s:a href="%{url_next}">下一页</s:a>
       </s:else>
       </center>
       
       
      
	  </body>
	</html>
