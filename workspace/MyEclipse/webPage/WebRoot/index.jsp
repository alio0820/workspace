<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
    1每页显示记录条数：<input type="text" id="rows" value="10" /><a href="#" onclick="sub();">查询</a>
    
    <%! int count = 100; %>
    <%
   	int  currentPage = 1;
    
    String pc = request.getParameter("pagecount");
    String cp = request.getParameter("currentpage");

    if(cp!=null){
    	currentPage = Integer.parseInt(cp);
    }
    System.out.println(currentPage);
    int pagecount = 10;
    if(pc!=null){
    	pagecount = Integer.parseInt(pc);
    }
    int pages = count%pagecount==0 ? count/pagecount : count/pagecount + 1;    
    List list = new ArrayList();
    	for(int i=1;i<=100;i++){
    		list.add(i);
    }     
    
    List subList = list.subList((currentPage - 1)*pagecount,currentPage * pagecount);
    
    
    %>
    <input type="hidden" id="currentpage"  value="<%=currentPage %>"/> 
    
    <table>
    	<%
    		for(int i=0;i<subList.size();i++){
    	%>	
    		<tr><td><%=subList.get(i) %></td></tr>
    	<% 
    		}   	
    	%>    
    </table>
    

    <input type="button" value="上一页" onclick="pre();" <%if(currentPage==1){out.print("disabled='disabled'");} %> />
    <input type="button" value="下一页" onclick="next();" <%if(currentPage==pages){out.print("disabled='disabled'");} %> />
    
    <select id="select" onchange="selectPage();">
    	<% 
    		for(int i=0;i<pages;i++){
    	%>
    		<option value="<%=i + 1%>" <%if(currentPage == i + 1) out.print("selected='selected'"); %> >第<%=i + 1 %>页 </option>
    	<%	
    		}
    	
    	%>    
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
