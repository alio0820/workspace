<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net"%>
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
  		<%List list = new ArrayList(); 
  			Map map = new HashMap();
  			map.put("id",1);
  			map.put("name","zhouqi");
  			map.put("sex","ÄĞ");
  			Map map1 = new HashMap();
  			map1.put("id",2);
  			map1.put("name","WANG");
  			map1.put("sex","Å®");
  			Map map2 = new HashMap();
  			map2.put("id",3);
  			map2.put("name","zhou");
  			map2.put("sex","ÄĞ");
  			list.add(map);
  			list.add(map1);
  			list.add(map2);
  			request.setAttribute("list",list);
  		%>
  
    <display:table name="list" pagesize="2" sort="list" export="true">   
    	<display:column property="id" sortable="true"></display:column>
    	<display:column property="name"></display:column>
    	<display:column property="sex"></display:column>
    </display:table>
  </body>
</html>
