<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*,com.chinasoft.dto.*" pageEncoding="utf-8"%>
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改用户</title>
</head>

<body>
<%User user = (User)request.getAttribute("user"); %>
<center>
<form id="form1" name="form1" method="post" action="ModifyUser">
  <table width="669" border="1" align="left" cellspacing="5" bordercolor="#CCCCCC">
    <tr>
      <td width="657" align="center">用户名：
        <input type="text" name="username" value="<%=user.getAccount()%>" readOnly="true"/>  	
      </td>
    </tr>
    <tr>
      <td align="center">密&nbsp;&nbsp;码：      
        <label>
        <input type="text" name="userpass" id="userpass" value="<%=user.getPassword()%>"/>
      </label></td>
    </tr>
    <tr>
      <td align="center">年&nbsp;&nbsp;龄:
        <label>
        <input type="text" name="age" id="age" value="<%=user.getAge()%>"/>
      </label></td>
    </tr>
    <tr>
      <td align="center">性&nbsp;&nbsp;别：      
      <label>
      <input type="radio" name="sex"  value="男" <%if(user.getSex().trim().equals("男"))out.println("checked");%>/>
      男
      <input type="radio" name="sex"  value="女" <%if(user.getSex().trim().equals("女"))out.println("checked");%>/>
      女</label></td>
    </tr>
    <tr>
      <td align="center">爱&nbsp;&nbsp;好：
        <label>
       <input type="checkbox" name="hobby" value="看书" <%if(user.getHobby().indexOf("看书")!=-1)out.println("checked");%>/>
      看书
      <input type="checkbox" name="hobby" value="唱歌" <%if(user.getHobby().indexOf("唱歌")!=-1)out.println("checked");%>/>
      唱歌
      <input type="checkbox" name="hobby" value="跳舞" <%if(user.getHobby().indexOf("跳舞")!=-1)out.println("checked");%>/>
      跳舞
      <input type="checkbox" name="hobby" value="玩游戏" <%if(user.getHobby().indexOf("玩游戏")!=-1)out.println("checked");%>/>
      玩游戏 
      <input type="checkbox" name="hobby" value="打球" <%if(user.getHobby().indexOf("打球")!=-1)out.println("checked");%>/>
      打球</label></td>
    </tr>
    <tr>
      <td align="center"><label>
        <input type="submit" id="submit" value="保存" />
      </label></td>
    </tr>
  </table>
</form>
</center>
</body>
</html>
