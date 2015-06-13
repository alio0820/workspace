<%@page import="swu.edu.cn.sql.ProjectRecordManagement"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" import="java.util.*,swu.edu.cn.bean.*,swu.edu.cn.sql.DBConnection,java.sql.ResultSet,java.text.DecimalFormat;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>File upload</title>
</head>
<body>
    <select name="leibie" >
       <option value="evaluation">导入评估</option>
       <option value="department" selected>导入部门</option>
       <option value="project">导入项目</option>
    </select>
     
    <form name="myform1" action="servlet/FileUploadAccept" method="post"  enctype="multipart/form-data">
      

        <input type="text" name="myText">
       <input type="file" name="myfile"><br>
       <input type="file" name="myfile"><br>
       <input type="submit" name="submit" value="导入">
    </form><br>
   
</body>
</html>
