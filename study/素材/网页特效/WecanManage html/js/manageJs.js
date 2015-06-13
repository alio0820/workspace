/*******************************************左边选项菜单的方法 开始*****************************************/
function changeItem(typeId){
	switch(typeId){
		case 0://切换到主页面
			$("#rightbar iframe").attr("src", "mainpage.html");
			break;
		case 1://切换到补全用户信息的页面
			$("#rightbar iframe").attr("src", "addNormalUser.html");
			break;
		case 2://切换到更新用户信息的页面
			$("#rightbar iframe").attr("src", "updateNormalUser.html");
			break;
		case 3://切换到更换密码的页面
			$("#rightbar iframe").attr("src", "updatePassword.html");
			break;
	}
}
/*******************************************左边选项菜单的方法 结束*****************************************/

