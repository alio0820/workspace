var loginjs = function (){
	return{
		init:function(){
		},
		check:function(){
			var user = document.form1.userId.value;
			var password = document.form1.password.value;
			var code = document.form1.incode.value;
			var flag = true;
			//var radio = document.form1.radio;//form1(name) �ȿ��Ի�ȡid �ֿ��Ի�ȡname�������Ի�ȡname������
			if(user==''){
				document.getElementById('tip1').innerHTML='�û�������Ϊ��';
				flag = false;
			}
			else
				document.getElementById('tip1').innerHTML='';
			if(password==''){
				document.getElementById('tip2').innerHTML='���벻��Ϊ��';
				flage = false;
			}
			else
				document.getElementById('tip2').innerHTML='';
			if(code==''){
				document.getElementById('LinkButton1').style.display='none';
				document.getElementById('tip3').innerHTML='��֤�벻��Ϊ��';
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