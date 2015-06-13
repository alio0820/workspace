<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
  <head>
  <title>登录页面</title>
  
  </head>
  
  <body>
   <form name="form1" method="post" action="login.action">
   <table>
      <tr>
          <td>用户名：</td>
          <td><input type="text" name="username"><div id="result"></div></td>
      </tr>
      <tr>
          <td>密码：</td>
          <td><input type="text" name="password"></td>
      </tr>
   </table>
   <input type="submit" value="确定">
   </form>
  </body>
</html>
