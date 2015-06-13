<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'searthresult.jsp' starting page</title>
    
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
  <form action="">
  请输入每页显示的个数：
  <input type="text" name="num" value="" >
  <table>
    <%
    ArrayList list=(ArrayList)request.getAttribute("list");
    int page=parseInt(request.getAttribute("page"));
    int n=0;
    int num=10;
    if(request.getAttribute("num")==null){
	   
	    if(list.size()%num==0){
	    n=list.size()/num;
	    }else{
	    n=list.size()/num+1;
    }
    }else{
	    num=parseInt(request.getAttribute("num"));
	    if(list.size()%num==0){
	    n=list.size()/num;
	    }else{
	    n=list.size()/num+1;
    }
    }
    for(int i=0;i<num;i++){
    String s=(String)list.get(i);
    %>
   <tr>
         <td ><%=s %></td>
   </tr>
    <% 
    }
     %>
     </table>
     <input type="hidden" name="page">
    <a>上一页</a>
    <select name="select1" onchange="f1(this.value);">
    <%
    for(int i=1;i<=n;i++){
    %>
    <option value="<%=i %>"><%=i %></option>
    <%
    }
     %>
   </select>
    <a>下一页</a>跳转至： <input type="text" name="pagenum" onchange="f1(this.value);">
 </form>
 	 <script type="text/javascript">
   
    fuction f1(pagenum){
	   document.getElementByName("page").value=pagenum;
    }
    
   
    
     </script>
 
  </body>
</html>
