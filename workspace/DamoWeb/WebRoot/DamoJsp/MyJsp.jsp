<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="../DamoHtml/css.css">
  </head>
  
  <script type="text/javascript">
  	function m(){
  		var m = document.getElementsByName("username")[0].id;
  		/*var tmp = window.showModalDialog('subJsp.jsp','_blank','width=400px,height=200px');
  		alert(tmp);
  		document.getElementById('username111').value = tmp;*/
  		
  		document.form1.username.focus();
  		document.tables[0]
  	}
  </script>
  <body>
  	<form name="form1" action="subJsp.jsp">
  		<table id="table">
  			<tr>
  				<td>
  					 <input type="text" class="class1" name="username" id="username111" value="test1" height=200 width=400><font color="red"><label id="errorUsername"></label></font>
  				</td>
  			</tr>
  			<tr>
  				<td>
  					<input type="radio" name="1" value="2" >
  					<input type="radio" name="1" value="1" checked>
  					<input type="radio" name="1" value="3">
  					<input type="button" onclick="m()" />
  					<input type="reset" value="reset" />
  				</td>
  			</tr>
  		</table>
  		<table id="table222">
  			<tr><td>iopiopipipi</td></tr>
  		</table>
  	</form>
  </body>
</html>
