<%@ page contentType="text/html;charset=GB2312" %>

<html>
<head>
<title>CH5 - Login.jsp</title>
</head>
<body>

<h2>javax.servlet.http.HttpSession - session 对象</h2> 
<form action=login.jsp method="POST" >
Login Name: <input type="text" name="Name"><br>
Login Password: <input type="text" name="Password" ><br>
<input type="submit" value="Send"><br>
</form>

<% if (request.getParameter("Name") != null &&
	 request.getParameter("Password") != null) { 
		String Name = request.getParameter("Name");
		String Password = request.getParameter("Password");
		
		if (Name.equals("mike") && Password.equals("1234")) { 
			session.setAttribute("Login", "OK");
			response.sendRedirect("Member.jsp");
		}
		else { 
			out.println("登录错误，请输入正确名称"); 
		} 
	}
%>
<!-- session 是存放在服务器上的,自己在本地创建的 session 不可能传递到 别人的服务器上。  -->
</body>
</html>