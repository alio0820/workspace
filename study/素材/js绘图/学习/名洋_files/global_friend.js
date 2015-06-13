(function($){
	window.isIE6=$.browser.msie && jQuery.browser.version==6.0;
	jQuery.extend({
		ajaxFormNums:0,
		ajaxFormPost:function(sURL, datas, callBack,domains){/*[sURL=提交地址, datas=要提交的数据对像, callBack=回调,domain=域]*/
			domains=domains||'51.com';
			var on='TEMP_POST_'+$.ajaxFormNums;
			var of=[];
			of.push('<div id="'+on+'_DIV" style="position:absolute;z-index:10;top:-20000100px;"><iframe id="'+on+'_IFRAME" name="'+on+'_IFRAME" height="1" width="1" src="http://friend.51.com/ajax_blank.php?d='+encodeURIComponent(domains)+'" frameborder="0" border="0" scrolling="no"></iframe><form id="'+on+'_FORM" name="'+on+'_FORM" method="post" action="'+sURL+'" target="'+on+'_IFRAME">');
			$.each(datas,function(i,n){of.push('<textarea name="'+i+'" style="width:1px;height:1px;">'+n+'</textarea>');});
			of.push('<input type="submit" value="Submit" name="b1" style="width:1px;height:1px;" /></form></div>');
			$(document.body).append(of.join(''))//.insertAdjacentHTML("beforeEnd", of.join(''));
			//document.body.insertAdjacentHTML("beforeEnd", of.join(''));
			of=null;
			$('#'+on+'_IFRAME').bind('load',function(){
				if(!$(this).attr('summary'))
				{
					$(this).attr('summary',1);
					$('#'+on+'_FORM').submit();
					return false;
				}

				if(isIE6)
				{
					if($.isFunction(callBack))
					{
						callBack(window.name);
					}
					else
					{
						eval(callBack+'(window.name)');
					}
				}
				else
				{
					var oIf= this.id;
					if($.isFunction(callBack))
					{
						if(navigator.userAgent.toLowerCase().indexOf('se 2.x')>-1)
						{
							callBack(frames[oIf].document.body.innerText);
						}
						else
						{
							callBack(frames[oIf].document.body.innerHTML);
						}
					}
					else
					{
						eval(callBack+'(frames[oIf].document.body.innerHTML)');
					}
				}
				window.setTimeout(function(){$('#'+on+'_DIV').remove();},1);
			});
			$.ajaxFormNums++;
		}
	});
})(jQuery);

/**
 * 全站关注js接口
 * @param	string	f		要关注的内部账号名
 * @param	string	options  可选参数
 * @param	string	callBack  可选回调函数,传default为默认弹出层提示，否则不提示
 */
var ajax_portal = 'http://friend.51.com/friend/global_deal_friend_ajax.php?callback=?';
var ajax_portal_follow = 'http://friend.51.com/friend/add_follow_api.php?callback=?';

var scoreComment = {

    '2':[

        ['w1','邻家女孩','邻家女孩？','font_w0'],

        ['w2','古典美','古典美！你很适合拍古装剧嘛哈哈！','font_w0'],

        ['w3','大眼妹妹','大眼妹妹，你长的好可爱啊！','font_w0'],

        ['w4','潮女','潮女一个，喜欢自拍吧','font_w1'],

        ['w5','皮肤好白','皮肤好白啊，天生就这么白吗？','font_w1'],

        ['w6','性感','照片很性感呢，喜欢运动吗？','font_w1'],

        ['w7','奶茶妹妹','传说中的奶茶妹妹？','font_w2'],

        ['w8','似曾相识','似曾相识啊，可以聊聊吗？','font_w2'],

        ['w9','乖乖女','乖乖女，你还在上学吗？','font_w2'],

        ['w10','时尚的女生','很时尚的女生啊！','font_w3'],

        ['w11','惊艳','哇，惊艳！照片是你自己吗？','font_w3'],

        ['w12','眼睛好漂亮','眼睛好漂亮哦！能多传几张你的照片吗？','font_w3'],

        ['w13','脖子很性感','有没有人说过你的脖子很性感？','font_w4'],   

        ['w14','你很爱笑哦？','美女，你很爱笑哦？','font_w4'],

        ['w15','距离感','照片有点距离感哦！还有其他照片吗？','font_w4'],

        ['w16','风情女','风情女，哈哈！','font_w5'],

        ['w17','帅气的女生','好帅气的女生！','font_w5'],

        ['w18','朋克女生','朋克女生，你很喜欢音乐吗？','font_w5'],   

        ['w19','好迷你好娇小','你长得好迷你好较小，怎么看像一个港台明星呢？','font_w6'],

        ['w20','野性','很野性的样子，性格也是这样吗？','font_w6'],

        ['w21','小资文艺女','有点小资文艺女的感觉，你平时一定很爱看书吧！','font_w6'],

        ['w22','温柔的美女','好温柔的美女啊，现实生活里是贤妻良母吗？','font_w7'],

        ['w23','小萝莉','你多大了？看上去就是个小萝莉！','font_w7'],       

        ['w24','有气质','美女，你好有气质啊，平时都喜欢干什么呢？','font_w7'],

        ['w25','氧气美女','长得好干净啊，一定很多人夸你是氧气美女吧！','font_w8'],

        ['w26','身材很魔鬼','你的身材很魔鬼，是模特吗？','font_w8'],

        ['w27','骨感的女生','好骨感的女生，你一直减肥吗？','font_w8'],

        ['w28','冰雪女王','你都不笑啊，难道是冰雪女王吗？','font_w9'],       

        ['w29','笑得好妩媚好温暖','笑得好妩媚好温暖，我们可以认识下吗？','font_w9'],

        ['w30','好淑女','好淑女，生活中也一直这么安静吗？','font_w9'],

        ['w31','great haircut','that\’s a great haircut.','font_w10'],

        ['w32','first time','come here first time?','font_w10'],

        ['w33','sweet smile','sweet smile.','font_w10'],   

        ['w34','So charming','you look So charming.','font_w11'],

        ['w35','sexy lips!','sexy lips','font_w11'],

        ['w36','flipped',')   flipped: )','font_w11'],

        ['w37','have a boyfriend?','Do you have a boyfriend','font_w12'],

        ['w38','nick’s friend?','Are you nick’s friend?','font_w12'],  

        ['w39','meet once?','Did we meet once','font_w12'],

        ['w40','Great photo','Great photo.','font_w13']

    ],

    '1':[

        ['m1','骑着白马的……唐僧','你一定是传说中骑着白马的……唐僧！','font_w0'],

        ['m2','智慧','你鼻梁上架着的是智慧吧？','font_w0'],

        ['m3','好美啊！','好美啊！你居然能长得让女人都羡慕嫉妒恨！','font_w0'],

        ['m4','贵族王子','你有种贵族王子的感觉诶，真的超级有气场啊！','font_w1'],

        ['m5','魅力型男','哇，魅力型男，你很迷惑女人呐！','font_w1'],

        ['m6','灰太狼','你看上去就是21世纪新好男人第一名的灰太狼！','font_w1'],

        ['m7','潮男','一看你就是走在时尚尖端的潮男！','font_w2'],

        ['m8','莲花小王子','你真的堪比车展上最火爆的莲花小王子！','font_w2'],

        ['m9','背包客','背包客，常去旅游吗？','font_w2'],

        ['m10','眼神犀利','眼神犀利，你就是传说中的××哥！','font_w3'],

        ['m11','阳光宅男','很乖的男人不多见哦，莫非你是阳光宅男？','font_w3'],

        ['m12','黑框眼镜男','黑框眼镜男，是为了装帅还是真近视啊？','font_w3'],

        ['m13','迷茫弟','你的眼神好空洞啊，莫非是迷茫弟？','font_w4'],

        ['m14','王子范儿','你看上去超级帅，超有王子范儿的！','font_w4'],

        ['m15','西装笔挺','西装笔挺，不会是假正经吧？','font_w4'],

        ['m16','运动健将','貌似很爱运动啊，你是运动健将吗？','font_w5'],

        ['m17','纯爷们','感觉你是个纯爷们呐！','font_w5'],

        ['m18','很有潜力','从照片里看，感觉你很有潜力哦！','font_w5'],

        ['m19','三好学生','看上去很乖的样子，是三好学生吗？','font_w6'],

        ['m20','火星男','你莫非是第十一种男人&mdash;&mdash;火星男？','font_w6'],

        ['m21','文艺青年','好秀气的样子，你是文艺青年吗？','font_w6'],

        ['m22','极品好男人','你是不是传说中的极品好男人？','font_w7'],

        ['m23','成熟','看上去很成熟呐，一定事业有成吧？','font_w7'],

        ['m24','霸气外露','你的气场好强大，给我有一种霸气外露的感觉！','font_w7'],

        ['m25','坏男人','看上去笑得很贱哟，不会是坏男人吧？','font_w8'],

        ['m26','体魄强健','经常去锻炼吗？看上去很体魄强健呢！','font_w8'],

        ['m27','老实本分','这张照片很老实本分的样子，真人也是这样吗？','font_w8'],

        ['m28','心好男人','你看上去真的很心好男人，现实生活中呢？','font_w9'],

        ['m29','绅士','很优雅的样子，你平时一定很绅士吧？','font_w9']   

    ]

};

var style = document.createElement('link');
style.href = 'http://static.51img1.com/v5/jiaoyou/css/public_grade.css?v=110809';
style.rel = 'stylesheet';
style.type = 'text/css';
document.getElementsByTagName('HEAD')[0].appendChild(style);

function helloAssessaPanel(obj){
		var f = obj.f;
		var sex = obj.sex;
		var token = obj.token;
		var time = obj.time;
		var from = obj.from;
		var callBack = obj.callBack;
		var param = obj.param;
		var callafterok = obj.callafterok;
        var msg = [];
		var msg_content = [];
		if($.isFunction(callBack)) callBack = '';
        if(f ==''){ return;}
        //if(lastUser ==null || lastUser==''){alert('网络异常，请刷新页面');return;}
		msg.push('<table border="0" id="global_popup_table" class="global_popup_table" style="visibility: visible; position: relative; display: block; width: 100%; height: 100%; left: 0px; top: 0px; z-index: 2;"><tbody>');
		msg.push('<tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr>');
		msg.push('<tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width: 560px; height: 280px;">');
		msg.push('<div class="global_dialog_content">');
		msg_content.push('<a href="javascript:void(0);" onclick="hidePopWin(false);" class="close" style="display:block;position:absolute;top:10px;right:10px;background: url(http://static.51img1.com/v5/global/public/images/layer/close.gif) no-repeat;height: 10px;width: 10px;">&nbsp;</a>');
		msg_content.push('<div class="pop_appraise" style="padding-bottom:20px;">');
		msg_content.push('<div class="word_box" style="margin-top:0;">');
		msg_content.push('<p style="padding:5px 10px;font-weight:bold;font-size:15px;"><img src="http://static.51img1.com/v5/my/images/icon_ok.gif">&nbsp;关注收藏成功！顺便给TA打个招呼吧！</p>');
		msg_content.push('<div>');
		msg_content.push('<ul class="clear">');
        if(typeof scoreComment[sex] !='undefined'){
            for(var i=0;i<scoreComment[sex].length;i++){
                var _tmpdata = scoreComment[sex][i];
				var con = '';
				con = '<li hint="'+_tmpdata[2]+'" onclick="sendSelectHello(\''+f+'\', \''+_tmpdata[2]+'\', \''+token+'\', \''+time+'\', \''+from+'\', \''+callBack+'\', \''+param+'\', '+callafterok+');';
				con += '" class="'+_tmpdata[3]+' font_w_flag" onmouseover="helloHints(this,event,1)" onmouseout="helloHints(this,event,0)">'+_tmpdata[1]+'</li>';
                msg_content.push(con);
            }
        }
		msg_content.push('</ul>');
		msg_content.push('<div style="position: absolute; width: 100%; top: 309px; left: 161px; display: none;" id="score_hints"><p class="pop_appraise_tip">Great photo.</p></div>');
		msg_content.push('</div>');
		msg_content.push('<style>');
		msg_content.push('.pop_appraise li{margin-right:0;white-space:nowrap;padding:0 6px !important;}.a_g_btn{background:#7599C4;padding:1px;display: inline-block;vertical-align: middle;color:#fff;font-size:14px;}');
		msg_content.push('.a_g_btn:hover{background:#4B6CA0;}');
		msg_content.push('.public_input{display:inline-block;vertical-align:middle;line-height:1;margin:0 !important;border:1px solid #bcbcbc;padding:6px 11px !important;*padding:6px 11px 5px;background:#fff url("http://static.51img1.com/v5/global/public/images/public_input_bg.gif") repeat-x !important;}');
		msg_content.push('.public_input .t{background:#fff;border:0;color:#444;font-size:14px;line-height:normal;*padding:1px 0 0;}');
		msg_content.push('</style>');
		msg_content.push('<div style="position:relative;padding:32px 0 0;font-size:12px;">');
		msg_content.push('<p>我要自己给TA写：<span style="position:absolute;right:92px;top:32px;" id="hello_tip">还可以输入<strong style="color:#E97414;">30</strong>字</span></p>');
		msg_content.push('<p style="margin-top:3px;"><span class="public_input" style="border:1px solid #bcbcbc;"><input id="hello_content" type="text" style="width:430px;outline:none;" class="t" onclick="clear_text(this,1);" onblur="clear_text(this,0);" onkeyup="hello_check(event)"/></span>&nbsp;<a href="javascript:void(0);" onclick="do_send_hello(\''+f+'\', \''+token+'\', \''+time+'\', \''+from+'\', \''+callBack+'\', \''+param+'\', '+callafterok+');return false;" class="a_g_btn" style="color: #FFFFFF;text-decoration: none;"><span style="border:1px solid #4A6E9A;border-top:1px solid #CDDDF2;border-left:1px solid #CDDDF2;display: inline-block; height: 30px; line-height: 30px;padding: 0 15px;">发 送</span></a></p>');
		msg_content.push('<p style="color:red;font-size:12px;margin-top:3px;" id="error_tip">&nbsp;</p>');
		msg_content.push('</div></div></div>');
		msg.push(msg_content.join(''));
		msg.push('</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table>');
		if(from=='home'){
			winDiy({msg:msg_content.join(''),width:580,height:(sex=='1'?'280':'330')});
		}else foui.dialog.open(msg.join(''),{overlay:true,draggable:true,width:580,height:300});
        //new_score.closePanel = foui.dialog.open(msg.join(''),{width:580,height:340,overlay:true});
}

function helloHints(th,e,params){
   //var pos = foui.getMousePosition(e);
   /*var _top = pos[1];
   var _left =pos[0];*/
   var p = $(th).position();
   var _top = p.top;
   var _left = p.left;
   var score = $('#score_hints');
   if(parseInt(params) ==1){
	   score.find('p').text($(th).attr('hint'));
	   /*if(foui.IE()>0){
		   _top = _top-130;
		   _left = _left-500;
	   }else{
			_top = _top-150;
			_left = _left-580;
	   }*/
	   score.css({top:_top+30,left:_left+50}).show();   
   }else{
	   score.hide();
   }
}

function sendSelectHello(friend, hello, token, time, from, callBack, param, callafterok){
	hidePopWin(false);
	var param_callback = param;
	var param = {friend:friend, hello:hello, token:token, time:time, from:from};
	$.ajaxFormPost("http://friend.51.com/friend/add_follow_hello_api.php",param, function(result){
		if(callafterok && callBack!='') eval(callBack+'('+param_callback+')');
	})
}

function add_follow(f, options) {
	var callBack = '';
	var param='';
	//var from = '';
	//var hidden = 0;
	//var showtip = 0;
	//var callafterok = 0;
	if(typeof options=='object'){
		options=jQuery.extend({
				from:'',
				hidden:0,
				showtip:0,
				callafterok:0,
				hello:0
			},options);
		if(options.hidden==1) options.hello=0;
		//if(typeof source['from']=='string') from = source['from'];
		//if(typeof source['hidden']=='number') hidden = source['hidden'];
		//if(typeof source['showtip']=='number') showtip = source['showtip'];
		//if(typeof source['callafterok']=='number') callafterok = source['callafterok'];
	}else options={from:options};
	//var ie_version='';
	if(arguments.length>2){
		if(arguments.length>3){
			for(var i=3;i<arguments.length;i++){
				if(typeof arguments[i] === 'string') arguments[i] = '\''+arguments[i]+'\'';
				if(i==3) param +=arguments[i];
				else param +=','+arguments[i];
			}
		}
		callBack = arguments[2];
	}
	//if($.browser.msie && $.browser.version=='6.0') ie_version = 6;
	$.getJSON(ajax_portal_follow, {friend: f, source: options.from, hidden: options.hidden}, function(result) {
		var status = result.state;
		var errorno = result.errorno;
	    var data = result.data;
	    var info = result.info;
		if (status == 1) {
			if(!options.callafterok){
				if($.isFunction(callBack)) callBack(param);
				else if(callBack!='') eval(callBack+'('+param+')');
			}
			if(options.showtip && !options.hello){
				 friend_show_tip({sex:data.sex,from:options.from,hidden:options.hidden,callBack:callBack,param:param,callafterok:options.callafterok});
			}
			if(options.hello){
				var token = data.token;
				var time = data.time;
				var sex = data.sex=='先生'?'1':'2';
				helloAssessaPanel({f:f,sex:sex,token:token,time:time,from:options.from,callBack:callBack,param:param,callafterok:options.callafterok});
			}
		}else if(status == '0') {
			if(errorno=='1001') top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);
			else show_request_info({info:info,title:'提示',width:'340',height:'140'});
		}
		
	});
}

function add_follow_hello(f, options) {
	var callBack = '';
	var param = '';
	//var from = '';
	//var hidden = 0;
	//var showtip = 1;
	//var callafterok = 0;
	if(typeof options=='object'){
		options=jQuery.extend({
				from:'',
				hidden:0,
				showtip:1,
				callafterok:0,
				hello:1
			},options);
		if(options.hidden==1) options.hello=0;
		//if(typeof source['from']=='string') from = source['from'];
		//if(typeof source['hidden']=='number') hidden = source['hidden'];
		//if(typeof source['showtip']=='number') showtip = source['showtip'];
		//if(typeof source['callafterok']=='number') callafterok = source['callafterok'];
	}else options={from:options};
	//var ie_version='';
	if(arguments.length>2){
		if(arguments.length>3){
			for(var i=3;i<arguments.length;i++){
				if(typeof arguments[i] === 'string') arguments[i] = '\''+arguments[i]+'\'';
				if(i==3) param +=arguments[i];
				else param +=','+arguments[i];
			}
		}
		//func =arguments[2]+'('+param+');';
		callBack = arguments[2];
	}
	//if($.browser.msie && $.browser.version=='6.0') ie_version = 6;
	$.getJSON(ajax_portal_follow, {friend: f, source: options.from, hidden: options.hidden}, function(result) {
		var status = result.state;
		var errorno = result.errorno;
	    var data = result.data;
	    var info = result.info;
		if (status == 1) {
			if(!options.callafterok){
				if($.isFunction(callBack)) callBack(param);
				else if(callBack!='') eval(callBack+'('+param+')');
			}
			if(options.showtip && !options.hello){
				 friend_show_tip({sex:data.sex,from:options.from,hidden:options.hidden,callBack:callBack,param:param,callafterok:options.callafterok});
			}
			if(options.hello){
				var token = data.token;
				var time = data.time;
				var sex = data.sex=='先生'?'1':'2';
				helloAssessaPanel({f:f,sex:sex,token:token,time:time,from:options.from,callBack:callBack,param:param,callafterok:options.callafterok});
			}
		}else if(status == '0') {
			if(errorno=='1001') top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);
			else show_request_info({info:info,title:'提示',width:'340',height:'140'});
		}
		
	});
}

function show_request_info(obj){
	var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 10px;">'+obj.info+'</div>';
	msg += '<div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="button" onclick="hidePopWin(false);';
	if(typeof obj.callafterok != 'undefined' && typeof obj.callBack != 'undefined' && obj.callafterok) msg += obj.callBack+'('+obj.param+')';
	msg += '" class="g_btn" value="确定"></span></div>';
	winOpen({'msg':msg,width:obj.width,height:obj.height,title:obj.title});		
}

function friend_show_tip(obj){
	var sex = obj.sex;
	var from = obj.from;
	var hidden = obj.hidden;
	var callBack = obj.callBack;
	var param = obj.param;
	var callafterok = obj.callafterok;
	if(from == 'home'){
		var msg = '<div style="padding:30px 30px 0;"><p style="text-align:center;font-size:14px;"><img src="http://pic.51img1.com/v3/home/new_loveinfo/images/ok.jpg" style="margin:0 5px 0 0;vertical-align: middle;"/><strong>关注收藏成功！<a href="http://friend.51.com/friend/follow.list.php" onclick="hidePopWin(false);" style="color:#1a4dc1;" target="_blank"><u>点这里查看我的关注收藏</u></a></strong></p></div>';
		msg += '<div style="text-align:center;padding:30px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="关闭" class="g_btn" onclick="hidePopWin(false);"></span></div>';
		winDiy({msg:msg,width:370,height:140});

		//var msg = '<div style="text-align:center;font-size:14px;line-height:24px;margin:25px 5px;"><img src="http://static.51img1.com/v5/my/images/icon_ok.gif">&nbsp;&nbsp;'+info+'</div>';
		//$_Global_Mask.show();
		//setTimeout("hidePopWin(false);$_Global_Mask.hide();",1500);
	}else{
		var con  = '<div style="padding:20px;clear:both;" class="clear">';
		con += '<table border="0" id="global_popup_table" class="global_popup_table">';
		con += '<tbody>';
		con += '<tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr>';
		con += '<tr>';
		con += '<td class="pop_border"></td>';
		if(hidden) con += '<td valign="top" class="global_popup_content" id="global_popup_content" style="width:450px; height:160px;">';
		else con += '<td valign="top" class="global_popup_content" id="global_popup_content" style="width:400px; height:140px;">';
		//con += '<td valign="top" class="global_popup_content" id="global_popup_content">';
		con += '<div class="global_dialog_content">';
		var openwin = '';
		if(window.location.href.indexOf("friend.51.com")==-1) openwin = 'target="_blank"';
		if(!hidden){
			con += '<div style="padding:30px 30px 0;"><p style="text-align:center;font-size:14px;"><img src="http://pic.51img1.com/v3/home/new_loveinfo/images/ok.jpg" style="margin:0 5px 0 0;vertical-align: middle;"/><strong>关注收藏成功！<a href="http://friend.51.com/friend/follow.list.php" onclick="hidePopWin(false);';
			if(callafterok) con += callBack+'('+param+')';
			con += '" style="color:#1a4dc1;" '+openwin+'><u>点这里查看我的关注收藏</u></a></strong></p></div>';
		}else{
			con += '<div style="padding:30px 30px 0;"><p style="text-align:center;font-size:14px;"><img src="http://pic.51img1.com/v3/home/new_loveinfo/images/ok.jpg" style="margin:0 5px 0 0;vertical-align: middle;"/><strong>悄悄收藏成功！该用户不会知道您关注收藏了'+(sex=='先生'?'他':'她')+'！<br/><a href="http://friend.51.com/friend/follow.list.php" onclick="hidePopWin(false);';
			if(callafterok) con += callBack+'('+param+')';
			con += '" style="color:#1a4dc1;" '+openwin+'><u>点这里查看我的关注收藏</u></a></strong></p></div>';
		}
		con += '<div style="text-align:center;padding:30px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="关闭" class="g_btn" onclick="hidePopWin(false);';
		if(callafterok) con += callBack+'('+param+')';
		con += '"></span></div>';
		con += '</div>';
		con += '</td>';
		con += '<td class="pop_border"></td>';
		con += '</tr>';
		con += '<tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr>';
		con += '</tbody>';
		con += '</table>';
		con += '</div>';
		if(hidden) foui.dialog.open(con,{overlay:true,draggable:true,width:450,height:160});
		else  foui.dialog.open(con,{overlay:true,draggable:true,width:400,height:140});
	}
}

function show_tip_hello(info,from){
	var con  = '<div style="padding:20px;clear:both;" class="clear">';
	con += '<table border="0" id="global_popup_table" class="global_popup_table">';
	con += '<tbody>';
	con += '<tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr>';
	con += '<tr>';
	con += '<td class="pop_border"></td>';
	con += '<td valign="top" class="global_popup_content" id="global_popup_content" style="width:220px; height:85px;">';
	con += '<div class="global_dialog_content">';
	con += '<div style="text-align:center;font-size:14px;line-height:24px;margin:25px 5px 0;"><img src="http://static.51img1.com/v5/my/images/icon_ok.gif">&nbsp;&nbsp;'+info+'</div>';
	con += '</div>';
	con += '</td>';
	con += '<td class="pop_border"></td>';
	con += '</tr>';
	con += '<tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr>';
	con += '</tbody>';
	con += '</table>';
	con += '</div>';
	
	if(from == 'home'){
		con = '<div style="text-align:center;font-size:14px;line-height:24px;margin:25px 5px;"><img src="http://static.51img1.com/v5/my/images/icon_ok.gif">&nbsp;&nbsp;'+info+'</div>';
		winDiy({msg:con,width:220,height:80});
		//$_Global_Mask.show();
		setTimeout("hidePopWin(false);$_Global_Mask.hide();",2000);			
	}else foui.dialog.open(con,{overlay:true,draggable:true,width:220,closeTimeout:2000});
}

function clear_text(obj,type)
{
	//if($(obj).val()==default_word){
	//	$(obj).val('').focus();
		//$(obj).css("color","#000");
	//}
	$('#error_tip').html("&nbsp;");
	if(type) $(obj).parent().css("border-color","#67B7F5");
	else  $(obj).parent().css("border-color","#bcbcbc");
}

function hello_check(e) {
	var lass = 30-$("#hello_content").val().length;
	if(lass >= 0) $('#hello_tip').html('还可以输入<strong style="color:#E97414;">'+lass+'</strong>字');
	else $('#hello_tip').html('<font color="#E37D75">已超出</font><strong style="color:#E97414;">'+Math.abs(lass)+'</strong><font color="#E37D75">字</font>');

	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		refuse_relation_up(f_uid);
	}
}

function do_send_hello(friend, token, time, from, callBack, param, callafterok){
	var hello = $("#hello_content").val().replace(/(^\s*)|(\s*$)/g,"");
	if(hello.length == 0){
		$('#error_tip').html('提示：你还未输入内容');
		return false;
	}
	if(hello.length > 30) return false;
	
	var param_hello = {friend:friend, hello:hello, token:token, time:time, from:from};
	$.ajaxFormPost("http://friend.51.com/friend/add_follow_hello_api.php",param_hello, function(result){
		if(result==-2){
			$('#error_tip').html('提示：你发送的内容含有敏感词汇');
			return false;	
		}else if(result==12){
			hidePopWin(false);
			var info = '对不起，您的帐号已经被禁言，不能打招呼、发消息、评论、留言等。如有疑问，请联系客服：0515-88115151';
			//show_request_info(info,'提示','320','160');
			show_request_info({info:info,title:'提示',width:'320',height:'160',callBack:callBack, param:param, callafterok:callafterok});
		}else{
			hidePopWin(false);
			show_tip_hello('招呼发送成功',from);
			if(callafterok && callBack!='') eval(callBack+'('+param+')');
		} 	
			//hidePopWin(false);
			//var msg = '招呼发送失败';
			//show_request_info(msg,'打招呼');
	})
}

function cancel_follow(f, fid, nick) {
	var callBack = '';
	var param='';
	if(arguments.length>3){
		if(arguments.length>4){
			for(var i=4;i<arguments.length;i++){
				if(typeof arguments[i] === 'string') arguments[i] = '\''+arguments[i]+'\'';
				if(i==4) param +=arguments[i];
				else param +=','+arguments[i];
			}
		}
		callBack = arguments[3];
	}
	if(!param) param = '\'\'';
	var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 0 20px;"><i style="-moz-inline-stack;display:inline-block;background:url(http://static.51img1.com/v5/my/images/icon_friends.gif) 0 -139px no-repeat;width:15px;height:15px;position:relative;*top:-3px;margin-right:3px;"></i>是否取消对<font color="#EB6100">'+nick+'</font>的关注收藏？</div><div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="submit" id="" class="g_btn" value="确定" onclick="do_cancel_follow(\'' + f + '\', \'' + fid + '\', \''+ callBack +'\', '+ param +');"></span><span class="g_btn_w_gray"><input type="button" class="g_btn_gray" value="取消"  onclick="hidePopWin(false);"></span></div>';
	
	winOpen({'msg':msg,width:300,height:120,title:'取消关注收藏'});
}

function do_cancel_follow(f, fid, callBack, param){
	hidePopWin(false);
	$.getJSON(ajax_portal, {opt: 'del_friend', friend: f, friendid: fid}, function(data) {
		if (data == 1) {
			if($.isFunction(callBack)) callBack(param);
			else if(callBack!='') eval(callBack+'(\''+param+'\')');
		} else if (data == -1) {
			alert('系统繁忙,请稍后再试!');
		} else if (data == -2) {
			alert('您已经将Ta加入了黑名单!');
			window.location.reload();
		}
	});
}

function friend_add_black(f, fid, nick) {
	var callBack = '';
	var param='';
	if(arguments.length>3){
		if(arguments.length>4){
			for(var i=4;i<arguments.length;i++){
				if(typeof arguments[i] === 'string') arguments[i] = '\''+arguments[i]+'\'';
				if(i==4) param +=arguments[i];
				else param +=','+arguments[i];
			}
		}
		callBack = arguments[3];
	}
	if(!param) param = '\'\'';
	var msg = '<div style="text-align:center;line-height:18px;padding:20px 5px 10px;"><img src="http://static.51img1.com/v5/global/public/images/tip_sigh.gif" style="margin-right:5px;">你确定要拉<font color="#EB6100">'+nick+'</font>用户到黑名单吗？</div><div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="submit" id="" class="g_btn" value="确定" onclick="do_friend_add_black(\'' + f + '\', \'' + fid + '\', \''+ callBack +'\', '+ param +');"></span><span class="g_btn_w_gray"><input type="button" class="g_btn_gray" value="取消" onclick="hidePopWin(false);"></span></div>';

	winOpen({'msg':msg,width:310,height:120,title:'加黑名单'});
}

function do_friend_add_black(f, fid, callBack, param){
	hidePopWin(false);
	$.getJSON(ajax_portal, {opt: 'add_black', friend: f, friendid: fid}, function(data) {
		if (data == 1) {
			if(callBack!='reflush'){
				if($.isFunction(callBack)) callBack(param);
				else if(callBack!='') eval(callBack+'(\''+param+'\')');
				//alert('操作成功！');
				var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 10px;">操作成功！</div>';
				msg += '<div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="button" onclick="hidePopWin(false);" class="g_btn" value="确定"></span></div>';
				winOpen({'msg':msg,width:200,height:120,title:'加黑名单'});
			}else{
				//alert('操作成功！');
				var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 10px;">操作成功！</div>';
				msg += '<div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="button" onclick="hidePopWin(false);reflush();" class="g_btn" value="确定"></span></div>';
				winOpen({'msg':msg,width:200,height:120,title:'加黑名单'});		
			}			
		} else if (data == -1) {
			alert('系统繁忙,请稍后再试!');
		}
	});
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////功能分界线
/**
 * 全站打招呼js接口
 * @param	string	receiver 打招呼对象的内部账号名
 * @param	string	source  可选参数来源
 */
var errorpic_man_80 = 'http://static.51img1.com/v3/themes/skins/images/none_80.gif';
var errorpic_woman_80 = 'http://static.51img1.com/v3/themes/skins/images/none_women_80.gif';
var hello_girl = [[['我猜一定有很多男生追你吧？',0],['姑娘你很能激起男生的保护欲！',0],['你和我梦中情人长得一模一样！',0],['你笑容真的好甜美，邻家妹妹一样~',0],['想必这位美女，你就是我上辈子的债主吧？我来还债了！',0],['看你长相，如果设置打分照肯定会得高分！',1],['这张打分照没你真人漂亮呀，快去换一张吧！',2]],[['你喜欢什么星座的男生呢？',0],['你长得好养眼，看到你心情就好！',0],['你看上去年纪好小，还是学生吧？',0],['你好，你长的很像我的下一任女友',0],['古典美！有没有人说过你很适合拍古装剧？',0],['好久没见过像你这样不化妆也漂亮的素颜美女了！',0]],[['美女，你很爱笑哦？',0],['你很有明星气质喔！是不是演过戏？',0],['御姐气场！在生活中是不是个女强人？',0],['你看上去好贤惠，是不是很擅长做饭呀？',0],['你看上去很强势，是不是很多男生都怕你呀？',0],['小资文艺女的感觉，你平时一定很爱看书吧？',0]]]
var hello_boy = [[['你气场好强大喔，霸气外露！',0],['你给人感觉很特别，好想认识下！',0],['好秀气的样子，你是文艺青年吗？',0],['你看上去好成熟，一定事业有成吧？',0],['你给我种似曾相识的感觉，可以认你做哥哥吗？',0],['看你长相，如果设置打分照肯定会得高分！',1],['这张打分照没你真人漂亮呀，快去换一张吧！',2]],[['看你照片不多，多传点照片嘛！',0],['你不在江湖，江湖还有谁的传说？',0],['你长得很亲切，是不是人缘特别好？',0],['眼镜男，是真近视还是耍帅呀？哈哈',0],['哇，美男！女生站你边上压力一定很大~',0],['你是不是经常健身？看上去体魄好强健呢！',0]],[['你喜欢听歌吗？都听谁的歌呢？',0],['你笑得好贱喔，不会是个坏男人吧？',0],['你看上去好阳光，是不是经常运动呀？',0],['很优雅的样子，你平时一定是个绅士吧？',0],['我猜你是个宅男！很少出门的那种！对不对？',0],['我觉得吧，你不去出演偶像剧男主角真是可惜！',0]]];
var hello_visitor = [['欢迎来到我的个人空间，希望我们能够成为朋友？',0],['感谢你的来访，我会回访的哦~',0],['肿么只看看就走了啊，不喜欢我的空间吗？',0],['你相信缘分吗？能认识一下吗？',0],['亲，你是今天第一个访问我空间的哦！',0],['最近频繁访问我空间，肿么不关注我呢，求关注。',0]];
var hello_score = [['感谢你的打分，我也会给你打分的。',0],['哇~这么高的分，感谢你哦~',0],['你没有设置打分照呀，赶紧设置吧，我也给你打分。',0],['肿么给伦家这么低的分，欠你钱啊！！',0],['真给力！满分耶~“十分”谢谢你。',0],['亲，谢谢你给我打的分哦~',0]]; 
var hello_flower = [['谢谢你的小红花！',0],['敢不敢送真花来...',0],['小红花是对我最大的鼓励，谢谢你。',0],['你也很喜欢这条说说是不是？',0],['我的小红花真是太少了，桑心，求安慰！',0],['这么多小红花，真开心！',0]];
var hello_mapping = {'my_visitor':hello_visitor,'my_score':hello_score,'my_flower':hello_flower};
var word_index;
var total_index;
function global_hello(receiver) {
	var source='';
	if(arguments.length==2){
			source = arguments[1];
	}
	$.getJSON("http://friend.51.com/friend/global_hello_api.php?callback=?",{receiver:receiver,source:source},function(data){
		var result = data.result;
		var errorno = data.errorno;
	    if(result == 0){
			if(errorno == 1001){
				if(source=='home'){
					pub_home_statistic('11|15',1);
					passport_login({success_hook:function(){
						pub_home_statistic('11|16',1);
						location.reload();
					}});
				}else{
					top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);
				}
			}
			else{
				alert(data.desc);
				//Alert({msg:data.desc,title:'互动'});
			}
	    }else if(result == 1){
			var data = data.data;
			var _receiver = data._receiver;
			var receiver_sex = data.receiver_sex;
			var receiver_face = data.receiver_face;
			var receiver_nickname = data.receiver_nickname;
			var receiver_age = data.receiver_age;
			var receiver_prov = data.receiver_prov; 
			var receiver_town = data.receiver_town; 
			var receiver_has_scorephoto = data.receiver_has_scorephoto; 
			var token = data.token;
			var time = data.time;
			var rec_hello = [];
			word_index=0;
			if(receiver_sex == '她'){
				if(hello_girl.length>3) hello_girl.shift();
				if(typeof hello_mapping[source]!='undefined') hello_girl.unshift(hello_mapping[source]);
				total_index = hello_girl.length-1;
				rec_hello = hello_girl[word_index];
			}else{
				if(hello_boy.length>3) hello_boy.shift();
				if(typeof hello_mapping[source]!='undefined') hello_boy.unshift(hello_mapping[source]);
				total_index = hello_boy.length-1;
				rec_hello = hello_boy[word_index];
			}

			if($.trim(receiver_face)==''){
				if(receiver_sex == '她'){
					receiver_face = errorpic_woman_80;
				}else{
					receiver_face = errorpic_man_80;
				}
			}else{
					receiver_face = receiver_face.replace("_130.", "_80.");
			}

			var msg = '<div class="global_dialog_content">';
				msg += '<div style="padding:12px 18px;" class="clear">';
				msg += '<div style="float:left;"><img style="padding:2px;border:1px solid #e2e2e2;" width="65" src="'+receiver_face+'"></div>';
				msg += '<div style="float:left;width:330px;padding-left:15px;">';
				msg += '<p style="border-bottom:1px dashed #d5d5d5;padding:8px 0;"><a style="color:#0066cc;font-size:14px;font-weight:bold;" href="http://home.51.com/?u='+_receiver+'&c=loveinfo" target="_blank">'+receiver_nickname+'</a><span style="padding:0 10px 0 20px;">'+receiver_age+'</span>'+receiver_prov+'<span style="padding-left:10px;">'+receiver_town+'</span></p>';
				msg += '<ul id="hello_words">';
				for(i=0; i<rec_hello.length; i++){
					if((rec_hello[i][1]==2 && receiver_has_scorephoto) || (rec_hello[i][1]==1 && !receiver_has_scorephoto) || rec_hello[i][1]==0)
					msg += '<li style="padding:5px 0;display:block;margin:0;border:none;"><input name="think_val" type="radio" value="'+rec_hello[i][0]+'" '+(i==0?'checked':'')+'/><span onclick="$(this).parent().find(\'input\').attr(\'checked\',true)" style="cursor:pointer;padding-left:10px;">'+rec_hello[i][0]+'</span></li>';
				}				
				msg += '</ul>';
				msg += '<div style="padding:5px 0;"><a style="color:#0068b7;" href="javascript:void(0)" onclick="change_word(\''+receiver+'\',\''+receiver_sex+'\',\''+receiver_has_scorephoto+'\');return false;"><img style="padding-right:10px;" src="http://static.51img1.com/v5/jiaoyou/images/icon_loaders_0.gif">换一些打招呼的话</a></div>';
				msg += '</div></div>';
				msg += '<div style="text-align:center;line-height:30px"><span class="g_btn_w"><input type="button" value="发送" class="g_btn" onclick="send_hello(\''+receiver+'\',\''+receiver_nickname+'\',\''+source+'\',\''+token+'\',\''+time+'\');return false;"></span><span style="padding:0 10px;">或</span><a style="color:#0068b7;" href="javascript:;" onclick="hidePopWin(false);return false;">关闭</a></div>';
				msg += '</div>';

			var title = '和<span style="color:#ff8b1b;padding:0 5px;">'+receiver_nickname+'</span>打个招呼';
			winOpen({'msg':msg,width:475,height:370,'title':title});
	    }
	});
}

function change_word(receiver,receiver_sex,receiver_has_scorephoto){
	if(word_index<total_index) word_index++;
	else word_index=0;
	if(receiver_sex == '她'){
		rec_hello = hello_girl[word_index];
	}else{
		rec_hello = hello_boy[word_index];
	}

	var msg='';
	for(i=0; i<rec_hello.length; i++){
		if((rec_hello[i][1]==2 && receiver_has_scorephoto) || (rec_hello[i][1]==1 && !receiver_has_scorephoto) || rec_hello[i][1]==0)
		msg += '<li style="padding:5px 0;display:block;margin:0;border:none;"><input name="think_val" type="radio" value="'+rec_hello[i][0]+'" '+(i==0?'checked':'')+'/><span onclick="$(this).parent().find(\'input\').attr(\'checked\',true)" style="cursor:pointer;padding-left:10px;">'+rec_hello[i][0]+'</span></li>';
	}
	$('#hello_words').html(msg);
}

//发送招呼
function send_hello(receiver, receiver_nickname, source, token, time) {
	var content = $("input[name='think_val']:checked").val();
	if(typeof content == "undefined") {
		alert("请选择招呼语句！");
		return false;
	}
	hidePopWin(false);
	var param_hello = {act:'send', receiver:receiver, content:content, source:source, token:token, time:time};
	$.getJSON('http://friend.51.com/friend/global_hello_api.php?callback=?',param_hello, function(data){
		if (data.result == 1) {
			//Alert('发送成功');
			global_hello_show_tip('发送成功!');
		} else if(data.result == 6) {
			//对方在我的黑名单中
			alert('对不起，对方在你的黑名单中，请取消后再发送');
			//Alert({msg:'对不起，对方在你的黑名单中，请取消后再发送',title:'互动'});
		} else if(data.result == 7) {
			//我在对方的黑名单中
			alert('对不起，你在对方的黑名单中，不能发起互动');
			//Alert({msg:'对不起，你在对方的黑名单中，不能发起互动',title:'互动'});
		} else if(data.result == 8) {
			//热度用户
			var showhtml	= '\
				 <style>.hot_limit_btn{display:block;width:160px;height:41px;line-height:41px;text-align:center;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -35px no-repeat;margin:10px auto;color:#7d4530 !important;font-size:14px;font-weight:bold;text-decoration: none !important;}.hot_limit_btn:hover{background-position:0 -86px;}.hot_limit_btn:active{background-position:0 -137px;}</style>\
				<div style="position: relative;height:30px;"><a style="position: absolute; top: 10px; right: 10px; font-family: 宋体; font-size: 14px; font-weight: bold; color:#999;text-decoration: none;" onclick="hidePopWin();return false;" href="javascript:void(0)">×</a></div>\
				<div style="margin:12px 18px;border-bottom:1px dashed #d1d1d1;padding-bottom:20px;" class="clear">\
					<p style="text-align:center;font-weight:bold;font-size:16px;">对不起，对方是热度用户，今天内不能再给'+data['receiver_sex']+'发短消息，请换个方式联系'+data['receiver_sex']+'</p>\
					<p style="font-size:14px;width:540px;margin:0 auto;line-height:24px;padding-top:10px;">为了防止用户被过度骚扰，当每天超过10个陌生人给'+data['receiver_sex']+'发送短消息，则变为热度用户，当天陌生人将不能给热度用户发短消息</p>\
					<p style="color:red;font-weight:bold;font-size:16px;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 0 no-repeat;padding-left:55px;margin:30px 0 15px 133px;">贵宾用户拥有直接联系热度用户特权</p>\
					<a class="hot_limit_btn" href="http://game.51.com/vip#vip" target="_blank" onclick="hidePopWin();">升级成为贵宾用户</a>\
				</div>\
				<div>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -186px no-repeat;padding-left:95px;margin-left:95px;color:#777;">热度用户，联系受限（<span style="color:#000;">贵宾用户不受此限制，可直接联系</span>）</p>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -206px no-repeat;padding-left:95px;margin-left:95px;color:#777;">非热度用户，可自由联系</p>\
				</div>\
			 ';

			if(typeof(winDiy) == 'function')
			{
				winDiy({msg:showhtml,width:630,height:350});	
			}
			else
			{
				hidePopWin(false);
				var widthval	= 640;
				var heightval	= 370;
				showhtml = '<table border="0" id="global_popup_table" class="global_popup_table" style="visibility: visible; position: relative; display: block; width: 100%; height: 100%; left: 0px; top: 0px; z-index: 2;"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:'+(widthval-20)+'px;height:'+(heightval-20)+'px;"><div class="global_dialog_content">'+showhtml+'</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table>';
				foui.dialog.open(showhtml,{overlay:true,draggable:true,width:widthval,height:heightval});
			}
			/*
			if(source!='home'){
				var html  = '<div style="padding:20px 20px 0;">';
					html += '<h2 style="text-align:center;font-size:14px;"><span>'+receiver_nickname+'</span>&nbsp;目前是热度用户，因此你今天不能给Ta发短消息。</h2>';
					html += '<div style="padding-top:30px;">';
					html += '<p>为何要用热度限制？<span style="color:#f98802;">（诚请认真查看以下文字）</span></p>';
					html += '<p style="margin-top:15px;">　　为保证每个人都会受到关注，我们强制限制那些受到过多关注的用户。当一个人在24小时内收到十个人以上的联系请求，系统就将其设为热度用户，此时我们建议您与其他热度低的用户进行联系，那是没有任何限制且回复率更高。</p>';
					html += '<p>　　1、有了限制后，对方收到的消息将有限，您发送的消息才不会淹没在大量的消息里，她更能用心阅读，从而提升你与她交友的成功性。</p>';
					html += '<p id="tryst_hot_reason_1" style="margin-top:15px;"><a href="javascript:void(0)" onclick="$(\'#tryst_hot_reason_1\').hide();$(\'#tryst_hot_reason_2\').show();$(this).parents(\'.fo_dlg\').height(400);$(\'#global_popup,#global_popup_content\').height(400);" style="color:#909090;"><u>更详细原因</u></a></p>';
					html += '<p id="tryst_hot_reason_2" style="display:none;">　　2、交友网站现象：少部份照片好看的用户，受到热烈关注，而大多数照片普通的用户却少有人理睬。其实照片好看的用户不一定就都好。反之，照片(形象)普通的用户，往往有许多优秀之处。比如一个相貌平平的女生，可能有开朗的笑容、做一手好菜等等。在压力与浮躁的社会，一个哪怕相貌平平却善良单纯到可以感化你心灵的女孩，应是你不悔的选择。人生本是一个追求幸福快乐的过程，并不是只有和长得好或是有钱的人在一起才快乐。</p>';
					html += '</div>';
					html += '</div>';
					html += '<div style="text-align:center;padding:20px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="知道了" class="g_btn" onclick="hidePopWin();"></span></div>';

				winOpen({msg:html,width:560,height:350});
			}else{
				pub_home_statistic('11|26',1);

				var tmpnickname	= data['receiver_nickname'];
				if(tmpnickname.length > 6)
				{
					tmpnickname	= tmpnickname.substr(0, 6);
					tmpnickname += '..';
				}
				//弹层
				var showhtml	= '\
					<div style="padding:20px 20px 0;">\
						<h2 style="text-align:center;font-size:14px;">对不起，对方是热度用户，今天内不能再给'+data['receiver_sex']+'发短消息，请换个方式联系'+data['receiver_sex']+'</h2>\
						<div style="padding-top:20px;font-family:\'宋体\';">\
							<p style="color:#818181;">为了防止用户被过度骚扰，当每天超过10个陌生人给'+data['receiver_sex']+'发送短消息，则变为热度用户，当天陌生人将不能给热度用户发短消息</p>\
							<p style="margin-top:25px;"><strong>我可以怎么联系'+data['receiver_sex']+'？</strong></p>\
							<p style="margin-top:10px;line-height:2;">\
								&middot;&nbsp;您可以去给'+data['receiver_sex']+'留言说上几句，'+data['receiver_sex']+'一样可以在第一时间收到您的消息&nbsp;&nbsp;<a href="javascript:void(0)" onclick="pub_loveinfo_sendmsg_div(\''+data['_receiver']+'\');return false;">去给'+data['receiver_sex']+'留言&gt;&gt;</a><br />\
								&middot;&nbsp;您可以去看看'+data['receiver_sex']+'相册，记得对'+data['receiver_sex']+'的照片用心评价一下，'+data['receiver_sex']+'就会更愿意回复你哦&nbsp;&nbsp;<a href="http://home.51.com/?u='+data['_receiver']+'&c=photo&_sid=loveinfohot" target="_blank">去看'+data['receiver_sex']+'相册&gt;&gt;</a><br />\
							</p>\
						</div>\
						<div style="text-align:center;padding:20px 0 0;line-height:30px">\
							<span class="g_btn_w"><input type="button" value="知道了" class="g_btn" onclick="hidePopWin();"></span>\
						</div>\
					</div>\
				';

				if(typeof(winDiy) == 'function')
				{
					winDiy({msg:showhtml,width:560,height:270});	
				}
				else
				{
					hidePopWin(false);
					var widthval	= 570;
					var heightval	= 290;
					showhtml = '<table border="0" id="global_popup_table" class="global_popup_table" style="visibility: visible; position: relative; display: block; width: 100%; height: 100%; left: 0px; top: 0px; z-index: 2;"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:'+(widthval-20)+'px;height:'+(heightval-20)+'px;"><div class="global_dialog_content">'+showhtml+'</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table>';
					foui.dialog.open(showhtml,{overlay:true,draggable:true,width:widthval,height:heightval});
				}
			}
			*/
		} else if(data.result == 9) {
			if(source!='home'){
				alert(data.desc);
				//Alert({msg:data.desc,title:'互动'});
			}else{
				pub_home_statistic('11|27',1);

				var tmpnickname	= data['receiver_nickname'];
				if(tmpnickname.length > 6)
				{
					tmpnickname	= tmpnickname.substr(0, 6);
					tmpnickname += '..';
				}
				//弹层
				var showhtml	= '\
					<div style="padding:20px 20px 0;">\
						<h2 style="text-align:center;font-size:14px;">对不起，您当前等级每天只能和'+data['limitnum']+'个陌生人发起互动（发短消息、打招呼、约'+data['receiver_sex']+'、邀请）</h2>\
						<div style="padding-top:20px;font-family:\'宋体\';">\
							<p style="margin-top:25px;"><strong>我还想认识新朋友怎么办？</strong></p>\
							<p style="margin-top:10px;line-height:2;">\
								&middot;&nbsp;您可以去给'+data['receiver_sex']+'留言说上几句，'+data['receiver_sex']+'一样可以在第一时间收到您的消息&nbsp;&nbsp;<a href="javascript:void(0)" onclick="pub_loveinfo_sendmsg_div(\''+data['_receiver']+'\');return false;">去给'+data['receiver_sex']+'留言&gt;&gt;</a><br />\
								&middot;&nbsp;您可以去看看'+data['receiver_sex']+'相册，记得对'+data['receiver_sex']+'的照片用心评价一下，'+data['receiver_sex']+'就会更愿意回复你哦&nbsp;&nbsp;<a href="http://home.51.com/?u='+data['_receiver']+'&c=photo&_sid=loveinfoout" target="_blank">去看'+data['receiver_sex']+'相册&gt;&gt;</a><br />\
								&middot;&nbsp;您可以去看看'+data['receiver_sex']+'的说说，认真回复'+data['receiver_sex']+'的说说，会更容易有话题聊起来哦&nbsp;&nbsp;<a href="http://home.51.com/?u='+data['_receiver']+'&c=miniblog&_sid=loveinfoout" target="_blank">去看'+data['receiver_sex']+'说说&gt;&gt;</a><br />\
							</p>\
						</div>\
						<div style="text-align:center;padding:20px 0 0;line-height:30px">\
							<span class="g_btn_w"><input type="button" value="知道了" class="g_btn" onclick="hidePopWin();"></span>\
						</div>\
					</div>\
				';

				if(typeof(winDiy) == 'function')
				{
					winDiy({msg:showhtml,width:630,height:260});	
				}
				else
				{
					hidePopWin(false);
					var widthval	= 650;
					var heightval	= 280;
					showhtml = '<table border="0" id="global_popup_table" class="global_popup_table" style="visibility: visible; position: relative; display: block; width: 100%; height: 100%; left: 0px; top: 0px; z-index: 2;"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:'+(widthval-20)+'px;height:'+(heightval-20)+'px;"><div class="global_dialog_content">'+showhtml+'</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table>';
					foui.dialog.open(showhtml,{overlay:true,draggable:true,width:widthval,height:heightval});
				}			
			}
		} else if(data.result == 10) {
			alert('抱歉，你的账号已被系统锁定\r\n如有疑问，请联系客服：0515-88115151');
			//Alert({msg:'抱歉，你的账号已被系统锁定\r\n如有疑问，请联系客服：0515-88115151',title:'互动'});
		} else if(data.result == 12) {
			//禁言
			var html  = '<div style="padding:20px 20px 0;">';
				html += '<p style="margin-top:15px;">　　对不起，您的账号已经被禁言，不能打招呼、发消息、评论、留言等。如有疑问，请联系客服：0515-88115151。</p>';
				html += '</div>';
				html += '<div style="text-align:center;padding:20px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="确定" class="g_btn" onclick="hidePopWin();"></span></div>';
			winOpen({msg:html,width:400,height:180,title:'互动'});
		} else if(data.result == 13) {
				//弹层
			var showhtml	= '\
				<style>.hot_limit_btn{display:block;width:160px;height:41px;line-height:41px;text-align:center;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -35px no-repeat;margin:10px auto;color:#7d4530 !important;font-size:14px;font-weight:bold;text-decoration: none !important;}.hot_limit_btn:hover{background-position:0 -86px;}.hot_limit_btn:active{background-position:0 -137px;}</style>\
				<div style="position: relative;height:30px;"><a style="position: absolute; top: 10px; right: 10px; font-family: 宋体; font-size: 14px; font-weight: bold; color:#999;text-decoration: none;" onclick="hidePopWin();return false;" href="javascript:void(0)">×</a></div>\
				<div style="margin:12px 18px;border-bottom:1px dashed #d1d1d1;" class="clear">\
					<p style="text-align:center;font-weight:bold;font-size:16px;">对方目前是热度用户，普通用户将限制联系'+data['receiver_sex']+'</p>\
					<p style="color:red;font-weight:bold;font-size:16px;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 0 no-repeat;padding-left:55px;margin:30px 0 0 44px;">您是贵宾用户，拥有特权，可不受限制联系热度用户</p>\
					<p style="font-size:16px;font-weight:bold;text-align:center;margin:20px 0 30px;" href=""><a style="color:#0092e6;border-bottom:1px solid #0092e6;text-decoration:none;" href="javascript:void(0)" onclick="hidePopWin();return false;">好的，我知道了</a></p>\
				</div>\
				<div>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -185px no-repeat;padding-left:95px;margin-left:95px;color:#777;">热度用户，联系受限（<span style="color:#000;">贵宾用户不受此限制，可直接联系</span>）</p>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -206px no-repeat;padding-left:95px;margin-left:95px;color:#777;">非热度用户，可自由联系</p>\
				</div>\
			';

			if(typeof(winDiy) == 'function')
			{
				winDiy({msg:showhtml,width:560,height:260});
			}
			else
			{
				hidePopWin(false);
				var widthval	= 560;
				var heightval	= 260;
				showhtml = '<table border="0" id="global_popup_table" class="global_popup_table" style="visibility: visible; position: relative; display: block; width: 100%; height: 100%; left: 0px; top: 0px; z-index: 2;"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:'+(widthval-20)+'px;height:'+(heightval-20)+'px;"><div class="global_dialog_content">'+showhtml+'</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table>';
				foui.dialog.open(showhtml,{overlay:true,draggable:true,width:widthval,height:heightval});
			}	
		}else {
			alert('发送失败！');
			//Alert({msg:'发送失败！',title:'互动'});
		}
	});
	//hidePopWin(false);
	
}

function global_hello_show_tip(info){
	var con  = '<div style="padding:20px;clear:both;" class="clear">';
	con += '<table border="0" id="global_popup_table" class="global_popup_table">';
	con += '<tbody>';
	con += '<tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr>';
	con += '<tr>';
	con += '<td class="pop_border"></td>';
	con += '<td valign="top" class="global_popup_content" id="global_popup_content" style="width:220px; height:85px;">';
	con += '<div class="global_dialog_content">';
	con += '<div style="text-align:center;font-size:14px;line-height:24px;margin:25px 5px 0;"><img src="http://static.51img1.com/v5/my/images/icon_ok.gif">&nbsp;&nbsp;'+info+'</div>';
	con += '</div>';
	con += '</td>';
	con += '<td class="pop_border"></td>';
	con += '</tr>';
	con += '<tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr>';
	con += '</tbody>';
	con += '</table>';
	con += '</div>';
	
	if(typeof(winDiy) == 'function'){
		con = '<div style="text-align:center;font-size:14px;line-height:24px;margin:25px 5px;"><img src="http://static.51img1.com/v5/my/images/icon_ok.gif">&nbsp;&nbsp;'+info+'</div>';
		winDiy({msg:con,width:220,height:80});
		//$_Global_Mask.show();
		setTimeout("hidePopWin(false);$_Global_Mask.hide();",2000);			
	}else foui.dialog.open(con,{overlay:true,draggable:true,width:220,closeTimeout:2000});
}