<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <HTML>
<script language=Jscript>
var xlApp, xlSheet;  
xlApp = new ActiveXObject("Excel.Application");
xlApp.Visible = true;  
//xlApp.Workbooks.Add(); 
xlApp.Workbooks.Open("D:\\capitalList.xls");
</script>
</HTML>
