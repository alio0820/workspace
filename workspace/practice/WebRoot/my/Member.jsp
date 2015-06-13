<%@ page contentType="text/html;charset=GB2312" %>

<html>
<head>
<title>CH5 - Member.jsp</title>
</head>
<body>

<h2>javax.servlet.http.HttpSession - session 对象</h2> 
	<% 
	String Login = (String)session.getAttribute("Login");
	
	if (Login != null && Login.equals("OK")) { 
		out.println("欢迎进入");
		session.invalidate(); 
	} 
	else { 
		out.println("请先登录，谢谢") ;
		out.println("<br>经过五秒之后，网页会自动返回Login.jsp");
		
		response.setHeader("Refresh","5;URL=login.jsp"); 
	}
	%>

</body>
</html>