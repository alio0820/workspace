/*
	for:common user tips for each site
	author:daim
	mail:daim@mail.51.com
*/


var tips_callback;
var d_tips = function(obj)
{
	var that = this;
	var now_eventobj = false;//��ǰҪ��ʾ��tips������obj
	var now_username = '';
	var now_usertype = '';//gaccount:Ⱥ�˺� personal:�����˺�
	var now_tips_status = 'close'; //��ǰtips��ʾ״̬
	var tipsinfo_arr = {}; //����д��Array
	var login_username = '';
	var channel = '';//��ǰƵ��

	var timeobj_close = false;
	var timeobj_open = false;
	var tipsid = false;
	var bind_classname = '';
	var tips_view_direction = 'updown';//updown:������ʾ��leftright:������ʾ
	var now_tips_view_direction = '';//��ǰTIPS��ʾ���򣬿�ֵʱ�¾�tips_view_direction

	var pic_url = "http://static.51img1.com/v5/t";
	if(typeof(d_pic_url) == 'string') pic_url = d_pic_url; //ʹ��t.51.com��ͳһ����Դ·��

	var tips_width = 380;
	var tips_height = 205;

	var webim_exsit = false;

	var tips_closeable = true;

	/*
	var each_user =		//��tipsinfo_arr[now_usertype+now_username] = each_user; �����鹩�ο�ʹ�ã�ʵ��������PHP���ظ���tipsinfo_arr[now_usertype+now_username]
	{
		usertype : '',//gaccount:Ⱥ��personal:����
		accout : '',
		username : '',
		uin : '',
		nickname : '',
		goodid : '',
		displayname : '',
		alia : '',
		friendtype : '',//0������ע 1 ֻ�ҹ�ע�� 2 �����ע 3��ֻ����ע��
		online_type : '',
		hometown : '',
		now_location : '',
		sex : '',
		authration : '',
		rz : '',
		vip : '',
		webclass : '',
		signature : '',
		loading_status : ''
	};*/

	var __construct = function(obj)
	{
		if(!obj||typeof(obj)!='object')obj={};
		bind_classname = obj.classname||'_none_bind';
		tips_view_direction = obj.tips_direction||'updown';
		login_username = obj.username||'';
		channel = obj.channel||'';
		if(channel == '')
		{
			var c_h = u_arr = window.location.toString().match(/(?:http:\/\/)?(\w+)\.51\.com.*/);
			if(c_h) channel = c_h[1];
		}
		that.bind();
		tipsid = 'd_tipsid_'+(new Date()).getTime();
		$('body').append("<div id='"+tipsid+"' style='display:none;top:30px' class='public_newtip'>sssssss</div>");
		//test
		//$('body').append("<div id='s"+tipsid+"' style='display:;top:30px' class='public_newtip'>count</div>");
		$('#'+tipsid).bind('click',function(event)
		{
			tipsClickCall(event);
		});
		$('#'+tipsid).bind('mouseover',function()
		{
			if(timeobj_close)
			{
				clearTimeout(timeobj_close);
				timeobj_close = false;
			}
		});
		$('#'+tipsid).bind('mouseout',function(event)
		{
			that.tipsClose(event);
		});

		var _script;

		//����TIPS ��ʽ
		_script = document.createElement("link");
		_script.type = 'text/css';
		_script.rel = 'stylesheet';
		_script.href = 'http://static.51img1.com/v5/t/public_tip/css/public_tip.css?20111107';
		document.getElementsByTagName("head")[0].appendChild(_script);
		//����friend.js
		if(typeof(cancel_follow) == 'undefined')
		{
			_script = document.createElement("script");
			_script.type = 'text/javascript';
			_script.src = 'http://static.51img1.com/v3/friend/js/global_friend.js?v=20111107';
			document.getElementsByTagName("head")[0].appendChild(_script);
		}
		if(typeof(global_hello) == 'undefined')
		{
			_script = document.createElement("script");
			_script.type = 'text/javascript';
			_script.src = 'http://static.51img1.com/v3/friend/js/global_friend.js?v=20111228';
			document.getElementsByTagName("head")[0].appendChild(_script);
		}
	}

	var _one_tips =
	{
		getUserInfo : function()
		{
			var json_p = "callback=?&";
			if(channel == 't')json_p = '';
			var _url = 'http://t.51.com/?'+json_p+'c=ajax&a=getUserInfoForCommonTips&_u='+now_username+'&_t='+now_usertype+'&channel='+channel;
			$.getJSON(_url,function(obj)
			{
				tipsinfo_arr[obj.usertype+obj.username] = obj;
				if(obj.username+obj.usertype == now_username+now_usertype)
				{
					_fillTipsContent();
				}
			});
		},

		generateHtml : function()
		{
			var _t = typeof(tipsinfo_arr[now_usertype+now_username]);
			if(_t == 'undefined')
			{
				this.getUserInfo();
				return false;
			}
			else if(_t == 'string')
			{
				//����ֵ����� ��t����ͬ�û����� �����ͨ��ͷ���ϵ�TIPS��Ϣʱ�����ص����ݻᱣ�浽��ͨ��TIPS�����У���������if����
				//if(tipsinfo_arr[now_usertype+now_username]!='loading') this.getUserInfo();
				return false;
			}
			return this.fillHtml(tipsinfo_arr[now_usertype+now_username]);
		},

		fillHtml : function(obj)
		{
			var g_note = obj.usertype == 'gaccount'?true:false;
			var _url = 'http://'+(g_note?'t':'home')+'.51.com/'+obj.username+(g_note?'':'/loveinfo');
			var f_c = ''
			var f_n = '�ӹ�ע';

			//obj.friendtype = 2;
			switch(parseInt(obj.friendtype))
			{
				case 1:
					f_c = 'ico atte_one'
					f_n = '�ѹ�ע';
					break;
				case 2:
					f_c = 'ico atte_two'
					f_n = '�����ע';
					break;
				default:
					f_c = ''
					f_n = '+ �ӹ�ע';
					break;
			}

			var l_note = (login_username!=now_username)&&(!g_note);
			var hello = '_functionCall="hello"';
			var chat = '_functionCall="chat"';
			var changeAlia = '_functionCall="changeAlia"';
			if(g_note)
			{
				hello = 'title="���ܸ��Է����к�"';
				chat = 'title="�Է�δ��ע�㣬��������"';
				changeAlia = 'title="�����޸ı�ע"';
			}
			else if(login_username==now_username)
			{
				hello = 'title="���ܺ��Լ����к�"';
				chat = 'title="���ܺ��Լ�����"';
				changeAlia = 'title="�����޸��Լ���ע"';
			}
			else
			{
				if(obj.friendtype == 1) chat = 'title="�Է�δ��ע�㣬��������"';
				else if (obj.friendtype != 2) 
				{
					chat = 'title="��δ��ע�Է�����������"';
					changeAlia = 'title="��δ��ע�Է��������޸ı�ע"';
				}
			}

			var _html = '';
			_html += '<div class="tip_user_info clear">';
            	_html += '<div class="photo"><div class="box"><a href="'+_url+'" target="_blank"><img src="'+obj.face+'"></a></div></div>';
                _html += '<div class="info">';
                	_html += '<a href="'+_url+'" class="name" target="_blank" '+(obj.displayname.length>6?'title="'+obj.displayname+'"':'')+'>'+(obj.displayname.substr(0,6))+'</a>';
				if(!g_note)
				{
					_html += '<span class="'+((obj.online=='online')?'ico online':'ico online')+'">'+obj.online_type+'</span><span class="area">'+obj.now_location+'</span>';
                    _html += '<p class="userimg">';
					_html += '<span class="img"><img title="'+(obj.sex=='����'?'��':'Ů')+'"width="16" src="http://static.51img1.com/v3/themes/skins/images/'+(obj.sex=='����'?'man':'woman')+'.gif"></span>';
					if(obj.authentication == '1')
                        _html += '<span class="img"><a href="http://game.51.com/realname/" target="_blank" title="'+obj.authentication_cause+'"><img src="http://static.51img1.com/v5/global/public/images/v_confirm.gif"></a></span>';
					if(obj.rz == '1')
                        _html += '<span class="img"><a href="http://rz.51.com/?ac=def.show&u='+obj.username+'" target="_blank" title="��ͨ����ʵ��Ƶ��֤"><img src="http://static.51img1.com/v3/themes/skins/images/ico_videosure.gif" class="ico_video"></a></span>';
					if(obj.vip != '0')
                        _html += '<span class="img"><a target="_blank" href="http://51vip.51.com/"><img border="0" src="'+obj.vip_pic+'"></a></span>';
					if(obj.webclass != '0')
                        _html += '<span class="img"><a href="http://my.51.com/score" target="_blank"><img src="http://pic.51.com/i/uc/level/'+obj.webclass_pic+'"></a></span>';
					if(obj.guest_level!='0')
                    	_html += '<span class="img"><a href="http://game.51.com/vip#howgb" target="_blank" title="'+obj.guest_level+'�����"><img src="http://pic.51img1.com/v3/op/gamenew.51.com/platform/images/hg/hgs_'+obj.guest_level+'.gif"></a></span>';
                    _html += '</p>';
				}
					_html += '<p class="mark">'+obj.signature+'</p>';
				if(login_username!=now_username)
				{
					_html += '<p class="act"><span '+((f_c=='')?' _functionCall="friendshipAction"':'')+' class="'+f_c+((f_c=='')?' pointer':'')+'">'+f_n+'</span>'
					if(f_c != '')
						_html += '<span class="line">|</span><span class="pointer" _functionCall="friendshipAction">ȡ��</span>';
					_html += '</p>';
				}
                _html += '</div>';
				_html += '<p style="clear: both; height: 8px; line-height: 0pt; font-size: 0pt; overflow: hidden;">&nbsp;</p>';

                _html += '<div class="bottom">';
					_html += '<span class="ico hi '+(l_note?' pointer':'hi_gray')+'" '+hello+'>���к�</span>'
					_html += '<span class="line">|</span><span class="ico talk '+((l_note&&(obj.friendtype==2))?' pointer':'talk_gray')+'" '+chat+'>����</span>'
					_html += '<span class="line">|</span><span class="'+((l_note&&(obj.friendtype==1||obj.friendtype==2))?'pointer':'')+'" '+changeAlia+'>�޸ı�ע</span>'
					_html += '<span class="line" style="visibility:hidden">|</span><span style="visibility:hidden">����ʾ���ĸ���</span>'
				_html += '</div>';
            _html += '</div>';

			return _html;
		},

		getTipsXY : function()
		{
			var min_left = 90;
			var min_top = 65;
			var objXY = $(now_eventobj).offset();
			var objW = $(now_eventobj).width();
			var objH = $(now_eventobj).height();
			var documentX = $(document).scrollLeft();
			var documentY = $(document).scrollTop();
			var windowW = $(window).width();
			var windowH = $(window).height();

			//TIPS����object���ܾ��봰���ı߾���
			var left_space = objXY.left - documentX;
			var up_space = objXY.top - documentY;
			var right_space = windowW - left_space - objW;
			var down_space = windowH - up_space - objH;

			var _up = false; //TIPS����������ʾ��������ͬ
			var _down = false;
			var _left = false;
			var _right = false;
			//alert(' '+down_space + '  ' + left_space);
			
			//������غõ�TIPS�߶ȴ���ʱ���������ô˸߶�
			var now_tips_height = $('#'+tipsid).height();
			tips_height = now_tips_height>150?now_tips_height:205;

			if((up_space >= tips_height) && (left_space >= min_left)) _up = true;
			if((down_space >= tips_height) && (left_space >= min_left)) _down = true;
			if((left_space >= tips_width) && (up_space >= min_top)) _left = true;
			if((right_space >= tips_width) && (up_space >= min_top)) _right = true;

			var backobj = {};

			//tips����ѡ�� start
			//���Ȱ��趨 ��ʾ�� ���Ϻ��£����Һ���
			//�趨�ķ��� ��λ ��������TIPS��Сʱ���������˳�����һ�����ʵ�
			//�ĸ����򶼲���ʱ��ѡ���û��趨������ ��λ�ϴ���Ǹ�

			//alert(_up+' '+ ' ' + _down + ' ' + _left + ' '+ _right);
			if((now_tips_view_direction == 'leftright') && !_left && !_right && (_up || _down)) now_tips_view_direction = 'updown';
			if(now_tips_view_direction == 'updown')
			{
				if(_up || (!_down && !_left && !_right && (up_space>=down_space)))
				{
					backobj.classname = 'newtip_arrow_down'; //Ϊ��ͷ���� ��ͬ
					backobj.top = objXY.top - now_tips_height-12;
					backobj.left = objXY.left - min_left + objW/2 + 5;
				}
				else if(_down || (!_left && !_right))
				{
					backobj.classname = 'newtip_arrow_top';
					backobj.top = objXY.top + objH + 12;
					backobj.left = objXY.left - min_left + objW/2 + 5;
				}
				else if(_left || _right) now_tips_view_direction = 'leftright';
			}

			if(now_tips_view_direction == 'leftright')
			{
				if(_right || (!_left && (right_space>=left_space)))
				{
					backobj.classname = 'newtip_arrow_left';
					backobj.top = objXY.top + objH/2 - ((now_tips_height>150)?min_top:18) + 15;
					backobj.left = objXY.left + objW + 15;
				}
				else
				{
					backobj.classname = 'newtip_arrow_right';
					backobj.top = objXY.top + objH/2 -((now_tips_height>150)?min_top:18) + 15;
					backobj.left = objXY.left - tips_width + 3;
				}
			}
			//tips����ѡ�� end

			return backobj;
		}
	};

	var tipsAction = 
	{
		friendshipAction : function(vthis,e)
		{
			//test
			//$('#s'+tipsid).html($('#s'+tipsid).html()+'friendshipAction');
			var obj = tipsinfo_arr[now_usertype+now_username];
			var callback = '';
			if(obj.usertype=='gaccount')
			{
				var _p = {};
				var url = 'http://home.51.com/?callback=?&c=up&a=attentionact&from=gblog&type=1&friend='+obj.username;
				if(obj.friendtype == '1') 
				{
					url = 'http://friend.51.com/friend/global_deal_friend_ajax.php?callback=?';
					_p = {opt: 'del_gfriend', friend: obj.username};
				}
				$.getJSON(url,_p, function(data) 
				{
					if (data == 1 || ((typeof(data)=='object') && (data.isattention=='1')))
					{
						tipsinfo_arr[now_usertype+now_username].friendtype = (obj.friendtype == '1')?'0':'1';
						_fillTipsContent();
					} 
					else alert('����ʧ��!');
				});
				return;
			}
			if(obj.friendtype=='2' || obj.friendtype == '1')
			{
				//tips_closeable = false;
				_closeTipsImmediately();
				tips_callback = function()
				{
					tipsinfo_arr[now_usertype+now_username].friendtype = (obj.friendtype == '1')?'0':'3';
					//_fillTipsContent();
				}
				cancel_follow(obj.account,obj.accountid,obj.displayname,'tips_callback');
			}
			else
			{
				//tips_closeable = false;
				_closeTipsImmediately();
				tips_callback = function()
				{
					tipsinfo_arr[now_usertype+now_username].friendtype = (obj.friendtype == '0')?'1':'2';
					//_fillTipsContent();
				}
				add_follow(obj.account,{from:channel,showtip:1,hello:1},'tips_callback');
			}
		},

		hello : function(vthis,e)
		{	
			var obj = tipsinfo_arr[now_usertype+now_username];
			//tips_closeable = false;
			_closeTipsImmediately();
			global_hello(obj.account);
		},

		chat : function(vthis,e)
		{
			var obj = tipsinfo_arr[now_usertype+now_username];
			if(typeof(webim_chat)!='undefined')
			{
				webim_chat.showNewMessage({account:obj.account, accountUin:obj.uin, mouseEvent:e, clearTimes:1});
				new_webim.stopEventPropagation(e);
			}
			else
			{
				//���webIM�����ڣ�����->����Ϣ
				window.open("http://jiaoyou.51.com/?c=webchat&a=render&friend=30016928&"+obj.uin,'_blank');
			}
		},

		changeAlia : function(vthis,e)
		{
			//test
			//$('#s'+tipsid).html($('#s'+tipsid).html()+'changeAlia');
			//tips_closeable = false;
			_closeTipsImmediately();
			var obj = tipsinfo_arr[now_usertype+now_username];
			var callback = function(backobj)
			{
				tipsinfo_arr[now_usertype+now_username].alia = backobj.alia;
				tipsinfo_arr[now_usertype+now_username].displayname = ($.trim(backobj.alia) && ($.trim(backobj.alia)!=''))?backobj.alia:tipsinfo_arr[now_usertype+now_username].nickname;
				//_fillTipsContent();
			}
			global_set_alias(obj.account,obj.accountid,obj.displayname,callback,'');
		}
	};

	var tipsClickCall = function(e)
	{
		var obj = false;
		if(e) obj = e.currentTarget? e.relatedTarget : e.toElement;
		if(!obj) obj = e.target;
		while(obj)
		{
			if($(obj).attr('_functionCall'))
			{
				var name = $(obj).attr('_functionCall');
				var _f;
				eval("_f = tipsAction."+name);
				if(typeof(_f) == 'function')
				{
					_f(obj,e);
					break;
				}
			}
			obj = obj.parentNode;
		}
	}

	var _getUsername = function()
	{
		var obj = now_eventobj;

		//ȡtips��ʾ����
		if((typeof($(obj).attr('tips_direction'))!='undefined') && ($(obj).attr('tips_direction') == 'updown' || $(obj).attr('tips_direction') == 'leftright')) now_tips_view_direction = $(obj).attr('tips_direction');

		//ȡ�û���������
		if((typeof($(obj).attr('username'))!='undefined') && $(obj).attr('username'))
		{
			now_username = $(obj).attr('username');
			now_usertype = ((typeof($(obj).attr('usertype'))!='undefined')&&($(obj).attr('usertype')=='t'))?'gaccount':'personal';
		}
		else
		{
			if(typeof($(obj).attr('href'))!='undefined'&&$(obj).attr('href'))
			{
				var url = $(obj).attr('href');
				if(_parseURL(url)) return;
			}

			$(obj).find("a").each(function(index)
			{
				var url = this.href||'_';
				if(_parseURL(url)) return;
			});
		}
	}

	var _parseURL = function(url)
	{
		url = url.replace(/\s/g,'');
		var u_arr = url.match(/(?:http:\/\/)?(t|home)\.51\.com\/(\w{1,30})\W?.*/);
		if(!u_arr)u_arr = url.match(/(?:http:\/\/)?(.+)\.51\.com\/?\?.*u=(\w{4,30})\W?.*/);
		if(u_arr)
		{
			now_username = u_arr[2];
			now_usertype = (u_arr[1]=='t')?'gaccount':'personal';
			return true;
		}
		return false;
	}

	var _showTips = function()
	{
		timeobj_open = false;
		if(!now_eventobj) return;
		if(!now_username)_getUsername();

		if(!now_username) return;

		//alert(now_username+now_usertype);

		now_tips_status = 'loading';
		
		_fillTipsContent();
	}

	var _fillTipsContent = function()
	{
		var _html = _one_tips.generateHtml();
		var _style = '';
		if(_html)
		{
			_style = 'style="padding:0;"';
			now_tips_status = 'complete';
		}
		else
		{
			_style = '';
			_html = '<p style="text-align:center;font-size:12px;width:320px;margin:0;color:#666;"><img src="'+pic_url+'/public/images/small_loading.gif" style="vertical-align:middle;"/>&nbsp;���ڼ����У����Ժ�...</p>';
		}

		//�������ȥ�� _one_tips.getTipsXY() �� ����λ����

		var l_html = '<span class="newtip_arrow_top">&nbsp;</span><div class="public_newtip_box" '+_style+'>' + _html + '</div>';
		//$('#'+tipsid).html('');
		//if($.browser.msie)document.getElementById(tipsid).insertAdjacentHTML('beforeEnd',l_html);
		//else $('#'+tipsid).append(l_html);

		$('#'+tipsid).html(l_html);

		var tips_xy = _one_tips.getTipsXY();

		_html = '<span class="'+tips_xy.classname+'">&nbsp;</span><div class="public_newtip_box" '+_style+'>' + _html + '</div>';

		$('#'+tipsid).css('top',tips_xy.top);
		$('#'+tipsid).css('left',tips_xy.left);
		$('#'+tipsid).html(_html);
		$('#'+tipsid).show();
	}

	var _closeTips = function(e)
	{
		if(now_tips_status == 'close') return;
		var obj = false;
		var _out = true;
		if(e && e.currentTarget) obj = e.currentTarget? e.relatedTarget : e.toElement;
		if(!obj && e &&e.target) obj = e.target;
		if(!obj) obj = e;
		var _icount = 0;

		/*
		if($(e.currentTarget).attr('id') == tipsid)
		{
			_icount = 0;
			while(obj && (_icount < 8))
			{
				$('#s'+tipsid).html($('#s'+tipsid).html()+_icount);
				_icount++;
				if($(obj).attr('id')==tipsid)
				{
					_out = false;
					break;
				}
				obj = obj.parentNode;
			}
		}
		else
		{
			_icount = 0;
			while(obj && (_icount < 8))
			{
				$('#s'+tipsid).html($('#s'+tipsid).html()+'s'+_icount);
				_icount++;
				if(($(obj).attr('id')==tipsid)||$(obj).hasClass(bind_classname)||($(obj).attr('onmouseout')&& (/tipsClose\((event)?\)/.test($(obj).attr('onmouseout').replace(/\s/g,'')))))
				{
					_out = false;
					break;
				}
				obj = obj.parentNode;
			}
		}*/

	 //	var sobj = obj;

		while(obj && (_icount < 8))
		{
			_icount++;
			if(($(obj).attr('id')==tipsid)||$(obj).hasClass(bind_classname)||($(obj).attr('onmouseout')&& (/tipsClose\((event)?\)/.test($(obj).attr('onmouseout').toString().replace(/\s/g,'')))))
			{
				_out = false;
				break;
			}
			obj = obj.parentNode;
		}

		//test
		//$('#s'+tipsid).html($('#s'+tipsid).html()+_out+_icount);
		//if(_out) $('#s'+tipsid).html($('#s'+tipsid).html()+$(sobj).html());

		if(_out)
		{
			_closeTipsImmediately();
		}
	}

	var _closeTipsImmediately = function()
	{
		tips_closeable = true;
		timeobj_close = false;
		now_eventobj = false;
		now_tips_status = 'close';
		//now_username = '';
		//now_usertype = '';
		$('#'+tipsid).hide();
	}

	that.dispplayTips = function(vthis,obj)
	{
		if(!obj||typeof(obj)!='object')obj={};
		user = obj.user||'';
		user_type = obj.user_type||'';
		now_tips_view_direction = obj.tips_direction||tips_view_direction;

		if(now_eventobj == vthis && now_tips_status != 'close')
		{
			if(timeobj_close)
			{
				clearTimeout(timeobj_close);
				timeobj_close = false;
			}
			return; //��ǰ������ʾ��
		}
		else if(now_eventobj && (now_eventobj != vthis))
		{
			_closeTipsImmediately();
		}

		now_eventobj = vthis;
		now_username = user?user:'';
		now_usertype = (user_type&&(user_type=='gaccount'))?'gaccount':'personal';
		timeobj_open = setTimeout(_showTips,300);
	}

	that.tipsClose = function(e)
	{
		if(timeobj_open)
		{
			clearTimeout(timeobj_open);
			timeobj_open = false;
		}
		if(!tips_closeable)
		{
			//��ǰtips����
			tips_closeable = true;
			return;
		}

		if(now_tips_status == 'close') return;

		timeobj_close = setTimeout(function(){_closeTips(e||false);},300);
	}

	that.bind = function(classname)
	{
		var _classname = classname||bind_classname;
		if(_classname == '_none_bind')return;
		$('.'+_classname).bind('mouseover',function(){that.dispplayTips(this);});
		$('.'+_classname).bind('mouseout',function(event){that.tipsClose(event);});
		//$('body').bind('click',function(event){that.tipsClose(event);});
		if(_classname != bind_classname)$('.'+_classname).addClass(bind_classname);//Ϊonmouseout����
	}

	__construct(obj);
}

//������ԵĻ���Ӧ���Ƴ����ļ�����friendƵ��ͳһ�ṩ
var global_friend_ajax_portal = 'http://friend.51.com/friend/global_deal_friend_ajax.php?callback=?';
var global_callback = '';
var global_param = '';
function global_set_alias(f,fid,alias,callback,param)
{
	callback = ((typeof(callback)!='undefined') && callback)?callback:'';
	param = ((typeof(param)!='undefined') && param)?param:'';
	if(typeof(callback)!='function') eval('callback='+callback+';');
	if(typeof(callback)!='function') callback = '';
	global_callback = callback;
	global_param = param;
	var msg = '<div style="text-align:center;line-height:24px;margin:20px 0 10px;">���ñ�ע��<span class="public_input"><input id="user_custom_alias" type="text" value="'+ alias +'" class="t " style="width:126px;" onkeydown="global_check_alias(\''+f+'\', '+fid+')"  onkeyup="global_check_alias(\''+f+'\', '+fid+')" onclick="d_init_text(this)"></span><br><span id="alias_tip" style="font-size:12px;color:#EB6100;margin-left:50px;line-height:16px;background:url(http://static.51img1.com/v5/my/images/icon_friends.gif) 0 -179px no-repeat;padding-left:18px;display:none"></span></div>';
	msg += '<div style="text-align:center;padding:10px;line-height:30px"><span class="g_btn_w"><input type="button" onclick="global_do_set_alias(\''+f+'\','+fid+');" class="g_btn" value="ȷ��"></span></div>';

	winOpen({'msg':msg,width:280,height:160,title:'���ñ�ע'});
	$('#user_custom_alias').click().select();
}

function global_do_set_alias(f, fid)
{

	var user_custom_alias = $("#user_custom_alias").val();
	if (!global_is_valid_chinese(user_custom_alias)) 
	{
		alert("��עֻ��Ϊ�������ġ�Ӣ�ġ����֣�");
		return false;
	}

	var obj_info = $("#id_id_tips_content").children().eq(0);
	var nickname = $("#id_id_tips_content").find(".d_username_nickname").eq(0).html();
	if(nickname == user_custom_alias)
	{
		hidePopWin(false);
		return;
	}

	$.getJSON(global_friend_ajax_portal,{opt:"set_alias", friend:f, friendid:fid, alias:user_custom_alias}, function(data) 
	{
		if (data == 1)
		{
			hidePopWin(false);
			var backobj = {};
			backobj.param = global_param;
			backobj.alia = user_custom_alias;

			if(typeof(global_callback)=='function') global_callback(backobj);
			//callback();
		}
		else if (data == -1)
		{
			alert("����ʧ�ܣ������ԣ�");
			return false;
		}else if (data == -2) 
		{
			alert("��ע���ܳ���16�ֽڣ�");
			return false;
		}else if (data == -3)
		{
			alert("��עֻ��Ϊ�������ġ�Ӣ�ġ����֣�");
			return false;
		}else if (data == -4)
		{
			alert("��������");
			return false;
		}
	});
}


// �Ƿ��Ǽ������ġ�Ӣ�ġ�����
function global_is_valid_chinese(str)
{
	var chars = "";
	var char_code = 0;
	var char_code2 = 0;
	for (var i = 0; i < str.length; i++) {
		char_code = str.charCodeAt(i);
		char_code2 = 0;
		chars = str.charAt(i);
		if (char_code > 127) {
			continue;
		}else {
			if (chars >= "a" && chars <= "z") {
				continue;
			}else if (chars >= "A" && chars <= "Z") {
				continue;
			}else if (chars >= "0" && chars <= "9") {
				continue;
			}else {
				return false;
			}
		}
	} // end for
	return true;
}

function global_init_text(obj)
{
	//$('#public_input').addClass("public_input_click");
	$(obj).parent().addClass("public_input_click");
}

function global_check_alias(f, fid)
{
	var lass = 16-$("#user_custom_alias").val().length;
	if(lass < 0) {
		var cont = $("#user_custom_alias").val();
		$("#user_custom_alias").val(cont.substr(0, 16));
		$("#alias_tip").html("��಻����16���ֽ�");
		$("#alias_tip").show();
		return;
	}else{
		$("#alias_tip").html("");
		$("#alias_tip").hide();
	}
}

var d_comment_face = function()
{
	var that = this;
	var _input_id = "id_face_comment_input_"+(new Date()).getTime();
	var _fun;
	var _time_obj = false;

	var __construct = function()
	{
		$('body').append("<input style='position:absolute;top:50px;width:1px;visibility:hidden' id='"+_input_id+"' />");
	}

	var _getFace = function()
	{
		var face = $('#'+_input_id).val();
		if(face.length < 5)return;
		clearTimeout(_time_obj);
		_time_obj = false;
		if(typeof(_fun) == 'string') eval('_fun='+_fun);
		if(typeof(_fun) == 'function') _fun(face);
		$('#'+_input_id).val('');
	}

	that.getCommentFace = function(vthis,fun,_direction)
	{
		_fun = fun;
		 $('#'+_input_id).val('');
		 var _d = _direction||2;
		TnewFace51.show(vthis,_input_id,_d);
		if(_time_obj) clearTimeout(_time_obj);
		_time_obj = setInterval(function(){_getFace();},200);
	}
	__construct();
}