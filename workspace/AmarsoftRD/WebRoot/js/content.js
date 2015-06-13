var contentjs = function(){
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
	return{
		initUeditor:function(name,cont){
			//实例化编辑器
		    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
		    var ueditor = UE.getEditor(name);
		    ueditor.addListener("ready",function(){// editor准备好之后才可以使用
		        ueditor.setContent(cont==null?"":cont);//设置null值会导致ueditor报错
		        var _iframe = $('#'+name).find('iframe');
		        //设置iframe中的快捷事件
		        _iframe.attr("name",function(){return this.id;});
		        var iframeId = _iframe.attr("id");
		        //IE是用过id来生成对象，可是firefox是通过name来生成对象
		        window.frames[iframeId].document.body.onkeyup = function(event){
		        	if(event.ctrlKey&&event.keyCode==13)
		        		$('.iframe_submit').trigger('click');
		        }
		    });
		},
		init:function(){
			/**time*/
			var localTimeSpan = document.getElementById("localTime");
			localTimeSpan.innerHTML = (new Date())
					.getFormattedDate("yyyy - MM - dd  hh : mm : ss");
			setInterval(function() {
				localTimeSpan.innerHTML = (new Date())
						.getFormattedDate("yyyy - MM - dd  hh : mm : ss");
			}, 1000);
			
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
			/**渐变背景*/
			$("a.brand").hover(function(){
				$(this).stop().animate({
					backgroundColor:"#6893C2"
				}, 1000);
			},function(){
				$(this).stop().animate({
					backgroundColor:"##232323"
				},600,function(){
					$(this).css('backgroundColor','');
				});
			});
			
			/**滚动条-移动|在IE8及以下版本浏览器不兼容*/
	    	/*$(window).scroll(function(){
	    		//alert($(this).scrollTop());
	    		var height = document.documentElement.scrollTop + document.body.scrollTop;
	    		alert(height);
	    		if(height>=57){
	    			$('div.pro_linedrop').addClass('menu-fixed');
	    			$('#doc').addClass('space-after-fixed');
	    			$('#top_arrow').fadeIn('slow');
	    		}
	    		else{
	    			$('div.pro_linedrop').removeClass('menu-fixed');
	    			$('#doc').removeClass('space-after-fixed');
	    			$('#top_arrow').fadeOut('slow');
	    		}
	    	});*/
			/**滚动条-移动*/
		    window.onscroll = _onScroll;  
		    function _onScroll(){
		    	var height = document.documentElement.scrollTop + document.body.scrollTop;  
		    	if(height>=57){
	    			$('div.pro_linedrop').addClass('menu-fixed');
	    			$('#doc').addClass('space-after-fixed');
	    			$('#top_arrow').fadeIn('slow');
	    		}
	    		else{
	    			$('div.pro_linedrop').removeClass('menu-fixed');
	    			$('#doc').removeClass('space-after-fixed');
	    			$('#top_arrow').fadeOut('slow');
	    		}
		    };
	    	if($(window).scrollTop()!=0)
	    		$('#top_arrow').fadeOut('slow');
	    	/**滚动至顶部*/
	    	$('#top_arrow').click(function(){
		        $('html, body').animate({scrollTop:0},'slow');
		    });
	    	contentjs.bindHeaderClick($('.contentpart>a.header'));
	    	contentjs.bindCloseBtnClick($('a.header>.close'));
		},
		bindCloseBtnClick:function(obj){
			/**定义删除文件按钮**/
	    	$(obj).click(function(){
	    		var _this = $(this).parent();
	    		var isFolder = _this.attr("isFolder");
	    		if(isFolder=="true"){
	    			if(!confirm("删除该文件夹，其目录下的文件均会被删除，确定删除吗？")) return false;
	    		}
	    		else{
	    			if(!confirm("确定删除文件吗？")) return false;
	    		}
	    		var sPath = _this.attr("path");
	    		sPath = getURLEncode(sPath);
	    		$.ajax({
	    			type:'post',
	    			url:"jsp_file/file_action.jsp",
	    			async:true,
	    			cache:false,
	    			dataType:'text',
	    			data:"sPath="+sPath,
	    			success: function(msg){
	    				msg = eval("("+msg+")");
	    				if(msg.status=="true"){
	    					if(_this.parent().hasClass('contentpart'))	_this.parent().remove();
	    					else{
	    						_this.next().filter('.content').remove();
	    						_this.remove();
	    					}
	    					contentjs.showTip('success','删除成功');
	    				}
	    				else{
	    					contentjs.showTip('success','删除失败');
	    				}
	    			}
	    		});
	    		return false;
	    	});
		},
		bindHeaderClick:function(obj){
 			$(obj).click(function(){
 				var _this = $(this);
 				var sPath = _this.attr("path");
 				var isFolder = _this.attr("isFolder");
 				if(isFolder=="false"){
 					sPath = getURLEncode(sPath);
 					window.location = "download.jsp?data="+sPath;
 				}
 				else{
 					var content = _this.next();
 					var data = _this.attr('data');
 					//如果为产品根级节点，则直接打开子级列表
 					//该节点子级节点已经加载完毕
 					if(data=="load"){
 						if(_this.attr("status")=="close"){
 							content.show();
 							_this.attr("status","open");
 							if(_this.parent().filter('.contentpart').length==0){
 								_this.find('i').removeClass('icon-folder-close').addClass('icon-folder-open');
 							}
 						}
 						else{
 							content.hide();
 							_this.attr("status","close");
 							if(_this.parent().filter('.contentpart').length==0){
 								_this.find('i').removeClass('icon-folder-open').addClass('icon-folder-close');
 							}
 						}
 					}
 					//该节点子级节点尚未加载
 					else{
	 					$(content).load("jsp_file/show_file.jsp",{'sPath':sPath},function(){
	 						contentjs.bindHeaderClick(content.find('.header'));
	 						contentjs.bindCloseBtnClick(content.find('.close'));
	 					});
	 					_this.attr('data','load');
	 					_this.attr('status','open');
	 					content.show();
	 					if(_this.parent().filter('.contentpart').length==0){
	 						_this.find('i').removeClass('icon-folder-close').addClass('icon-folder-open');
	 					}
 					}
 				}
 				return false;
 	 		});
 		},
		checkLogin:function(){
			var userName_text = document.getElementById('userName');
			var password_text = document.getElementById('password');
			var user = userName_text.value;
			var pwd = password_text.value;
			var flag = true;
			if(user==''){
				$(userName_text).addClass('error');
				flag = false;
			}
			else
				$(userName_text).removeClass('error');
			if(pwd==''){
				$(password_text).addClass('error');
				flag = false;
			}
			else
				$(password_text).removeClass('error');
			return flag;
		},
		login:function(obj){
			var body = $('body');
			var loginbox = $('#loginbox');
			if(loginbox.length!=0){loginbox.show();$('#userName').focus(); return false;}
			loginbox = $('<div id="loginbox">'+'<div class="box-header"><label>登录框</label><span>X</span></div>'+
			'<div class="box-content">'+
			'<div class="unit_box"><label>用户名：</label><input id="userName" type="text" name="userName"/></div>'+
			'<div class="unit_box"><label>密码：</label><input id="password" type="password" name="password" /></div>'+
			'<input type="button" id="loginBtn" class="boxbtn" value="登录"/>'+
			'<input type="button" id="cancelBtn" class="boxbtn" value="取消"/></div></div>').appendTo(body);
			
			//设置拖动属性
			loginbox.find('div.box-header').bind('mousedown',function(e){
				$(document).bind('mousemove',dragmove).bind('mouseup',dragup);
				var parent = $(this).parent();
				var x = e.clientX;
				var y = e.clientY;
				var position = parent.position();
//				var left = parent.css('left').replace("px","");
//				var top = parent.css('top').replace("px","");	//top为百分比设置的话，通过css的方式获取top的值，在IE8下无效
				var left = position.left;
				var top = position.top;
				function dragmove(e){
					parent.css('left',(e.clientX-x)+Number(left)+"px");
					parent.css('top',(e.clientY-y)+Number(top)+"px");
				}
				function dragup(){
					$(document).unbind('mousemove',dragmove).unbind('mouseup',dragup);
					$('#userName').focus();
				}
			});
			
			//登录(login)功能
			$('#loginBtn').click(function(){
				if(!contentjs.checkLogin()){return false;}
				var tip = $('<div class="tip">正在登录...</div>').appendTo(body);
				var x = loginbox.css('left');
				var y = loginbox.css('top');
				tip.css('left', Number(x.substring(0,x.length-2))-30);
				tip.css('top',y);
				loginbox.hide();
				tip.show();
				//登录事件
				//...
				var userName = document.getElementById('userName').value;
				var password = document.getElementById('password').value;
				$.ajax({
	 				type:'post',
	 				url:"servlet/MLogin",
	 				async:true,
	 				cache:false,
	 				dataType:'text',
	 				data:'userName='+userName+'&password='+password,
	 				success: function(msg){
	 					msg = eval("("+msg+")");
	 					if(msg.status=="success"){
	 						tip.html('登录成功...');
	 						tip.css('color','#8EEA8E');
	 						$('#user').html(msg.userName);
	 						$('<a href="personalInfo.jsp">Profile</a>').insertAfter($(obj));
	 						$(obj).remove();
	 						window.location.reload();
	 					}
	 					else{
	 						tip.html('登录失败...');
	 						tip.css('color','#BB3115');
	 						loginbox.show();
	 					}
	 					setTimeout(function(){tip.remove();},1000);
	 				}
	 			});
			});
			//取消、关闭功能
			loginbox.find('.box-header span,#cancelBtn').bind('click',function(){
				loginbox.hide();
			});
			//设置快捷键--Enter(登录) Esc(取消、关闭)
			$('#password').keydown(function(e){
				if(e.keyCode==13)
					$('#loginBtn').trigger('click');
			});
			$(document).keydown(function(e){
				if(e.keyCode==27){
					$('#cancelBtn').trigger('click');
				}
			});
			//设置焦点
			$('#userName').focus();
		},
		showTip:function(status,msg,width){
			if(msg==null||msg=='') msg = '提示';
			if(width==null||width=='') width = msg.length*14;
			var tip = $('<div class="tip">'+msg+'</div>').appendTo($('body'));
			tip.css('width',width);
			if(status=='success') tip.css('color','#8EEA8E');
			else if(status=='failure') tip.css('color','#BB3115');
			else tip.css('color','#666666');
			tip.show();
			setTimeout(function(){tip.fadeOut('slow',function(){tip.remove();});},1000);
		},
		showSpecialTip:function(event,msg){
			var userAgent = navigator.userAgent;
			if(userAgent.indexOf('MSIE 8') >= 0||userAgent.indexOf('MSIE 7') >= 0||userAgent.indexOf('MSIE 6') >= 0){
				return false;
			}
			if(msg=='') msg='...';
 			var x = event.clientX+70;
 			var y = event.clientY-50;
 			if(x>window.availWidth) x = window.availWidth;
 			if(y<0) y=0;
 			var tip = $('<div class="tip specialTip">'+msg+'</div>').appendTo($('body'));
 			tip.css({
 				left:x+'px',
 				top:y+'px',
 			});
 			tip.show();
 			tip.animate({
				top:y-15+'px',
				opacity:1
			}, 500,function(){
				tip.animate({
					top:y-30+'px',
					opacity:0
				},500,function(){
					tip.remove();
				});
			});
 		},

		//该方法废弃
		locationToTop:function(){
			var href = window.location.href.replace(/#.*$/,"");
 			window.location.href = href+"#top";
		}
	};
}();
	/**字符进行编码转换，方便通过URL传值*/
	function getURLEncode(str){
		return str.replace(/[%]/g,"%25").replace(/[&]/g,"%26").replace(/[+]/g,"%2B");
	}
$(document).ready(contentjs.init);