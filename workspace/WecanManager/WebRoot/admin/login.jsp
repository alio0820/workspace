<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>登录</title>
		<!--导入css文件-->
		<link rel="stylesheet" type="text/css" href="css/manageLogin.css" />
		<!--导入js文件-->
		<script type="text/javascript" src="js/manageJs.js">
</script>
	</head>

	<body>
		<div id="container">
			<!--container开始-->
			<div id="header">
				<!--header开始-->
				<img src="images/manageMent/systemIcon/logo-pic.png"
					title="Wecan后台管理系统" />
			</div>
			<!--header结束-->

			<div id="footer">
				<!--footer开始-->
				<s:fielderror>
				<s:param value="''"/>

				</s:fielderror>
				<div id="logo_text">
					<!--文字logo开始-->
					<img src="images/manageMent/systemIcon/logo-text.png"
						title="Wecan后台管理系统" />
				</div>
				<!--文字logo结束-->

				<form action="user_login" method="post">
					<div class="input">
						<!--输入框 开始-->
						<div class="row">
							<!--用户名输入框 开始-->
							<span><label>
									用户名
								</label>
							</span>
							<input type="text" id="user.username" name="user.username"
								maxlength="20" />
							<span class="wrong_tips"> <!--<img src="images/manageMent/systemIcon/cross_circle.png" />
                            <span>用户名错误</span>--> </span>
						</div>
						<!--用户名输入框 结束-->

						<div class="row">
							<!--密码输入框 开始-->
							<span><label>
									密&nbsp;&nbsp;&nbsp;码
								</label>
							</span>
							<input type="password" id="user.password" name="user.password"
								maxlength="15" />
							<span class="wrong_tips"> <!--<img src="images/manageMent/systemIcon/cross_circle.png" />
                            <span>密码错误</span>--> </span>
						</div>
						<!--密码输入框 结束-->

						<div class="row">
							<!--登录按钮 开始-->
							<input type="checkbox" id="check_box" name="rememberMe" />
							<span><label>
									记住我
								</label>
							</span>
							<input type="submit" id="login_btn" value="登录" />
						</div>
						<!--登录按钮 结束-->

					</div>
					<!--输入框 结束-->
					<div id="login_btn">
						<!--登录按钮 开始-->

					</div>
					<!--登录按钮 结束-->
				</form>
			</div>
			<!--footer结束-->
		</div>
		<!--container结束-->
	</body>
</html>
