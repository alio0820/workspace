<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>  
    <title>使用Servlet登录</title>
  </head>
   <body>
   <h1 align="center"><font color="red">欢迎登录</font></h1><br/>
    <form name="form1" method="post" action="login">
      <div align="center">
        <span>用户：<input type="text" name="username"></span><br/>
        <span>密码：<input type="text" name="password"></span><br/>
        <span>年龄：<input type="text" name="age"></span><br/>
        <span>生日：<input type="text" name="birthday"></span><br/>
        <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="重置"><br/>
        
        <!--显示servlet传过来的值-->
        <span style="color:red;font-weight:bold">
        <%if(request.getAttribute("username")!=null){ %>
              用户：<%=request.getAttribute("username")%><br/>
              密码：<%=request.getAttribute("password")%><br/>
              年龄：<%=request.getAttribute("age")%><br/>
              生日：<%=request.getAttribute("birthday")%>
        <%}%></span>
      </div>
    </form>
  </body>
</html>
