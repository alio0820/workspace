(function($){
	window.isIE6=$.browser.msie && jQuery.browser.version==6.0;
	jQuery.extend({
		ajaxFormNums:0,
		ajaxFormPost:function(sURL, datas, callBack,domains){/*[sURL=�ύ��ַ, datas=Ҫ�ύ�����ݶ���, callBack=�ص�,domain=��]*/
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
 * ȫվ��עjs�ӿ�
 * @param	string	f		Ҫ��ע���ڲ��˺���
 * @param	string	options  ��ѡ����
 * @param	string	callBack  ��ѡ�ص�����,��defaultΪĬ�ϵ�������ʾ��������ʾ
 */
var ajax_portal = 'http://friend.51.com/friend/global_deal_friend_ajax.php?callback=?';
var ajax_portal_follow = 'http://friend.51.com/friend/add_follow_api.php?callback=?';

var scoreComment = {

    '2':[

        ['w1','�ڼ�Ů��','�ڼ�Ů����','font_w0'],

        ['w2','�ŵ���','�ŵ���������ʺ��Ĺ�װ���������','font_w0'],

        ['w3','��������','�������ã��㳤�ĺÿɰ�����','font_w0'],

        ['w4','��Ů','��Ůһ����ϲ�����İ�','font_w1'],

        ['w5','Ƥ���ð�','Ƥ���ðװ�����������ô����','font_w1'],

        ['w6','�Ը�','��Ƭ���Ը��أ�ϲ���˶���','font_w1'],

        ['w7','�̲�����','��˵�е��̲����ã�','font_w2'],

        ['w8','������ʶ','������ʶ��������������','font_w2'],

        ['w9','�Թ�Ů','�Թ�Ů���㻹����ѧ��','font_w2'],

        ['w10','ʱ�е�Ů��','��ʱ�е�Ů������','font_w3'],

        ['w11','����','�ۣ����ޣ���Ƭ�����Լ���','font_w3'],

        ['w12','�۾���Ư��','�۾���Ư��Ŷ���ܶഫ���������Ƭ��','font_w3'],

        ['w13','���Ӻ��Ը�','��û����˵����Ĳ��Ӻ��ԸУ�','font_w4'],   

        ['w14','��ܰ�ЦŶ��','��Ů����ܰ�ЦŶ��','font_w4'],

        ['w15','�����','��Ƭ�е�����Ŷ������������Ƭ��','font_w4'],

        ['w16','����Ů','����Ů��������','font_w5'],

        ['w17','˧����Ů��','��˧����Ů����','font_w5'],

        ['w18','���Ů��','���Ů�������ϲ��������','font_w5'],   

        ['w19','������ý�С','�㳤�ú�����ý�С����ô����һ����̨�����أ�','font_w6'],

        ['w20','Ұ��','��Ұ�Ե����ӣ��Ը�Ҳ��������','font_w6'],

        ['w21','С������Ů','�е�С������Ů�ĸо�����ƽʱһ���ܰ�����ɣ�','font_w6'],

        ['w22','�������Ů','���������Ů������ʵ��������������ĸ��','font_w7'],

        ['w23','С����','�����ˣ�����ȥ���Ǹ�С����','font_w7'],       

        ['w24','������','��Ů����������ʰ���ƽʱ��ϲ����ʲô�أ�','font_w7'],

        ['w25','������Ů','���úøɾ�����һ���ܶ��˿�����������Ů�ɣ�','font_w8'],

        ['w26','��ĺ�ħ��','�����ĺ�ħ����ģ����','font_w8'],

        ['w27','�Ǹе�Ů��','�ùǸе�Ů������һֱ������','font_w8'],

        ['w28','��ѩŮ��','�㶼��Ц�����ѵ��Ǳ�ѩŮ����','font_w9'],       

        ['w29','Ц�ú����ĺ���ů','Ц�ú����ĺ���ů�����ǿ�����ʶ����','font_w9'],

        ['w30','����Ů','����Ů��������Ҳһֱ��ô������','font_w9'],

        ['w31','great haircut','that\��s a great haircut.','font_w10'],

        ['w32','first time','come here first time?','font_w10'],

        ['w33','sweet smile','sweet smile.','font_w10'],   

        ['w34','So charming','you look So charming.','font_w11'],

        ['w35','sexy lips!','sexy lips','font_w11'],

        ['w36','flipped',')   flipped: )','font_w11'],

        ['w37','have a boyfriend?','Do you have a boyfriend','font_w12'],

        ['w38','nick��s friend?','Are you nick��s friend?','font_w12'],  

        ['w39','meet once?','Did we meet once','font_w12'],

        ['w40','Great photo','Great photo.','font_w13']

    ],

    '1':[

        ['m1','���Ű���ġ�����ɮ','��һ���Ǵ�˵�����Ű���ġ�����ɮ��','font_w0'],

        ['m2','�ǻ�','������ϼ��ŵ����ǻ۰ɣ�','font_w0'],

        ['m3','��������','�����������Ȼ�ܳ�����Ů�˶���Ľ���ʺޣ�','font_w0'],

        ['m4','��������','�����ֹ������ӵĸо�������ĳ�������������','font_w1'],

        ['m5','��������','�ۣ��������У�����Ի�Ů���ţ�','font_w1'],

        ['m6','��̫��','�㿴��ȥ����21�����º����˵�һ���Ļ�̫�ǣ�','font_w1'],

        ['m7','����','һ�����������ʱ�м�˵ĳ��У�','font_w2'],

        ['m8','����С����','����Ŀ��ȳ�չ����𱬵�����С���ӣ�','font_w2'],

        ['m9','������','�����ͣ���ȥ������','font_w2'],

        ['m10','����Ϭ��','����Ϭ��������Ǵ�˵�еġ����磡','font_w3'],

        ['m11','����լ��','�ܹԵ����˲����Ŷ��Ī����������լ�У�','font_w3'],

        ['m12','�ڿ��۾���','�ڿ��۾��У���Ϊ��װ˧��������Ӱ���','font_w3'],

        ['m13','��ã��','�������ÿն�����Ī������ã�ܣ�','font_w4'],

        ['m14','���ӷ���','�㿴��ȥ����˧���������ӷ����ģ�','font_w4'],

        ['m15','��װ��ͦ','��װ��ͦ�������Ǽ������ɣ�','font_w4'],

        ['m16','�˶�����','ò�ƺܰ��˶����������˶�������','font_w5'],

        ['m17','��ү��','�о����Ǹ���ү���ţ�','font_w5'],

        ['m18','����Ǳ��','����Ƭ�￴���о������Ǳ��Ŷ��','font_w5'],

        ['m19','����ѧ��','����ȥ�ܹԵ����ӣ�������ѧ����','font_w6'],

        ['m20','������','��Ī���ǵ�ʮһ������&mdash;&mdash;�����У�','font_w6'],

        ['m21','��������','�����������ӣ���������������','font_w6'],

        ['m22','��Ʒ������','���ǲ��Ǵ�˵�еļ�Ʒ�����ˣ�','font_w7'],

        ['m23','����','����ȥ�ܳ����ţ�һ����ҵ�гɰɣ�','font_w7'],

        ['m24','������¶','���������ǿ�󣬸�����һ�ְ�����¶�ĸо���','font_w7'],

        ['m25','������','����ȥЦ�úܼ�Ӵ�������ǻ����˰ɣ�','font_w8'],

        ['m26','����ǿ��','����ȥ�����𣿿���ȥ������ǿ���أ�','font_w8'],

        ['m27','��ʵ����','������Ƭ����ʵ���ֵ����ӣ�����Ҳ��������','font_w8'],

        ['m28','�ĺ�����','�㿴��ȥ��ĺ��ĺ����ˣ���ʵ�������أ�','font_w9'],

        ['m29','��ʿ','�����ŵ����ӣ���ƽʱһ������ʿ�ɣ�','font_w9']   

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
        //if(lastUser ==null || lastUser==''){alert('�����쳣����ˢ��ҳ��');return;}
		msg.push('<table border="0" id="global_popup_table" class="global_popup_table" style="visibility: visible; position: relative; display: block; width: 100%; height: 100%; left: 0px; top: 0px; z-index: 2;"><tbody>');
		msg.push('<tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr>');
		msg.push('<tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width: 560px; height: 280px;">');
		msg.push('<div class="global_dialog_content">');
		msg_content.push('<a href="javascript:void(0);" onclick="hidePopWin(false);" class="close" style="display:block;position:absolute;top:10px;right:10px;background: url(http://static.51img1.com/v5/global/public/images/layer/close.gif) no-repeat;height: 10px;width: 10px;">&nbsp;</a>');
		msg_content.push('<div class="pop_appraise" style="padding-bottom:20px;">');
		msg_content.push('<div class="word_box" style="margin-top:0;">');
		msg_content.push('<p style="padding:5px 10px;font-weight:bold;font-size:15px;"><img src="http://static.51img1.com/v5/my/images/icon_ok.gif">&nbsp;��ע�ղسɹ���˳���TA����к��ɣ�</p>');
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
		msg_content.push('<p>��Ҫ�Լ���TAд��<span style="position:absolute;right:92px;top:32px;" id="hello_tip">����������<strong style="color:#E97414;">30</strong>��</span></p>');
		msg_content.push('<p style="margin-top:3px;"><span class="public_input" style="border:1px solid #bcbcbc;"><input id="hello_content" type="text" style="width:430px;outline:none;" class="t" onclick="clear_text(this,1);" onblur="clear_text(this,0);" onkeyup="hello_check(event)"/></span>&nbsp;<a href="javascript:void(0);" onclick="do_send_hello(\''+f+'\', \''+token+'\', \''+time+'\', \''+from+'\', \''+callBack+'\', \''+param+'\', '+callafterok+');return false;" class="a_g_btn" style="color: #FFFFFF;text-decoration: none;"><span style="border:1px solid #4A6E9A;border-top:1px solid #CDDDF2;border-left:1px solid #CDDDF2;display: inline-block; height: 30px; line-height: 30px;padding: 0 15px;">�� ��</span></a></p>');
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
				var sex = data.sex=='����'?'1':'2';
				helloAssessaPanel({f:f,sex:sex,token:token,time:time,from:options.from,callBack:callBack,param:param,callafterok:options.callafterok});
			}
		}else if(status == '0') {
			if(errorno=='1001') top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);
			else show_request_info({info:info,title:'��ʾ',width:'340',height:'140'});
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
				var sex = data.sex=='����'?'1':'2';
				helloAssessaPanel({f:f,sex:sex,token:token,time:time,from:options.from,callBack:callBack,param:param,callafterok:options.callafterok});
			}
		}else if(status == '0') {
			if(errorno=='1001') top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);
			else show_request_info({info:info,title:'��ʾ',width:'340',height:'140'});
		}
		
	});
}

function show_request_info(obj){
	var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 10px;">'+obj.info+'</div>';
	msg += '<div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="button" onclick="hidePopWin(false);';
	if(typeof obj.callafterok != 'undefined' && typeof obj.callBack != 'undefined' && obj.callafterok) msg += obj.callBack+'('+obj.param+')';
	msg += '" class="g_btn" value="ȷ��"></span></div>';
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
		var msg = '<div style="padding:30px 30px 0;"><p style="text-align:center;font-size:14px;"><img src="http://pic.51img1.com/v3/home/new_loveinfo/images/ok.jpg" style="margin:0 5px 0 0;vertical-align: middle;"/><strong>��ע�ղسɹ���<a href="http://friend.51.com/friend/follow.list.php" onclick="hidePopWin(false);" style="color:#1a4dc1;" target="_blank"><u>������鿴�ҵĹ�ע�ղ�</u></a></strong></p></div>';
		msg += '<div style="text-align:center;padding:30px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="�ر�" class="g_btn" onclick="hidePopWin(false);"></span></div>';
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
			con += '<div style="padding:30px 30px 0;"><p style="text-align:center;font-size:14px;"><img src="http://pic.51img1.com/v3/home/new_loveinfo/images/ok.jpg" style="margin:0 5px 0 0;vertical-align: middle;"/><strong>��ע�ղسɹ���<a href="http://friend.51.com/friend/follow.list.php" onclick="hidePopWin(false);';
			if(callafterok) con += callBack+'('+param+')';
			con += '" style="color:#1a4dc1;" '+openwin+'><u>������鿴�ҵĹ�ע�ղ�</u></a></strong></p></div>';
		}else{
			con += '<div style="padding:30px 30px 0;"><p style="text-align:center;font-size:14px;"><img src="http://pic.51img1.com/v3/home/new_loveinfo/images/ok.jpg" style="margin:0 5px 0 0;vertical-align: middle;"/><strong>�����ղسɹ������û�����֪������ע�ղ���'+(sex=='����'?'��':'��')+'��<br/><a href="http://friend.51.com/friend/follow.list.php" onclick="hidePopWin(false);';
			if(callafterok) con += callBack+'('+param+')';
			con += '" style="color:#1a4dc1;" '+openwin+'><u>������鿴�ҵĹ�ע�ղ�</u></a></strong></p></div>';
		}
		con += '<div style="text-align:center;padding:30px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="�ر�" class="g_btn" onclick="hidePopWin(false);';
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
	if(lass >= 0) $('#hello_tip').html('����������<strong style="color:#E97414;">'+lass+'</strong>��');
	else $('#hello_tip').html('<font color="#E37D75">�ѳ���</font><strong style="color:#E97414;">'+Math.abs(lass)+'</strong><font color="#E37D75">��</font>');

	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		refuse_relation_up(f_uid);
	}
}

function do_send_hello(friend, token, time, from, callBack, param, callafterok){
	var hello = $("#hello_content").val().replace(/(^\s*)|(\s*$)/g,"");
	if(hello.length == 0){
		$('#error_tip').html('��ʾ���㻹δ��������');
		return false;
	}
	if(hello.length > 30) return false;
	
	var param_hello = {friend:friend, hello:hello, token:token, time:time, from:from};
	$.ajaxFormPost("http://friend.51.com/friend/add_follow_hello_api.php",param_hello, function(result){
		if(result==-2){
			$('#error_tip').html('��ʾ���㷢�͵����ݺ������дʻ�');
			return false;	
		}else if(result==12){
			hidePopWin(false);
			var info = '�Բ��������ʺ��Ѿ������ԣ����ܴ��к�������Ϣ�����ۡ����Եȡ��������ʣ�����ϵ�ͷ���0515-88115151';
			//show_request_info(info,'��ʾ','320','160');
			show_request_info({info:info,title:'��ʾ',width:'320',height:'160',callBack:callBack, param:param, callafterok:callafterok});
		}else{
			hidePopWin(false);
			show_tip_hello('�к����ͳɹ�',from);
			if(callafterok && callBack!='') eval(callBack+'('+param+')');
		} 	
			//hidePopWin(false);
			//var msg = '�к�����ʧ��';
			//show_request_info(msg,'���к�');
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
	var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 0 20px;"><i style="-moz-inline-stack;display:inline-block;background:url(http://static.51img1.com/v5/my/images/icon_friends.gif) 0 -139px no-repeat;width:15px;height:15px;position:relative;*top:-3px;margin-right:3px;"></i>�Ƿ�ȡ����<font color="#EB6100">'+nick+'</font>�Ĺ�ע�ղأ�</div><div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="submit" id="" class="g_btn" value="ȷ��" onclick="do_cancel_follow(\'' + f + '\', \'' + fid + '\', \''+ callBack +'\', '+ param +');"></span><span class="g_btn_w_gray"><input type="button" class="g_btn_gray" value="ȡ��"  onclick="hidePopWin(false);"></span></div>';
	
	winOpen({'msg':msg,width:300,height:120,title:'ȡ����ע�ղ�'});
}

function do_cancel_follow(f, fid, callBack, param){
	hidePopWin(false);
	$.getJSON(ajax_portal, {opt: 'del_friend', friend: f, friendid: fid}, function(data) {
		if (data == 1) {
			if($.isFunction(callBack)) callBack(param);
			else if(callBack!='') eval(callBack+'(\''+param+'\')');
		} else if (data == -1) {
			alert('ϵͳ��æ,���Ժ�����!');
		} else if (data == -2) {
			alert('���Ѿ���Ta�����˺�����!');
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
	var msg = '<div style="text-align:center;line-height:18px;padding:20px 5px 10px;"><img src="http://static.51img1.com/v5/global/public/images/tip_sigh.gif" style="margin-right:5px;">��ȷ��Ҫ��<font color="#EB6100">'+nick+'</font>�û�����������</div><div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="submit" id="" class="g_btn" value="ȷ��" onclick="do_friend_add_black(\'' + f + '\', \'' + fid + '\', \''+ callBack +'\', '+ param +');"></span><span class="g_btn_w_gray"><input type="button" class="g_btn_gray" value="ȡ��" onclick="hidePopWin(false);"></span></div>';

	winOpen({'msg':msg,width:310,height:120,title:'�Ӻ�����'});
}

function do_friend_add_black(f, fid, callBack, param){
	hidePopWin(false);
	$.getJSON(ajax_portal, {opt: 'add_black', friend: f, friendid: fid}, function(data) {
		if (data == 1) {
			if(callBack!='reflush'){
				if($.isFunction(callBack)) callBack(param);
				else if(callBack!='') eval(callBack+'(\''+param+'\')');
				//alert('�����ɹ���');
				var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 10px;">�����ɹ���</div>';
				msg += '<div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="button" onclick="hidePopWin(false);" class="g_btn" value="ȷ��"></span></div>';
				winOpen({'msg':msg,width:200,height:120,title:'�Ӻ�����'});
			}else{
				//alert('�����ɹ���');
				var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 10px;">�����ɹ���</div>';
				msg += '<div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="button" onclick="hidePopWin(false);reflush();" class="g_btn" value="ȷ��"></span></div>';
				winOpen({'msg':msg,width:200,height:120,title:'�Ӻ�����'});		
			}			
		} else if (data == -1) {
			alert('ϵͳ��æ,���Ժ�����!');
		}
	});
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////���ֽܷ���
/**
 * ȫվ���к�js�ӿ�
 * @param	string	receiver ���к�������ڲ��˺���
 * @param	string	source  ��ѡ������Դ
 */
var errorpic_man_80 = 'http://static.51img1.com/v3/themes/skins/images/none_80.gif';
var errorpic_woman_80 = 'http://static.51img1.com/v3/themes/skins/images/none_women_80.gif';
var hello_girl = [[['�Ҳ�һ���кܶ�����׷��ɣ�',0],['��������ܼ��������ı�������',0],['������������˳���һģһ����',0],['��Ц����ĺ��������ڼ�����һ��~',0],['�����λ��Ů����������ϱ��ӵ�ծ���ɣ�������ծ�ˣ�',0],['���㳤�࣬������ô���տ϶���ø߷֣�',1],['���Ŵ����û������Ư��ѽ����ȥ��һ�Űɣ�',2]],[['��ϲ��ʲô�����������أ�',0],['�㳤�ú����ۣ�����������ͺã�',0],['�㿴��ȥ��ͺ�С������ѧ���ɣ�',0],['��ã��㳤�ĺ����ҵ���һ��Ů��',0],['�ŵ�������û����˵������ʺ��Ĺ�װ�磿',0],['�þ�û����������������ױҲƯ����������Ů�ˣ�',0]],[['��Ů����ܰ�ЦŶ��',0],['�������������ร��ǲ����ݹ�Ϸ��',0],['�������������������ǲ��Ǹ�Ůǿ�ˣ�',0],['�㿴��ȥ���ͻݣ��ǲ��Ǻ��ó�����ѽ��',0],['�㿴��ȥ��ǿ�ƣ��ǲ��Ǻܶ�����������ѽ��',0],['С������Ů�ĸо�����ƽʱһ���ܰ�����ɣ�',0]]]
var hello_boy = [[['��������ǿ��ร�������¶��',0],['����˸о����ر𣬺�����ʶ�£�',0],['�����������ӣ���������������',0],['�㿴��ȥ�ó��죬һ����ҵ�гɰɣ�',0],['�������������ʶ�ĸо������������������',0],['���㳤�࣬������ô���տ϶���ø߷֣�',1],['���Ŵ����û������Ư��ѽ����ȥ��һ�Űɣ�',2]],[['������Ƭ���࣬�ഫ����Ƭ�',0],['�㲻�ڽ�������������˭�Ĵ�˵��',0],['�㳤�ú����У��ǲ�����Ե�ر�ã�',0],['�۾��У�������ӻ���ˣ˧ѽ������',0],['�ۣ����У�Ů��վ�����ѹ��һ���ܴ�~',0],['���ǲ��Ǿ�����������ȥ���Ǻ�ǿ���أ�',0]],[['��ϲ�������𣿶���˭�ĸ��أ�',0],['��Ц�úü�ร������Ǹ������˰ɣ�',0],['�㿴��ȥ�����⣬�ǲ��Ǿ����˶�ѽ��',0],['�����ŵ����ӣ���ƽʱһ���Ǹ���ʿ�ɣ�',0],['�Ҳ����Ǹ�լ�У����ٳ��ŵ����֣��Բ��ԣ�',0],['�Ҿ��ðɣ��㲻ȥ����ż������������ǿ�ϧ��',0]]];
var hello_visitor = [['��ӭ�����ҵĸ��˿ռ䣬ϣ�������ܹ���Ϊ���ѣ�',0],['��л������ã��һ�طõ�Ŷ~',0],['��ôֻ���������˰�����ϲ���ҵĿռ���',0],['������Ե��������ʶһ����',0],['�ף����ǽ����һ�������ҿռ��Ŷ��',0],['���Ƶ�������ҿռ䣬��ô����ע���أ����ע��',0]];
var hello_score = [['��л��Ĵ�֣���Ҳ������ֵġ�',0],['��~��ô�ߵķ֣���л��Ŷ~',0],['��û�����ô����ѽ���Ͻ����ðɣ���Ҳ�����֡�',0],['��ô���׼���ô�͵ķ֣�Ƿ��Ǯ������',0],['�����������Ү~��ʮ�֡�лл�㡣',0],['�ף�лл����Ҵ�ķ�Ŷ~',0]]; 
var hello_flower = [['лл���С�컨��',0],['�Ҳ������滨��...',0],['С�컨�Ƕ������Ĺ�����лл�㡣',0],['��Ҳ��ϲ������˵˵�ǲ��ǣ�',0],['�ҵ�С�컨����̫���ˣ�ɣ�ģ���ο��',0],['��ô��С�컨���濪�ģ�',0]];
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
				//Alert({msg:data.desc,title:'����'});
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
			if(receiver_sex == '��'){
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
				if(receiver_sex == '��'){
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
				msg += '<div style="padding:5px 0;"><a style="color:#0068b7;" href="javascript:void(0)" onclick="change_word(\''+receiver+'\',\''+receiver_sex+'\',\''+receiver_has_scorephoto+'\');return false;"><img style="padding-right:10px;" src="http://static.51img1.com/v5/jiaoyou/images/icon_loaders_0.gif">��һЩ���к��Ļ�</a></div>';
				msg += '</div></div>';
				msg += '<div style="text-align:center;line-height:30px"><span class="g_btn_w"><input type="button" value="����" class="g_btn" onclick="send_hello(\''+receiver+'\',\''+receiver_nickname+'\',\''+source+'\',\''+token+'\',\''+time+'\');return false;"></span><span style="padding:0 10px;">��</span><a style="color:#0068b7;" href="javascript:;" onclick="hidePopWin(false);return false;">�ر�</a></div>';
				msg += '</div>';

			var title = '��<span style="color:#ff8b1b;padding:0 5px;">'+receiver_nickname+'</span>����к�';
			winOpen({'msg':msg,width:475,height:370,'title':title});
	    }
	});
}

function change_word(receiver,receiver_sex,receiver_has_scorephoto){
	if(word_index<total_index) word_index++;
	else word_index=0;
	if(receiver_sex == '��'){
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

//�����к�
function send_hello(receiver, receiver_nickname, source, token, time) {
	var content = $("input[name='think_val']:checked").val();
	if(typeof content == "undefined") {
		alert("��ѡ���к���䣡");
		return false;
	}
	hidePopWin(false);
	var param_hello = {act:'send', receiver:receiver, content:content, source:source, token:token, time:time};
	$.getJSON('http://friend.51.com/friend/global_hello_api.php?callback=?',param_hello, function(data){
		if (data.result == 1) {
			//Alert('���ͳɹ�');
			global_hello_show_tip('���ͳɹ�!');
		} else if(data.result == 6) {
			//�Է����ҵĺ�������
			alert('�Բ��𣬶Է�����ĺ������У���ȡ�����ٷ���');
			//Alert({msg:'�Բ��𣬶Է�����ĺ������У���ȡ�����ٷ���',title:'����'});
		} else if(data.result == 7) {
			//���ڶԷ��ĺ�������
			alert('�Բ������ڶԷ��ĺ������У����ܷ��𻥶�');
			//Alert({msg:'�Բ������ڶԷ��ĺ������У����ܷ��𻥶�',title:'����'});
		} else if(data.result == 8) {
			//�ȶ��û�
			var showhtml	= '\
				 <style>.hot_limit_btn{display:block;width:160px;height:41px;line-height:41px;text-align:center;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -35px no-repeat;margin:10px auto;color:#7d4530 !important;font-size:14px;font-weight:bold;text-decoration: none !important;}.hot_limit_btn:hover{background-position:0 -86px;}.hot_limit_btn:active{background-position:0 -137px;}</style>\
				<div style="position: relative;height:30px;"><a style="position: absolute; top: 10px; right: 10px; font-family: ����; font-size: 14px; font-weight: bold; color:#999;text-decoration: none;" onclick="hidePopWin();return false;" href="javascript:void(0)">��</a></div>\
				<div style="margin:12px 18px;border-bottom:1px dashed #d1d1d1;padding-bottom:20px;" class="clear">\
					<p style="text-align:center;font-weight:bold;font-size:16px;">�Բ��𣬶Է����ȶ��û��������ڲ����ٸ�'+data['receiver_sex']+'������Ϣ���뻻����ʽ��ϵ'+data['receiver_sex']+'</p>\
					<p style="font-size:14px;width:540px;margin:0 auto;line-height:24px;padding-top:10px;">Ϊ�˷�ֹ�û�������ɧ�ţ���ÿ�쳬��10��İ���˸�'+data['receiver_sex']+'���Ͷ���Ϣ�����Ϊ�ȶ��û�������İ���˽����ܸ��ȶ��û�������Ϣ</p>\
					<p style="color:red;font-weight:bold;font-size:16px;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 0 no-repeat;padding-left:55px;margin:30px 0 15px 133px;">����û�ӵ��ֱ����ϵ�ȶ��û���Ȩ</p>\
					<a class="hot_limit_btn" href="http://game.51.com/vip#vip" target="_blank" onclick="hidePopWin();">������Ϊ����û�</a>\
				</div>\
				<div>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -186px no-repeat;padding-left:95px;margin-left:95px;color:#777;">�ȶ��û�����ϵ���ޣ�<span style="color:#000;">����û����ܴ����ƣ���ֱ����ϵ</span>��</p>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -206px no-repeat;padding-left:95px;margin-left:95px;color:#777;">���ȶ��û�����������ϵ</p>\
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
					html += '<h2 style="text-align:center;font-size:14px;"><span>'+receiver_nickname+'</span>&nbsp;Ŀǰ���ȶ��û����������첻�ܸ�Ta������Ϣ��</h2>';
					html += '<div style="padding-top:30px;">';
					html += '<p>Ϊ��Ҫ���ȶ����ƣ�<span style="color:#f98802;">����������鿴�������֣�</span></p>';
					html += '<p style="margin-top:15px;">����Ϊ��֤ÿ���˶����ܵ���ע������ǿ��������Щ�ܵ������ע���û�����һ������24Сʱ���յ�ʮ�������ϵ���ϵ����ϵͳ�ͽ�����Ϊ�ȶ��û�����ʱ���ǽ������������ȶȵ͵��û�������ϵ������û���κ������һظ��ʸ��ߡ�</p>';
					html += '<p>����1���������ƺ󣬶Է��յ�����Ϣ�����ޣ������͵���Ϣ�Ų�����û�ڴ�������Ϣ������������Ķ����Ӷ��������������ѵĳɹ��ԡ�</p>';
					html += '<p id="tryst_hot_reason_1" style="margin-top:15px;"><a href="javascript:void(0)" onclick="$(\'#tryst_hot_reason_1\').hide();$(\'#tryst_hot_reason_2\').show();$(this).parents(\'.fo_dlg\').height(400);$(\'#global_popup,#global_popup_content\').height(400);" style="color:#909090;"><u>����ϸԭ��</u></a></p>';
					html += '<p id="tryst_hot_reason_2" style="display:none;">����2��������վ�����ٲ�����Ƭ�ÿ����û����ܵ����ҹ�ע�����������Ƭ��ͨ���û�ȴ��������ǡ���ʵ��Ƭ�ÿ����û���һ���Ͷ��á���֮����Ƭ(����)��ͨ���û����������������֮��������һ����òƽƽ��Ů���������п��ʵ�Ц�ݡ���һ�ֺò˵ȵȡ���ѹ���븡�����ᣬһ��������òƽƽȴ�������������Ըл��������Ů����Ӧ���㲻�ڵ�ѡ����������һ��׷���Ҹ����ֵĹ��̣�������ֻ�кͳ��úû�����Ǯ������һ��ſ��֡�</p>';
					html += '</div>';
					html += '</div>';
					html += '<div style="text-align:center;padding:20px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="֪����" class="g_btn" onclick="hidePopWin();"></span></div>';

				winOpen({msg:html,width:560,height:350});
			}else{
				pub_home_statistic('11|26',1);

				var tmpnickname	= data['receiver_nickname'];
				if(tmpnickname.length > 6)
				{
					tmpnickname	= tmpnickname.substr(0, 6);
					tmpnickname += '..';
				}
				//����
				var showhtml	= '\
					<div style="padding:20px 20px 0;">\
						<h2 style="text-align:center;font-size:14px;">�Բ��𣬶Է����ȶ��û��������ڲ����ٸ�'+data['receiver_sex']+'������Ϣ���뻻����ʽ��ϵ'+data['receiver_sex']+'</h2>\
						<div style="padding-top:20px;font-family:\'����\';">\
							<p style="color:#818181;">Ϊ�˷�ֹ�û�������ɧ�ţ���ÿ�쳬��10��İ���˸�'+data['receiver_sex']+'���Ͷ���Ϣ�����Ϊ�ȶ��û�������İ���˽����ܸ��ȶ��û�������Ϣ</p>\
							<p style="margin-top:25px;"><strong>�ҿ�����ô��ϵ'+data['receiver_sex']+'��</strong></p>\
							<p style="margin-top:10px;line-height:2;">\
								&middot;&nbsp;������ȥ��'+data['receiver_sex']+'����˵�ϼ��䣬'+data['receiver_sex']+'һ�������ڵ�һʱ���յ�������Ϣ&nbsp;&nbsp;<a href="javascript:void(0)" onclick="pub_loveinfo_sendmsg_div(\''+data['_receiver']+'\');return false;">ȥ��'+data['receiver_sex']+'����&gt;&gt;</a><br />\
								&middot;&nbsp;������ȥ����'+data['receiver_sex']+'��ᣬ�ǵö�'+data['receiver_sex']+'����Ƭ��������һ�£�'+data['receiver_sex']+'�ͻ��Ը��ظ���Ŷ&nbsp;&nbsp;<a href="http://home.51.com/?u='+data['_receiver']+'&c=photo&_sid=loveinfohot" target="_blank">ȥ��'+data['receiver_sex']+'���&gt;&gt;</a><br />\
							</p>\
						</div>\
						<div style="text-align:center;padding:20px 0 0;line-height:30px">\
							<span class="g_btn_w"><input type="button" value="֪����" class="g_btn" onclick="hidePopWin();"></span>\
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
				//Alert({msg:data.desc,title:'����'});
			}else{
				pub_home_statistic('11|27',1);

				var tmpnickname	= data['receiver_nickname'];
				if(tmpnickname.length > 6)
				{
					tmpnickname	= tmpnickname.substr(0, 6);
					tmpnickname += '..';
				}
				//����
				var showhtml	= '\
					<div style="padding:20px 20px 0;">\
						<h2 style="text-align:center;font-size:14px;">�Բ�������ǰ�ȼ�ÿ��ֻ�ܺ�'+data['limitnum']+'��İ���˷��𻥶���������Ϣ�����к���Լ'+data['receiver_sex']+'�����룩</h2>\
						<div style="padding-top:20px;font-family:\'����\';">\
							<p style="margin-top:25px;"><strong>�һ�����ʶ��������ô�죿</strong></p>\
							<p style="margin-top:10px;line-height:2;">\
								&middot;&nbsp;������ȥ��'+data['receiver_sex']+'����˵�ϼ��䣬'+data['receiver_sex']+'һ�������ڵ�һʱ���յ�������Ϣ&nbsp;&nbsp;<a href="javascript:void(0)" onclick="pub_loveinfo_sendmsg_div(\''+data['_receiver']+'\');return false;">ȥ��'+data['receiver_sex']+'����&gt;&gt;</a><br />\
								&middot;&nbsp;������ȥ����'+data['receiver_sex']+'��ᣬ�ǵö�'+data['receiver_sex']+'����Ƭ��������һ�£�'+data['receiver_sex']+'�ͻ��Ը��ظ���Ŷ&nbsp;&nbsp;<a href="http://home.51.com/?u='+data['_receiver']+'&c=photo&_sid=loveinfoout" target="_blank">ȥ��'+data['receiver_sex']+'���&gt;&gt;</a><br />\
								&middot;&nbsp;������ȥ����'+data['receiver_sex']+'��˵˵������ظ�'+data['receiver_sex']+'��˵˵����������л���������Ŷ&nbsp;&nbsp;<a href="http://home.51.com/?u='+data['_receiver']+'&c=miniblog&_sid=loveinfoout" target="_blank">ȥ��'+data['receiver_sex']+'˵˵&gt;&gt;</a><br />\
							</p>\
						</div>\
						<div style="text-align:center;padding:20px 0 0;line-height:30px">\
							<span class="g_btn_w"><input type="button" value="֪����" class="g_btn" onclick="hidePopWin();"></span>\
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
			alert('��Ǹ������˺��ѱ�ϵͳ����\r\n�������ʣ�����ϵ�ͷ���0515-88115151');
			//Alert({msg:'��Ǹ������˺��ѱ�ϵͳ����\r\n�������ʣ�����ϵ�ͷ���0515-88115151',title:'����'});
		} else if(data.result == 12) {
			//����
			var html  = '<div style="padding:20px 20px 0;">';
				html += '<p style="margin-top:15px;">�����Բ��������˺��Ѿ������ԣ����ܴ��к�������Ϣ�����ۡ����Եȡ��������ʣ�����ϵ�ͷ���0515-88115151��</p>';
				html += '</div>';
				html += '<div style="text-align:center;padding:20px 0 0;line-height:30px"><span class="g_btn_w"><input type="button" value="ȷ��" class="g_btn" onclick="hidePopWin();"></span></div>';
			winOpen({msg:html,width:400,height:180,title:'����'});
		} else if(data.result == 13) {
				//����
			var showhtml	= '\
				<style>.hot_limit_btn{display:block;width:160px;height:41px;line-height:41px;text-align:center;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -35px no-repeat;margin:10px auto;color:#7d4530 !important;font-size:14px;font-weight:bold;text-decoration: none !important;}.hot_limit_btn:hover{background-position:0 -86px;}.hot_limit_btn:active{background-position:0 -137px;}</style>\
				<div style="position: relative;height:30px;"><a style="position: absolute; top: 10px; right: 10px; font-family: ����; font-size: 14px; font-weight: bold; color:#999;text-decoration: none;" onclick="hidePopWin();return false;" href="javascript:void(0)">��</a></div>\
				<div style="margin:12px 18px;border-bottom:1px dashed #d1d1d1;" class="clear">\
					<p style="text-align:center;font-weight:bold;font-size:16px;">�Է�Ŀǰ���ȶ��û�����ͨ�û���������ϵ'+data['receiver_sex']+'</p>\
					<p style="color:red;font-weight:bold;font-size:16px;background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 0 no-repeat;padding-left:55px;margin:30px 0 0 44px;">���ǹ���û���ӵ����Ȩ���ɲ���������ϵ�ȶ��û�</p>\
					<p style="font-size:16px;font-weight:bold;text-align:center;margin:20px 0 30px;" href=""><a style="color:#0092e6;border-bottom:1px solid #0092e6;text-decoration:none;" href="javascript:void(0)" onclick="hidePopWin();return false;">�õģ���֪����</a></p>\
				</div>\
				<div>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -185px no-repeat;padding-left:95px;margin-left:95px;color:#777;">�ȶ��û�����ϵ���ޣ�<span style="color:#000;">����û����ܴ����ƣ���ֱ����ϵ</span>��</p>\
					<p style="background:url(http://static.51img1.com/v5/my/images/hot_limit_popup.gif) 0 -206px no-repeat;padding-left:95px;margin-left:95px;color:#777;">���ȶ��û�����������ϵ</p>\
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
			alert('����ʧ�ܣ�');
			//Alert({msg:'����ʧ�ܣ�',title:'����'});
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