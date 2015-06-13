<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="register_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
  <head>
    <title>
      用户登录
    </title>
    <script type="text/javascript">
    function check()
	{
	    var reg1=form1.userId.value;
	    var reg2=form1.password.value;
	    if((reg1!="")&&(reg2!=""))
	    {
	    return true;
	    }
        if(reg1=="")
        {
	    alert("用户名为空!");
	    return false;
	    }
	    if(reg2=="")
	    {
	    alert("密码为空！");
	    return false;
	    }
	}
    function register()
    {
       window.location.href="/DamoWeb/register.jsp";
       
    }
    function loginError()
    {
       var userIdWrong="<%=request.getAttribute("userIdError") %>";
       var passwordWrong="<%=request.getAttribute("passwordError")%>";
       if(userIdWrong=="null"&&passwordWrong=="null")
       {}
       else
       {
           if(userIdWrong!="null")
           {
                if(userIdWrong=="用户名不存在！")
                alert("用户名不存在");
                if(userIdWrong=="恭喜你注册成功！你现在可以登录！")
                alert("恭喜你注册成功！你现在可以登录！");
           }
           else
           alert("密码错误");
       }
    }
    </script>
  </head>
  <body bgcolor="#ffffff" onload="loginError()">
    <h2 align="center">
       <font color="green"> <br>欢迎访问J2EE网站！<br> </font>
    </h2>
    <h1 align="center">
       <font color="red"><br>请先登录<br></font>
    </h1> 
    <form name=form1 method="Post" action="/DamoWeb/servlet/LoginServlet">    <!-- 在form中加入onsubmit="a()";表示表单提交之前的验证，如果失败，不提交 -->
       <div align="center">
          <br>用户ID：&nbsp;&nbsp;<input type="text" name="userId"><br>
          <br>密&nbsp;&nbsp;码：
          <input type="password" name="password"><br>
          <br><br>
          <input type="submit" name="Submit" value="提交" onclick="return check();">
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置" >
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" value="注册" onclick="return register();"><br>
       </div>
    </form>
  </body>
 </html>