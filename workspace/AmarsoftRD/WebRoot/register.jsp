<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<link rel="icon" href="images/fruit.ico" type="image/x-icon"/>
	<title>Amarsoft研发部信息平台-注册</title>
	<link href="css/login.css" type=text/css rel=stylesheet>
	<style>
		a.back1:hover{
			color:#FEC819;
		}
		.td_right{
			text-align:right;
			width:100px;
		}
	</style>
	<script type='text/javascript'>
		function check(){
			var user = document.form1.userName.value;
			var password = document.form1.password.value;
			var password2 = document.form1.password2.value;
			var nickName = document.form1.nickName.value;
			var remark = document.form1.remark.value;
			var code = document.form1.incode.value;
			var flag = true;
			//var radio = document.form1.radio;//form1(name) 既可以获取id 又可以获取name，还可以获取name的数组
			if(user==''){
				document.getElementById('tip1').innerHTML='不能为空！';
				flag = false;
			}
			else if(user.length>16){
				document.getElementById('tip1').innerHTML='长度不能超过16个字';
				flag = false;
			}
			else if(user.replace(/[a-zA-Z0-9]+/,"")!=""){
				document.getElementById('tip1').innerHTML='用户名只能由字母或数字组成';
				flag = false;
			}
			else
				document.getElementById('tip1').innerHTML='';
			if(password==''){
				document.getElementById('tip2').innerHTML='不能为空！';
				flag = false;
			}
			else if(password.length>16){
				document.getElementById('tip2').innerHTML='长度不能超过16个字';
				flag = false;
			}
			else if(new RegExp(/[\/:*?"'<>|()]/).test(password)){
				document.getElementById('tip2').innerHTML='密码不能包含特殊字符';
			}
			else
				document.getElementById('tip2').innerHTML='';
			if(password!=password2){
				document.getElementById('tip4').innerHTML='两次输入密码不一致';
				flag = false;
			}
			else
				document.getElementById('tip4').innerHTML='';
			if(code==''){
				document.getElementById('LinkButton1').style.display='none';
				document.getElementById('tip3').innerHTML='忘记输入验证码！';
				flag = false;
			}
			else{
				document.getElementById('tip3').innerHTML='';
				document.getElementById('LinkButton1').style.display='inline-block';
			}
			if(remark.length>100){
				document.getElementById('tip6').innerHTML='长度不能超过64个字';
				flag=false;
			}
			else
				document.getElementById('tip6').innerHTML='';
			if(nickName.length>16){
				document.getElementById('tip5').innerHTML='长度不能超过16个字';
				flag=false;
			}
			else
				document.getElementById('tip5').innerHTML='';
			return flag;
		}
		function refrush(){
			var date = new Date();
			var time = date.getTime();
			var img = document.getElementById('img_yzm');
			img.src = "yzmCODE.jsp?id="+time;
		}
	</script>
</head>
<body>
	<form name='form1' method='post' action ='servlet/register'>
	<div id=div1>
	  	<table id=login height="100%" cellSpacing=0 cellPadding=0 width=800 align=center>
		    <tbody>
		      <TR id=main style="background-image:none">
		        <TD><table height="100%" cellspacing=0 cellpadding=0 width="100%">
		          <tbody>
		            <tr height=120>
		              <td colspan=4 style="font-size:45px;text-align:center;padding-left:40px;overflow:hidden;">
		              	<img src='images/logo2.png'></img>
		              </td>
		            </tr>
		            <tr height=40>
		              <td rowspan=7 width=160>&nbsp;&nbsp;</td>
		              <td class="td_right">用户名<font color="red">*</font>：</td>
		              <td style='width:281px;'>
						<input class="textbox i-txt" id=txtUserName name=userName>
						<label id='tip1' class='tip'></label>
					  </td>
		              <td width=40>&nbsp;</td>
		            </tr>
		            <tr height=40>
		              <td class="td_right">密　码<font color="red">*</font>：</td>
		              <td style='width:281px;'>
						<input class="textbox i-txt" id=txtUserPassword type=password name=password>
						<label id='tip2' class='tip'></label>
					  </td>
		              <td>&nbsp;</td>
		            </tr>
		            <tr height=40>
		              <td class="td_right">再次输入密码<font color="red">*</font>：</td>
		              <td style='width:281px;'>
						<input class="textbox i-txt" id=txtUserPassword2 name=password2 type=password>
						<label id='tip4' class='tip'></label>
					  </td>
		              <td>&nbsp;</td>
		            </tr>
		            <tr height=40>
		              <td class="td_right">昵称：</td>
		              <td style='width:281px;'>
						<input class="textbox i-txt" id=txtNickName name=nickName>
						<label id='tip5' class='tip'></label>
					  </td>
		              <td>&nbsp;</td>
		            </tr>
		            <tr height=40>
		              <td class="td_right">签名档：</td>
		              <td style='width:281px;'>
						<input class="textbox i-txt" id=txtRemark name=remark>
						<label id='tip6' class='tip'></label>
					  </td>
		              <td>&nbsp;</td>
		            </tr>
		            <tr height=40>
		              <td class="td_right">验证码<font color="red">*</font>：</td>
		              <td colspan=2>
		              	<span><input id=txtSN class="i-txt" name=incode style="float:left;width:70px;height:20px;">&nbsp;
		              	<img id="img_yzm" src="yzmCODE.jsp?id=0" border="0" usemap="#Map" onclick="refrush()" />
		                <a id=LinkButton1 onclick="refrush()" href="#">不清楚，再来一张</a>
						<label id='tip3' class='tip'></label>
		                </span>
		              </td>
		            </tr>
		            <tr height=40>
		              <td colspan=2>
		              		<span style="float:left;color:white"><a href='login.htm' class="back1" style="color:#F09B21;">返回登陆页面</a></span>
		              		<span style="float:right;padding-bottom:1px;padding-right:70px;"><input id=btnLogin class='button' type="submit" value=" 注 册 " onclick='return check()'></span>
		              </td>
		              <td>&nbsp;</td>
		            </tr>
		            <tr>
		              <td colspan=4>&nbsp;</td>
		            </tr>
		          </tbody>
		        </table></TD>
		      </TR>
		      <TR id=root height=104>
		        <TD>&nbsp;</TD>
		      </TR>
		    </tbody>
	  	</table>
	</div>
	<div id=div2 style="DISPLAY: none"></div>
	</form>
</body>
</html>
