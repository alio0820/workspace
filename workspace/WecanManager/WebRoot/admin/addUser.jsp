<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更新用户信息</title>
<!--引入css文件-->
<link rel="stylesheet" type="text/css" href="css/manageUpdate.css" />
</head>

<body>
<form action="user_addUser" method="post">
	<div id="rightbar"><!--rightbar 开始-->
    	<div class="title">添加用户</div>
        <div class="commenText"><span class="tips">用户名：</span><input type="text" class="txt" name="user.username" /></div>
        <div class="commenText"><span class="tips">工号：</span><input type="text" class="txt" name="user.countId" /></div>
        <div class="commenText"><span class="tips">身份：</span>职员</div>
        
        	
            <div class="commenText"><span class="tips y_middle">部门：</span>
              <select name="user.department" class="txt sel">
                <option value="技术部">技术部</option>
				<option value="市场部">市场部</option>
              </select>
            </div>
           
            <input name="button" type="submit" class="btn submt" value="增加" />
        
    </div><!--rightbar 结束-->
    </form>
</body>
</html>
