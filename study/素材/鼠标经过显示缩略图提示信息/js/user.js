/*********************
首页login-cookie
**********************/
function getCookieVal(offset)
{
	var endstr = document.cookie.indexOf(";",offset);
	if (endstr == -1)
	{
		endstr = document.cookie.length;
	}
	return unescape(document.cookie.substring(offset,endstr));
}
function getCookie(name)
{
	var arg = name + "=";
	var alen = arg.length;
	var clen = document.cookie.length;
	var i= 0;
	while (i<clen)
	{
		var j = i+alen;
			if (document.cookie.substring(i,j) == arg)
			{
				return getCookieVal(j);	
			}
		i = i+1;
	}
	return null;
}
var username = getCookie("mlusername");
if(username != null)
{
	document.write("<span class=\"txt\">你好，<strong class=\"txt5\">"+username+"</strong>&nbsp;&nbsp;</span>");
	document.write("<span class=\"btn\"><a href=\"/e/member/cp\" class=\"user\"><img src=\"/qkankan/images/btn_user.gif\" width=\"80\" height=\"19\" alt=\"用户中心\" /></a></span>");
	document.write("<span class=\"txt\"><a href=\"/e/enews?enews=exit&ecmsfrom=9\" class=\"user\">[退出]</a></span>");
}
else
{
    document.write("<form name=\"form1\" method=\"post\" action=\"/e/enews/index.php\"><span>用户名：<input name=\"username\" class=\"txt\" type=\"text\" />&nbsp;&nbsp;密码：<input name=\"password\" class=\"txt\" type=\"password\" /></span>");
    document.write("<span class=\"btn\"><input type=\"image\" src=\"/qkankan/images/btn_login.gif\" /> <a href=\"/e/member/register/\"><img src=\"/qkankan/images/btn_reg.gif\" width=\"56\" height=\"19\" alt=\"注册\" /></a></span>");
	document.write("<input type=\"hidden\" name=\"enews\" value=\"login\" /><input type=\"hidden\" name=\"lifetime\" value=\"315360000\" /><input type=\"hidden\" name=\"ecmsfrom\" value=\""+window.location.href+"\"></form>");
}