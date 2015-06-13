<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="register_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
  <head>
    <title>
      资产类别维护
    </title>
    <style type="text/css">
        .style7
        {
        }
        .style8
        {
        }
        .style9
        {
            width: 135px;
        }
        #Button1
        {
            margin-top: 0px;
            height: 32px;
            width: 54px;
        }
        #Button2
        {
            height: 32px;
            width: 54px;
        }
        #Button3
        {
            height: 32px;
            width: 54px;
        }
        </style>
</head>
<body>

     <table style="width: 63%;"align="center" border="1">
        <tr align="center">
            <td class="style7" colspan="2" bgcolor="#275c98">
                资产类别维护</td>
        </tr>
        <tr>
            <td class="style9" bgcolor="#99ccff">
                资产类别名称*</td>
            <td class="style8">
                &nbsp;</td>
        </tr>
    </table>

    <p align="center">
        <input id="Button1" type="button" value="添加" />&nbsp;&nbsp;
        <input id="Button2" type="button" value="修改" />&nbsp;&nbsp;
        <input id="Button3" type="button" value="删除" />
        </p>

  </body>
 </html>