<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'web.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  List list=new ArrayList();
  for(int i=0;i<100;i++){
  list.add(i+"");
  
  request.setAttribute("list",list);
  String pc = request.getParameter("pagecount");
  String cp = request.getParameter("currentpage");
  request.setAttribute("pagecount",pc);
  request.setAttribute("currentpage",cp);
  }
  
   %>
   <c:set var="pagecount" value="${requestScope.aaa}" scope="request"></c:set>
   <c:set var="currentpage" value="${requestScope.aaa}" scope="request"></c:set>
    请输入每页显示的个数：
  <input type="text" name="num" value="10" >
  
   <table>
   <c:forEach items="$(request.list)" var="it" begin="$(request.currentpage*request.pagecount)" end="request.currentpage*request.pagecount+request.pagecount">
   <tr><td>${it}</td></tr>	
   </c:forEach>
   </table>
   <input type="hidden" id="currentpage"  value="$(request.currentPage)"/> 
   <input type="button" value="上一页" onclick="">
   <input type="button" value="下一页" onclick="">
   <select name="select1" onchange="f1();">
   <c:forEach items="$(request.list)" var="it" begin="0" end="10">
   <option value="$(it.index+1)">$(it.index+1)</option>
   </c:forEach>
   </select>
    <script type="text/javascript">
        function sub(){
    		var pagecount = document.getElementById("rows").value;
    		window.location.href = "index.jsp?pagecount="+pagecount;
    	
    	}
    
    	function next(){
    		var pagecount = document.getElementById("rows").value;
    		var currentpage = parseInt( document.getElementById("currentpage").value) + 1;
    
    		window.location.href = "index.jsp?pagecount="+pagecount+"&currentpage="+currentpage;
    		
    	}
    	
    	function pre(){
    		var pagecount = document.getElementById("rows").value;
    		var currentpage = parseInt(document.getElementById("currentpage").value) - 1;
    		
    		window.location.href = "index.jsp?pagecount="+pagecount+"&currentpage="+currentpage;
    	}
    	
    	function selectPage(){
    		var currentpage = document.getElementById("select").value;
    	
    		var pagecount = document.getElementById("rows").value;
    	
    		var options = document.getElementById("select").options;
    		

    		
    		
    		window.location.href = "index.jsp?pagecount="+pagecount+"&currentpage="+currentpage;
    	}
    
    
    
    </script>
  </body>
</html>
