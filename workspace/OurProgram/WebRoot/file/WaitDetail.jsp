<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�������Ŀ��ϸ����</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <style type="text/css">
<!--
.STYLE1 {
	font-weight: bold;
}
-->
</style>
  </head>
  
  <body>
 <table bordercolor="#0099FF" border="1" align="center" width="100%" cellspacing="0">
	<thead align="center">
	<tr>
	<td colspan="6" bgcolor="#0099FF" class="STYLE1"><div align="center"><s:property value="%{#parameters.projectName}"/>��Ŀ����</div></td>
	</tr>
	<tr bgcolor="#CCFFFF">
		<td width="58%"><div align="center" class="STYLE1">�ĵ���������</div></td>
		<td width="13%"><div align="center" class="STYLE1">����ʱ��</div></td>
		<td width="29%"><div align="center" class="STYLE1">������ </div></td>
	</tr>	
	</thead>  
	<s:iterator value="list" status="s" id="l">
	<s:if test="list.size() == 0">
		<tr bgcolor="#hjhjhj">
			<td><s:property value="datumName"/></td>
			<td><s:property value="datumSetupDate"/></td>
			<td>&nbsp;</td>
		</tr>
	</s:if>
	<s:else>
		<tr>
			<td><s:property value="datumName"/></td>
			<td><s:property value="datumSetupDate"/></td>
			<td>&nbsp;</td>
		</tr>
	</s:else>
	</s:iterator>
	</table>
<br>
 <s:form action="queryUserDetailTwo" namespace="/" method="post" >
<table bordercolor="#0099FF" border="1" align="center" width="100%" cellspacing="0">
	<tr>
	<td colspan="6" bgcolor="#0099FF" class="STYLE1"><div align="center"> ������</div></td>
    </tr>
    <tr bgcolor="#CCFFFF">
	<td width="20%">��Ŀ����<font color="#FF0000">&nbsp;*</font></td>
	<td width="30%"><input id="projectName" name="projectName" value="<s:property value="%{#parameters.projectName}"/>"/>
	<td width="20%">�鵵���<font color="#FF0000">&nbsp;*</font></td>
	<td width="30%"><s:property value="%{#parameters.auditingAttitude}"/></td>
	</tr>
	<tr bgcolor="#CCFFFF">
	<td width="20%">�����</td>
	<td width="30%"><s:property value="%{#parameters.assessor}"/></td>
    <td colspan="2">&nbsp;</td>
	</tr>
	<tr bgcolor="#CCFFFF">
	<td>������</td>
	<td colspan="3">
	     <textarea rows="3" cols="20" style="width:99%" name="auditingAttitude" id="auditingAttitude"></textarea>
	     (ע����������Ϣ���������250������.)
	</td>
	</tr>
</table>
   
      <div align="center"> 
      <input type="submit" value="�ύ" name="submit">
      </div>
    </s:form>
  </body>
</html>
