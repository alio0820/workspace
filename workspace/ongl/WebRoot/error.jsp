<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>error.jsp</title>
  </head>
  <script>
      function returnback()
      {
           window.location.href="/ongl/welcome.jsp";
      }
  </script>
  <body>
    <s:property value="fieldErrors.zhai[0]"/>
    <s:property value="errors.zhai[0]"/>
    <s:property value="tip"/>请重新登录！
    <input type="button" value="返回" onclick="returnback();">
    <s:debug/>
  </body>
</html>
