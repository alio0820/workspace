(function($){
	window.isIE6=jQuery.browser.version==6.0;
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

//�Ӻ���
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
			//msg += '<p class="ask_title color_green" style="font-size:16px;">��Ϊ��ͨ���ѵ������ѷ����Է���</p>';
			//msg += '</div>';
	    	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="ȷ��" class="dialog_btn" onclick=\'pinjia("'+fid+'","'+f_sex+'","'+f_face2+'","'+f_nickname+'","'+mid+'")\'>', title:'��Ϊ����', width:550, height:180});	
	    }else if(status == 2){
			//var msg = '<div class="user_ask">';	
	    	//msg += '<p class="ask_title" style="font-family: "Microsoft YaHei";font-size:16px;">�������Ѿ�����5�μӺ��������ˡ�</p>';
			//msg += '<p class="t_c" style="font-family: "Microsoft YaHei";font-size:12px;">�㻹���Ը����������дд�ţ������졣<br />������ϵ�����������ǳ�Ϊ���������ѡ�</p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});		
	    }else if(status == 3){
			var errorno = result.errorno;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>'+info+'</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});
			if(errorno == 1012){
				info = '������˼���Ҳ�ϣ���������Ҵ��к���';
				var f_sex = result.data.sex;
				var f_face2 = result.data.face2;
				var f_face2_80 = f_face2.replace("_130.", "_80.");
				if($.trim(f_face2_80)==''){
					if(f_sex == 'Ůʿ'){
						f_face2_80 = errorpic_woman_80;
					}else{
						f_face2_80 = errorpic_man_80;
					}
				}
				var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:500px;"><div class="do"><div class="photo" style="width:100px;"><div class="img_box img_80"><img src="'+f_face2_80+'" /></div></div><div class="pop" style="margin:40px 0 0 20px;"><span class="arrow"></span><p>'+info+'</p></div></div><div class="btn_area" style="clear:both;padding:20px 0 10px;text-align:center;"><input type="button" class="btn g_layer_alert_btn" value="�ر�"  onclick="hidePopWin(false)" ></div></div></div>';
				winOpen({'msg':msg,width:500,height:250,title:'����к�'});
			}else{
				show_request_info(info,'����к�');
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
        	//msg += '<p class="hint">�͸�������Է��ɣ��ֳ�������ڲ�ͬ��<br />�Է����ܺ����ǾͿ���Լ�������ˣ�</p></div>';
        	//Win.dialog({msg:msg, enter: "", type:'confirm', button:'<input type=button value="��������" class="dialog_btn" onclick="window.open(\'http://jiaoyou.51.com/?c=gift&uid='+fid+'\'); Win.close();">&nbsp;<input type=button value="ȡ��" class="dialog_btn_gray" onclick="Win.close()">', btnalign:'center', title:'��Ϊ����', width:440, height:350});	
	    }
	});
}

//�����֤
function identity_verify(fid, f_sex, f_face2, f_nickname, token, time){
	var msg = '<div class="g_home_layer"><div class="dialog_answer" style="margin:20px 10px;font-size:14px;">';
	msg += '<h3 style="font-size:14px;margin-bottom:11px;">�Է���������Ҫ������֤��Ϣ���ܼ�Ϊ���ѡ�</h3><ul class="answer_info" style="border-top:1px solid #D8D8D8;padding:30px 0 0 32px;"><li style="margin-bottom:20px;">��������֤��Ϣ��</li><li style="margin-bottom:20px;"><input type="text" id="ReqMemo" style="width:219px;height:24px;vertical-align:middle;" maxlength="20" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');"></input><p style=\'color:#FF0000;margin-left:12px;display:inline;\'><span id="ReqMemoMessageLi"></span></p></li></ul>';
	msg += '<div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_identity_verify(\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\')" value="�ύ" class="btn g_layer_alert_btn" type="button"><input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '</div></div>'; 
	winOpen({'msg':msg,width:400,height:300,title:'����к�'});
}

function do_identity_verify(fid, f_sex, f_face2, f_nickname, token, time){
	//if($("#ReqMemo").val()==''){
	//	$("#ReqMemoMessageLi").html('<font color="red">����������</font>');
	//	return false;
	//}
	//if(checkForm()==false) return false;
	$.ajaxFormPost("http://friend.51.com/friend/add_friend_question_api.php", {'friendid':fid,'ReqMemo':'','token':token,'time':time}, function(result){
		if(result==-1){
			show_request_info('��������','����к�');
			//$("#ReqMemoMessageLi").html('<font color="red">��������</font>');
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>��������</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});
		}else if(result==-2){
			show_request_info('�к�����ʧ�ܣ����Ժ�����','����к�');
			//$("#ReqMemoMessageLi").html('<font color="red">������ʧ�ܣ�������</font>');
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>������ʧ�ܣ�������</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});	
		}else{
			//var mid = result.data.mid;
			var mid = result;
	    	//send_request_ok(fid, f_sex, f_face2, f_nickname, token, time, mid);
			pinjia(fid,f_sex,f_face2,f_nickname,mid,token,time);
		}
	});
}

//�ʴ���֤
var QOrder;
var Total = 1;
function question_verify(fid, f_sex, f_face2, f_nickname, token, time, questions){
	var f_face2_80 = f_face2.replace("_130.", "_80.");
	if($.trim(f_face2_80)==''){
		if(f_sex == 'Ůʿ'){
			f_face2_80 = errorpic_woman_80;
		}else{
			f_face2_80 = errorpic_man_80;
		}
	}
	var arr_num =['һ','��','��','��','��'];
	var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:500px;">';
	msg += '<div class="do"><div class="photo" style="width:100px;"><div class="img_box img_80"><img src="'+f_face2_80+'" /></div></div><div class="pop" style="margin:40px 0 0 20px;"><span class="arrow"></span><p>����Ҫ�ش���'+arr_num[questions.length-1]+'����������Ҵ��к�Ŷ��</p></div></div>';
	msg += '<ul class="answer_info" style="clear:both;padding:30px 0 0 32px;font-size:14px;"><li style="margin-bottom:10px;font-weight:bold;">���ʣ�<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+questions[0]+'</span></li><li>�ش�<textarea name="ReqMemo" id="ReqMemo" cols="35" rows="4" maxLength=40 style="width:324px;height:62px;vertical-align: text-top;overflow-y:auto;" onkeyup="textarea_maxlen.isMax()" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');textarea_maxlen.disabledRightMouse()" onblur="textarea_maxlen.enabledRightMouse()" maxLength=40></textarea><p style="color:#FF0000;margin:10px 0 0 45px;height:20px;overflow:hidden;"><span id="ReqMemoMessageLi"></span></p></li></ul>';
	//var msg = '<div class="g_home_layer"><div class="dialog_answer" style="margin:20px 10px;font-size:14px;">';
	//msg += '<h3 style="font-size:14px;margin-bottom:11px;">�Է���������Ҫ�ش����������'+(f_sex == 'Ůʿ'?'��':'��')+'���к���</h3><ul class="answer_info" style="border-top:1px solid #D8D8D8;padding:30px 0 0 32px;"><li style="margin-bottom:20px;">�Է����ʣ�<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+questions[0]+'</span></li><li style="margin-bottom:20px;">���Ļش�<textarea name="ReqMemo" id="ReqMemo" cols="35" rows="4" maxLength=40 style="width:324px;height:62px;vertical-align: text-top;overflow-y:auto;" onkeyup="textarea_maxlen.isMax()" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');textarea_maxlen.disabledRightMouse()" onblur="textarea_maxlen.enabledRightMouse()" maxLength=40></textarea><p style="color:#666666;vertical-align: bottom;display:inline;">(�40����)</p><p style="color:#FF0000;margin:0 0 0 70px;height:20px;overflow:hidden;"><span id="ReqMemoMessageLi"></span></p></li><ul>';
	Total=questions.length;
	QOrder = 1;
	if(Total==1) button_name='�� ��';
	else button_name='��һ��';

	msg += '<div style="padding: 10px 0 10px 65px; line-height: 30px;" id="fasong"><input id="next" onclick="GetQuestion(\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\')" value="'+button_name+'" class="btn g_layer_alert_btn" type="button"><input type="button" class="btn g_layer_alert_btn" value="ȡ ��" onclick="hidePopWin(false)"></div>';
	for(i in questions){
		j = parseInt(i)+1;
		msg += '<input type="hidden" name="Question'+j+'" id="Question'+j+'" value="'+questions[i]+'"><input type="hidden" name="Answer'+j+'" id="Answer'+j+'">';
	}
	msg += '</div></div>';
	//Win.dialog({msg:msg, enter: "", type:'', button:'', btnalign:'center', title:'��Ϊ����', width:520, height:500});
	winOpen({'msg':msg,width:500,height:400,title:'����к�'});
}

function GetQuestion(fid, f_sex, f_face2, f_nickname, token, time) {
	if(checkForm()==false) return false;
	//if($("#ReqMemo").val()==''){
	//	$("#ReqMemoMessageLi").html('<font color="red">����������</font>');
	//	return false;
	//}else{
	//	$("#ReqMemoMessageLi").html('');
	//}
	// �����
	var QuestionAnswer = $('#ReqMemo').val();
	var atmp = "Answer"+QOrder;
	$("#"+atmp).val(QuestionAnswer);	// ��
	if (QOrder == Total) {		// �ύ
		disableButton(1);
		//document.form1.submit();
		do_question_verify(fid, f_sex, f_face2, f_nickname, token, time);
	}else {		// ������һ��
		QOrder++;
		var QuestionArea = $('#QuestionContent');
		var qtmp = "Question"+QOrder;
		QuestionArea.text($("#"+qtmp).val());
		$('#ReqMemo').val("");
		if (QOrder == Total) {
			//$('#AuthCodeLi').show();
			//document.getElementById('AuthCodeLi').style.display = '';
			$('#next').val("�� ��");
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
		error_msg_1 = '�����ݲ���Ϊ�գ�';
	}
	if (memo.length > 40) {
		error_msg_1 = '�����������벻Ҫ����40���֡���';
	}
	if (pattern.exec(memo) != null) {
		error_msg_1 = '������������ݺ�������Ϣ����';
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
		//$("#ReqMemoMessageLi").html('����������');
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
			$("#ReqMemoMessageLi").html('����������');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>��������</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});
		}else if(result==-2){
			$("#ReqMemoMessageLi").html('��������ʧ�ܣ������ԣ�');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>������ʧ�ܣ�������</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});	
		}else{
			//var mid = result.data.mid;
			var mid = result;
	    	//send_request_ok(fid, f_sex, f_face2, f_nickname, token, time, mid);
			pinjia(fid,f_sex,f_face2,f_nickname,mid,token,time);
	    	//var msg = '<div class="user_ask">';
			//msg += '<p class="ask_title color_green" style="font-size:16px;">��Ϊ��ͨ���ѵ������ѷ����Է���</p>';
			//msg += '</div>';
	    	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="ȷ��" class="dialog_btn" onclick=\'pinjia("'+fid+'","'+f_sex+'","'+f_face2+'","'+f_nickname+'","'+mid+'","'+token+'","'+time+'")\'>', title:'��Ϊ����', width:550, height:180});
		}
	});
}

//��ȷ�ʴ���֤
function exact_qa_verify(fid, f_sex, f_face2, f_nickname, token, time, question){
	var f_face2_80 = f_face2.replace("_130.", "_80.");
	if($.trim(f_face2_80)==''){
		if(f_sex == 'Ůʿ'){
			f_face2_80 = errorpic_woman_80;
		}else{
			f_face2_80 = errorpic_man_80;
		}
	}
	var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:500px;">';
	msg += '<div class="do"><div class="photo" style="width:100px;"><div class="img_box img_80"><img src="'+f_face2_80+'" /></div></div><div class="pop" style="margin:40px 0 0 20px;"><span class="arrow"></span><p>����Ҫ����ҵ�����������Ҵ��к�Ŷ��</p></div></div>';
	msg += '<ul class="answer_info" style="clear:both;padding:30px 0 0 32px;font-size:14px;"><li style="margin-bottom:10px;font-weight:bold;">���ʣ�<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+question+'</span></li><li>�ش�<textarea name="ReqMemo" id="ReqMemo" cols="35" rows="4" maxLength=40 style="width:324px;height:62px;vertical-align: text-top;overflow-y:auto;" onkeyup="textarea_maxlen.isMax()" onfocus="$(\'#ReqMemoMessageLi\').html(\'\');textarea_maxlen.disabledRightMouse()" onblur="textarea_maxlen.enabledRightMouse()" maxLength=40></textarea><p style="color:#FF0000;margin:10px 0 0 45px;height:20px;"><span id="ReqMemoMessageLi"></span></p></li></ul>';
	//var msg = '<div class="g_home_layer"><div class="dialog_answer" style="margin:20px 10px;font-size:14px;">';
	//msg += '<h3 style="font-size:14px;margin-bottom:11px;">�Է������˱�����ȷ�ش����������'+(f_sex == 'Ůʿ'?'��':'��')+'���к���</h3><ul class="answer_info" style="border-top:1px solid #D8D8D8;padding:30px 0 0 32px;"><li style="margin-bottom:20px;">�Է����ʣ�<span id="QuestionContent" style=\'word-wrap:break-word;word-break:break-all;\'>'+question+'</span></li><li style="margin-bottom:20px;">���Ļش�<input type="text" id="ReqMemo" style="width:219px;height:24px;vertical-align:middle;" maxlength="20" onfocus="$(\'#ReqMemoMessageLi\').html(\'\')" onkeydown="key_sub(event,\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\');" /><p style="color:#FF0000;margin-left:12px;display:inline;"><span id="ReqMemoMessageLi"></span></p></li></ul>';
	msg += '<div style="padding: 10px 0 10px 65px; line-height: 30px;" line-height: 30px;" id="fasong"><input id="next" onclick="do_exact_qa_verify(\''+fid+'\', \''+f_sex+'\', \''+f_face2+'\', \''+f_nickname+'\', \''+token+'\', \''+time+'\')" value="�ύ" class="btn g_layer_alert_btn" type="button"><input type="button" class="btn g_layer_alert_btn" value="ȡ��" onclick="hidePopWin(false)"></div>';
	msg += '</div></div>';
	//Win.dialog({msg:msg, enter: "", type:'', button:'', btnalign:'center', title:'��Ϊ����', width:520, height:500});
	winOpen({'msg':msg,width:500,height:400,title:'����к�'});
}

/**
 * ���س��ύ
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
		$("#ReqMemoMessageLi").html('�����������ݣ�');
		return false;
	}
	disableButton(1);
	$.ajaxFormPost("http://friend.51.com/friend/add_friend_question_api.php", {'friendid':fid,'ReqMemo':$("#ReqMemo").val(),'token':token,'time':time}, function(result){
		if(result==-1){
			$("#ReqMemoMessageLi").html('����������');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>��������</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});
		}else if(result==-2){
			$("#ReqMemoMessageLi").html('��������ʧ�ܣ������ԣ�');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>������ʧ�ܣ�������</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});	
		}else if(result==-3){
			$("#ReqMemoMessageLi").html('���ش����');
			disableButton(0);
			return false;
			//var msg = '<div class="user_ask">';	
			//msg += '<p class="t_c size_14" style="padding:10px 0;"><strong>�ش����</strong></p>';
			//msg += '</div>';
        	//Win.dialog({msg:msg, enter: "", type:'alert', btnalign:'center', button:'<input type=button value="�õģ���֪����" class="dialog_btn" onclick="Win.close()">', title:'��������', width:550, height:180});	
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
	msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '</div></div>';	
	winOpen({'msg':msg,width:400,height:180,title:title});
}

function send_request_ok(fid, f_sex, f_face2, f_nickname, token, time, mid){
	var msg = '<div class="g_home_layer"><div style="text-align: center; padding: 10px; line-height: 30px;">';
	msg += '<p style="text-align: center;">��Ϊ��ͨ���ѵ������ѷ����Է���</p><div class="dialog_button"><input onclick=\'pinjia("'+fid+'","'+f_sex+'","'+f_face2+'","'+f_nickname+'","'+mid+'","'+token+'","'+time+'")\' value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '</div></div>';

	winOpen({'msg':msg,width:250,height:180,title:'����к�'});
}

//����
var errorpic_man_130 = 'http://static.51img1.com/v3/themes/skins/images/none_130.gif';
var errorpic_woman_130 = 'http://static.51img1.com/v3/themes/skins/images/none_women_130.gif';
var appraise_girl = [[['���и��Ե�С����~',0,11],['��Ƭ�ĵĺ���Ŷ',1,12],['������峺��������',1,13],['��������ǰ��Ů����',1,14],['�Ǹ�ˮ�����СѾͷ',1,15],['ñ�Ӻ��ʺ���Ŷ',0,16],['Ц�ݺ�����~',1,17],['һ�һЦ������',1,1],['������Ů',0,2],['�������ʹ(*^_^*)',1,3],['Ƥ���ð��',1,4],['���ͺ��ʺ���Ŷ',0,5]],[['���������ش��������ˣ�����ʶ����',0,1],['���Ĳ������������ô����~',1,2],['�ҿ��԰��㶺Ц',0,3],['����Ӧ�û��Ϊ�ܺõ�����',0,4],['������������������',1,5],['�崿�ɰ���СŮ��',0,6],['����ְҵŮ�Եĸо���',1,7],['�൱������',1,8],['���ҵ�֪��',1,9],['����ĳ���ˡ�',1,10]],[['���ص���������Ҵ���к�~',0,6],['�����������',1,7],['������������',1,8],['Ư�����е���֣�',1,9],['���������°�~',1,10],['���һ������~',1,11],['����������������~',1,12],['�е�㻵',1,13],['С�ɰ�',0,14],['���Һ���ǻ���',1,15],['Ц�ݺ�����',1,16],['���Һ��й�ͬ����',1,17],['Ƥ���ܰ��',1,1]],[['���и��Ե�С����',0,2],['��������ǰ��Ů����',1,3],['���ر𣬿�����ʶ����',1,4],['���·����з���',1,5],['������������',1,6],['ԭ��������~����Ե~',0,7],['����һЦ������',0,8],['���ĺ����Ҹ���ʱ���У��',1,9],['�ཱུ�С��ÿɰ�',1,10],['�Ǹ����龫�ֵ�СѾͷ',1,11]]]
var appraise_boy = [[['ī���Ե���ܿ�Ŷ~',0,11],['ñ�Ӻ��ʺ���Ŷ',0,12],['��˹�ģ����ʱ���~',1,13],['�������Ƿ�����',1,14],['���а�ȫ��',1,15],['����ĳ���ˡ�',1,16],['Ц�ݸ�Ⱦ����',1,17],['���������',1,1],['�����ƺ��й����ʲݵ�ζ��~',1,2],['�����뿿һ��',1,3],['�Ǹ��������ص���',1,4]],[['���Ǹ�����^_^',1,1],['С�����ܿɰ�~',1,2],['������ʶ��Ŷ',1,3],['�۾��ܺÿ�',1,4],['����ôһ������������',1,5],['����װ��˧��ѽ~',1,6],['�����Ǹ��й��µ���',1,7],['��������ζŶ~~',1,8],['�����ڼҴ���',1,9],['��������ǰ��������~',1,10]],[['��������������',1,5],['����С����',0,6],['�����ڲ�ͬ',1,7],['��˧��~����',1,8],['����Ŷ~�����',0,9],['�е���������',1,10],['��ʵ���',1,11],['ϲ�����Ц��',0,12],['�����������',0,13],['��ĺܲ���Ŷ^_^',1,14],['���и�������Ŷ~',1,15],['��ð�~��ʶһ�°�',0,16]],[['���ǻ��Ϊ�ܺõ�����',0,17],['�Ǹ���������',1,1],['������ʶһ�����~',0,2],['��ĺܲ���Ŷ',1,3],['�ߴ�˧��',1,4],['����ĳ���ˡ�',1,5],['ϲ�����Ц��',0,6],['���������',1,7],['����������Ҵ���к�^_^',0,8],['�Ǹ��������ص���',1,9],['���а�ȫ��~',1,10],['���ͺܿ�',1,11]]];
var word_index;
function pinjia(fid, f_sex, f_face2, f_nickname, mid, token, time){
	var rec_appraise = new Array();
	var info = '';
	//var appraise_girl = new Array('Ц�ݺ���ܿɰ�', '����ܵ���', '��������', '�ǳ��ɰ�', '�����ڼ�С����', '�Ը�����', '�������Ķ���', '�崿����', '��ٺܾ���', '���Һ���ǻ���', '���Ķ���', '��������һ��','��������','�������Ѫ��','���ľ�','��������','����Ů~');
	//var appraise_boy  = new Array('�е㻵���ĸо�Ŷ~','�ߴ�˧��','������','���ڼҴ���','��ʱ�к���Ʒζ','��������ζ','˧˧��~','�������ܾ���','������������Ŷ~','��ĺܲ���Ŷ','�Ǹ��й��µ���','˼��������','���ͺܿ�','���˺��а�ȫ��','�����ڲ�ͬ','˹˹���ĵ�~');
	if(f_sex == 'Ůʿ'){
		word_index=Math.floor(Math.random()*4);
		rec_appraise = appraise_girl[word_index];
	}else{
		word_index=Math.floor(Math.random()*4);
		rec_appraise = appraise_boy[word_index];
	}

	if($.trim(f_face2)==''){
		if(f_sex == 'Ůʿ'){
			f_face2 = errorpic_woman_130;
		}else{
			f_face2 = errorpic_man_130;
		}
	}

	var tip_info = '<p><span class="color_red">����ϸ�ڣ�</span>��������Ը���������ϲ������С�������������ķ��͡����ţ��������ܿ���Ŷ��</p>';
	
	var msg = '<div class="g_home_layer"><div class="dialog_block">';
	msg += '<div class="do">';
	msg += '<div class="photo" style="width:140px"><div class="img_box img_130"><img src="'+f_face2+'" /></div><p>'+f_nickname+'</p></div>';
	msg += '<div class="pop"><span class="arrow"></span><p>����ҵ�ӡ����ʲô�أ�</p></div>';
	msg += '</div>';
	//msg += '<p class="t_r color_light">����ѡ��һ���ʣ�</p>';
	msg += '<ul class="friends_commend clear" id="yx_msg">';

	for(i=0; i<rec_appraise.length; i++){
		//var index = i+1;
		var yx = '';
		if(rec_appraise[i][1]==1) yx = '�Ҿ�����' + rec_appraise[i][0];
		else yx = rec_appraise[i][0];
		msg += '<li onmouseover="$(this).attr(\'class\',\'current\')" onmouseout="$(this).attr(\'class\',\'\')"><span title="'+yx+'" class="color_'+rec_appraise[i][2]+'" onclick="dopinjia(\''+fid+'\', 0, \''+yx+'\',\''+mid+'\',\''+token+'\',\''+time+'\')">'+rec_appraise[i][0]+'</span></li>';
	}

	msg += '</ul>';
	//msg += '<p class="clear"><a href="" class="commend_more" onclick="setlocation({height:500}); $(\'#appraise_content\').get(0).style.display=\'block\'; $(\'#fasong\').get(0).style.display=\'block\'; return false;">����</a></p>';
	//msg += '<div style="text-align:center; padding:20px 20px 0 0; display:none" id="appraise_content"><label style="color:#999;">˵˵��������������ĵط���</label><input type="text" id="appraise" class="input_text" style="height:22px;padding:8px 2px 0;vertical-align:middle;" maxlength="10" /></div>';
	//msg += '<div style="text-align:center; padding:20px 20px 0 0; display:none" id="fasong"><input onclick="dopinjia(\''+fid+'\',\''+ 1+'\', \''+''+'\',\''+mid+'\',\''+token+'\',\''+time+'\')" value="����" class="btn g_layer_alert_btn" type="button"></div>';
	msg += '<p style="text-align:right;"><a href="javascript:void(0)" onclick="change_word(\''+fid+'\',\''+f_sex+'\',\''+mid+'\',\''+token+'\',\''+time+'\')">[��Щ��]</a></p>';
	msg += '<div class="diy_area"><label>...������д��</label><input type="text" id="appraise" class="input_text" style="" maxlength="16" onfocus="change_tip(1,\''+f_sex+'\')" onblur="change_tip(0,\''+f_sex+'\')" />&nbsp;&nbsp;<input type="button" id="friend_rename_click" onclick="dopinjia(\''+fid+'\',\''+ 1+'\', \''+''+'\',\''+mid+'\',\''+token+'\',\''+time+'\')" class="g_btn" value="����"><div class="g_hint g_arrow_up"><div class="g_hint_wrap" id="tip"><span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p>ÿ���˶�ϣ���յ�����Ϊ'+(f_sex=='Ůʿ'?'��':'��')+'��д�Ķ���</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div></div></div></div>';
	msg += '</div></div>';
	//Win.dialog({msg:msg, enter: "", type:'', button:'', btnalign:'center', title:'��Ϊ����', width:520, height:500});	
	winOpen({'msg':msg,width:550,height:580,title:'����к�'});
    
}

function change_tip(type,f_sex){
	var sex_info=(f_sex=='Ůʿ'?'��':'��');
	if(type==1){
		if(f_sex=='Ůʿ'){
			$('#tip').html('<span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p><span class="color_red">����ϸ�ڣ�</span>��������Ը���������ϲ������С�������������ķ��͡����ţ��������ܿ���Ŷ��</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div>');
		}else{
			$('#tip').html('<span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p><span class="color_red">����ϸ�ڣ�</span>��������Ը���������ϲ����������Ц�ݡ��������ķ��͡����ţ��������ܿ���Ŷ��</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div>');
		}
	}else{
		$('#tip').html('<span class="g_arrow"></span><div class="g_box_t"><div class="g_box_t_l"></div><div class="g_box_t_r"></div></div><div class="g_box_l"><div class="g_box_r"><p>ÿ���˶�ϣ���յ�����Ϊ'+sex_info+'��д�Ķ���</p></div></div><div class="g_box_b"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div>');		
	}
}

function change_word(fid,f_sex,mid,token,time){
	if(word_index<3) word_index++;
	else word_index=0;
	if(f_sex == 'Ůʿ'){
		rec_appraise = appraise_girl[word_index];
	}else{
		rec_appraise = appraise_boy[word_index];
	}

	var msg='';
	for(i=0; i<rec_appraise.length; i++){
		//var index = i+1;
		var yx = '';
		if(rec_appraise[i][1]==1) yx = '�Ҿ�����' + rec_appraise[i][0];
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
			//alert("��ѡ��һ��ӡ����");
			//return false;
		}else if(appraise.replace(/[^\x00-\xff]/g, "aa").length>32){
			alert("�������16�����֣�");
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
			msg += '<p class="size_14"><strong>��ɹ��ش��˸��к���</strong></p>';
			msg += '</div><div class="send_again"><p class="size_14"><img src="http://static.51img1.com/v3/themes/skins/images/new/ico_gift.gif" />���ͷ������ʾ��������ڲ�ͬ��</p><p class="color_light">������������ӱ�������Է����ܺ�ֱ����Ϊ�����ѣ�</p></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input type=button value="ȥ��������" class="btn g_layer_alert_btn" onclick="window.open(\'http://jiaoyou.51.com/?c=gift&uid='+fid+'\'); hidePopWin(false)">&nbsp;<input type=button value="������" class="btn g_layer_alert_btn" onclick="hidePopWin(false)"></div>';	
			winOpen({'msg':msg,width:450,height:300,title:'����к�'});       
		}else{
			//winOpen({'msg':msg,width:520,height:500,title:'��Ϊ����'});
			var msg = '�к�����ʧ��';
			show_request_info(msg,'����к�');
			//Alert({'msg':msg,width:520,height:300,title:'����к�'});
			//Win.dialog({msg:info, enter: "", type:'alert', button:'', btnalign:'center', title:'��Ϊ����', width:420, height:150});
		}	
	})
}

//��������
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
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
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">�����Ѿ��Ǻ�������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
			}else if(f_relation==1){
				if(f_sex=='Ůʿ'){
					//var msg = '<div class="dialog_prompt" style="padding-top:52px;">';
					//msg += '<p style="text-align: center;font-weight:bold">��Ҫ��'+f_nickname+'��Ϊ��ĺ�������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_relation_up('+fid+')" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div>';
					//msg += '</div>';	
					var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>��Ҫ���Է���Ϊ��ĺ�������</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'��'+f_friend+'��</div></div>';
					msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div></div>';
					winOpen({'msg':msg,width:350,height:280,title:'��Ϊ������'});
				}else{
					if(f_sex_friend == 'Ůʿ'){
						var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:400px;">';
						msg += '<div class="do"><div class="photo" style="width:80px;"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin:25px 0 0 0;"><span class="arrow"></span><p>˵˵��Ϊʲô����ҳ�Ϊ�������أ�</p></div></div>';
						msg += '<div class="upgrade_contain"><div class="wrap"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')"></textarea><p>^_^ ÿ��Ů����ϣ���յ��Է�����Ϊ��д�Ļ������ĵ�Ŷ��</p></div></div>';
						msg += '<div style="clear:both;padding: 20px 0 0 120px; line-height: 30px;"><span class="g_btn_w"><input type="button" class="g_btn" value="������������" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></span></div></div>';
					}else{
						var msg = '<div class="g_home_layer"><div class="dialog_block change_level">';
						msg += '<div class="do"><div class="photo"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin-top:30px;"><span class="arrow"></span><p>˵˵��Ϊʲô����ҳ�Ϊ�������أ�</p></div></div>';
						msg += '<div class="send_request"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')">'+f_nickname+'����ã�\n�����������Ϊ�����Ѱɣ��������Ǿ���ֱ�������ˣ�</textarea>';
						msg += '<div class="btn_area"><input type="button" class="btn g_layer_alert_btn" value="������������" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></div><p>��������Ϊ�����ѣ������׳ɹ���<a href="http://jiaoyou.51.com/?c=gift&uid='+fid+'" target="_blank">ȥ������&gt;&gt;</a></p></div>';
						msg += '</div></div>';						
					}
					winOpen({'msg':msg,width:450,height:350,title:'��Ϊ������'});
				}
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">���ѹ�ϵ����</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});				
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
			var msg = '<div class="g_home_layer"><div class="change_guanxi" style="padding-bottom:30px"><strong><span class="color_green">�����ɹ���</span>���ǳ�Ϊ�˺����ѡ�</strong></div><div style="text-align:center">��ע��<input name="friend_alias" id="friend_alias" type="text" value="�ɲ���" class="input_text" onclick="clear_input_text(\'friend_alias\', \'�ɲ���\');" style="color:#999;width:100px" maxlength="16" /></div><div style="text-align: center; padding: 40px 0 0; line-height: 30px;"><input onclick="set_friend_alias('+fid+');'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div></div>';

			//msg += '</div>';	
			winOpen({'msg':msg,width:350,height:250,title:'��Ϊ������'});
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
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
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">�����Ѿ��Ǻ�������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
			}else if(f_relation==1){
				if(f_sex=='Ůʿ'){
					eval(func);
				}else{
					if(f_sex_friend == 'Ůʿ'){
						var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:400px;">';
						msg += '<div class="do"><div class="photo" style="width:80px;"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin:25px 0 0 0;"><span class="arrow"></span><p>˵˵��Ϊʲô����ҳ�Ϊ�������أ�</p></div></div>';
						msg += '<div class="upgrade_contain"><div class="wrap"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')"></textarea><p>^_^ ÿ��Ů����ϣ���յ��Է�����Ϊ��д�Ļ������ĵ�Ŷ��</p></div></div>';
						msg += '<div style="clear:both;padding: 20px 0 0 120px; line-height: 30px;"><span class="g_btn_w"><input type="button" class="g_btn" value="������������" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></span></div></div>';
					}else{
						var msg = '<div class="g_home_layer"><div class="dialog_block change_level">';
						msg += '<div class="do"><div class="photo"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin-top:30px;"><span class="arrow"></span><p>˵˵��Ϊʲô����ҳ�Ϊ�������أ�</p></div></div>';
						msg += '<div class="send_request"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')">'+f_nickname+'����ã�\n�����������Ϊ�����Ѱɣ��������Ǿ���ֱ�������ˣ�</textarea>';
						msg += '<div class="btn_area"><input type="button" class="btn g_layer_alert_btn" value="������������" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></div><p>��������Ϊ�����ѣ������׳ɹ���<a href="http://jiaoyou.51.com/?c=gift&uid='+fid+'" target="_blank">ȥ������&gt;&gt;</a></p></div>';
						msg += '</div></div>';						
					}
					winOpen({'msg':msg,width:450,height:350,title:'��Ϊ������'});
				}
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">���ѹ�ϵ����</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});				
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
			$('#fan_'+fid).html('<a class="bothway_friend" title="˫���ע" href="javascript:void(0);"><img src="http://static.51img1.com/v3/themes/skins/images/spacer.gif" /></a>');
			eval(func);
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
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
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">�����Ѿ��Ǻ�������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
			}else if(f_relation==1){
				if(f_sex=='Ůʿ'){
					//var msg = '<div class="dialog_prompt" style="padding-top:52px;">';
					//msg += '<p style="text-align: center;font-weight:bold">��Ҫ��'+f_nickname+'��Ϊ��ĺ�������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_relation_up('+fid+')" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div>';
					//msg += '</div>';	
					var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>��Ҫ���Է���Ϊ��ĺ�������</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'��'+f_friend+'��</div></div>';
					msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div></div>';
					winOpen({'msg':msg,width:350,height:280,title:'��Ϊ������'});
				}else{
					if(f_sex_friend == 'Ůʿ'){
						var msg = '<div class="g_home_layer"><div class="dialog_block" style="width:400px;">';
						msg += '<div class="do"><div class="photo" style="width:80px;"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin:25px 0 0 0;"><span class="arrow"></span><p>˵˵��Ϊʲô����ҳ�Ϊ�������أ�</p></div></div>';
						msg += '<div class="upgrade_contain"><div class="wrap"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')"></textarea><p>^_^ ÿ��Ů����ϣ���յ��Է�����Ϊ��д�Ļ������ĵ�Ŷ��</p></div></div>';
						msg += '<div style="clear:both;padding: 20px 0 0 120px; line-height: 30px;"><span class="g_btn_w"><input type="button" class="g_btn" value="������������" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></span></div></div>';
					}else{
						var msg = '<div class="g_home_layer"><div class="dialog_block change_level">';
						msg += '<div class="do"><div class="photo"><div class="img_box img_50"><img width="50" height="50" src="'+f_face2_50+'" /></div></div><div class="pop" style="margin-top:30px;"><span class="arrow"></span><p>˵˵��Ϊʲô����ҳ�Ϊ�������أ�</p></div></div>';
						msg += '<div class="send_request"><textarea name="mail_cont" id="mail_cont" onkeyup="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')" onkeydown="mail_check2(event,\''+fid+'\',\''+f_nickname+'\')">'+f_nickname+'����ã�\n�����������Ϊ�����Ѱɣ��������Ǿ���ֱ�������ˣ�</textarea>';
						msg += '<div class="btn_area"><input type="button" class="btn g_layer_alert_btn" value="������������" onclick="mail_reply2(\''+fid+'\',\''+f_nickname+'\'); return false;" /></div><p>��������Ϊ�����ѣ������׳ɹ���<a href="http://jiaoyou.51.com/?c=gift&uid='+fid+'" target="_blank">ȥ������&gt;&gt;</a></p></div>';
						msg += '</div></div>';						
					}
					winOpen({'msg':msg,width:450,height:350,title:'��Ϊ������'});
				}
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">���ѹ�ϵ����</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});				
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
			var msg = '<div class="g_home_layer"><div class="change_guanxi" style="padding-bottom:30px"><strong><span class="color_green">�����ɹ���</span>���ǳ�Ϊ�˺����ѡ�</strong></div><div style="text-align:center">��ע��<input name="friend_alias" id="friend_alias" type="text" value="�ɲ���" class="input_text" onclick="clear_input_text(\'friend_alias\', \'�ɲ���\');" style="color:#999;width:100px" maxlength="16" /></div><div style="text-align: center; padding: 40px 0 0; line-height: 30px;"><input onclick="set_friend_alias('+fid+');'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div></div>';

			//msg += '</div>';	
			winOpen({'msg':msg,width:350,height:250,title:'��Ϊ������'});
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
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
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==0){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">�����Ѿ��Ǻ�������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});
			}else if(f_relation==1){
					var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>��Ҫ���Է���Ϊ��ĺ�������</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'��'+f_friend+'��</div></div>';
					msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div></div>';
					winOpen({'msg':msg,width:350,height:280,title:'��Ϊ������'});
			}else{
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">���ѹ�ϵ����</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ������'});				
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
			var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong><span class="color_green">�����ɹ���</span><br/><br/>���ǳ�Ϊ�˺����ѡ�</strong></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);window.location.reload();" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div></div>';
			winOpen({'msg':msg,width:350,height:250,title:'��Ϊ������'});
		}else{
			winOpen({'msg':info,width:350,height:250,title:'��Ϊ������'});
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
 * ����ı���
 * @param	string	input_id	�ı���id
 * @param	string	text_cont	�ı������ݣ����ı��������������ʱ�������
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
			alert("�������8�����֣�");
			return false;
	}
	$.ajaxFormPost("http://friend.51.com/friend/change_friend_relation_api.php", {'userid':fid,'cont':cont,'act':'alias'}, function(data){
		if(data == -1) {
			alert('��ע����16�ֽ����ڣ�');
			return false;
		}else if(data == -2) {
			alert('��עֻ��Ϊ�������ġ�Ӣ�ġ����֣�');
			return false;
		}else if(data == 0) {
			alert('��ע����ʧ�ܣ�');
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

//���ѽ���
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ��ͨ����'});
		}else if(status == 3){
			var f_nickname = result.data.nickname;
			var f_face2 = result.data.face2;
			var f_sex = result.data.sex;
			var f_sex_friend = result.data.sex_friend;
			var f_relation = result.data.relation;
			var f_friend = result.data.friend;
			var f_face2_50 = f_face2.replace("_130.", "_50.");
			if($.trim(f_face2_50)==''){
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			if(f_relation==1){
				var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
				msg += '<p style="text-align: center;">�����Ѿ�����ͨ������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
				msg += '</div></div>';	
				winOpen({'msg':msg,width:350,height:180,title:'��Ϊ��ͨ����'});
			}else{
				//var msg = '<div class="dialog_prompt" style="padding-top:52px;">';
				//msg += '<p style="text-align: center;">��Ҫ��'+f_nickname+'��Ϊ�����ͨ������</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="do_relation_down('+fid+')" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div>';
				//msg += '</div>';	
				var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>��Ҫ���Է���Ϊ�����ͨ������</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'��'+f_friend+'��</div></div>';
				msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div></div>';
				winOpen({'msg':msg,width:350,height:280,title:'��Ϊ��ͨ����'});
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
			var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong><span class="color_green">�����ɹ���</span><br/><br/>���ǳ�Ϊ����ͨ���ѡ�</strong></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div></div>';
			//msg += '</div>';	
			winOpen({'msg':msg,width:350,height:250,title:'��Ϊ��ͨ����'});	
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div></div>';
			msg += '</div>';	
			winOpen({'msg':msg,width:350,height:180,title:'��Ϊ��ͨ����'});
		}
	})
}


function mail_reply2(f_uid,f_nickname) {
	var cont = $("#mail_cont").val();
	cont = $.trim(cont);
	if(cont.length == 0) {
		alert("�ż����ݲ���Ϊ��Ŷ");
		return false;
	}
	if(cont.length > 500) {
		alert("�ż����ݲ��ܳ���500���ַ�");
		return false;
	}
	cache_cont2 = cont;
	//winOpen({'msg':'<center>���ڷ�����... </center>',width:350,height:180,title:'��ʾ'});
	//Win.dialog({msg:'<center>���ڷ�����... </center>',type:'warn',btnalign:'center',timeout:2000});
	//window.setTimeout("mail_send2('"+f_uid+"','"+f_nickname+"')", 1000);
	mail_send2(f_uid,f_nickname);
}

var g_issend2 = 0;
var cache_cont2 = "";
function mail_send2(f_uid,f_nickname) {
	var cont = cache_cont2;
	if(cont=="") cont = f_nickname + '����ã�\n�����������Ϊ�����Ѱɣ��������Ǿ���ֱ�������ˣ�';
	if(g_issend2 == 1) return;
	g_issend2 = 1;
	$.ajaxFormPost("http://friend.51.com/friend/change_friend_relation_api.php", {'userid':f_uid,'cont':cont,'act':'sendmail'}, function(data){
		g_issend2 = 0;
		//Win.close();
		if(data == -2) {
			//Win.dialog({msg:'<center>���ܺ�ͬ��д�š� </center>',type:'alert',btnalign:'center'});
		}
		else if(data == -3) {
			//Win.dialog({msg:'<center>�Բ������ǻ����Ǻ����ѣ�����д�š� </center>',type:'alert',btnalign:'center'});
			//winOpen({'msg':'�Բ������ǻ����Ǻ����ѣ�����д�š�',width:350,height:180,title:'��ʾ'});
			show_request_info('�Բ������ǻ����Ǻ����ѣ�����д�š�','��Ϊ������');
		}
		else if(data == 1) {
			//Win.dialog({msg:'<center>���������ͳɹ���</center>',type:'alert',btnalign:'center',title:'��ʾ'});
			//winOpen({'msg':'���������ͳɹ���',width:350,height:180,title:'��ʾ'});
			show_request_info('���������ͳɹ���','��Ϊ������');
		}
		else{
			//Win.dialog({msg:'<center>����ʧ�ܡ� </center>',type:'alert',btnalign:'center'});
			//winOpen({'msg':'����ʧ�ܡ�',width:350,height:180,title:'��ʾ'});
			show_request_info('����ʧ�ܡ�','��Ϊ������');
		}
	});	
}

function mail_check2(e,f_uid,f_nickname) {
	var lass = 500-$("#mail_cont").val().length;
	if(lass <= 0 && !((e || window.event).keyCode<=46)) {
		var cont = $("#mail_cont").val();
		$("#mail_cont").val(cont.substr(0, 500));
		//$("#charlength").html("�ż����ݲ��ܳ���500�����֡�");
		alert("�ż����ݲ��ܳ���500�����֡�");
		return;
	}
	//$("#charlength").html('');
	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		mail_reply2(f_uid,f_nickname);
	}
}

//ɾ������
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'ɾ��'});
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
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			var msg = '<div class="g_home_layer"><div class="change_guanxi"><strong>��Ҫ���Է��Ӻ�����ɾ����</strong><div class="friend_mes"><img width="50" height="50" src="'+f_face2_50+'" class="photo"/>'+f_nickname.substr(0,5)+'��'+f_friend+'��</div></div>';
			msg += '<div style="text-align: center; padding: 0px; line-height: 30px;"><input onclick="hidePopWin(false);'+func+'" value="ȷ��" class="btn g_layer_alert_btn" type="button">&nbsp;&nbsp;<input onclick="hidePopWin(false)" value="ȡ��" class="btn g_layer_alert_btn" type="button"></div></div>';
			winOpen({'msg':msg,width:350,height:280,title:'ɾ��'});
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
			//var msg = '<div class="change_guanxi"><strong><span class="color_green">�����ɹ���</span><br/><br/>���ǳ�Ϊ����ͨ���ѡ�</strong></div><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false);relation_reflash();" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			//msg += '</div>';	
			//winOpen({'msg':msg,width:350,height:250,title:'��Ϊ��ͨ����'});
			if(func!='') eval(func);
		}else{
			var msg = '<div class="g_home_layer"><div class="dialog_prompt" style="padding-top:52px;">';
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'ɾ��'});
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'�ܾ�'});
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
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
		
			msg = '<textarea id="refuse_mail_cont" onkeydown="mail_check3(event,\''+fid+'\',\''+f_nickname+'\')"  onkeyup="mail_check3(event,\''+fid+'\',\''+f_nickname+'\')" style="width:355px;height:115px;overflow-y:auto;color:#666;">'+f_nickname+'����ã�\n�Ҿ������ǻ����Ǻ��죬��ʱ��������Ϊ�����ѡ�</textarea>';
			Win.dialog({msg:msg, enter: "", type:'alert', button:'<input onclick="mail_reply3('+fid+')" value="����" class="dialog_btn" type="button"><input onclick="Win.close(false)" value="ȡ��" class="dialog_btn" type="button">', btnalign:'center', title:'�ܾ�', width:425, height:230});
			
		}
	})
}

function mail_check3(e,f_uid,f_nickname) {
	var lass = 500-$("#refuse_mail_cont").val().length;
	if(lass <= 0 && !((e || window.event).keyCode<=46)) {
		var cont = $("#refuse_mail_cont").val();
		$("#refuse_mail_cont").val(cont.substr(0, 500));
		alert("�ż����ݲ��ܳ���500�����֡�");
		return;
	}
	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		refuse_relation_up(f_uid);
	}
}

function mail_reply3(friend) {
		var cont = $("#refuse_mail_cont").val().trim();
		if(cont=='') {
				Win.dialog({msg:'<center>�ż����ݲ���Ϊ�ա� </center>',type:'alert',btnalign:'center'});
				return;
		}
		sending2(friend,cont);
}

function sending2(friend,cont) {
	Win.dialog({msg:'<center>���ڷ�����... </center>',type:'warn',btnalign:'center',cancel:'location.reload()',timeout:2000});
	mail_send3(friend,cont);
}

var g_issend = 0;
function mail_send3(friend,cont) {
	if(g_issend == 1) return;
	g_issend = 1;
	$.post('/?c=webmail&a=send&mailtype=3&uid='+friend,{cont:cont},function (data){
		g_issend = 0;
		if(data == -3)  {
			Win.dialog({msg:'<center>�Բ������ǻ��������ѣ�����д�š� </center>',type:'alert',btnalign:'center'});
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
			msg += '<p style="text-align: center;">'+info+'</p><div style="text-align: center; padding: 10px; line-height: 30px;"><input onclick="hidePopWin(false)" value="ȷ��" class="btn g_layer_alert_btn" type="button"></div>';
			msg += '</div></div>';	
			winOpen({'msg':msg,width:350,height:180,title:'�ܾ�'});
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
				if(f_sex_friend == 'Ůʿ'){
					f_face2_50 = errorpic_woman_50;
				}else{
					f_face2_50 = errorpic_man_50;
				}
			}
			msg ='<textarea id="refuse_mail_cont" onkeydown="mail_check_new(event,\''+fid+'\',\''+f_nickname+'\')" onkeyup="mail_check_new(event,\''+fid+'\',\''+f_nickname+'\')" style="height: 115px; overflow-y: auto; color: rgb(102, 102, 102); margin: 20px 0pt 0pt 35px; width: 350px;">'+f_nickname+'����ã��Ҿ������ǻ����Ǻ��죬��ʱ��������Ϊ�����ѡ�</textarea>';
			msg+='<div style="margin: 20px 0pt 0pt; text-align: center;" class="btn_area"><span class="g_btn_w"><input type="button" onclick="mail_reply_new('+fid+')" value="����" class="g_btn"></span><span class="g_btn_w"><input type="button" onclick="hidePopWin(false)" value="ȡ��" class="g_btn"></span></div>';
			winOpen({msg:msg,width:425,height:230,title:'�ܾ�'});
		}
	})
}

function mail_check_new(e,f_uid,f_nickname) {
	var lass = 500-$("#refuse_mail_cont").val().length;
	if(lass <= 0 && !((e || window.event).keyCode<=46)) {
		var cont = $("#refuse_mail_cont").val();
		$("#refuse_mail_cont").val(cont.substr(0, 500));
		alert("�ż����ݲ��ܳ���500�����֡�");
		return;
	}
	if((e || window.event).keyCode==13 && (e || window.event).ctrlKey){
		refuse_relation_up_new(f_uid);
	}
}

function mail_reply_new(friend) {
		var cont = $("#refuse_mail_cont").val().trim();
		if(cont=='') {
			Alert({msg:'<span style="font-size:14px;margin-left:10px">�ż����ݲ���Ϊ�ա� </span>',title:'��ʾ',width:250,height:140}); 
			return;
		}
		sending_new(friend,cont);
}

function sending_new(friend,cont) {
	winOpen({msg:'<center style="font-size:14px;margin-top:30px">���ڷ�����... </center>',width:250,height:100,title:'��ʾ'}); 
	mail_send_new(friend,cont);
}

function mail_send_new(friend,cont) {
	if(g_issend == 1) return;
	g_issend = 1;
	$.post('/?c=webmail&a=send&mailtype=3&uid='+friend,{cont:cont},function (data){
		g_issend = 0;
			if(data == -3)  {
				Alert({msg:'<span style="font-size:12px;">�Բ������ǻ��������ѣ�����д�š� </span>',title:'��ʾ',width:300,height:140}); 
			}
			if(data == 3)  {
				Alert({msg:'<span style="font-size:14px;margin-left:10px">�ż����ݲ���Ϊ�ա� </span>',title:'��ʾ',width:250,height:140}); 
			}
			if(data == 2)  {
				Alert({msg:'<span style="font-size:14px;">�𾴵��û������ã����ڴ��ĺ�������Υ����Ϣ����ֹ���͡�</span>',title:'��ʾ',width:400,height:160}); 
			}
			if(data == 1)  {
				Alert({msg:'<span style="font-size:14px;margin-left:18px">���ͳɹ��� </span>',title:'��ʾ',width:250,height:140,enter:function(e){
					window.location.href="http://jiaoyou.51.com/?c=webmail#mailtop";
				}}); 
			}
	});
}

function show_tip(){
	$(document.body).append('<div id="pop_hello" style="z-index:100000;position:absolute;display:none"><div class="global_popup" id="global_popup" style="width: 268px; height: 80px; z-index: 1; position: relative;"><table border="0" id="global_popup_table" class="global_popup_table"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:266px;height:78px;border:1px solid rgb(121, 121, 121);"><div style="color:#606060;font-size:14px;font-weight:bolder;padding-left:75px;background:url(http://static.51img1.com/v3/themes/skins/images/new/ico_tick.gif) 33px 25px no-repeat;height:78px;line-height:78px;">��ɹ��ش��˸��к���</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table></div></div>');

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
	var html = '<div id="pop_tip_follow_'+fid+'" style="z-index:100001;position:absolute;display:block;padding:20px;clear:both;" class="clear"><table border="0" id="global_popup_table" class="global_popup_table"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" class="global_popup_content" id="global_popup_content" style="width:220px; height:75px; border: 1px solid rgb(121, 121, 121);"><div class="global_dialog_content"><div style="text-align:center;font-size:14px;font-weight:bold;line-height:24px;margin:25px 0 0 20px;background:url(http://static.51img1.com/v5/my/images/icon_friends.gif) 45px -108px no-repeat;">�����ɹ�</div></div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table></div>';
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
