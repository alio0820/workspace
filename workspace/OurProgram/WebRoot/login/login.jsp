<%@ page contentType="text/html; charset=utf-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
  <head>
    <title>
      用户登录
    </title>
  </head>
   <script type="text/javascript" language="javascript">
    function a(){
     var a=document.getElementsByName("power");
     for(var i=0; i<a.length; i++)
     {
        if(a[i].checked)
        form1.qx.value=a[i].value;
     }
    }  
    function subm(){
    form1.action="login.action?pigeonholeLeader="+form1.userID.value;
    }
    </script>    
    
  <body bgcolor="#ffffff">
    <h2 align="center">
       <font color="green"><br>欢迎访问工程管理软件项目网站<br></font>
    </h2>
    <h1 align="center">
       <font color="red">
	      		<br>请先登录<br></font>
    </h1> 
    
    
    <h1 align="center">
       <font color="red"><s:actionerror/></font>
    </h1> 
    
    
    
    <form name="form1" method="post" >
    
    <div>
        <table style="width: 431px" bordercolor="#000000" border="1" align="center" width="60%" height="40" cellspacing="0">
            <tr>
                <td colspan="3" style="background-color: #3399cc; text-align: center">
                    部门列表</td>
            </tr>
            <tr>
                <td style="height: 21px; background-color: #99ccff">
                </td>
                <td style="height: 21px; background-color: #99ccff; text-align: center; color: #3366cc;">
                    序号</td>
                <td style="height: 21px; background-color: #99ccff; text-align: center; color: #3366cc;">
                    部门名称</td>
            </tr>
            <tr>
                <td>
                    <input id="Radio2" name="department" value="署领导" type="radio" checked="checked"/></td>
                <td style="text-align: center; color: #3366cc;">
                    1</td>
                <td style="text-align: center; color: #3366cc;">
                    署领导</td>
            </tr>
            <tr>
                <td>
                    <input id="Radio3" name="department" value="审计署机关" type="radio" /></td>
                <td style="text-align: center; color: #3366cc;">
                    2</td>
                <td style="text-align: center; color: #3366cc;">
                    审计署机关</td>
            </tr>
            <tr>
                <td>
                    <input id="Radio4" name="department" value="派出审计局" type="radio" /></td>
                <td style="text-align: center; color: #3366cc;">
                    3</td>
                <td style="text-align: center; color: #3366cc;">
                    派出审计局</td>
            </tr>
            <tr>
                <td style="height: 22px">
                    <input id="Radio5" name="department" value="事业单位" type="radio" /></td>
                <td style="height: 22px; text-align: center; color: #3366cc;">
                    4</td>
                <td style="height: 22px; text-align: center; color: #3366cc;">
                    事业单位</td>
            </tr>
            <tr>
                <td style="height: 22px">
                    <input id="Radio6" name="department" value="特派办" type="radio" /></td>
                <td style="height: 22px; text-align: center; color: #3366cc;">
                    5</td>
                <td style="height: 22px; text-align: center; color: #3366cc;">
                    特派办</td>
            </tr>
        </table>
    </div>
     
     
       <div align="center">
          <br>用户ID：<input type="text" name="userID"><br>
          <br>密&nbsp;&nbsp;码：
          <input type="password" name="password"><br>
          <br>权&nbsp;&nbsp;限：
           <input type="radio" name="power" value="admin" onclick="a();"/>管理员
           <input type="radio" name="power"  value="common" onclick="a();"/>项目负责人
          <br><br>
          <input type="submit" name="Submit" value="提交" onclick="subm();">
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input type="reset" value="重置" >
          
       <input type="hidden" name= "qx" />    
       </div>
    </form>
  </body>
 </html>