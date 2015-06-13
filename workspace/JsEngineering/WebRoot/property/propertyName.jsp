<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="register_error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
  <head>
    <title>
      资产名称
    </title>
    <style type="text/css">
        .style1
        {
        	
            width: 49px;
        }
        .style2
        {
            width: 91px;
        }
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
        #Radio1
        {
            height: 21px;
            width: 23px;
        }
        #Radio2
        {
            height: 21px;
            width: 23px;
        }
        #Radio3
        {
            height: 21px;
            width: 23px;
        }
        #Radio4
        {
            height: 21px;
            width: 23px;
        }
        #Radio5
        {
            height: 21px;
            width: 23px;
        }
        #Radio6
        {
            height: 21px;
            width: 23px;
        }
        #Radio7
        {
            height: 21px;
            width: 23px;
        }
        #Radio8
        {
            height: 21px;
            width: 23px;
        }
        .style5
        {
            height: 24px;
        }
        .style6
        {
            height: 20px;
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
               <input type="text" name="zcname2" style="width:100%;">
            </td>
        </tr>
    </table>

    <p align="center">
        <input id="Button1" type="button" value="添加" />&nbsp;&nbsp;
        <input id="Button2" type="button" value="修改" />&nbsp;&nbsp;
        <input id="Button3" type="button" value="删除" />
        </p>
        
        
    <table style="width: 63%;" border="1" align="center">
        <tr align="center" >
            <td class="style6" colspan="3"  bgcolor="#275c98" >
                资产名称</td>
        </tr>
        <tr align="center" bgcolor="#99ccff">
            <td class="style1">
                &nbsp;</td>
            <td >
                资产名称</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio1" name="R1" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio2" name="R2" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio3" name="R3" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio4" name="R4" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio5" name="R5" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio6" name="R6" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio7" name="R7" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr align="center">
            <td class="style1">
                <input id="Radio8" name="R8" type="radio" value="V1" /></td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
  </body>
 </html>