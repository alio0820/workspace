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
<html>
  <head>  
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProjectInformationVindicate.jsp' starting page</title>
    
 </head>
<script language="javascript" src="PopupCalendar.js" ></script>
<script>
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
function test()
       {        
       	  var temp = document.getElementsByName("radio2");
       	  var r;
          for(var i=0;i<temp.length;i++)
          {
               
               if(temp[i].checked)
                r = temp[i].value;
            
          }
          form2.datumRoute.value=document.getElementsByName(r)[0].value;
          form2.saveTerm.value=document.getElementsByName(r)[1].value;
          form2.datumName.value=document.getElementsByName(r)[2].value;
          form2.datumAttribute.value=document.getElementsByName(r)[3].value;
          form2.datumSetupDate.value=document.getElementsByName(r)[4].value;
          form2.desciption.value=document.getElementsByName(r)[5].value;
          form2.projectdatumID.value=r; 
       
      }
      function add(){
    
      form2.action="addPrjdatum.action?datumName="+form2.datumName.value;
      form2.submit();
      
      }
      function del(){
   
      form2.action="deletePrjdatum.action?id="+form2.projectdatumID.value+"&projectName="+form2.projectName.value;
      form2.submit();
      }
      function update(){
     
      form2.action="updatePrjdatum.action?id="+form2.projectdatumID.value+"&projectName="+form2.projectName.value;
      form2.submit();
      }
      function ret(){
      window.location="executePrjManage.action?pageNow="+form2.pageNow.value;
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
 
  
  <body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">
  <s:form name="form2" action="executePrjdatum.action" method="post" enctype="multipart/form-data"  >
  
  		<input type="hidden" name="pageNow" value="<s:property value="pageNow" />"/>
  	
   <table  border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr bgcolor="#6699CC">
    <td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">项目资料维护</font></strong></td>
   
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">

    <td width="21%" height="25"><div align="left">资源路径<span class="STYLE1"><font color='red'>*</font></span></div></td>
    <td >
	<input type="file" name="datumRoute" value="<s:property value="datumRoute"/>"/>		
  		
	</td>
    <td width="21%" height="25"><div align="left">保存期限</div></td>
    <td width="37%">
	 <select name="saveTerm" >
	 <option value="永久">永久</option>
	  <option value="短期">短期</option>
	   <option value="长期">长期</option>
	   </select>	
	   </td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="21%" height="25"><div align="left">资源名称<span class="STYLE1"><font color='red'>*</font></span></div></td>
    <td width="37%"><input type="text" name="datumName" size="70"/></td>
    <td width="37%"></td>
    <td width="37%"></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="21%" height="25"><div align="left">资源属性<span class="STYLE1"><font color='red'>*</font></span></div></td>
    <td width="37%"><input type="text" name="datumAttribute"/><img src="/OurProgram/images/clip.gif" onClick="getPopValue(datumAttribute,'showDatumAttributeLiulan')"/></td>
    <td width="21%" height="25"><div align="left">资源创建日期<span class="STYLE1"><font color='red'>*</font></span></div></td>
    <td width="37%"><input readonly type="text" name="datumSetupDate" id="begintime" onClick="getDateString(this,oCalendarEn);"/></td>
  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td width="21%" height="25"><div align="left">备注</div></td>
    <td width="37%"><input type="text" name="desciption" size="70" /></td>
    <td width="37%"><input type="hidden" name="projectID" value="<%=request.getParameter("projectID") %>"/></td>
    <td width="37%"><input type="hidden" name="projectName" value="<%=request.getParameter("projectName") %>"/></td>
      <td width="37%"><input type="hidden" name="projectdatumID" value="0"/></td>
  </tr>
</table>
<table align="center">
 <tr>
  <td>
  <img src="/OurProgram/images/add.gif" onclick="add();"/>
  <img src="/OurProgram/images/modify.gif" onclick="update();" />
  <img src="/OurProgram/images/delete.gif" onclick="del();"/>
  <img src="/OurProgram/images/return.gif" onclick="ret();" />
  </td>
   </tr>
   </table>
   
   </s:form>
   
   
<table  border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
  <tr bgcolor="#6699CC" >
  <td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4"><%=request.getParameter("projectName") %>项目资料</font></strong></td>

  </tr>
  <tr class="lc2" bgcolor="#EEF4FF">
    <td height="25" align="center" width="5%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td width="21%" height="25" align="center">文档资料名称</td>
    <td width="21%" height="25" align="center">资料属性</td>
    <td width="21%" height="25" align="center">创建日期</td>
    <td width="21%" height="25" align="center"></td>
    <td width="21%" height="25" align="center"></td>
    <td width="21%" height="25" align="center"></td>
  </tr>
  <s:iterator value="list" status="s" id="l">
  <tr class="lc2" bgcolor="#EEF4FF">
         <td height="25" align="center" width="5%"><input type="radio"   name="radio2"    value= "<s:property value="id" />"    onclick="test();"/></td>
         
		  <td width="21%" height="25" align="center"><a href="fileDownLoad!fileDownLoad.action?datumName=<s:property value="datumName"/>">
		  <s:property value="datumName"/></a>
		  <input type="hidden" name="<s:property value="id"/>" value="<s:property value="datumRoute"/>"/> </td>
			<td width="21%" height="25" align="center">
			 <s:property value="datumAttribute"/>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="saveTerm"/>"/>
			</td>
			<td width="21%" height="25" align="center">
			<s:property value="datumSetupDate"/>
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="datumName"/>"/>
			</td>
			<td width="21%" height="25" align="center">
			<input type="hidden" name="<s:property value="id"/>" value="<s:property value="datumAttribute"/>"/>
			</td>
            <td width="21%" height="25" align="center">
            <input type="hidden" name="<s:property value="id"/>" value="<s:property value="datumSetupDate"/>"/>
            </td>
            <td width="21%" height="25" align="center">
            <input type="hidden" name="<s:property value="id"/>" value="<s:property value="desciption"/>"/>
            </td>
  </tr>
  </s:iterator>
</table>
  <center>
        共<s:property value="intRowCount"/>&nbsp;&nbsp;条记录
        第<s:property value="pageNow"/>&nbsp;&nbsp;页
         <s:url id="url_pre" value="executePrjdatum.action">   
         <s:param name="pageNow" value="pageNow-1"></s:param>   
         <s:param name="projectID" value="projectID"></s:param> 
          <s:param name="projectName" value="projectName"></s:param> 
     </s:url>   
  
     <s:url id="url_next" value="executePrjdatum.action">   
         <s:param name="pageNow" value="pageNow+1"></s:param>  
          <s:param name="projectID" value="projectID"></s:param>  
          <s:param name="projectName" value="projectName"></s:param> 
     </s:url>   
     <s:iterator value="Newss" status="status">   
        <s:url id="url" value="executePrjdatum.action">   
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
