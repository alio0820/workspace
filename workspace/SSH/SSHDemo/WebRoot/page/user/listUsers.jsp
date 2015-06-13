<%@ page language="java" import="java.util.*,com.chinasoft.dto.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript">
  	function f(id){
  		//window.location.href="servlet/UserTemp?username=encodeURI(encodeURI(url))";
  		document.getElementById(id).submit();
  	}
  </script>
    <%List<User> users = (List<User>)request.getAttribute("userList");%>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function init(){
			var pageindex=parseInt(<%=request.getAttribute("pageindex")%>);
			document.getElementById("indexpage").value=pageindex;
			var select = document.getElementById("pageforward");
			var pagecount =parseInt(<%=request.getAttribute("pagecount")%>);
			for(var i=1;i<=pagecount;i++){
				var option = document.createElement("option");
				option.innerHTML=i;
				option.value=i;
				select.appendChild(option);
				if(i==pageindex)
					option.selected="selected";
			}
			if(pageindex==1)
				document.getElementById("lastpage").disabled="disabled";
			if(pageindex==pagecount)
				document.getElementById("nextpage").disabled="disabled";
		}
		function pagechange(){
			var pageindex = parseInt(document.getElementById("pageforward").value);
			window.location.href="ListUsers?pageindex="+pageindex+"&pagesize="+<%=request.getAttribute("pagesize")%>;
		}
		function lastpage(){
			var pageindex = parseInt(document.getElementById("indexpage").value);
			pageindex--;
			window.location.href="ListUsers?pageindex="+pageindex+"&pagesize="+<%=request.getAttribute("pagesize")%>;
		}
		function nextpage(){
			var pageindex = parseInt(document.getElementById("indexpage").value);
			pageindex++;
			window.location.href="ListUsers?pageindex="+pageindex+"&pagesize="+<%=request.getAttribute("pagesize")%>;
		}
		function sizechange(){
			var pagesize = parseInt(document.getElementById("pagesize").value);
			window.location.href="ListUsers?pagesize="+pagesize;
		}
	</script>
  </head>
  <body onload="init();">
  	<div>
    <table height='24' border='1' align='center' bordercolor='#666666'>
		<tr><td width='10%'>用户名</td>
		<td width='10%'>密码</td>
		<td width='10%'>性别</td>
		<td width='10%'>年龄</td>
		<td width='30%'>爱好</td>
		<td width='10%'>&nbsp;</td></tr>
	<%	int i=0;
  		for(User user:users){
  	 %>	<tr><td><%=user.getAccount() %></td><td><%=user.getPassword() %></td>
  	 		<td><%=user.getSex() %></td><td><%=user.getAge() %></td>
  	 		<td><%=user.getHobby() %></td>
  	 		<td><form id="form<%=i %>" method="post" action="servlet/UserTemp">
  	 			<a href="javascript:f('form<%=i %>');">修改</a>
  					<input name="username" type="hidden" value="<%=user.getAccount() %>">
  				</form>
  	 		&nbsp;
  	 		<a href="servlet/DeleteUser?username=<%=user.getAccount() %>">删除</a></td></tr>
  	<%i++;	}
  	%>
  	
  	</table>
  	</div>
  	<p/><div align="center"> 
  		<a href="javascript:sizechange();">设置每页显示数为</a><input type="text" id="pagesize" size="1">&nbsp;&nbsp;&nbsp;&nbsp;
  		当前第<input size="1" id="indexpage" readonly="readonly/">页&nbsp;&nbsp;&nbsp;&nbsp;
  		<input type="button" value="上一页" id="lastpage" onclick="lastpage();"/>
  		&nbsp;&nbsp;&nbsp;&nbsp;
  			<input type="button" value="下一页" id="nextpage" onclick="nextpage();"/>&nbsp;&nbsp;&nbsp;&nbsp;
  			跳到<select id="pageforward" style="width:40px" onchange="pagechange();"></select>页
  			</div>
  </body>
</html>
