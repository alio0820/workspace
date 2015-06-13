<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  <body>
    	<%session.setAttribute("str","this is a test!");
    	  session.setAttribute("str","good good study!day day up!");
    	  session.setMaxInactiveInterval(60); %>
    	  <!-- 主动设置session的优先级高于web.xml中的设置,session从初始化过后直到销毁，无论打开或关闭多少次浏览器都可以继续使用该session-->
    	<input type="text" name="user" value="zhangsan"/><!--该值不能被获取 -->
    	
    	<iframe frameborder="0" style="height: 220px; width: 100%;"
			src='chuancan/index2.jsp?num=10'
			class="kA" name="read.ReadModule_2" id="ifrmContent">
		</iframe>
		<script type="text/javascript">
			function forward(){
    		 document.body.innerHTML+="";//"<jsp:forward page='index2.jsp'><jsp:param name='num' value='100'/></jsp:forward>";
    		//输出时jsp:forward与jsp:param不能隔开
    		//貌似只要有forward就能跳转，不用理会其他的
    		}
		</script>
  </body>
</html>
