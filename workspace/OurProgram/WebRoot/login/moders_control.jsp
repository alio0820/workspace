<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>moder_control.jsp'</title> 
  </head>
  
  <h2 align="center">
       <font color="green"> <br>模块管理<br> </font>
    </h2>
  <body>
    
    <table bordercolor="#000000" border="1" align="center" width="60%" height="40" cellspacing="0" bgcolor="#aadada">
     <tr>
     
     <td><a href="/OurProgram/moderControl/moder_PM.jsp">项目管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
     <td><a href="/OurProgram/moderControl/moder_CM.jsp">合同管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
     <td><a href="/OurProgram/moderControl/moder_AM.jsp">资产管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
     <td><a href="/OurProgram/moderControl/moder_BM.jsp">预算管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
     <td><a href="/OurProgram/moderControl/moder_FM.jsp">财务管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
     </tr>
  </table>
  </body>
</html>
