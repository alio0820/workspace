/*******************************************页面加载完成后的初始化方法 开始*****************************************/
$(function(){
	//将表格用灰色间隔开
	$("#rightbar .listBody table tr:odd").addClass("background_gray");
	//选中所有的复选框
	selectAllManager();
});
/*******************************************页面加载完成后的初始化方法 开始*****************************************/

/*******************************************左边选项菜单的方法 开始*****************************************/
function changeItem(typeId){
	switch(typeId){
		case 0://切换到主页面
			$("#rightbar iframe").attr("src", "admin/mainpage.jsp");
			break;
		case 4://切换到管理管理员的页面
			$("#rightbar iframe").attr("src", "user_showManagerNameForUpdate");
			break;
		case 5://切换到管理成员的页面
			$("#rightbar iframe").attr("src", "user_showUserNameForUpdate");
			break;
	}
}
/*******************************************左边选项菜单的方法 结束*****************************************/

/*******************************************管理管理员的方法 开始*****************************************/
var isAllManagerSelected = false;
//将所有的管理员都选中或者都不选中
function selectAllManager(){
	if(isAllManagerSelected){
		$(".cb").attr("checked", "checked");
	} else {
		$(".cb").removeAttr("checked");
	}
	isAllManagerSelected = !isAllManagerSelected;
}
/*******************************************管理管理员的方法 结束*****************************************/

//判断选中了哪一个
function selectWhich()
{        
	  var temp = document.getElementsByName("test");
	  var r;
   for(var i=0;i<temp.length;i++)
   {
        
        if(temp[i].checked)
         r = temp[i].value;
     
   }
   form1.uid.value=document.getElementsByName(r)[0].value;

}

function addUser(){
//	$("#rightbar iframe").attr("src", "admin/addUser.jsp");
	window.location.href="admin/addUser.jsp";
}

function delUser(){
//	alert("ok");
	var arr = new Array ();
	var chs = document.getElementsByName("test");
	for (var i = 0;i<chs.length;i++) {
	    if (chs[i].checked) {
	        arr.push(chs[i].value);
	    } 
	}

	if (arr.length == 0) {
	    alert("请选择要删除的记录!");
	    return;
	} else {
		alert(arr[0]);
	    var str =  chs.join(",");
	    form1.sl.value=arr[0];
	    form1.action = "user_delUser?id="+str;
	    form1.submit;
	}
}



function jqchk(){  //jquery获取复选框值
	  var s='';
	  $('input[name="test"]:checked').each(function(){
	    s+=$(this).val()+',';
	  });
	  alert(s==''?'你还没有选择任何内容！':s);
	}

