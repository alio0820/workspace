<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ProjectManegement.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">

function loadInfo(){
window.location="ProjectManegement!showList.action";
}

function del(){
         var str=form1.radiovalue.value;
        window.location="ProjectManegement!deleteProject.action?id="+str;
      
}
function update(){
        var str=form1.radiovalue.value;
        form1.action = "ProjectManegement!updateProject.action?id="+str;
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

</script>
 </head>
	  
	  <body>
	  <s:form name="form1" action="ProjectManegement!add.action" method="post"  >
	   <table align="center" border=1  width="900" height="160" >
	   <tr ><th colspan=6 bgcolor="#0099FF">  项目信息维护</th>
	
	               
	   </tr>
	   <tr>
	    	<td>
	                项目名称<font color='red'>* </font>
	  		</td>
	  		<td colspan=3>
	  		 <input type="text" name="projectName" size="70" />
	  		</td>
	  		<td>
	  		项目责任单位<font color='red'>* </font>
	  		</td>
	  		<td>
	  		 <input type="text" name="unit" />
	  		 <input type="button" name="button1" value="浏览"/>
	  		</td>
	   </tr>
	   <tr>
	      	<td>
				    项目编号<font color='red'>* </font>
				
	  		</td>
	  		<td>
	  		<input type="text" name="projectID"/>
	  		  <input type="button" name="浏览"/>
	  		</td>
	  		<td> 
	  		
				    流水号<font color='red'>* </font>
				  
	  		</td>
	  		<td>
	  		<input type="text" name="lineNumber" />
	  		</td>
	  		<td>
	  		    建立日期<font color='red'>* </font>
	  		 
	  		  
	  		</td>
	  		<td>
	  		 <input type="text" id="setupDate" name="setupDate"/> 
	  		</td>
	   </tr>
	   <tr>
	   <td> 
	             归档负责人<font color='red'>* </font>
	   </td>
	  
	   <td colspan=3>
	  		 <input type="text" name="pigeonholeLeader"/>
	   </td>
	   <td>
	   
	  		项目组成员
	   </td>
	   <td>
	    <input type="text" name="teammates"/>
	   	<input type="button" name="button3" value="浏览"/>
	   </td>
	   </tr>
	   <tr>
		   <td>
		   		备注
		   </td>
	   <td colspan=5>
	    <input type="text" name="describe" size="130"/>
	   </td>
	   </tr>
	   <tr><td><input type="hidden" name="radiovalue" value="0"/></td></tr>
	   </table>
	
		  
		   <input type="submit" name="button4" value="添加"  />
		   <input type="button" name="button5" value="修改" onclick="update()"/>
	       <input type="button" name="button6" value="删除" onclick="del();"/>
	       <input type="button" name="button7" value="加载资料" onclick="loadInfo();"/>
	        
	   
 </s:form>
	   
	   
	   
		   
   <table align="center" width="900" height="73"  border="1" >
  <tr>
   <td height="33" colspan="8" bgcolor="#0099FF"><div align="center">项目列表</div></td>
  </tr>
  <tr>
    <td height="32" >
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
    <td >项目编号</td>
    <td >项目名称</td>
    <td >资源总数</td>
    <td >项目责任单位</td>
    <td >归档责任人</td>
    <td >建立日期</td>
    <td >状态</td>
  </tr>



	<s:iterator value="list" status="s" id="l">
	
		<tr>
		<td><input type="radio"   name="radio1"    value= "<s:property value="id" />"    onclick="test();"/></td>
		  <td><s:property value="projectID"/><input type="hidden" name="<s:property value="id"/>" value="<s:property value="projectName"/>"/> </td>
			<td> <s:property value="projectName"/><input type="hidden" name="<s:property value="id"/>" value="<s:property value="unit"/>"/></td>
			<td><s:property value="datumNumber"/><input type="hidden" name="<s:property value="id"/>" value="<s:property value="projectID"/>"/></td>
			<td><s:property value="unit"/><input type="hidden" name="<s:property value="id"/>" value="<s:property value="lineNumber"/>"/></td>
			<td><s:property value="pigeonholeLeader"/><input type="hidden" name="<s:property value="id"/>" value="<s:property value="setupDate"/>"/></td>
			<td><s:property value="setupDate"/><input type="hidden" name="<s:property value="id"/>" value="<s:property value="pigeonholeLeader"/>"/></td>
			<td><s:property value="stutas"/><input type="hidden" name="<s:property value="id"/>" value="<s:property value="teammates"/>"/></td>		 
			<td> <input type="hidden" name="<s:property value="id"/>" value="<s:property value="describe"/>"/></td>
		</tr>

	</s:iterator>

</table>

	  </body>
	</html>
