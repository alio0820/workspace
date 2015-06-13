/**一般Clock 扩展Date类 eg: pattern = "yyyy-MM-dd hh:mm:ss";*/
Date.prototype.getFormattedDate = function(pattern) {
	function getFullStr(i) {
		return i > 9 ? "" + i : "0" + i;
	}
	pattern = pattern.replace(/yyyy/, this.getFullYear()).replace(/MM/,
			getFullStr(this.getMonth() + 1)).replace(/dd/,
			getFullStr(this.getDate())).replace(/hh/,
			getFullStr(this.getHours())).replace(/mm/,
			getFullStr(this.getMinutes())).replace(/ss/,
			getFullStr(this.getSeconds()));
	return pattern;
};
/**页面嵌入iframe，将滚动条显示在父层页面*/
function setFrameSize() {
    var iframe = document.getElementById("mainframe");
    $(iframe).attr('height','');
    var bHeight = iframe.contentWindow.document.body.scrollHeight;
    var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
    var innerHeight = Math.min(bHeight, dHeight);
    var outerHeight = $(window).height() - $(".navbar").height() - $("#footer").height()-92-Number(document.all?4:0);
//    alert("window:"+$(window).height()+"header:"+$(".navbar").height()+"footer:"+$("#footer").height());
    iframe.height = Math.max(innerHeight, outerHeight);
}
function frameInit(){
	setFrameSize();
	var iframe = document.getElementById("mainframe");
	var title = $(iframe.contentWindow.document).find('title').html();
	$('title').html(title);
}
//$(window).resize(function () {
//	setFrameSize();
//});
/**---------------------------------------------------------*/
/**在iframe页面获取父页面的菜单对象*/
function getMenu(){
	return $('.open');
}

$(document).ready(function(){
	/**time*/
	var localTimeSpan = document.getElementById("localTime");
	localTimeSpan.innerHTML = (new Date())
			.getFormattedDate("yyyy / MM / dd hh : mm : ss");
	setInterval(function() {
		localTimeSpan.innerHTML = (new Date())
				.getFormattedDate("yyyy / MM / dd hh : mm : ss");
	}, 1000);
	/**------------------------------------------------------------*/
	/**下拉菜单*/
	var dropdown_menu_hover = false;
	$('div.btn-group').click(function(){
		if($(this).hasClass('open'))
			$(this).removeClass("open");
		else{
			$('.open').removeClass('open');
			$(this).addClass("open");
		}
	}).hover(function(){
		dropdown_menu_hover = true;
	},function(){
		dropdown_menu_hover = false;
	});
	$(document).click(function(){
		if(!dropdown_menu_hover){
			$('.open').removeClass('open');
		}
	});
	/**------------------------------------------------------------*/
	/**渐变背景*/
	$("a.brand").hover(function(){
		$(this).stop().animate({
			backgroundColor:"#FFA500"
		}, 1000);
	},function(){
		$(this).stop().animate({
			backgroundColor:"##232323"
		},600,function(){
			$(this).css('backgroundColor','');
		});
	});
	/**------------------------------------------------------------*/
	/**选中菜单*/
//	$('#navList li').click(function(){
//		$('#navList li.menu-on').removeClass('menu-on');
//		$(this).addClass('menu-on');
//	});
	/**------------------------------------------------------------*/
});