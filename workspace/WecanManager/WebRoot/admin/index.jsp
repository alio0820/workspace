<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wecan后台管理系统</title>
<!--引入css文件-->
<link rel="stylesheet" type="text/css" href="css/manageIndex.css" />
<!--引入js文件-->
<script type="text/javascript" src="js/jquery-1.6.4.js"></script>
<script type="text/javascript" src="js/manageJs.js"></script>
</head>

<body>
    <div id="container"><!--container 开始-->
        <div id="leftbar"><!--leftbar 开始-->
            <div id="logo"><!--logo 开始-->
                <div id="logo_pic"><!--logo_pic 开始-->
                    <img src="images/manageMent/systemIcon/logo-pic2.png" />
                </div><!--logo_pic 结束-->
                <div id="logo_text"><!--logo_text 开始-->
                    <img src="images/manageMent/systemIcon/logo-text.png" />
                </div><!--logo_text 结束-->
            </div><!--logo 结束-->
            
            <div id="hello_text"><!--hello_text 开始-->
                <span>您好，</span><a href="#">${user.username}</a><br />
                <span>您有</span><a href="#">3条消息</a><br />
                <a href="#" id="exit">注销登录</a>&nbsp;|&nbsp;<a href="#" id="help">帮助</a>
            </div><!--hello_text 结束-->
            
            <div id="items"><!--items 开始-->
                <ul>
                    <li><a href="#" onclick="changeItem(0)">主界面</a></li>
                    <li><a href="#" onclick="changeItem(1)">添加个人信息</a></li>
                    <li><a href="#" onclick="changeItem(2)">更新个人信息</a></li>
                    <li><a href="#" onclick="changeItem(3)">更改密码</a></li>
                    <li><a href="#" onclick="changeItem(4)">管理管理员</a></li>
                    <li><a href="#" onclick="changeItem(5)">管理成员</a></li>
                    <li><a href="#" onclick="changeItem(6)">添加优秀成员</a></li>
					<li><a href="#" onclick="changeItem(7)">公告管理</a></li>
                </ul>
            </div><!--items 结束-->
            
        </div><!--leftbar 结束-->
        
        <div id="rightbar"><!--rightbar 开始-->
        	<iframe frameborder="0" width="100%" height="100%" src="admin/mainpage.jsp"></iframe>
        </div><!--rightbar 结束-->
        <div class="clear"></div>
    </div><!--container 结束-->
</body>
</html>
