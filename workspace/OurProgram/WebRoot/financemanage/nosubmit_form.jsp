<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>      <!-- //运用struts需要定义标签 --> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>未生成拨款列表</title>
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
	  //var radio;
	 function insert(){
	  window.location.href("http://localhost:8080/OurProgram/financemanage/finance_maintain.jsp")
	 }
	 
	 function update(){
  		  var str=form.radiovalue.value;
  		  //var h=document.getElementsByName("submit")[0].value;
  		 //alert(h);
  		  if(str==0)
  		    alert("请选择修改项");
  		      //else if(h!=0)
  		     //alert("已生成通知单选项不能进行修改")
  		  else
  		    window.location="financeupdate!update.action?id="+str;
  		
	}
	function del(){
	   var str=form.radiovalue.value;
	   if(str==0)
	   alert("请选择删除项");
	   else
	   window.location="financedelete!delete.action?id="+str;
 		
	} 
	function createForm(){
	    alert("添加成功");
	    var str=form.radiovalue.value;
	    window.location="financecreateform!createForm.action?id="+str;
	}
	function check(){
	   var temp = document.getElementsByName("radio");
	   //var radio=document.getElementsByName("radio");
	   for(i=0;i<temp.length;i++)
	   {
	     if(temp[i].checked){
         r=temp[i].value;
         }
       }
      form.radiovalue.value=r;         
	   
	}

	 
	</script>

  </head>
  
  <body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">
   <s:form action="financeSuccessShow.action" name="form">
   <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
	<thead align="center">
	<tr bgcolor="#6699CC">
	<td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">未生成拨款通知单财务信息表</font></strong></td><tr bgcolor="EEF4FF">
	
	</tr>	
	</thead>
	
	<tr class="lc2" bgcolor="#EEF4FF">
	<td width="10%" align="center">选择</td>
	<td width="10%" align="center"><font color="blue">日期</font></td>
	<td width="10%" align="center"><font color="blue">凭证号</font></td>
	<td width="10%" align="center">摘要</td>
	<td width="10%" align="center">借方</td>
	<td width="10%" align="center">货方</td>
	<td width="10%" align="center">金额</td>
	<td width="10%" align="center">所属项目</td>
	<td width="10%" align="center">所属合同/专项</td>
	<td width="10%" align="center">拨款通知单</td>
	</tr>

	<s:iterator value="list" status="s" id="1">  <!-- 遍历列表运用到的迭代器定义 -->
	
	 	<tr class="lc2" bgcolor="#EEF4FF">
	 	     <s:if test='IsSubmit == "已提交"'>
	 	     <td>
	 	     <input type="radio" disabled="disabled" name="radio" value="<s:property value="id" />" onclick="check()"/>
	 	     </td>
	 	     </s:if>
	 		 <s:else>
	 		 <td>
	 		 <input type="radio"  name="radio" value="<s:property value="id" />" onclick="check()"/></td>
	 		 </s:else>
	 		 
	 		<td><s:property value="Date"/></td>
	 		<td><s:property value="ProofID"/></td>
	 		<td><s:property value="Summary"/></td>
	 		<td><s:property value="Borrow_object"/></td>
	 		<td><s:property value="Haber_subject"/></td>
	 		<td><s:property value="Money"/></td>
	 		<td><s:property value="Own_project"/></td>
	 		<td><s:property value="Contract_special"/></td>
	 		<td><s:property value="IsSubmit"/></td>
	 		
	 		<input type="hidden" name="submit" value="<s:property value="isSubmit"/>"/>
	 	</tr>
	
	</s:iterator>
	
	
	</table><br/><br/>
	<div align="center">
	  <input type="submit" value="查询" />
	  <input type="button" value="添加" onclick="insert()"/>
	  <input type="button" value="修改" onclick="update()"/>
	  <input type="button" value="删除" onclick="del()"/>
	  <input type="button" value="生成拨款通知单" onclick="createForm()"/> 
	</div>
	<input type="hidden" name="radiovalue" value="0"/>
	</s:form>
    
  </body>
</html>
