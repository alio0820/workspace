<%@ page contentType="text/html;charset=GB2312" %>

<html>
<head>
<title>CH5 - Member.jsp</title>
</head>
<body>

<h2>javax.servlet.http.HttpSession - session ����</h2> 
	<% 
	String Login = (String)session.getAttribute("Login");
	
	if (Login != null && Login.equals("OK")) { 
		out.println("��ӭ����");
		session.invalidate(); 
	} 
	else { 
		out.println("���ȵ�¼��лл") ;
		out.println("<br>��������֮����ҳ���Զ�����Login.jsp");
		
		response.setHeader("Refresh","5;URL=login.jsp"); 
	}
	%>

</body>
</html>