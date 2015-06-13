$(document).ready(function(){
	var tab1=false,
		tab2=false;
	$(document).click(function(){
		tab1=false;
		tab2=false;
	});
	/**设置问候语*/
	function setGreetings(){
		var greetings = "",
			content = "",
			timebucket = "",
			index = 0,
			ran = Math.random(),
			hour = oExtDateNow.getHours();
		if(oExtDateNow.getDay()>=1&&oExtDateNow.getDay()<=5){
			if(hour>=23||hour<3) timebucket = "tother";
			else if(hour>=3&&hour<6) timebucket = "t03to06";
			else if(hour>=6&&hour<9) timebucket = "t06to09";
			else if(hour>=9&&hour<11) timebucket = "t09to11";
			else if(hour>=11&&hour<13) timebucket = "t11to13";
			else if(hour>=13&&hour<14) timebucket = "t13to14";
			else if(hour>=14&&hour<15) timebucket = "t14to15";
			else if(hour>=15&&hour<18) timebucket = "t15to18";
			else if(hour>=18&&hour<20) timebucket = "t18to20";
			else if(hour>=20&&hour<23) timebucket = "t20to23";
			content = gFixGreetConf["common"]["work"][timebucket];
			index = Math.floor(ran*content.length);
			greetings = content[index];
		}
		else{
			if(hour>=23||hour<6) timebucket = "tother";
			else if(hour>=6&&hour<9) timebucket = "t06to09";
			else if(hour>=9&&hour<11) timebucket = "t09to11";
			else if(hour>=11&&hour<14) timebucket = "t11to14";
			else if(hour>=14&&hour<18) timebucket = "t14to18";
			else if(hour>=18&&hour<23) timebucket = "t18to23";
			content = gFixGreetConf["common"]["weekend"][timebucket];
			index = Math.floor(ran*content.length);
			greetings = content[index];
		}
		$('div.button_left').find('span:first').html(greetings);
	}
	setGreetings();
	getWeather();
	/**最新动态信息 tab页click切换*/
	$('.myAdvancedInfo li, .publicinfo li').click(function(){
		var parent = $(this).parent().parent();
		if(parent.hasClass('myAdvancedInfo')) tab1 = true;
		else tab2 = true;
		if($(this).hasClass('over')){
			return false;
		}
		else{
			var ul = $(this).parent();
			ul.find('.over').removeClass('over');
			$(this).addClass('over');
			var target = $(this).attr('href');
			parent.find('.active').removeClass('active').hide();
			$(target).addClass('active');
			$(target).css('opacity',0);
			$(target).show();
			$(target).animate({
				opacity:1
			},500);
			setTr($(target));
		}
		return false;
	});
	/**最新动态信息 tab页hover切换*/
	$('.myAdvancedInfo li, .publicinfo li').hover(function(){
		var parent = $(this).parent().parent();
		if($(this).hasClass('over')){
			return;
		}
		else{
			if((parent.hasClass('myAdvancedInfo')&&tab1)||(parent.hasClass('publicinfo')&&tab2)){
				var ul = $(this).parent();
				ul.find('.over').removeClass('over');
				$(this).addClass('over');
				var target = $(this).attr('href');
				parent.find('.active').removeClass('active').hide();
				$(target).addClass('active');
				$(target).css('opacity',0);
				$(target).show();
				$(target).animate({
					opacity:1
				},500);
				//////////
				setTr($(target));
			}
		}
	},function(){});
	function setTr(obj){
		if(obj.find('tr').length>10){
			var tr = obj.find('tr');
			if(tr.find('a.arrow2').length==0){
				$('<a class="arrow2 more" href="javascript:void(0)"'+(document.all?'style="margin-top:0px;"':'')+'></a>').click(function(){
					if($(this).hasClass('less')){
						$(this).removeClass('less');
						$(this).addClass('more');
						$(this).parent().parent().nextAll().hide();
					}
					else{
						$(this).removeClass('more');
						$(this).addClass('less');
						$(this).parent().parent().nextAll().show();
					}
					
				}).appendTo($(tr[9]).find('td'));
				$(tr[9]).nextAll().hide();
			}
		}
	}
	/**获取出差住宿帮助*/
	function getJourneyHelp(){
//		$('#journeyHelp').html();
	}
	/**打开user信息*/
	/**渐变背景*/
	$(".infom a").hover(function(){
		$(this).stop().animate({
			backgroundColor:"#FFA500"
		}, 1000);
	},function(){
		$(this).stop().animate({
			backgroundColor:"#454748"
		},600,function(){
			$(this).css('backgroundColor','');
		});
	});
	/**打开user信息*/
	$('.user_info').click(function(e){
		var information = $('#user_info_message');
		var position = $(this).position();
		var x = position.left;
		var y = position.top;
		information.css('left', x-100);
		information.css('top',y+35);
		information.slideToggle();
	});
	/**绑定点击考勤日期事件*/
	bindCheckClick();
	/**选中top菜单*/
	$('#top_div li').click(function(){
		$('#top_div .menu_on').removeClass('menu_on');
		$(this).addClass('menu_on');
	});
	/**展开邮件主要内容*/
	$('.mail_info li a').click(function(){
		var obj = $(this).parent();
		obj.siblings().filter('.over').removeClass('over');
		obj.addClass('over');
		$('div.tip-bubble').appendTo(obj);
	});
	/**快捷回复邮件*/
	$('.publicinfo .mailAddress,.mail_info li .tip-bubble,.mail_info li img').click(function(){
		var space,current,obj;
		if($(this).hasClass('mailAddress')) {space = $('.publicinfo');current = $('#content01');obj = $(this);}
		else {space = $('.mail_info');current = space;obj = $(this).parent();}
		var mailsendbox = current.find('.mailsendbox');
		/**隐藏mailbox，document-keydown事件回调函数*/
		function hideMailbox(e){
			if(e.keyCode==27){
				$(document).unbind('keydown',hideMailbox);
				space.find('.mailsendbox:visible').slideUp();
				$('#lockmask').remove();
			}
		}
		if(mailsendbox.length==0){
			mailsendbox = $('<div class="mailsendbox">'+'<div class="box-header"><label></label><span>[X]</span></div>'+
			'<div class="box-content"><textarea></textarea><input type="button" id="sendMail" value="发送"/><input type="button" id="cancelSend" value="取消"/></div></div>').appendTo(current);
			//发送按钮
			mailsendbox.find('#sendMail').click(function(){
				var tip = $('<div class="tip">正在发送...</div>').appendTo(current);
				var x = mailsendbox.css('left');
				var y = mailsendbox.css('top');
				tip.css('left', Number(x.substring(0,x.length-2))+75);
				tip.css('top',y);
				mailsendbox.hide();
				$('#lockmask').remove();
				tip.show();
				setTimeout(function(){
					tip.html('发送成功！');
					tip.css('color','#8EEA8E');
					setTimeout(function(){tip.remove();},1000);
				},1500);
			});
			//设置拖动属性
			mailsendbox.find('div.box-header').bind('mousedown',function(e){
				$(document).bind('mousemove',dragmove).bind('mouseup',dragup);
				var parent = $(this).parent();
				var x = e.clientX;
				var y = e.clientY;
				var left = parent.css('left').replace("px","");
				var top = parent.css('top').replace("px","");
				function dragmove(e){
					parent.css('left',(e.clientX-x)+Number(left)+"px");
					parent.css('top',(e.clientY-y)+Number(top)+"px");
				}
				function dragup(){
					$(document).unbind('mousemove',dragmove).unbind('mouseup',dragup);
				}
			});
			//发送快捷键--Ctrl+Enter
			var textarea = mailsendbox.find('.box-content textarea');
			textarea.keydown(function(e){
				if(e.ctrlKey&&e.keyCode==13)
					space.find('#sendMail').trigger('click');
			});
		}
		else{
			mailsendbox.hide();
		}
		$(document).unbind('keydown',hideMailbox);
		$(document).bind('keydown',hideMailbox);
		/**取消和关闭mailbox click事件*/
		mailsendbox.find('.box-header span,#cancelSend').unbind('click');
		mailsendbox.find('.box-header span,#cancelSend').one('click',function(){
			mailsendbox.slideUp();
			$('#lockmask').remove();
		});
		var title,position,x,y;
		if(obj.hasClass('mailAddress')){
			title = "快捷回复给："+obj.prev().html().replace(/(:|：).*$/,"");
			position = obj.parent().position();
			x = position.left+30;
			y = position.top+25;
		}
		else{
			title = "快捷回复";
			position = obj.position();
			x = position.left;
			y = position.top+obj.height()+5;
		}
		mailsendbox.css('left',x);
		mailsendbox.css('top',y);
		mailsendbox.find('.box-header label').html(title);
		//初始化Textarea
		var textarea = mailsendbox.find('.box-content textarea');
		textarea.css('height','');
		textarea.css('width','');
		textarea.val('');
		mailsendbox.slideDown(function(){textarea.focus();});
		showShadow();
		return false;
	});
	/**EIP公告板*/
	var liNo = $('div.notice_info li');
	if(liNo.length>5){
		$('.notice_info a.more').click(function(){
			var ul = $('div.notice_info ul.active');
			var next = ul.next().filter('ul');
			if(next.length!=0){
				ul.removeClass('active');
				next.addClass('active');
				ul.animate({
					"margin-top":"-145px",
				},1000,function(){
					$('.notice_info a.less').show();
					if($('div.notice_info ul.active').next().filter('ul').length==0)
						$('.notice_info a.more').hide();
				});
			}else{
				$(this).hide();
			}
		});
		$('.notice_info a.less').click(function(){
			var ul = $('div.notice_info ul.active');
			var prev = ul.prev().filter('ul');
			if(prev.length!=0){
				ul.removeClass('active');
				prev.addClass('active');
				prev.animate({
					"margin-top":"0px",
				},1000,function(){
					$('.notice_info a.more').show();
					if($('div.notice_info ul.active').prev().filter('ul').length==0)
						$('.notice_info a.less').hide();
				});
			}else{
				$(this).hide();
			}
		});
		$('.notice_info a.less').hide();
	}
	else{
		$('.notice_info a').hide();
	}
	/**选择考勤日期-暂不使用该方法*/
	$('#editCheckon').click(function(){
		showShadow();
		var setDate = $('<div id="setDate"></div>').appendTo($('body'));
		$('<div class="close"></div>').click(function(){
			$('#setDate').remove();
			$('#lockmask').remove();
		}).appendTo(setDate);
		var panel = $('<div id="datePanel"></div>').appendTo(setDate);
		var date = new Date();
		var preUnit = $('<span class="preUnit"></span>').appendTo(panel);
		for(var i=-9;i<=0;i++){
			var current = getMonthAndDay(date,i);
			createDateUnit(current,panel,1);
		}
		$('<a class="arrow left" href="javascript:void(0)"></a>').click(function(){
			var dateUnit = $('#datePanel .dateUnit:first').stop(false,true);
			var marginLeft = dateUnit.css('margin-left').replace('px','');
			if(marginLeft==0){
				var timestamp = dateUnit.attr('date');
				var date = new Date(Number(timestamp));
				var current = getMonthAndDay(date,-1);
				var span = createDateUnit(current,preUnit,2);
				dateUnitAnimation(span,-53,true);
			}
			else{
				dateUnitAnimation(dateUnit,marginLeft,true);
			}
		}).appendTo(setDate);
		$('<a class="arrow right" href="javascript:void(0)"></a>').click(function(){
			var dateUnits = $('#datePanel .dateUnit');
			var dateUnit = dateUnits.eq(0).stop(false,true);
			var marginLeft = dateUnit.css('margin-left').replace('px','');
			if(dateUnits.length!=10-marginLeft/53){
				dateUnitAnimation(dateUnit,marginLeft,false);
			}
			else{
				var timestamp = dateUnits.eq(-1).attr('date');
				var date = new Date(Number(timestamp));
				var current = getMonthAndDay(date,1);
				createDateUnit(current,panel,1);
				dateUnitAnimation(dateUnit,marginLeft,false);
			}
		}).appendTo(setDate);
		$(document).bind('keydown',hideSetDatebox);
	});
	
	/**拖动日历*/
	$('#arrow-right').click(function(){
		var unit = $('.check_td');
		var marginLeft = unit.eq(0).css('margin-left').replace('px','');
		marginLeft = Number(marginLeft);
		if(-marginLeft/101+7 == unit.length) return false;
		unit.eq(0).animate({
			"margin-left":marginLeft-101+'px',
		},100);
	});
	$('#arrow-left').click(function(){
		var unit = $('.check_td');
		var marginLeft = unit.eq(0).css('margin-left').replace('px','');
		marginLeft = Number(marginLeft);
		if(marginLeft==0) return false;
		unit.eq(0).animate({
			"margin-left":marginLeft+101+'px',
		},100);
	});
	
});
/**点击考勤日期*/
function bindCheckClick(){
	$('td.hover').click(function(){
		$('#checkonbyday .focus').removeClass('focus');
		$(this).addClass('focus');
		var checkonInfo = $('.checkon .info:hidden');
		if(checkonInfo.length==1)
			checkonInfo.show();
	});
}
/**
 * 生成滚动动画
 */
function dateUnitAnimation(dateUnit,marginLeft,flag){
	dateUnit.animate({
		"margin-left":Number(marginLeft)+(flag?53:-53)+'px',
	},100);
}
/**
 * 生成选择槽的日期单元
 */
function createDateUnit(current,panel,type){
	var dateUnit;
	if(type==1)
		dateUnit = $('<span class="dateUnit" date="'+current.timestamp+'">'
				+current.month+'/'+current.day+'</span>').appendTo(panel);
	else
		dateUnit = $('<span class="dateUnit" style="margin-left:-53px;" date="'
				+current.timestamp+'">'+current.month+'/'+current.day+'</span>').insertAfter(panel);
	dateUnit.click(function(){
		var timestamp = $(this).attr('date');
		var checkonbyday = $('#checkonbyday');
		var div = $('<div style="display:none" id="'+timestamp+'"></div>').insertAfter(checkonbyday);
		div.load("checkonbyday.jsp",{"timestamp":timestamp},function(){
			checkonbyday.remove();
			div = div.find('>table');
			$(div).unwrap();
			$('#setDate').remove();
			$('#lockmask').remove();
			bindCheckClick();
		});
	});
	return dateUnit;
}
/**
 * 隐藏日期选择槽
*/
function hideSetDatebox(e){
	if(e.keyCode==27){
		$(document).unbind('keydown',hideSetDatebox);
		$('#setDate').remove();
		$('#lockmask').remove();
	}
}
/**生成月份和日期
 * date为当前日期，i为相对于当前的日期偏移
*/
function getMonthAndDay(date,i){
	var timestamp = date.getTime()+1000*60*60*24*i;
	var date_now = new Date(timestamp);
	var month = date_now.getMonth()+1;
	month = month<10?"0"+month:""+month;
	var day = date_now.getDate();
	day = day<10?"0"+day:""+day;
	return {"timestamp":timestamp,"month":month,"day":day};
}
/**弹出遮罩层*/
function showShadow(){
	var div = '<div id="lockmask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index: 1989;"></div>';
	$('body').append(div);
}
function showContent(serialNo){
	window.open('http://192.168.5.1:8080/EIP/DeskTop/ShowBulletinContent.jsp?serialno='+serialNo,'_blank',
	'toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no,height=600,width=766,left=100,top=0');
}
function changeWorkSpot(spot) {
	lastSpot.className = "";
	spot.className = "over";
	lastSpot = spot;
	var spot_value = spot.id.substring(9);
	document.getElementById("workspot").value = spot_value;
	clearTask();
	enableTask(true);
	if (spot_value == "O") {
		changePlace("TD00000");
	} else if (spot_value == "H") {
		enableTask(false);
	}
	changeWorkStatus();
} 
function changeWorkStatus() {
	var workdate = document.getElementById("workdate").value;
	var workspot = document.getElementById("workspot").value;
	var status = document.getElementById("workstatus");
	var statuscode = status.value;
	status.options.length = 0;// 清空
	var url = "GetMyWorkStatus.jsp?workdate=" + workdate + "&workspot="
			+ workspot + "&workstatus=" + statuscode;
	openAjax(url, function(data) {
		var w = eval(data);
		var si = -1;
		for (var i = 0; i < w.length; i++) {
			status.options[i] = new Option(w[i][1], w[i][0]);
			if (w[i][0] == statuscode) {
				status.options[i].selected = "selected";
				si = i;
			}
		}
		if (si < 0 && w.length > 0)
			status.options[0].selected = "selected";
	}, true);
}
function validate() {
	var ws = document.getElementById("workspot").value;
	var threadid = document.getElementById("threadid").value;
	if ("OFJ".indexOf(ws) >= 0 && threadid == "") {
		alert("工作和出差状态下，任务活动不能为空！");
		return false;
	}
	if (threadid == "TX00000" && getWorkCommentLength() < 10) {
		alert("选择其他任务时，至少在要在工作内容备忘中填写10字以上情况说明！");
		return false;
	}
	var ap = document.getElementById("ap").value;
	if (threadid != "" && threadid.indexOf("TD") == 0 && ap == "P"
			&& getWorkCommentLength() < 10) {
		alert("工作任务是日常事务时，至少在要在下午的工作内容备忘中填写10字以上有意义的内容！");
		return false;
	}
	return true;
}
function getWorkCommentLength() {
	var sWorkComment = document.getElementById("workcomment").value;
	sWorkComment = sWorkComment.replace(/(^\s*)|(\s*$)/g, "");
	return sWorkComment.length;
}
function getWeather(){
	try{
	$.ajax({
		type:'post',
		url:'servlet/TP',
		async:false,
		success:function(json){
			var data = eval('(' + json + ')');
			var weatherUnit = $('span.weather_unit');
			var label = ["今天","明天","后天"];
//			var value = JSON.stringify(json);
			for(var i=0;i<3;i++){
				var todayWeather = data[i];
				unit = $(weatherUnit[i]);
				var city = todayWeather["city"];
				var week = todayWeather["week"];
				var fchh = todayWeather["fchh"];
				var weather = todayWeather["weather"];
				var temp = todayWeather["temp"];
				var wind = todayWeather["wind"];
				var fl = todayWeather["fl"];
				var index = todayWeather["index"];
				var index_uv = todayWeather["index_uv"];
				var index_tr = todayWeather["index_tr"];
				var index_co = todayWeather["index_co"];
				var index_cl = todayWeather["index_cl"];
				var index_xc = todayWeather["index_xc"];
				var index_d = todayWeather["index_d"];
				unit.find('img').attr('src',todayWeather["img"]);
				unit.find('span:first').html(label[i]+"("+week+","+weather+")");
				unit.find('span').eq(1).html(temp);
				unit.find('span:last').html(wind.replace(/^.*转/,""));
				unit.attr('title',"紫外指数："+index_uv+"\n旅游指数："
				+index_tr+"\n舒适指数："+index_co+"\n晨练指数："+index_cl+"\n洗车指数："+index_xc+"\n穿衣指数："+index_d);
			}
			var todayWeather = $('span.weather_today');
			todayWeather.find('span:first').html(data[0]["city"]);
			todayWeather.find('span').eq(1).html(data[0]["temp"]);
			todayWeather.find('span').eq(2).html(data[0]["quality"]);
			todayWeather.find('span').eq(3).html(data[0]["AQI"]);
			todayWeather.find('img').attr("src",data[0]["img"]);
			var a = todayWeather.find('a');
			a.attr("href",a.attr('href').replace('areaNo',data[0]["cityId"]));
//			alert(city+date+week+fchh+weather+temp+wind+fl+index+index_uv+index_tr+index_co+index_cl+index_xc+index_d);
		},
		complete:function(){
			$('.weather').show();
		}
	});
	}catch(e){
		$('.weather').show();
	}
}