<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*,com.etc.OurProgram.javabean.basedataUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
  <head>
    <title>
      资产类别维护
    </title>
    <link rel="stylesheet" href="../css/style.css">
    <style type="text/css">
    </style>
       <script>
       function add()
       {
          form1.qq.value="1";
          var reg1=form1.num.value;
          var reg2=form1.name.value;
          if(reg1==""||reg2=="")
          {
              alert("名称或编号不能为空");
              return false;
          }
       }
       function recompose()
       {
          form1.qq.value="2";
          if(form1.id.value=="0")
          {
             alert("请先选择该项");
             return false;
          }
          var reg1=form1.num.value;
          var reg2=form1.name.value;
          if(reg1==""||reg2=="")
          {
              alert("名称或编号不能为空");
              return false;
          }else
          {
          document.form1.action="property.action";
          document.form1.submit();
          }   
       }
       function del()
       {
           if(form1.id.value=="0")
          {
             alert("请先选择该项");
             return false;
          }
          form1.qq.value="3";
          
       }
       function test()
       {
                    
       	  var temp = document.getElementsByName("radio");
          for(var i=0;i<temp.length;i++)
          {   
               if(temp[i].checked)
               var r = temp[i].value;
          }
          form1.num.value=document.getElementsByName(r)[0].value;
          form1.name.value=document.getElementsByName(r)[1].value;
          form1.id.value=r;      
      }
      function retu()
      {
          window.location.href="/JsEngineering/fileSort/fileSort.jsp";
      }
      function loading()
       {
          var load="<s:property value="pagesize"/>";
          if(load!=10)
          {
          form1.action="property.action";
          form1.submit();
          }
       }
       </script>          
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="10" topmargin="10"  onload="loading();">
      <h2 align="center">
       <font color="red"><s:actionerror/></font>
    </h2>
 
 
 
    <s:form name= "form1" method="post"   action="property.action">
     <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
        <tr bgcolor="#6699CC">
        <td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4">资产类别维护</font></strong></td>
           
        </tr>
        <tr class="lc2" bgcolor="#EEF4FF">
            <td  width="21%" height="25"><div align="left">资产类别编号*</div></td>
            <td width="37%"><input type="text" name="num" id="num" style="width:100%;"></td>
        </tr>
        <tr class="lc2" bgcolor="#EEF4FF">
             <td  width="21%" height="25"><div align="left">资产类别名称*</div></td>
             <td width="37%"><input type="text" name="name" id="name" style="width:100%;"></td>
        </tr>
        <tr><!-- 引入两个隐藏的文本域，用于传参，qq和id分别代表选择的按钮及选中的记录的编号 -->
             <td><input type="hidden" name="qq" id="qq" value="0" style="width:100%;" ></td>
        </tr>
        <tr>
             <td><input type="hidden" name="id_forward" id="id_forward" value="<s:property value="id_forward"/>"  style="width:100%;" ></td>
        </tr>
        <tr>              
             <td><input id = 'test2' type = 'hidden' name="str" value="1"> 
                 <input name="id" type="hidden" >
             </td>
        </tr>
    </table>   
    <p align="center">
        <input id="Button1" type="submit" value="添加"  onclick="return add();"/>&nbsp;&nbsp;
        <input id="Button2" type="button" value="修改"  onclick="return recompose();"/>&nbsp;&nbsp;
        <input id="Button3" type="submit" value="删除"  onclick="return del();"/>&nbsp;&nbsp;
        <input id="Button3" type="button" value="返回"  onclick="return retu();"/>
    </p>        
    </s:form>
    
     <table border="0" valign="top" width="95%" align="center" cellspacing="1" bordercolorlight="#003366" bordercolordark="#DFDFFF" bgcolor="#426199">
        <tr bgcolor="#6699CC">
        <td height="25" colspan="8" align="center"><strong><font color="#FFFFFF" size="4"><s:property value="p_name"/>资产类别</font></strong></td>
            
        </tr>
        <tr bgcolor="#A6D0F2">
            <td height="25" align="center" width="5%">&nbsp;</td>
            <td width="21%" height="25" align="center">资产类别编号</td>
            <td width="21%" height="25" align="center">资产类别名称</td>
            <td height="25" align="center" width="5%">&nbsp;</td>
        </tr>
        <s:iterator value="list" status="s" id="l">	   
		<tr bgcolor="#A6D0F2">
		     <td height="25" align="center" width="5%">
		          <input  name="radio" type="radio" value="<s:property value="id"/>" onclick="test();"/>
		     </td>
		     <td width="21%" height="25" align="center">
		          <input name="<s:property value="id"/>" type="hidden" value="<s:property  value="num"/>"/>
		          <s:property  value="num"/>
		     </td>
             <td width="21%" height="25" align="center">
                  <input name="<s:property value="id"/>" type="hidden" value="<s:property  value="name"/>"/>
                  <s:property value="name"/>
             </td>
             <td> 
                  
                  <a href="property.action?id_forward=<s:property  value="id"/>& str=1&p_name=<s:property  value="name"/>">[维护下一级]</a>
             </td>
        </tr>
	    </s:iterator>	                    
        </table>
        
         <center>
        共<s:property value="intRowCount"/>记录&nbsp;&nbsp;
        第<s:property value="pageNow"/>/<s:property value="intPageCount"/>页&nbsp;&nbsp;
         <s:url id="url_pre" value="property.action">   
         <s:param name="pageNow" value="pageNow-1"></s:param>
         <s:param name="str" value="1"></s:param>
         <s:param name="id_forward" value="id_forward"></s:param>
         <s:param name="p_name" value="p_name"></s:param>
     </s:url>   
  
     <s:url id="url_next" value="property.action">   
         <s:param name="pageNow" value="pageNow+1"></s:param>
         <s:param name="str" value="1"></s:param>
         <s:param name="id_forward" value="id_forward"></s:param>
         <s:param name="p_name" value="p_name"></s:param>   
     </s:url>   
     <s:iterator value="Newss" status="status">   
        <s:url id="url" value="property.action">   
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
     <s:a href="%{url_next}">末页</s:a>
       </s:if>
       <s:else>
       <s:a href="%{url_next}">下一页</s:a>
       </s:else>
       </center>
  </body>
 </html>