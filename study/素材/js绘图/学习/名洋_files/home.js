(function($){
	window.isIE6=jQuery.browser.version==6.0;
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
						callBack(frames[oIf].document.body.innerHTML);
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

//加好友
var errorpic_man_80 = 'http://static.51img1.com/v3/themes/skins/images/none_80.gif';
var errorpic_woman_80 = 'http://static.51img1.com/v3/themes/skins/images/none_women_80.gif';
function jiahaoyou(fid){
	var param='';
	if(arguments.length==2){
			param ="&source="+arguments[1];
	}
	$.getJSON("http://friend.51.com/friend/add_friend_api.php?userid="+fid+param+"&type=web&callback=?",{},function(result){
		var status = result.state;
	    var data = result.data;
	    var info = result.info;
	    if(status == 1){
	    	//var mid = result.data.mid;
	    	//var msg = '<div class="user_ask">';
			//msg += '<p class="ask_title color_green" style="font-size:16px;">加为普通好友的请求已发给对方！</p>';
			//msg += '</div>';
	    	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="确定" class="dialog_btn" onclick=\'pinjia("'+fid+'","'+f_sex+'","'+f_face2+'","'+f_nickname+'","'+mid+'")\'>', title:'加为好友', width:550, height:180});	
	    }else if(status == 2){
			//var msg = '<div class="user_ask">';	
	    	//msg += '<p class="ask_title" style="font-family: "Microsoft YaHei";font-size:16px;">今天你已经发送5次加好友请求了。</p>';
			//msg += '<p class="t_c" style="font-family: "Microsoft YaHei";font-size:12px;">你还可以给你的朋友们写写信，聊聊天。<br />常常联系，才能让你们成为真正的朋友。</p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});		
	    }else if(status == 3){
			var errorno = result.errorno;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>'+info+'</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});
			if(errorno == 1012){
				info = '不好意思，我不希望别人向我打招呼！';
				var f_sex = result.data.sex;
				var f_face2 = result.data.face2;
				var f_face2_80 = f_face2.replace("_130.", "_80.");
				if($.trim(f_face2_80)==''){
					if(f_sex == '女士'){
						f_face2_80 = errorpic_woman_80;
					}else{
						f_face2_80 = errorpic_man_80;
					}
				}
				var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:500px;"><div class="do"><div class="photo" style="width:100px;"><div class="img_box img_80"><img src="'+f_face2_80+'" /></div></div><div class="pop" style="margin:40px 0 0 20px;"><span class="arrow"></span><p>'+info+'</p></div></div><div class="btn_area" style="clear:both;padding:20px 0 10px;text-align:center;"><input type="button" class="btn g_layer_alert_btn" value="关闭"  onclick="hidePopWin(false)" ></div></div></div>';
				winOpen({'msg':msg,width:500,height:250,title:'打个招呼'});
			}else{
				show_request_info(info,'打个招呼');
			}
	    }else if(status == 4){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);
	    }else if(status == 5){
			var token = result.data.token;
			var time = result.data.time;
			var f_sex = result.data.sex;
			var f_face2 = result.data.face2;
			var f_nickname = result.data.nickname;
			//identity_verify(fid, f_sex, f_face2, f_nickname, token, time);
			do_identity_verify(fid, f_sex, f_face2, f_nickname, token, time);
	    }else if(status == 6){
			var token = result.data.token;
			var time = result.data.time;
			var questions = result.data.questions;
			var f_sex = result.data.sex;
			var f_face2 = result.data.face2;
			var f_nickname = result.data.nickname;
			question_verify(fid, f_sex, f_face2, f_nickname, token, time, questions);
	    }else if(status == 7){
			var token = result.data.token;
			var time = result.data.time;
			var question = result.data.question;
			var f_sex = result.data.sex;
			var f_face2 = result.data.face2;
			var f_nickname = result.data.nickname;
			exact_qa_verify(fid, f_sex, f_face2, f_nickname, token, time, question);
	    }else{
	    	//var msg = '<div class="user_ask">';	
	    	//msg += '<div class="user_photo"><div class="img_box img_130"><img src="'+f_face2+'" /></div></div>';
        	//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>'+info+'</strong></p>';
        	//msg += '<p class="hint">送个礼物给对方吧，现出你的与众不同！<br />对方接受后，你们就可以约会聊天了！</p></div>';
        	//Win.dialog({msg:msg, enter: "", type:'confirm', button:'<input type=button value="改送礼物" class="dialog_btn" onclick="window.open(\'http://jiaoyou.51.com/?c=gift&uid='+fid+'\'); Win.close();">&nbsp;<input type=button value="取消" class="dialog_btn_gray" onclick="Win.close()">', btnalign:'center', title:'加为好友', width:440, height:350});	
	    }
	});
}

//身份验证
function identity_verify(fid, f_sex, f_face2, f_nickname, token, time){
	var msg = '<div class="g_home_layer"><div class="dialog_answer" style="margin:20px 10px;font-size:14px;">';
	msg += '<h3 style="font-size:14px;margin-bottom:11px;">对方设置了需要输入验证信息才能加为好友。</h3><ul class="answer_info" style="border-top:1px solid #D8D8D8;padding:30px 0 0 32px;"><li style="margin-bottom:20px;">请输入验证信息：</li><li style="margin-bottom:20px;"><input type="text" id="ReqMemo" style="width:219px;height:24px;vertical-align:middle;" maxlength="20" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');"></input><p style=\'color:#FF0000;margin-left:12px;display:inline;\'><span id="ReqMemoMessageLi"></span></p></li></ul>';
	msg += '<div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_identity_verify(\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\')" value="提交" class="btn g_layer_alert_btn" type="button"><input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '</div></div>'; 
	winOpen({'msg':msg,width:400,height:300,title:'打个招呼'});
}

function do_identity_verify(fid, f_sex, f_face2, f_nickname, token, time){
	//if($("#ReqMemo").val()==''){
	//	$("#ReqMemoMessageLi").html('<font color="red">请输入内容</font>');
	//	return false;
	//}
	//if(checkForm()==false) return false;
	$.ajaxFormPost("http://friend.51.com/friend/add_friend_question_api.php", {'friendid':fid,'ReqMemo':'','token':token,'time':time}, function(result){
		if(result==-1){
			show_request_info('参数错误','打个招呼');
			//$("#ReqMemoMessageLi").html('<font color="red">参数错误</font>');
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>参数错误</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});
		}else if(result==-2){
			show_request_info('招呼发送失败，请稍后再试','打个招呼');
			//$("#ReqMemoMessageLi").html('<font color="red">请求发送失败，请重试</font>');
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>请求发送失败，请重试</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});	
		}else{
			//var mid = result.data.mid;
			var mid = result;
	    	//send_request_ok(fid, f_sex, f_face2, f_nickname, token, time, mid);
			pinjia(fid,f_sex,f_face2,f_nickname,mid,token,time);
		}
	});
}

//问答验证
var QOrder;
var Total = 1;
function question_verify(fid, f_sex, f_face2, f_nickname, token, time, questions){
	var f_face2_80 = f_face2.replace("_130.", "_80.");
	if($.trim(f_face2_80)==''){
		if(f_sex == '女士'){
			f_face2_80 = errorpic_woman_80;
		}else{
			f_face2_80 = errorpic_man_80;
		}
	}
	var arr_num =['一','两','三','四','五'];
	var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:500px;">';
	msg += '<div class="do"><div class="photo" style="width:100px;"><div class="img_box img_80"><img src="'+f_face2_80+'" /></div></div><div class="pop" style="margin:40px 0 0 20px;"><span class="arrow"></span><p>你需要回答我'+arr_num[questions.length-1]+'道题才能向我打招呼哦！</p></div></div>';
	msg += '<ul class="answer_info" style="clear:both;padding:30px 0 0 32px;font-size:14px;"><li style="margin-bottom:10px;font-weight:bold;">提问：<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+questions[0]+'</span></li><li>回答：<textarea name="ReqMemo" id="ReqMemo" cols="35" rows="4" maxLength=40 style="width:324px;height:62px;vertical-align: text-top;overflow-y:auto;" onkeyup="textarea_maxlen.isMax()" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');textarea_maxlen.disabledRightMouse()" onblur="textarea_maxlen.enabledRightMouse()" maxLength=40></textarea><p style="color:#FF0000;margin:10px 0 0 45px;height:20px;overflow:hidden;"><span id="ReqMemoMessageLi"></span></p></li></ul>';
	//var msg = '<div class="g_home_layer"><div class="dialog_answer" style="margin:20px 10px;font-size:14px;">';
	//msg += '<h3 style="font-size:14px;margin-bottom:11px;">对方设置了需要回答问题才能向'+(f_sex == '女士'?'她':'他')+'打招呼。</h3><ul class="answer_info" style="border-top:1px solid #D8D8D8;padding:30px 0 0 32px;"><li style="margin-bottom:20px;">对方提问：<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+questions[0]+'</span></li><li style="margin-bottom:20px;">您的回答：<textarea name="ReqMemo" id="ReqMemo" cols="35" rows="4" maxLength=40 style="width:324px;height:62px;vertical-align: text-top;overflow-y:auto;" onkeyup="textarea_maxlen.isMax()" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');textarea_maxlen.disabledRightMouse()" onblur="textarea_maxlen.enabledRightMouse()" maxLength=40></textarea><p style="color:#666666;vertical-align: bottom;display:inline;">(最长40个字)</p><p style="color:#FF0000;margin:0 0 0 70px;height:20px;overflow:hidden;"><span id="ReqMemoMessageLi"></span></p></li><ul>';
	Total=questions.length;
	QOrder = 1;
	if(Total==1) button_name='提 交';
	else button_name='下一步';

	msg += '<div style="padding: 10px 0 10px 65px; line-height: 30px;" id="fasong"><input id="next" onclick="GetQuestion(\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\')" value="'+button_name+'" class="btn g_layer_alert_btn" type="button"><input type="button" class="btn g_layer_alert_btn" value="取 消" onclick="hidePopWin(false)"></div>';
	for(i in questions){
		j = parseInt(i)+1;
		msg += '<input type="hidden" name="Question'+j+'" id="Question'+j+'" value="'+questions[i]+'"><input type="hidden" name="Answer'+j+'" id="Answer'+j+'">';
	}
	msg += '</div></div>';
	//Win.dialog({msg:msg, enter: "", type:'', button:'', btnalign:'center', title:'加为好友', width:520, height:500});
	winOpen({'msg':msg,width:500,height:400,title:'打个招呼'});
}

function GetQuestion(fid, f_sex, f_face2, f_nickname, token, time) {
	if(checkForm()==false) return false;
	//if($("#ReqMemo").val()==''){
	//	$("#ReqMemoMessageLi").html('<font color="red">请输入内容</font>');
	//	return false;
	//}else{
	//	$("#ReqMemoMessageLi").html('');
	//}
	// 保存答案
	var QuestionAnswer = $('#ReqMemo').val();
	var atmp = "Answer"+QOrder;
	$("#"+atmp).val(QuestionAnswer);	// 答案
	if (QOrder == Total) {		// 提交
		disableButton(1);
		//document.form1.submit();
		do_question_verify(fid, f_sex, f_face2, f_nickname, token, time);
	}else {		// 更换下一题
		QOrder++;
		var QuestionArea = $('#QuestionContent');
		var qtmp = "Question"+QOrder;
		QuestionArea.text($("#"+qtmp).val());
		$('#ReqMemo').val("");
		if (QOrder == Total) {
			//$('#AuthCodeLi').show();
			//document.getElementById('AuthCodeLi').style.display = '';
			$('#next').val("提 交");
		}
	}
}

var textarea_maxlen = {
	isMax : function (){
		var textarea = document.getElementById("ReqMemo");
		var max_length = textarea.maxLength;
		if(textarea.value.length > max_length){
			textarea.value =textarea.value.substring(0, max_length);
		}
	},
	disabledRightMouse : function (){
		document.oncontextmenu = 	  function (){
			return false;
			}
	},
	enabledRightMouse : function (){
		document.oncontextmenu = null;
	}
};

function checkForm()
{
	var error_msg_1 = false;

	var pattern = /http:|.com|.net|.cn|.org/i;
	var memo = $.trim($("#ReqMemo").val());
	
	if (memo.length == 0) {
		error_msg_1 = '（内容不能为空）';
	}
	if (memo.length > 40) {
		error_msg_1 = '（输入内容请不要超过40个字。）';
	}
	if (pattern.exec(memo) != null) {
		error_msg_1 = '（您发表的内容含禁发信息。）';
	}

	if(error_msg_1) {
		var error_html = "";
		error_html = error_msg_1;
		$('#ReqMemoMessageLi').html(error_html);
		return false;
	}	
	return true;
}

function disableButton (type) {
	if(type==1) $("#next").attr("disabled", "disabled");
	else $("#next").attr("disabled", "");
}

function do_question_verify(fid, f_sex, f_face2, f_nickname, token, time){
	if($.trim($("#ReqMemo").val())==''){
		//$("#ReqMemoMessageLi").html('请输入内容');
		//return false;
	}
	var param = {'friendid':fid,'token':token,'time':time}
	for(i=1;i<=5;i++){
		if(typeof($("#Question"+i).val())!='undefined' && $("#Question"+i).val()!=''){
			param['Question'+i] = $("#Question"+i).val();
			param['Answer'+i] = $("#Answer"+i).val();
		}
	}
	$.ajaxFormPost("http://friend.51.com/friend/add_friend_question_api.php",param, function(result){

		if(result==-1){
			$("#ReqMemoMessageLi").html('（参数错误）');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>参数错误</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});
		}else if(result==-2){
			$("#ReqMemoMessageLi").html('（请求发送失败，请重试）');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>请求发送失败，请重试</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});	
		}else{
			//var mid = result.data.mid;
			var mid = result;
	    	//send_request_ok(fid, f_sex, f_face2, f_nickname, token, time, mid);
			pinjia(fid,f_sex,f_face2,f_nickname,mid,token,time);
	    	//var msg = '<div class="user_ask">';
			//msg += '<p class="ask_title color_green" style="font-size:16px;">加为普通好友的请求已发给对方！</p>';
			//msg += '</div>';
	    	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="确定" class="dialog_btn" onclick=\'pinjia("'+fid+'","'+f_sex+'","'+f_face2+'","'+f_nickname+'","'+mid+'","'+token+'","'+time+'")\'>', title:'加为好友', width:550, height:180});
		}
	});
}

//精确问答验证
function exact_qa_verify(fid, f_sex, f_face2, f_nickname, token, time, question){
	var f_face2_80 = f_face2.replace("_130.", "_80.");
	if($.trim(f_face2_80)==''){
		if(f_sex == '女士'){
			f_face2_80 = errorpic_woman_80;
		}else{
			f_face2_80 = errorpic_man_80;
		}
	}
	var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:500px;">';
	msg += '<div class="do"><div class="photo" style="width:100px;"><div class="img_box img_80"><img src="'+f_face2_80+'" /></div></div><div class="pop" style="margin:40px 0 0 20px;"><span class="arrow"></span><p>你需要答对我的问题才能向我打招呼哦！</p></div></div>';
	msg += '<ul class="answer_info" style="clear:both;padding:30px 0 0 32px;font-size:14px;"><li style="margin-bottom:10px;font-weight:bold;">提问：<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+question+'</span></li><li>回答：<textarea name="ReqMemo" id="ReqMemo" cols="35" rows="4" maxLength=40 style="width:324px;height:62px;vertical-align: text-top;overflow-y:auto;" onkeyup="textarea_maxlen.isMax()" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');textarea_maxlen.disabledRightMouse()" onblur="textarea_maxlen.enabledRightMouse()" maxLength=40></textarea><p style="color:#FF0000;margin:10px 0 0 45px;height:20px;"><span id="ReqMemoMessageLi"></span></p></li></ul>';
	//var msg = '<div class="g_home_layer"><div class="dialog_answer" style="margin:20px 10px;font-size:14px;">';
	//msg += '<h3 style="font-size:14px;margin-bottom:11px;">对方设置了必须正确回答问题才能向'+(f_sex == '女士'?'她':'他')+'打招呼。</h3><ul class="answer_info" style="border-top:1px solid #D8D8D8;padding:30px 0 0 32px;"><li style="margin-bottom:20px;">对方提问：<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+question+'</span></li><li style="margin-bottom:20px;">您的回答：<input type="text" id="ReqMemo" style="width:219px;height:24px;vertical-align:middle;" maxlength="20" onfocus="$(\'#ReqMemoMessageLi\').html(\'\')" onkeydown="key_sub(event,\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\');" /><p style="color:#FF0000;margin-left:12px;display:inline;"><span id="ReqMemoMessageLi"></span></p></li></ul>';
	msg += '<div style="padding: 10px 0 10px 65px; line-height: 30px;" line-height: 30px;" id="fasong"><input id="next" onclick="do_exact_qa_verify(\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\')" value="提交" class="btn g_layer_alert_btn" type="button"><input type="button" class="btn g_layer_alert_btn" value="取消" onclick="hidePopWin(false)"></div>';
	msg += '</div></div>';
	//Win.dialog({msg:msg, enter: "", type:'', button:'', btnalign:'center', title:'加为好友', width:520, height:500});
	winOpen({'msg':msg,width:500,height:400,title:'打个招呼'});
}

/**
 * 按回车提交
 */
function key_sub(e,fid, f_sex, f_face2, f_nickname, token, time)
{
	var evnt = e||event;
	if (evnt.keyCode == 13) {
		do_exact_qa_verify(fid, f_sex, f_face2, f_nickname, token, time);
	}
}

function do_exact_qa_verify(fid, f_sex, f_face2, f_nickname, token, time){
	if($.trim($("#ReqMemo").val())==''){
		$("#ReqMemoMessageLi").html('（请输入内容）');
		return false;
	}
	disableButton(1);
	$.ajaxFormPost("http://friend.51.com/friend/add_friend_question_api.php", {'friendid':fid,'ReqMemo':$("#ReqMemo").val(),'token':token,'time':time}, function(result){
		if(result==-1){
			$("#ReqMemoMessageLi").html('（参数错误）');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>参数错误</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});
		}else if(result==-2){
			$("#ReqMemoMessageLi").html('（请求发送失败，请重试）');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>请求发送失败，请重试</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});	
		}else if(result==-3){
			$("#ReqMemoMessageLi").html('（回答错误）');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>回答错误</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="好的，我知道了" class="dialog_btn" onclick="Win.close()">', title:'好友请求', width:550, height:180});	
		}else{
			//var mid = result.data.mid;
			mid = result;
			//send_request_ok(fid, f_sex, f_face2, f_nickname, token, time, mid);
			pinjia(fid,f_sex,f_face2,f_nickname,mid,token,time);
		}
	});
}

function show_request_info(info,title){
	var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
	msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '</div></div>';	
	winOpen({'msg':msg,width:400,height:180,title:title});
}

function send_request_ok(fid, f_sex, f_face2, f_nickname, token, time, mid){
	var msg = '<div class="g_home_layer"><div style="text-align: center; padding: 10px; line-height: 30px;">';
	msg += '<p style="text-align: center;">加为普通好友的请求已发给对方！</p><div class="dialog_button"><input onclick=\'pinjia("'+fid+'","'+f_sex+'","'+f_face2+'","'+f_nickname+'","'+mid+'","'+token+'","'+time+'")\' value="确定" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '</div></div>';

	winOpen({'msg':msg,width:250,height:180,title:'打个招呼'});
}

//评价
var errorpic_man_130 = 'http://static.51img1.com/v3/themes/skins/images/none_130.gif';
var errorpic_woman_130 = 'http://static.51img1.com/v3/themes/skins/images/none_women_130.gif';
var appraise_girl = [[['很有个性的小姑娘~',0,11],['照片拍的很美哦',1,12],['眼神很清澈，纯纯的',1,13],['很像我以前的女朋友',1,14],['是个水灵灵的小丫头',1,15],['帽子很适合你哦',0,16],['笑容很甜美~',1,17],['一颦一笑都好萌',1,1],['气质美女',0,2],['就像个天使(*^_^*)',1,3],['皮肤好白皙',1,4],['发型很适合你哦',0,5]],[['让我心跳地喘不上气了，能认识下吗？',0,1],['内心不如外表看起来这么快乐~',1,2],['我可以把你逗笑',0,3],['我们应该会成为很好的朋友',0,4],['像天上来的神仙妹妹',1,5],['清纯可爱的小女生',0,6],['很有职业女性的感觉啊',1,7],['相当有气质',1,8],['是我的知音',1,9],['很像某个人…',1,10]],[['我特地来帮你跟我打个招呼~',0,6],['看起来很舒服',1,7],['耳环亮晶晶的',1,8],['漂亮得有点过分！',1,9],['好像有心事啊~',1,10],['身材一级棒啊~',1,11],['长的像我梦中情人~',1,12],['有点点坏',1,13],['小可爱',0,14],['让我很想呵护…',1,15],['笑容很甜美',1,16],['和我很有共同语言',1,17],['皮肤很白皙',1,1]],[['很有个性的小姑娘',0,2],['很像我以前的女朋友',1,3],['很特别，可以认识下吗？',1,4],['穿衣服真有范儿',1,5],['在阳光下真美',1,6],['原来是老乡~真有缘~',0,7],['回眸一笑百媚生',0,8],['长的很像我高中时候的校花',1,9],['嘟嘟的小嘴好可爱',1,10],['是个古灵精怪的小丫头',1,11]]]
var appraise_boy = [[['墨镜显得你很酷哦~',0,11],['帽子很适合你哦',0,12],['很斯文，文质彬彬的~',1,13],['好有明星范儿啊',1,14],['很有安全感',1,15],['很像某个人…',1,16],['笑容感染了我',1,17],['眼神很忧郁',1,1],['身上似乎有股柠檬草的味道~',1,2],['让我想靠一靠',1,3],['是个成熟稳重的人',1,4]],[['不是个好人^_^',1,1],['小虎牙很可爱~',1,2],['可能认识我哦',1,3],['眼睛很好看',1,4],['有那么一点忧郁的气质',1,5],['穿军装好帅气呀~',1,6],['看着是个有故事的人',1,7],['很有男人味哦~~',1,8],['很像邻家大哥哥',1,9],['很像我以前的男朋友~',1,10]],[['看起来很有气质',1,5],['阳光小青年',0,6],['很与众不同',1,7],['是帅锅~哈哈',1,8],['老乡哦~加你哈',0,9],['有点明星气质',1,10],['忠实厚道',1,11],['喜欢你的笑容',0,12],['陪我聊聊天吧',0,13],['身材很不错哦^_^',1,14],['很有个人魅力哦~',1,15],['你好啊~认识一下啊',0,16]],[['我们会成为很好的朋友',0,17],['是个善良的人',1,1],['我想认识一下你哈~',0,2],['身材很不错哦',1,3],['高大帅气',1,4],['很像某个人…',1,5],['喜欢你的笑容',0,6],['眼神很忧郁',1,7],['我来帮你跟我打个招呼^_^',0,8],['是个成熟稳重的人',1,9],['很有安全感~',1,10],['发型很酷',1,11]]];
var word_index;
function pinjia(fid, f_sex, f_face2, f_nickname, mid, token, time){
	var rec_appraise = new Array();
	var info = '';
	//var appraise_girl = new Array('笑容很甜很可爱', '眼神很单纯', '很有气质', '非常可爱', '很像邻家小妹妹', '性感诱人', '好让我心动啊', '清纯可人', '五官很精致', '让我很想呵护你', '妩媚动人', '像洋娃娃一样','风情无限','让我喷鼻血了','很文静','清新脱俗','很淑女~');
	//var appraise_boy  = new Array('有点坏坏的感觉哦~','高大帅气','很阳光','像邻家大哥哥','很时尚很有品味','很有男人味','帅帅哒~','看起来很精神','很有明星气质哦~','身材很不错哦','是个有故事的人','思想很有深度','发型很酷','让人很有安全感','很与众不同','斯斯文文的~');
	if(f_sex == '女士'){
		word_index=Math.floor(Math.random()*4);
		rec_appraise = appraise_girl[word_index];
	}else{
		word_index=Math.floor(Math.random()*4);
		rec_appraise = appraise_boy[word_index];
	}

	if($.trim(f_face2)==''){
		if(f_sex == '女士'){
			f_face2 = errorpic_woman_130;
		}else{
			f_face2 = errorpic_man_130;
		}
	}

	var tip_info = '<p><span class="color_red">赞美细节！</span>例如你可以告诉她，你喜欢她的小虎牙。赞美她的发型、穿着，会让她很开心哦！</p>';
	
	var msg = '<div class="g_home_layer"><div class="dialog_block">';
	msg += '<div class="do">';
	msg += '<div class="photo" style="width:140px"><div class="img_box img_130"><img src="'+f_face2+'" /></div><p>'+f_nickname+'</p></div>';
	msg += '<div class="pop"><span class="arrow"></span><p>你对我的印象是什么呢？</p></div>';
	msg += '</div>';
	//msg += '<p class="t_r color_light">（请选择一个词）</p>';
	msg += '<ul class="friends_commend clear" id="yx_msg">';

	for(i=0; i<rec_appraise.length; i++){
		//var index = i+1;
		var yx = '';
		if(rec_appraise[i][1]==1) yx = '我觉得你' + rec_appraise[i][0];
		else yx = rec_appraise[i][0];
		msg += '<li onmouseover="$(this).attr(\'class\',\'current\')" onmouseout="$(this).attr(\'class\',\'\')"><span title="'+yx+'" class="color_'+rec_appraise[i][2]+'" onclick="dopinjia(\''+fid+'\', 0, \''+yx+'\',\''+mid+'\',\''+token+'\',\''+time+'\')">'+rec_appraise[i][0]+'</span></li>';
	}

	msg += '</ul>';
	//msg += '<p class="clear"><a href="" class="commend_more" onclick="setlocation({height:500}); $(\'#appraise_content\').get(0).style.display=\'block\'; $(\'#fasong\').get(0).style.display=\'block\'; return false;">更多</a></p>';
	//msg += '<div style="text-align:center; padding:20px 20px 0 0; display:none" id="appraise_content"><label style="color:#999;">说说他身上最吸引你的地方：</label><input type="text" id="appraise" class="input_text" style="height:22px;padding:8px 2px 0;vertical-align:middle;" maxlength="10" /></div>';
	//msg += '<div style="text-align:center; padding:20px 20px 0 0; display:none" id="fasong"><input onclick="dopinjia(\''+fid+'\',\''+ 1+'\', \''+''+'\',\''+mid+'\',\''+token+'\',\''+time+'\')" value="发送" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '<p style="text-align:right;"><a href="javascript:void(0)" onclick="change_word(\''+fid+'\',\''+f_sex+'\',\''+mid+'\',\''+token+'\',\''+time+'\')">[换些词]</a></p>';
	msg += '<div class="diy_area"><label>...或点此自写：</label><input type="text" id="appraise" class="input_text" style="" maxlength="16" onfocus="change_tip(1,\''+f_sex+'\')" onblur="change_tip(0,\''+f_sex+'\')" />&nbsp;&nbsp;<input type="button" id="friend_rename_click" onclick="dopinjia(\''+fid+'\',\''+ 1+'\', \''+''+'\',\''+mid+'\',\''+token+'\',\''+time+'\')" class="g_btn" value="发送"><div class="g_hint g_arrow_up"><div class="g_hint_wrap" id="tip"><span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p>每个人都希望收到单独为'+(f_sex=='女士'?'她':'他')+'而写的东西</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div></div></div></div>';
	msg += '</div></div>';
	//Win.dialog({msg:msg, enter: "", type:'', button:'', btnalign:'center', title:'加为好友', width:520, height:500});	
	winOpen({'msg':msg,width:550,height:580,title:'打个招呼'});
    
}

function change_tip(type,f_sex){
	var sex_info=(f_sex=='女士'?'她':'他');
	if(type==1){
		if(f_sex=='女士'){
			$('#tip').html('<span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p><span class="color_red">赞美细节！</span>例如你可以告诉她，你喜欢她的小虎牙。赞美她的发型、穿着，会让她很开心哦！</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div>');
		}else{
			$('#tip').html('<span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p><span class="color_red">赞美细节！</span>例如你可以告诉他，你喜欢他坏坏的笑容。赞美他的发型、穿着，会让他很开心哦！</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div>');
		}
	}else{
		$('#tip').html('<span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p>每个人都希望收到单独为'+sex_info+'而写的东西</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div>');		
	}
}

function change_word(fid,f_sex,mid,token,time){
	if(word_index<3) word_index++;
	else word_index=0;
	if(f_sex == '女士'){
		rec_appraise = appraise_girl[word_index];
	}else{
		rec_appraise = appraise_boy[word_index];
	}

	var msg='';
	for(i=0; i<rec_appraise.length; i++){
		//var index = i+1;
		var yx = '';
		if(rec_appraise[i][1]==1) yx = '我觉得你' + rec_appraise[i][0];
		else yx = rec_appraise[i][0];
		msg += '<li onmouseover="$(this).attr(\'class\',\'current\')" onmouseout="$(this).attr(\'class\',\'\')"><span title="'+yx+'" class="color_'+rec_appraise[i][2]+'" onclick="dopinjia(\''+fid+'\', 0, \''+yx+'\',\''+mid+'\',\''+token+'\',\''+time+'\')">'+rec_appraise[i][0]+'</span></li>';
	}
	$('#yx_msg').html(msg);
}

function setlocation(obj){
	if(obj.height) {
		$(".g_layer").css("height",obj.height);
		$(".g_layer_wrap").css("height",obj.height-2);
	}
	if(obj.width) {
		//$Y("popup").style.width=obj.width+"px";
		//$("#pop_content").css("width", obj.width-23);	
	}
}

function dopinjia(fid, type, content, mid, token, time){
	if(type == 0){
		var appraise = content;
	}else{
		var appraise = $("#appraise").val().replace(/(^s*)|(\s*$)/g,"");
		if($.trim(appraise) == ''){
			//alert("请选择一个印象词语！");
			//return false;
		}else if(appraise.replace(/[^\x00-\xff]/g, "aa").length>32){
			alert("最多输入16个汉字！");
			return false;
		}
	}

	var param = {friendid:fid, mid:mid, evaluation:appraise, token:token, time:time, act:'pinjia'};
	$.ajaxFormPost("http://friend.51.com/friend/add_friend_question_api.php",param, function(result){
		if(result == 1){
			hidePopWin(false);
			show_tip();
			$('#pop_hello').show();
			$_Global_Mask.show();
			setTimeout("$('#pop_hello').hide();$_Global_Mask.hide();",2000);
		}else if(result == 2){
			var msg = '<div class="g_home_layer"><div style="padding:30px 0; text-align:center;line-height:25px;">';
			msg += '<p class="size_14"><strong>你成功地打了个招呼！</strong></p>';
			msg += '</div><div class="send_again"><p class="size_14"><img src="http://static.51img1.com/v3/themes/skins/images/new/ico_gift.gif" />再送份礼物，显示出你的与众不同！</p><p class="color_light">送礼物让你脱颖而出，对方接受后直接升为好朋友！</p></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input type=button value="去看看礼物" class="btn g_layer_alert_btn" onclick="window.open(\'http://jiaoyou.51.com/?c=gift&uid='+fid+'\'); hidePopWin(false)">&nbsp;<input type=button value="不送了" class="btn g_layer_alert_btn" onclick="hidePopWin(false)"></div>';	
			winOpen({'msg':msg,width:450,height:300,title:'打个招呼'});       
		}else{
			//winOpen({'msg':msg,width:520,height:500,title:'加为好友'});
			var msg = '招呼发送失败';
			show_request_info(msg,'打个招呼');
			//Alert({'msg':msg,width:520,height:300,title:'打个招呼'});
			//Win.dialog({msg:info, enter: "", type:'alert', button:'', btnalign:'center', title:'加为好友', width:420, height:150});
		}	
	})
}

//好友升级
var errorpic_man_50 = 'http://static.51img1.com/v3/themes/skins/images/none_50.gif';
var errorpic_woman_50 = 'http://static.51img1.com/v3/themes/skins/images/none_women_50.gif';
function relation_up(fid){
	var func='';
	var param='';
	if(arguments.length>=2){
		for(var i=1;i<arguments.length;i++){
			param +=',\''+arguments[i]+'\'';
		}
	}
	func='do_relation_up('+fid+param+')';

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if(f_nickname=='') f_nickname = f_friend;
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">你们已经是好朋友了</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
			}else if(f_relation==1){
				if(f_sex=='女士'){
					//var msg = '<div class="dialog_prompt" style="padding-top:52px;">';
					//msg += '<p style="text-align: center;font-weight:bold">你要将'+f_nickname+'升为你的好朋友吗？</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_relation_up('+fid+')" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div>';
					//msg += '</div>';	
					var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>你要将对方升为你的好朋友吗？</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'（'+f_friend+'）</div></div>';
					msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div></div>';
					winOpen({'msg':msg,width:350,height:280,title:'升为好朋友'});
				}else{
					if(f_sex_friend == '女士'){
						var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:400px;">';
						msg += '<div class="do"><div class="photo" style="width:80px;"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin:25px 0 0 0;"><span class="arrow"></span><p>说说你为什么想和我成为好朋友呢？</p></div></div>';
						msg += '<div class="upgrade_contain"><div class="wrap"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')"></textarea><p>^_^ 每个女生都希望收到对方单独为她写的话，用心点哦！</p></div></div>';
						msg += '<div style="clear:both;padding: 20px 0 0 120px; line-height: 30px;"><span class="g_btn_w"><input type="button" class="g_btn" value="发送升级请求" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></span></div></div>';
					}else{
						var msg = '<div class="g_home_layer"><div class="dialog_block change_level">';
						msg += '<div class="do"><div class="photo"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin-top:30px;"><span class="arrow"></span><p>说说你为什么想和我成为好朋友呢？</p></div></div>';
						msg += '<div class="send_request"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')">'+f_nickname+'，你好！\n请你把我升级为好朋友吧，这样我们就能直接聊天了！</textarea>';
						msg += '<div class="btn_area"><input type="button" class="btn g_layer_alert_btn" value="发送升级请求" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></div><p>送礼物升为好朋友，更容易成功！<a href="http://jiaoyou.51.com/?c=gift&uid='+fid+'" target="_blank">去送礼物&gt;&gt;</a></p></div>';
						msg += '</div></div>';						
					}
					winOpen({'msg':msg,width:450,height:350,title:'升为好朋友'});
				}
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">好友关系错误</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});				
			}
		}
	})
}

function do_relation_up(fid){
	var func='';
	var param='';
	if(arguments.length>1){
		if(arguments.length>2){
			for(var i=2;i<arguments.length;i++){
				if(i==2) param +='\''+arguments[i]+'\'';
				else param +=',\''+arguments[i]+'\'';
			}
		}
		func =arguments[1]+'('+param+');';
	}

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?act=ctf&userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
	    var data = result.data;
	    var info = result.info;
		if(status == 1){
			var msg = '<div class="g_home_layer"><div class="change_guanxi" style="padding-bottom:30px"><strong><span class="color_green">升级成功！</span>你们成为了好朋友。</strong></div><div style="text-align:center">备注：<input name="friend_alias" id="friend_alias" type="text" value="可不填" class="input_text" onclick="clear_input_text(\'friend_alias\', \'可不填\');" style="color:#999;width:100px" maxlength="16" /></div><div style="text-align: center; padding: 40px 0 0; line-height: 30px;"><input onclick="set_friend_alias('+fid+');'+func+'" value="确定" class="btn g_layer_alert_btn" type="button"></div></div>';

			//msg += '</div>';	
			winOpen({'msg':msg,width:350,height:250,title:'升为好朋友'});
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
		}
	})
}

function relation_up_follow(fid){
	var func='';
	var param='';
	if(arguments.length>=2){
		for(var i=1;i<arguments.length;i++){
			param +=',\''+arguments[i]+'\'';
		}
	}
	func='do_relation_up_follow('+fid+param+')';

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if(f_nickname=='') f_nickname = f_friend;
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">你们已经是好朋友了</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
			}else if(f_relation==1){
				if(f_sex=='女士'){
					eval(func);
				}else{
					if(f_sex_friend == '女士'){
						var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:400px;">';
						msg += '<div class="do"><div class="photo" style="width:80px;"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin:25px 0 0 0;"><span class="arrow"></span><p>说说你为什么想和我成为好朋友呢？</p></div></div>';
						msg += '<div class="upgrade_contain"><div class="wrap"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')"></textarea><p>^_^ 每个女生都希望收到对方单独为她写的话，用心点哦！</p></div></div>';
						msg += '<div style="clear:both;padding: 20px 0 0 120px; line-height: 30px;"><span class="g_btn_w"><input type="button" class="g_btn" value="发送升级请求" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></span></div></div>';
					}else{
						var msg = '<div class="g_home_layer"><div class="dialog_block change_level">';
						msg += '<div class="do"><div class="photo"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin-top:30px;"><span class="arrow"></span><p>说说你为什么想和我成为好朋友呢？</p></div></div>';
						msg += '<div class="send_request"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')">'+f_nickname+'，你好！\n请你把我升级为好朋友吧，这样我们就能直接聊天了！</textarea>';
						msg += '<div class="btn_area"><input type="button" class="btn g_layer_alert_btn" value="发送升级请求" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></div><p>送礼物升为好朋友，更容易成功！<a href="http://jiaoyou.51.com/?c=gift&uid='+fid+'" target="_blank">去送礼物&gt;&gt;</a></p></div>';
						msg += '</div></div>';						
					}
					winOpen({'msg':msg,width:450,height:350,title:'升为好朋友'});
				}
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">好友关系错误</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});				
			}
		}
	})
}

function do_relation_up_follow(fid){
	var func='';
	var param='';
	if(arguments.length>1){
		if(arguments.length>2){
			for(var i=2;i<arguments.length;i++){
				if(i==2) param +='\''+arguments[i]+'\'';
				else param +=',\''+arguments[i]+'\'';
			}
		}
		func =arguments[1]+'('+param+');';
	}

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?act=ctf&userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
	    var data = result.data;
	    var info = result.info;
		if(status == 1){
			show_tip_follow(fid);
			//$('#pop_tip_follow').show();
			//$_Global_Mask.show();
			//setTimeout("$('#pop_tip_follow').hide();$_Global_Mask.hide();",2000);
			var offset = $('#control_'+fid).offset();
			_t = offset.top-125;
			_l = offset.left-110;
			if($(document).scrollTop()>offset.top-100) $(document).scrollTop(offset.top-100);
			//foui.dialog.open('#pop_tip_follow_'+fid,{left:_l,top:_t,closeTimeout:2000,overlay:true});
			foui.dialog.open('#pop_tip_follow_'+fid,{closeTimeout:2000,overlay:true});
			$('#fan_'+fid).html('<a class="bothway_friend" title="双向关注" href="javascript:void(0);"><img src="http://static.51img1.com/v3/themes/skins/images/spacer.gif" /></a>');
			eval(func);
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
		}
	})
}

function relation_up_woman(fid){
	var func='';
	var param='';
	if(arguments.length>=2){
		for(var i=1;i<arguments.length;i++){
			param +=',\''+arguments[i]+'\'';
		}
	}
	func='do_relation_up_woman('+fid+param+')';

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if(f_nickname=='') f_nickname = f_friend;
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">你们已经是好朋友了</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
			}else if(f_relation==1){
				if(f_sex=='女士'){
					//var msg = '<div class="dialog_prompt" style="padding-top:52px;">';
					//msg += '<p style="text-align: center;font-weight:bold">你要将'+f_nickname+'升为你的好朋友吗？</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_relation_up('+fid+')" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div>';
					//msg += '</div>';	
					var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>你要将对方升为你的好朋友吗？</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'（'+f_friend+'）</div></div>';
					msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div></div>';
					winOpen({'msg':msg,width:350,height:280,title:'升为好朋友'});
				}else{
					if(f_sex_friend == '女士'){
						var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:400px;">';
						msg += '<div class="do"><div class="photo" style="width:80px;"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin:25px 0 0 0;"><span class="arrow"></span><p>说说你为什么想和我成为好朋友呢？</p></div></div>';
						msg += '<div class="upgrade_contain"><div class="wrap"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')"></textarea><p>^_^ 每个女生都希望收到对方单独为她写的话，用心点哦！</p></div></div>';
						msg += '<div style="clear:both;padding: 20px 0 0 120px; line-height: 30px;"><span class="g_btn_w"><input type="button" class="g_btn" value="发送升级请求" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></span></div></div>';
					}else{
						var msg = '<div class="g_home_layer"><div class="dialog_block change_level">';
						msg += '<div class="do"><div class="photo"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin-top:30px;"><span class="arrow"></span><p>说说你为什么想和我成为好朋友呢？</p></div></div>';
						msg += '<div class="send_request"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')">'+f_nickname+'，你好！\n请你把我升级为好朋友吧，这样我们就能直接聊天了！</textarea>';
						msg += '<div class="btn_area"><input type="button" class="btn g_layer_alert_btn" value="发送升级请求" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></div><p>送礼物升为好朋友，更容易成功！<a href="http://jiaoyou.51.com/?c=gift&uid='+fid+'" target="_blank">去送礼物&gt;&gt;</a></p></div>';
						msg += '</div></div>';						
					}
					winOpen({'msg':msg,width:450,height:350,title:'升为好朋友'});
				}
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">好友关系错误</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});				
			}
		}
	})
}

function do_relation_up_woman(fid){
	var func='';
	var param='';
	if(arguments.length>1){
		if(arguments.length>2){
			for(var i=2;i<arguments.length;i++){
				if(i==2) param +='\''+arguments[i]+'\'';
				else param +=',\''+arguments[i]+'\'';
			}
		}
		func =arguments[1]+'('+param+');';
	}

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?act=ctf&userid="+fid+"&type=agree&callback=?",{},function(result){	
		var status = result.state;
	    var data = result.data;
	    var info = result.info;
		if(status == 1){
			var msg = '<div class="g_home_layer"><div class="change_guanxi" style="padding-bottom:30px"><strong><span class="color_green">升级成功！</span>你们成为了好朋友。</strong></div><div style="text-align:center">备注：<input name="friend_alias" id="friend_alias" type="text" value="可不填" class="input_text" onclick="clear_input_text(\'friend_alias\', \'可不填\');" style="color:#999;width:100px" maxlength="16" /></div><div style="text-align: center; padding: 40px 0 0; line-height: 30px;"><input onclick="set_friend_alias('+fid+');'+func+'" value="确定" class="btn g_layer_alert_btn" type="button"></div></div>';

			//msg += '</div>';	
			winOpen({'msg':msg,width:350,height:250,title:'升为好朋友'});
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
		}
	})
}

function relation_up_man(fid){
	var func='';
	func='dorelation_up_man('+fid+')';
	
	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if(f_nickname=='') f_nickname = f_friend;
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">你们已经是好朋友了</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});
			}else if(f_relation==1){
					var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>你要将对方升为你的好朋友吗？</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'（'+f_friend+'）</div></div>';
					msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div></div>';
					winOpen({'msg':msg,width:350,height:280,title:'升为好朋友'});
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">好友关系错误</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'升为好朋友'});				
			}
		}
	})
}

function dorelation_up_man(f_uid){
	var uptype = 1;
	var callback = function(result){
		var status = result.errno;
		var info = result.message;
		var data = result.data;
		if(status == 0){
			var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong><span class="color_green">升级成功！</span><br/><br/>你们成为了好朋友。</strong></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);window.location.reload();" value="确定" class="btn g_layer_alert_btn" type="button"></div></div>';
			winOpen({'msg':msg,width:350,height:250,title:'升为好朋友'});
		}else{
			winOpen({'msg':info,width:350,height:250,title:'升为好朋友'});
		}
	};
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: 'http://jiaoyou.51.com/?c=friend&a=upRS',
		data: {uid: f_uid, type:uptype},
		success: callback,
		error: callback
	});
	
}

/**
 * 清空文本框
 * @param	string	input_id	文本框id
 * @param	string	text_cont	文本框内容，当文本框中是这个内容时，就清空
 */
function clear_input_text(input_id, text_cont)
{
	if ($("#"+input_id)) {
		if ($("#"+input_id).val() == text_cont) {
			$("#"+input_id).val("");
			$("#"+input_id).css("color","#000");
		}
		//$("#"+input_id).removeAttr("class");
	}
}

function set_friend_alias(fid){
	var cont=$("#friend_alias").val();
	if(cont.replace(/[^\x00-\xff]/g, "aa").length>16){
			alert("最多输入8个汉字！");
			return false;
	}
	$.ajaxFormPost("http://friend.51.com/friend/change_friend_relation_api.php", {'userid':fid,'cont':cont,'act':'alias'}, function(data){
		if(data == -1) {
			alert('备注请在16字节以内！');
			return false;
		}else if(data == -2) {
			alert('备注只能为简繁体中文、英文、数字！');
			return false;
		}else if(data == 0) {
			alert('备注设置失败！');
			return false;
		}else{
			hidePopWin(false);
		}
	});	
}

function do_refresh(){
	window.location.reload();
}
//function relation_reflash(func){
//	if(func!='') eval(func);
	//if(typeof(new_friendlist) != 'undefined'&& new_friendlist =='friendlist')
	//	load_data_cache();
	//else
	//	window.location.reload();
//}

//好友降级
function relation_down(fid){
	var func='';
	var param='';
	if(arguments.length>=2){
		for(var i=1;i<arguments.length;i++){
			param +=',\''+arguments[i]+'\'';
		}
	}
	func='do_relation_down('+fid+param+')';

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'降为普通朋友'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==1){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">你们已经是普通朋友了</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'降为普通朋友'});
			}else{
				//var msg = '<div class="dialog_prompt" style="padding-top:52px;">';
				//msg += '<p style="text-align: center;">你要将'+f_nickname+'降为你的普通朋友吗？</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_relation_down('+fid+')" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div>';
				//msg += '</div>';	
				var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>你要将对方降为你的普通朋友吗？</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'（'+f_friend+'）</div></div>';
				msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div></div>';
				winOpen({'msg':msg,width:350,height:280,title:'降为普通朋友'});
			}
		}
	})
}

function do_relation_down(fid){
	var func='';
	var param='';
	if(arguments.length>1){
		if(arguments.length>2){
			for(var i=2;i<arguments.length;i++){
				if(i==2) param +='\''+arguments[i]+'\'';
				else param +=',\''+arguments[i]+'\'';
			}
		}
		func =arguments[1]+'('+param+')';
	}

	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?act=ftc&userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
	    var data = result.data;
	    var info = result.info;
		if(status == 1){
			var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong><span class="color_green">降级成功！</span><br/><br/>你们成为了普通朋友。</strong></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="确定" class="btn g_layer_alert_btn" type="button"></div></div>';
			//msg += '</div>';	
			winOpen({'msg':msg,width:350,height:250,title:'降为普通朋友'});	
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div></div>';
			msg += '</div>';	
			winOpen({'msg':msg,width:350,height:180,title:'降为普通朋友'});
		}
	})
}


function mail_reply2(f_uid,f_nickname) {
	var cont = $("#mail_cont").val();
	cont = $.trim(cont);
	if(cont.length == 0) {
		alert("信件内容不能为空哦");
		return false;
	}
	if(cont.length > 500) {
		alert("信件内容不能超过500个字符");
		return false;
	}
	cache_cont2 = cont;
	//winOpen({'msg':'<center>正在发送中... </center>',width:350,height:180,title:'提示'});
	//Win.dialog({msg:'<center>正在发送中... </center>',type:'warn',btnalign:'center',timeout:2000});
	//window.setTimeout("mail_send2('"+f_uid+"','"+f_nickname+"')", 1000);
	mail_send2(f_uid,f_nickname);
}

var g_issend2 = 0;
var cache_cont2 = "";
function mail_send2(f_uid,f_nickname) {
	var cont = cache_cont2;
	if(cont=="") cont = f_nickname + '，你好！\n请你把我升级为好朋友吧，这样我们就能直接聊天了！';
	if(g_issend2 == 1) return;
	g_issend2 = 1;
	$.ajaxFormPost("http://friend.51.com/friend/change_friend_relation_api.php", {'userid':f_uid,'cont':cont,'act':'sendmail'}, function(data){
		g_issend2 = 0;
		//Win.close();
		if(data == -2) {
			//Win.dialog({msg:'<center>不能和同性写信。 </center>',type:'alert',btnalign:'center'});
		}
		else if(data == -3) {
			//Win.dialog({msg:'<center>对不起，你们还不是好朋友，不能写信。 </center>',type:'alert',btnalign:'center'});
			//winOpen({'msg':'对不起，你们还不是好朋友，不能写信。',width:350,height:180,title:'提示'});
			show_request_info('对不起，你们还不是好朋友，不能写信。','升为好朋友');
		}
		else if(data == 1) {
			//Win.dialog({msg:'<center>升级请求发送成功。</center>',type:'alert',btnalign:'center',title:'提示'});
			//winOpen({'msg':'升级请求发送成功。',width:350,height:180,title:'提示'});
			show_request_info('升级请求发送成功。','升为好朋友');
		}
		else{
			//Win.dialog({msg:'<center>发送失败。 </center>',type:'alert',btnalign:'center'});
			//winOpen({'msg':'发送失败。',width:350,height:180,title:'提示'});
			show_request_info('发送失败。','升为好朋友');
		}
	});	
}

function mail_check2(e,f_uid,f_nickname) {
	var lass = 500-$("#mail_cont").val().length;
	if(lass <= 0 && !((e || window.event).keyCode<=46)) {
		var cont = $("#mail_cont").val();
		$("#mail_cont").val(cont.substr(0, 500));
		//$("#charlength").html("信件内容不能超过500个文字。");
		alert("信件内容不能超过500个文字。");
		return;
	}
	//$("#charlength").html('');
	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		mail_reply2(f_uid,f_nickname);
	}
}

//删除好友
function del_friend(fid){
	var func='';
	var param='';
	if(arguments.length>=2){
		for(var i=1;i<arguments.length;i++){
			param +=',\''+arguments[i]+'\'';
		}
	}
	func='do_del_friend('+fid+param+')';

	//if(arguments.length==2){
	//	func='do_del_friend('+fid+',\''+arguments[1]+'\')';
	//}else if(arguments.length==3){
	//	func='do_del_friend('+fid+',\''+arguments[1]+'\',\''+arguments[2]+'\')';
	//}else{
	//	func='do_del_friend('+fid+')';
	//}
	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'删除'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			var f_user = result.data.account;
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>你要将对方从好友中删除吗？</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'（'+f_friend+'）</div></div>';
			msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="确定" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="取消" class="btn g_layer_alert_btn" type="button"></div></div>';
			winOpen({'msg':msg,width:350,height:280,title:'删除'});
		}
	})
}

function do_del_friend(fid){
	var func='';
	var param='';
	if(arguments.length>1){
		if(arguments.length>2){
			for(var i=2;i<arguments.length;i++){
				if(i==2) param +='\''+arguments[i]+'\'';
				else param +=',\''+arguments[i]+'\'';
			}
		}
		func =arguments[1]+'('+param+')';
	}
	//if(arguments.length==2){
	//	func=arguments[1]+'()';
	//}else if(arguments.length==3){
	//	func=arguments[1]+'(\''+arguments[2]+'\')';
	//}
	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?act=del&userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
	    var data = result.data;
	    var info = result.info;
		if(status == 1){
			//var msg = '<div class="change_guanxi"><strong><span class="color_green">降级成功！</span><br/><br/>你们成为了普通朋友。</strong></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);relation_reflash();" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			//msg += '</div>';	
			//winOpen({'msg':msg,width:350,height:250,title:'降为普通朋友'});
			if(func!='') eval(func);
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'删除'});
		}
	})
}

function refuse_relation_up(fid){
	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'拒绝'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if(f_nickname=='') f_nickname = f_friend;
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
		
			msg = '<textarea id="refuse_mail_cont" onkeydown="mail_check3(event,\''+fid+'\',\''+f_nickname+'\')"  onkeyup="mail_check3(event,\''+fid+'\',\''+f_nickname+'\')" style="width:355px;height:115px;overflow-y:auto;color:#666;">'+f_nickname+'，你好！\n我觉得我们还不是很熟，暂时不想和你成为好朋友。</textarea>';
			Win.dialog({msg:msg, enter: "", type:'alert', button:'<input onclick="mail_reply3('+fid+')" value="发送" class="dialog_btn" type="button"><input onclick="Win.close(false)" value="取消" class="dialog_btn" type="button">', btnalign:'center', title:'拒绝', width:425, height:230});
			
		}
	})
}

function mail_check3(e,f_uid,f_nickname) {
	var lass = 500-$("#refuse_mail_cont").val().length;
	if(lass <= 0 && !((e || window.event).keyCode<=46)) {
		var cont = $("#refuse_mail_cont").val();
		$("#refuse_mail_cont").val(cont.substr(0, 500));
		alert("信件内容不能超过500个文字。");
		return;
	}
	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		refuse_relation_up(f_uid);
	}
}

function mail_reply3(friend) {
		var cont = $("#refuse_mail_cont").val().trim();
		if(cont=='') {
				Win.dialog({msg:'<center>信件内容不能为空。 </center>',type:'alert',btnalign:'center'});
				return;
		}
		sending2(friend,cont);
}

function sending2(friend,cont) {
	Win.dialog({msg:'<center>正在发送中... </center>',type:'warn',btnalign:'center',cancel:'location.reload()',timeout:2000});
	mail_send3(friend,cont);
}

var g_issend = 0;
function mail_send3(friend,cont) {
	if(g_issend == 1) return;
	g_issend = 1;
	$.post('/?c=webmail&a=send&mailtype=3&uid='+friend,{cont:cont},function (data){
		g_issend = 0;
		if(data == -3)  {
			Win.dialog({msg:'<center>对不起，你们还不是朋友，不能写信。 </center>',type:'alert',btnalign:'center'});
		}
	});
}

function refuse_relation_up_new(fid){
	$.getJSON("http://friend.51.com/friend/change_friend_relation_api.php?userid="+fid+"&callback=?",{},function(result){	
		var status = result.state;
		var info = result.info;
		if(status == 1){
			top.location.href="http://passport.51.com/passport.5p?gourl="+encodeURIComponent(top.location.href);		
		}else if(status == 2){
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="确定" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'拒绝'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if(f_nickname=='') f_nickname = f_friend;
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == '女士'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			msg ='<textarea id="refuse_mail_cont" onkeydown="mail_check_new(event,\''+fid+'\',\''+f_nickname+'\')" onkeyup="mail_check_new(event,\''+fid+'\',\''+f_nickname+'\')" style="height: 115px; overflow-y: auto; color: rgb(102, 102, 102); margin: 20px 0pt 0pt 35px; width: 350px;">'+f_nickname+'，你好！我觉得我们还不是很熟，暂时不想和你成为好朋友。</textarea>';
			msg+='<div style="margin: 20px 0pt 0pt; text-align: center;" class="btn_area"><span class="g_btn_w"><input type="button" onclick="mail_reply_new('+fid+')" value="发送" class="g_btn"></span><span class="g_btn_w"><input type="button" onclick="hidePopWin(false)" value="取消" class="g_btn"></span></div>';
			winOpen({msg:msg,width:425,height:230,title:'拒绝'});
		}
	})
}

function mail_check_new(e,f_uid,f_nickname) {
	var lass = 500-$("#refuse_mail_cont").val().length;
	if(lass <= 0 && !((e || window.event).keyCode<=46)) {
		var cont = $("#refuse_mail_cont").val();
		$("#refuse_mail_cont").val(cont.substr(0, 500));
		alert("信件内容不能超过500个文字。");
		return;
	}
	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		refuse_relation_up_new(f_uid);
	}
}

function mail_reply_new(friend) {
		var cont = $("#refuse_mail_cont").val().trim();
		if(cont=='') {
			Alert({msg:'<span style="font-size:14px;margin-left:10px">信件内容不能为空。 </span>',title:'提示',width:250,height:140}); 
			return;
		}
		sending_new(friend,cont);
}

function sending_new(friend,cont) {
	winOpen({msg:'<center style="font-size:14px;margin-top:30px">正在发送中... </center>',width:250,height:100,title:'提示'}); 
	mail_send_new(friend,cont);
}

function mail_send_new(friend,cont) {
	if(g_issend == 1) return;
	g_issend = 1;
	$.post('/?c=webmail&a=send&mailtype=3&uid='+friend,{cont:cont},function (data){
		g_issend = 0;
			if(data == -3)  {
				Alert({msg:'<span style="font-size:12px;">对不起，你们还不是朋友，不能写信。 </span>',title:'提示',width:300,height:140}); 
			}
			if(data == 3)  {
				Alert({msg:'<span style="font-size:14px;margin-left:10px">信件内容不能为空。 </span>',title:'提示',width:250,height:140}); 
			}
			if(data == 2)  {
				Alert({msg:'<span style="font-size:14px;">尊敬的用户，您好！由于此文含有敏感违规信息，禁止发送。</span>',title:'提示',width:400,height:160}); 
			}
			if(data == 1)  {
				Alert({msg:'<span style="font-size:14px;margin-left:18px">发送成功。 </span>',title:'提示',width:250,height:140,enter:function(e){
					window.location.href="http://jiaoyou.51.com/?c=webmail#mailtop";
				}}); 
			}
	});
}

function show_tip(){
	$(document.body).append('<div id="pop_hello" style="z-index:100000;position:absolute;display:none"><div class="global_popup" id="global_popup" style="width: 268px; height: 80px; z-index: 1; position: relative;"><table border="0" id="global_popup_table" class="global_popup_table"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:266px;height:78px;border:1px solid rgb(121, 121, 121);"><div style="color:#606060;font-size:14px;font-weight:bolder;padding-left:75px;background:url(http://static.51img1.com/v3/themes/skins/images/new/ico_tick.gif) 33px 25px no-repeat;height:78px;line-height:78px;">你成功地打了个招呼！</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table></div></div>');

	var _t = 0; 
	var _l = 0;

	if(top.document.body) {
		var scrollTop = top.document.documentElement.scrollTop || top.document.body.scrollTop;
		var clientHeight = top.document.documentElement.clientHeight || top.document.body.clientHeight;
		_t = scrollTop+((clientHeight-93)/2);
	} else {
		_t=document.documentElement.scrollTop+((document.documentElement.clientHeight-93)/2);
	}
	var _l=document.documentElement.scrollLeft+((document.documentElement.clientWidth-281)/2);
	//top.document.getElementById("pop_hello").height = document.documentElement.offsetHeight;
	$("#pop_hello").css("top",_t);
	$("#pop_hello").css("left",_l);
}

function show_tip_follow(fid){
	var html = '<div id="pop_tip_follow_'+fid+'" style="z-index:100001;position:absolute;display:block;padding:20px;clear:both;" class="clear"><table border="0" id="global_popup_table" class="global_popup_table"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:220px; height:75px; border: 1px solid rgb(121, 121, 121);"><div class="global_dialog_content"><div style="text-align:center;font-size:14px;font-weight:bold;line-height:24px;margin:25px 0 0 20px;background:url(http://static.51img1.com/v5/my/images/icon_friends.gif) 45px -108px no-repeat;">升级成功</div></div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table></div>';
	if($('#pop_tip_follow_'+fid).length==0) $(document.body).append(html);
	//$('#tip_content').text(param);

	//var _t = 0; 
	//var _l = 0;

	//var offset = $('#control_'+fid).offset();
	//_t = offset.top-125;
	//_l = offset.left-100;
	//$("#pop_tip_follow").css("top",_t);
	//$("#pop_tip_follow").css("left",_l);
}
