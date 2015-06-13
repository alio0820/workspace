<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>      <!-- //运用struts需要定义标签 --> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>财务信息维护</title>
    <link rel="stylesheet" href="../css/style.css">
    <style type="text/css">
    </style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	   function check(){
	     var m=document.getElementById("money").value;
         var i=document.getElementById("moneyid");
         var check=RegExp("^[0-9]*$");
     	if(m<=0)
     	{
     	  i.innerText="金额必须大于零";
     	  i.style.color="red";
     	  document.getElementById("money").focus();
     	 }
     	else if(!check.test(m)){
     	   i.innerText="金额必须为数字组成";
     	   i.style.color="red";
     	   document.getElementById("money").focus();
     	  }
     	  
	   }
	   
	   function getArray(){
	   var array=new Array();
	   var max=10000;
	   var min=1;
	   var temp=getRandom(max,min);
	   if(!serch(array,temp)){
	   array.push(temp);
	   if(temp<10)
	   document.getElementById("ProofID").value="000"+temp;
	   else if(temp<100)
	   document.getElementById("ProofID").value="00"+temp;
	   else if(temp<1000)
	   document.getElementById("ProofID").value="0"+temp;
	   else
	   document.getElementById("ProofID").value=temp;
	   }
	 }  
	    function getRandom(max,min){
	    {return Math.round(Math.random()*(max-min))+min;
	    }
	    }
	    function serch(array,num){
	     for(var i=0;i<array.length;i++){
	       if(array[i]==num){
	         return true;
	       }
	     } 
	         return false;
	    
	    }
	    function getdate(){
	    	var m=document.getElementById("date").value;
	    	if(m.length==0)
	    	{alert("日期不能为空");
	    	 document.getElementById("date").focus();
	    	}
	    	
	    }
	   
	</script>
  </head>
  
  <body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">
  
  


    <form action="financeupdatesuccess.action" >
   
    <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
     <s:iterator value="list" status="s" id="1">  <!-- 遍历列表运用到的迭代器定义 -->
	<thead align="center">
	<tr bgcolor="#6699CC">
	<td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">为生成拨款通知单财务信息表</font></strong></td><tr bgcolor="EEF4FF">

	</tr>	
	
	</thead>
	    <tr class="lc2" bgcolor="#EEF4FF">
	    <td width="20%">日期<font color="red">*</font></td>
		<td width="30%"><input type="text" name="Date" id="date" value="<s:property value="Date"/>" onblur="getdate()"/><font color="red">格式 YYYY-MM-DD</font></td>
		<td width="20%">凭证号<font color="red">*</font></td>
		<td width="30%"><input type="text" name="ProofID" value="<s:property value="ProofID"/>"/><input type="button" value="生成凭证号" id="Proofid"/></td>
		</tr>
		 
		 <tr class="lc2" bgcolor="#EEF4FF">
	    <td width="20%">所属项目<font color="red">*</font></td>
		<td width="30%"><input type="textbox" name="Own_project" value="<s:property value="Own_project"/>"/></td>
		<td width="20%"><input type="radio" name="1"/>合同<input type="radio" name="1"/>专项 <font color="red">*</font></td>
		<td width="30%"><input type="textbox" name="Contract_special" value="<s:property value="Contract_special"/>"/></td>
		</tr>
		
		<tr class="lc2" bgcolor="#EEF4FF">
	    <td width="20%">金额<font color="red">*</font></td>
		<td width="30%"><input type="textbox" name="Money" id="money" value="<s:property value="Money"/>" onblur="check()"/>(元)<div style="position:absolute;" id="moneyid"></div></td>
		<td width="20%">摘要</td>
		<td width="30%"><input type="textbox" name="Summary" value="<s:property value="Summary"/>" /></td>
		</tr>
		
		 <tr class="lc2" bgcolor="#EEF4FF">
	    <td width="20%">借方科目</td>
		<td width="30%"><input type="textbox" name="Borrow_object" value="<s:property value="Borrow_object"/>"/></td>
		<td width="20%">货方科目</td>
		<td width="30%"><input type="textbox" name="Haber_subject" value="<s:property value="Haber_subject"/>"/></td>
		</tr>
		
		<tr class="lc2" bgcolor="#EEF4FF">
	    <td width="20%">资金支付方式</td>
		<td width="30%"><input type="textbox" name="Pay_way" value="<s:property value="Pay_way"/>"/></td>
		<td width="20%">工程投资管理</td>
		<td width="30%"><input type="textbox" name="Project_manage" value="<s:property value="Project_manage"/>"/></td>
		</tr>
		
		<tr class="lc2" bgcolor="#EEF4FF">
	    <td width="20%">政府采购组织形式</td>
		<td width="30%"><input type="textbox" name="Government_buystyle" value="<s:property value="Government_buystyle"/>"/></td>
		<td width="20%">政府采购方式</td>
		<td width="30%"><input type="textbox" name="Government_buyway" value="<s:property value="Government_buyway"/>"/></td>
		</tr>
		
		<tr class="lc2" bgcolor="#EEF4FF">
	    <td width="20%">政府采购合同授予情况</td>
		<td width="30%"><select id="Government_buysite" name="Government_buysite" value="<s:property value="Government_buysite"/>">
		 <option name="home">国内</option>
		 <option name="abroad">国外</option>
		</select></td>
		<td width="20%">政府采购项目分类</td>
		
		<td width="30%"><input type="textbox" name="Government_buyclassify" value="<s:property value="Government_buyclassify"/>"/></td>
		</tr>
		
		</s:iterator>
		</table>
		<div align="center">
		 
		<input type="submit" value="提交"/>
		<input type="reset" value="重置"/>
		
		</div>
		
		</form>
		
  </body>
</html>
