var jiaoyou = {
	writemail : function(to, defMsg) {
		document.domain = "51.com";
		// ���ж��Ƿ���20
		data = '-4';
		$.getJSON('http://jiaoyou.51.com/?c=hudong&a=getpointJson&to=' + to + '&jsoncallback=?',
						function(data) {
							var type = data['type'];
							var url = data['url'];
							var sex = data['sex'];
							var uid = data['uid'];
							data = parseInt(data['data']);
							
							if (type == 'not_login'){
								window.location.href =url? 'http://passport.51.com/passport.5p?gourl=' + url : 'http://passport.51.com/passport.5p' ;
							}else if (type == 'not_open'){
								window.location.href = 'http://jiaoyou.51.com/?c=welcome';
							}else if (data == -3) {
								var cont = '<div class="size_14 bold t_c" style="padding:40px 0;text-align:center;">�Է�����ĺ�������,����д��</div>';
								cont  +='<div style="text-align:center;"><span class="g_btn_w"><input value="ȷ��" onclick="hidePopWin(false);" class="g_btn" type="button"/></span></div>';
								winOpen({msg:cont,width:330,height:180,title:'��ʾ'});
								return false;
							} else if (data == -6) {
								var cont = '<div class="size_14 bold t_c" style="padding:40px 0;text-align:center;">���ڶԷ��ĺ�������,����д��</div>';
								cont  +='<div style="text-align:center;"><span class="g_btn_w"><input value="ȷ��" onclick="hidePopWin(false);" class="g_btn" type="button"/></span></div>';
								winOpen({msg:cont,width:330,height:180,title:'��ʾ'});
								return false;
							} else if (data == -4) {
								var cont='<div style="text-align:center;line-height:24px;margin:20px 0 0;">ϵͳ��æ!</div>';
								cont+='<div style="text-align:center;padding:10px 10px 20px;line-height:30px"><span class="g_btn_w"><input type="submit" onclick="hidePopWin(false);" class="g_btn" value="ȷ��"></span></div>';
								winOpen({msg:cont,width:330,height:180,title:'��ʾ'});
								return false;
							}else if (data == -5) {
								var cont = '<div class="size_14 bold t_c" style="padding:40px 0;text-align:center;">�㲻�ܸ��Լ�д��Ŷ^_^</div>';
								cont  +='<div style="text-align:center;"><span class="g_btn_w"><input value="ȷ��" onclick="hidePopWin(false);" class="g_btn" type="button"/></span></div>';
								winOpen({msg:cont,width:330,height:180,title:'��ʾ'});
								return false;
							} else{
								var url = 'http://jiaoyou.51.com/?c=webmail&a=write&friend=' + to;
								if (typeof (defMsg) != 'undefined'){
									url += '&defmsg=' + encodeURIComponent(defMsg);
								}
								var cont='<iframe src="'+url+'" style="width:100%;height:100%" frameborder=0 id="win_frame"></iframe>';
								winOpen({msg:cont,width:780,height:550,title:'д��'});
								$(".dialog_content").css("margin", "0px");
								$("#win_frame").css("overflow", "hidden");
							}
						});
	},
	chatMsg : function (f_uid){
		$.getJSON(
				'http://jiaoyou.51.com/?c=hudong&a=date&fuid='+f_uid+'&jsoncallback=?',
				function(data) {
					var type = data['type'];
					var url = data['url'];
					var nickname = data['nickname'];
					var sex = data['sex'];
					var f_face = data['f_face'];
					var f_nickname = data['f_nickname'];
					if (type == 'not_login'){
						window.location.href =url? 'http://passport.51.com/passport.5p?gourl=' + url : 'http://passport.51.com/passport.5p' ;
					}
					else if(type == 'not_open'){
						window.location.href = 'http://jiaoyou.51.com/?c=welcome';
					}
					else if(type == null || type === ''){
						var cont = '<div style="padding:20px 0 0;"><p style="font-weight:bold;font-size:16px;text-align:center;margin-top:30px" class="t_c">';
						cont += '���ǻ���İ���ˣ�����Լ�����죬<br></br>�ȸ��Ҵ���к��ɡ�';
						cont += '</p><div class="you_can" style="clear:both;padding:25px 0 0;padding-left:120px;margin-left: 30px;"><ul>';
						cont += '</ul></div></div>';
						winOpen({msg:cont,width:300,height:180,title:'Լ������'});
					}
					else if(type == 0){
						if(sex == "����"){
							var cont ='<div style="padding:20px 0 0;"><p style="margin-top:30px;font-weight:bold;font-size:16px;text-align:center;" class="t_c">';
							cont += '��Ŷ��˧�磬�㻹�����ҵĺ����ѣ�����Լ�����졣';
							cont += '</p><div class="you_can" style="clear:both;padding:25px 0 0;padding-left:120px;">';
							cont += '<ul><li style="background:url(http://static.51img1.com/v3/jiaoyou/images/pic.gif) no-repeat scroll 0 0 transparent;height:40px;padding:10px 0 0 50px;list-style:none outside none;">����<a href="###" onclick="jiaoyou.writemail('+f_uid+')">д��</a>�������Ұ�������Ϊ������</li>';
							cont += '<li class="ico_gift" style="background:url(http://static.51img1.com/v3/jiaoyou/images/pic.gif) no-repeat scroll 0 0 transparent;background-position:0 -55px;height:40px;padding:10px 0 0 50px;">���ߣ�<a href="http://jiaoyou.51.com/?c=gift&uid='+f_uid+'" onclick="hidePopWin(false);" target="_blank">�͸�����</a>ֱ������Ϊ������</li>';
							cont += '</ul></div></div>';
							winOpen({msg:cont,width:520,height:300,title:'Լ������'});
						}else if(sex == "Ůʿ"){
							var cont = '<div style="padding:20px 0 0;"><p style="margin-top:25px;font-weight:bold;font-size:16px;text-align:center;" class="t_c">';
							cont += '��Ŷ����Ů���㻹�����ҵĺ����ѣ�<br></br>����Լ�����졣';
							cont += '</p><p style="font-weight:bold;font-size:14px;margin-top:40px;text-align:center;" class="t_c">';
							winOpen({msg:cont,width:300,height:180,title:'Լ������'});
						}
					}else{
						var url = 'http://jiaoyou.51.com/?c=chat&a=send_chat&fid='+f_uid+'&type=1';
						window.open(url); 
					}
				});
	},
	showHelp : function (id, link_id, tpl_help_type){
		var title = '���������ϵ��';
		var content = '<strong>Ů����</strong>Ů��������������������Ϊ�����ѡ�֪����<br /><strong>������</strong>�������Ը�Ů��д�ţ�����Է����Լ�������<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������������Ů�������պ�˫��ֱ�ӳ�Ϊ�����ѡ�';	
		var info = '<div class="g_hint '+tpl_help_type+'" id="'+link_id+'" style="display:block;bottom:20px;left:80px;position:absolute;top:auto;width:350px;">';
		info += '<div class="g_hint_wrap" style="background-color:#FFFFCD;text-align:left;color:#919191;font-size:12px;line-height:20px;direction:ltr;">';
		info += '<span class="g_arrow" style="left:auto;right:60px;background-image:url(http://static.51img1.com/v3/themes/skins/images/hint_arrow_down.gif);bottom:-6px;top:auto;position:absolute;height:9px;display:block;overflow:hidden;width:16px;z-index:10;"></span>';
		info += '<div class="g_box_t" style="background:url(http://static.51img1.com/v3/themes/skins/images/hint_t.gif) repeat-x scroll 0 0 transparent;height:3px;overflow:hidden;position:relative;width:100%;"><div class="g_box_t_l"></div><div class="g_box_t_r" style="background:url(http://static.51img1.com/v3/themes/skins/images/hint_t_r.gif) no-repeat scroll 0 0 transparent;height:3px;overflow:hidden;position:absolute;right:0;width:4px;"></div></div>';
		info += '<div class="g_box_l" style="background:url(http://static.51img1.com/v3/themes/skins/images/hint_l.gif) repeat-y scroll left top transparent;width:100%;">';
		info += '<div class="g_box_r" style="background:url(http://static.51img1.com/v3/themes/skins/images/hint_r.gif) repeat-y scroll right top transparent;width:100%;">';
		info += '<p><strong class="color_green" style="color:green;text-align:left;line-height:20px;padding:5px 0px;position:relative;">'+title+'</strong><br />';
		info += content;
		info += '</p></div></div>';
		info += '<div class="g_box_b" style="background:url(http://static.51img1.com/v3/themes/skins/images/hint_b.gif) repeat-x scroll 0 0 transparent;overflow:hidden;position:relative;width:100%;"><div class="g_box_b_l"></div><div class="g_box_b_r"></div></div></div></div>';
		
		$('#'+id).html(info);
	}
}
