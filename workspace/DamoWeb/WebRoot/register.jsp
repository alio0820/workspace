<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="register_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>
      用户注册
    </title>
    <script type="text/javascript">
    function a()
	{
	    var check1=/^[a-zA-Z]+$/;
	    var check2=RegExp("^[0-9]+$");
	    var reg1=form1.userId.value;
	    var reg2=form1.password.value;
	    var reg3=form1.password2.value;
	    if((!(reg3==""))&&(check1.test(reg1))&&(check2.test(reg2)))
	    {
	    return true;
	    }
        if(!check1.test(reg1))
        {
	    alert("用户名为空或不可用！用户名必须为字母！");
	    return false;
	    }
	    if(!check2.test(reg2))
	    {
	    alert("密码为空或设置不正确，请重新设置！密码必须为数字！");
	    return false;
	    }
	    if(reg2!=reg3)
	    {
	    alert("您两次输入的密码不相同！");
	    return false;
	    }
	}
    function registerError()
    {
       var userWrong="<%=request.getAttribute("userError") %>";
       if(userWrong=="null")
       {}
       else            
           alert("用户名已存在");
    }
    </script>
  </head>
  <body bgcolor="#ffffff" onload="registerError()">
    <h2 align="center">
       <font color="green"> <br>欢迎注册J2EE网站用户！<br> </font>
    </h2>
    <h1 align="center">
       <font color="red"><br>用户注册<br></font>
    </h1> 
    <form name=form1 method="Post" action="/DamoWeb/servlet/registerServlet">
       <div align="center">
          <br>用户名：&nbsp;&nbsp;<input type="text" name="userId"><br>
          <br>密&nbsp;&nbsp;码：
          <input type="password" name="password"><br>
          <br>再次输入密码：
          <input type="password" name="password2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <br><br>
          <input type="submit" name="button" value="确定" onclick="return a();" >
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置" >
          
          
       </div>
    </form>
  </body>
 </html>