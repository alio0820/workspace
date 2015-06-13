<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="register_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
  <head>
     <title>资产类型列表</title>
    <style type="text/css">
        .style1
        {
            height: 20px;
        }
    </style>
</head>
<body>

    <table style="width: 63%;" border="1">
        <tr align="center" bgcolor="#275c98">
            <td>
                资产类型列表</td>
        </tr>
        <tr bgcolor="#d9ecff">
            <td>
                <a onclick="alert('你好！')">+</a> 01_土建及改造工程[资产名称]</td>
        </tr>
        <tr>
            <td class="style1"> 
                + 02_网络设备[资产名称]</td>
        </tr>
        <tr>
            <td>
                + 03_服务器设备[资产名称]</td>
        </tr>
    </table>
  </body>
 </html>