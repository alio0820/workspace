<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>财务查询</title>
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
       
       
       var i=0;
      function addRow(){
         
 		var qitem = document.getElementById("query");
      	var item;
       	var length = qitem.options.length - 1;    
	     for(var j = length; j >= 0; j--){    
	         if(qitem[j].selected == true){    
	            item = qitem[j].text;    
	         }    
	     }    

       var key=document.getElementById("keyword").value;
	
	
	//添加一行

	var newTr = testTbl.insertRow();
	newTr.setAttribute("id","tr"+i);  
	//alert(i);
   
	//添加两列

	var newTd0 = newTr.insertCell();

	var newTd1 = newTr.insertCell();
	
	var newTd2 = newTr.insertCell();

	//设置列内容和属性

	newTd0.innerHTML = item+"="; 

	newTd1.innerHTML = key;
	
	

	
	 newTd2.innerHTML="<input type='button' value='删除' onclick=\"delMyRow('"+i+"')\"/>";
	 //alert(i);
      i++;
}

    function delMyRow(j){ 
              
            // i = event.srcElement.parentElement.rowIndex; 
             var mytable = document.getElementById("testTbl");   
             var myrow = document.getElementById("tr"+j);  
            // alert(j +'------->'+myrow.rowIndex); 
             mytable.deleteRow(myrow.rowIndex); 
             i--;
             //--i;
          
         }  
         
     function getIndex(){
    i = event.srcElement.parentElement.rowIndex;  //获取表格的行索引
    
}

   
   function a1(){
       
      window.location="financeSuccessShowTwo!successShowTwo.action";
   }
      
  </script>
  </head>
  
  <body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10">
     <form action="financequery.action"> 
      <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
	<thead align="center">
	<tr bgcolor="#6699CC">
	<td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">财务查询</font></strong></td><tr bgcolor="EEF4FF">

	</tr>	
	</thead>
	
	<tr class="lc2" bgcolor="#EEF4FF">
	   <td width="20%" align="center">查询条件：</td>
	   
	   <td width="10%">
	   <select id="query" name="query">
	   <option value="summary">摘要</option>
	   <option value="borrow_object"  >借方科目</option>
	   <option value="haber_subject"> 货方科目</option>
	   <option value="date">日期</option>
	   <option value="own_project">所属项目</option>
	   </select></td>
	   
	   <td align="center" width="10%">
	              关键词：
	   </td>
	   
	   <td>
	     <input type="text" id="keyword"  name="keyword" size="110"/>
	     <input type="button" id="insert" name="insert" value="添加" onclick="addRow()"/>
	   </td>
	</tr>
	</table>
	
	<table id="testTbl" border=0>



    </table>


	
	
	<br><br>
	
	<div align="center">
	   <input type="submit" id="a" name="a" value="查询"/>
	   <input type="button" id="all" name="all" value="显示全部" onclick="a1()"/>
	</div>
	
	</form>
	
	<table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
	<thead align="center">
	<tr bgcolor="#6699CC">
	<td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">财务列表</font></strong></td><tr bgcolor="EEF4FF">

	</tr>	
	</thead>
	
	<tr class="lc2" bgcolor="#EEF4FF">
	  <td width="10%" align="center"><font color="blue">日期</font></td>
	  <td width="10%" align="center"><font color="blue">凭证号</font></td>
	  <td width="10%" align="center">摘要</td>
	  <td width="10%" align="center">借方</td>
	  <td width="10%" align="center">货方</td>
	  <td width="10%" align="center"><font color="blue">金额</font></td>
	  <td width="10%" align="center"><font color="blue">所属项目</font></td>
	  <td width="10%" align="center"><font color="blue">所属合同/专项</font></td>
	  <td width="10%" align="center">拨款通知单</td>
	 </tr>
	 <s:iterator value="list" status="s" id="1">  <!-- 遍历列表运用到的迭代器定义 -->
	 <tr class="lc2" bgcolor="#EEF4FF">
	   <td width="10%" align="center"><s:property value="Date"/></td>
	   <td width="10%" align="center"><s:property value="ProofID"/></td>
	   <td width="10%" align="center"><s:property value="Summary"/></td>
	   <td width="10%" align="center"><s:property value="Borrow_object"/></td>
	   <td width="10%" align="center"><s:property value="Haber_subject"/></td>
	   <td width="10%" align="center"><s:property value="Money"/></td>
	   <td width="10%" align="center"><s:property value="Own_project"/></td>
	   <td width="10%" align="center"><s:property value="Contract_special"/></td>
	   <s:if test='IsSubmit=="已提交"'>
	     <td width="10%" align="center"><s:property value="Id"/></td>
	   </s:if>
	   <s:else>
	     <td width="10%" align="center"></td>
	   </s:else>
	 </tr>
	 </s:iterator>
	</table>
  </body>
</html>
