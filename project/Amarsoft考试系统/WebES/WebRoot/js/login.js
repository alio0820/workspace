$(document).ready(function(){
	//functions for Internet Explorer
	if($.browser.msie)
	{
		$('#is-ajax').prop('checked',false);
		$('#for-is-ajax').hide();
		$('#toggle-fullscreen').hide();
		$('.login-box').find('.input-large').removeClass('span10');
	}
	HTMLElement.prototype.addClass = function(a) {
        if (this._type != "null_obj") {
            if (!new RegExp("(^|\\s+)" + a).test(this.className)) {
                this.className += " " + a
            }
        }
        return this
    };

    HTMLElement.prototype.removeClass = function(a) {
        if (this._type != "null_obj") {
            this.className = this.className.replace(new RegExp("(^|\\s+)" + a), "")
        }
        return this
    };
	docReady();
	onLoginLoaded();
	setTimeout(function(){
		tip.show("page",true,"Hi，你的用户名为邮箱名","","2000");
	},1000);
    setTimeout(function(){
    	tip.show("page",true,"默认密码为空  ","","2000");
    },4000);
});
function docReady(){
	//prevent # links from moving to top
	$('a[href="#"][data-top!=true]').click(function(e){
		e.preventDefault();
	});
	//styler for checkbox, radio and file input
	$("input:checkbox, input:radio, input:file").not('[data-no-uniform="true"],#uniform-is-ajax').uniform();
	//tooltip
	$('[rel="tooltip"],[data-rel="tooltip"]').tooltip({"placement":"bottom",delay: { show: 400, hide: 200 }});
}
function refrush(){
	var date = new Date();
	var time = date.getTime();
	var img = document.getElementById('img_yzm');
	img.src = "yzmCODE.jsp?id="+time;
}
function check(){
	var user = document.form1.userName.value;
	var password = document.form1.password.value;
//	var code = document.form1.incode.value;
	var flag = true;
	if(user==''){
		document.form1.userName.addClass("error");
		flag = false;
	}
	else{
		document.form1.userName.removeClass("error");
	}
//	if(password==''){
//		document.form1.password.addClass("error");
//		flag = false;
//	}
//	else{
//		document.form1.password.removeClass("error");
//	}
//	if(code==''){
//		document.form1.incode.setAttribute("class","error");
//		flag = false;
//	}
//	else{
//		document.form1.incode.setAttribute("class","");
//		document.getElementById('LinkButton1').style.display='inline-block';
//	}
	SetPwdAndChk();
	return flag;
}
var userTest = /^[a-zA-Z.]+@$/;
var user = document.form1.userName;
function autoInput(){
	if(userTest.test(user.value)){
		user.value = user.value + "cootek.cn";
	}
}
user.oninput = autoInput;
user.onpropertychange = autoInput;

function onLoginLoaded() {
	GetLastUser();
}

function GetLastUser() {
		var id = "49BAC005-7D5B-4231-8CEA-16939BEACD67";
		var usr = GetCookie(id);
		if (usr != null) {
			document.getElementById('username').value = usr;
		} else {
			document.getElementById('username').value = "";
		}
		GetPwdAndChk();
	}
	//点击登录时触发客户端事件 
function SetPwdAndChk() {
	//取用户名 
	var usr = document.getElementById('username').value;
	//将最后一个用户信息写入到Cookie 
	SetLastUser(usr);
	//如果记住密码选项被选中 
	if (document.getElementById('remember').checked == true) {
		//取密码值 
		var pwd = document.getElementById('password').value;
		var expdate = new Date();
		expdate.setTime(expdate.getTime() + 365 * (24 * 60 * 60 * 1000));
		//将用户名和密码写入到Cookie 
		SetCookie(usr, pwd, expdate);
	} else {
		//如果没有选中记住密码,则立即过期 
		ResetCookie();
	}
}

function SetLastUser(usr) {
		var id = "49BAC005-7D5B-4231-8CEA-16939BEACD67";
		var expdate = new Date();
		//当前时间加上两周的时间 
		expdate.setTime(expdate.getTime() + 365 * (24 * 60 * 60 * 1000));
		SetCookie(id, usr, expdate);
	}
	//用户名失去焦点时调用该方法 
function GetPwdAndChk() {
		var usr = document.getElementById('username').value;
		var pwd = GetCookie(usr);
		if (pwd != null) {
			document.getElementById('remember').checked = true;
			document.getElementById('password').value = pwd;
			$("#uniform-remember span").addClass("checked");
			console.log('checked = true');
		} else {
			document.getElementById('remember').checked = false;
			document.getElementById('password').value = "";
			$("#uniform-remember span").removeClass("checked");
			console.log('checked = false');
		}
	}
	//取Cookie的值 
function GetCookie(name) {
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while (i < clen) {
		var j = i + alen;
		if (document.cookie.substring(i, j) == arg)
			return getCookieVal(j);
		i = document.cookie.indexOf(" ", i) + 1;
		if (i == 0) break;
	}
	return null;
}

function getCookieVal(offset) {
		var endstr = document.cookie.indexOf(";", offset);
		if (endstr == -1)
			endstr = document.cookie.length;
		return unescape(document.cookie.substring(offset, endstr));
	}
	//写入到Cookie 
function SetCookie(name, value, expires) {
	var argv = SetCookie.arguments;
	//本例中length = 3 
	var argc = SetCookie.arguments.length;
	var expires = (argc > 2) ? argv[2] : null;
	var path = (argc > 3) ? argv[3] : null;
	var domain = (argc > 4) ? argv[4] : null;
	var secure = (argc > 5) ? argv[5] : false;
	document.cookie = name + "=" + escape(value) +
		((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
		((path == null) ? "" : ("; path=" + path)) +
		((domain == null) ? "" : ("; domain=" + domain)) +
		((secure == true) ? "; secure" : "");
}

function ResetCookie() {
	var usr = document.getElementById('username').value;
	var expdate = new Date();
	SetCookie(usr, null, expdate);
}
user.onblur = GetPwdAndChk;