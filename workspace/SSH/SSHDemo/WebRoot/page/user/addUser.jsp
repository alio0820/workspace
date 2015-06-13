<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加用户</title>
</head>

<body>
<center>
<s:form name="form1" method="post" action="user!addUser" theme="simple">
  <table width="669" border="1" align="left" cellspacing="5" bordercolor="#CCCCCC">
    <tr>
      <td width="657" align="center">用户名： 
        <label>
        <s:textfield name="account"/>
      </label></td>
    </tr>
    <tr>
      <td align="center">密&nbsp;&nbsp;码：      
        <label>
        <s:textfield name="password"/> 
      </label></td>
    </tr>
    <tr>
      <td align="center">年&nbsp;&nbsp;龄:
        <label>
        <s:textfield name="age"/> 
      </label></td>
    </tr>
    <tr>
      <td align="center">性&nbsp;&nbsp;别：   
      <label>
      <s:radio name="sex" list="{'男','女'}" ></s:radio>
  </label></td>
    </tr>
    <tr>
      <td align="center">爱&nbsp;&nbsp;好：
        <label>
       <s:checkbox name="hobby" fieldValue="看书"></s:checkbox>
         看书
      <s:checkbox name="hobby" fieldValue="唱歌"></s:checkbox>
      唱歌
      <s:checkbox name="hobby" fieldValue="跳舞"></s:checkbox>
      跳舞
      <s:checkbox name="hobby" fieldValue="打球"></s:checkbox>
      打球
      <s:checkbox name="hobby" fieldValue="玩游戏"></s:checkbox>
      玩游戏</label></td>
    </tr>
    <tr>
      <td align="center"><label>
        <s:submit value="添加"></s:submit>
      </label></td>
    </tr>
  </table>
</s:form>
</center>
</body>
</html>
