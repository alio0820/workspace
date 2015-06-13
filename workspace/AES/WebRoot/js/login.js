var loginjs = function (){
	return{
		init:function(){
		},
		check:function(){
			var user = document.form1.userId.value;
			var password = document.form1.password.value;
			var code = document.form1.incode.value;
			var flag = true;
			//var radio = document.form1.radio;//form1(name) 既可以获取id 又可以获取name，还可以获取name的数组
			if(user==''){
				document.getElementById('tip1').innerHTML='用户名不能为空';
				flag = false;
			}
			else
				document.getElementById('tip1').innerHTML='';
			if(password==''){
				document.getElementById('tip2').innerHTML='密码不能为空';
				flage = false;
			}
			else
				document.getElementById('tip2').innerHTML='';
			if(code==''){
				document.getElementById('LinkButton1').style.display='none';
				document.getElementById('tip3').innerHTML='验证码不能为空';
				falg = false;
			}
			else{
				document.getElementById('tip3').innerHTML='';
				document.getElementById('LinkButton1').style.display='inline-block';
			}
			return falg;
		},
		refrush:function(){
			var date = new Date();
			var time = date.getTime();
			var img = document.getElementById('img_yzm');
			img.src = "codeparts/yzmCODE.jsp?id="+time;
		}
	};
	
}();
//$(document).ready(loginjs.init);