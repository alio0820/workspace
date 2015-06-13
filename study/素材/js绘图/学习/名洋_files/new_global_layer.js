var $_Global_Mask={
	level:0,
	show:function(fuckflash)
	{
		this.getMask().css('visibility','visible');
		//this.getMask().css('zIndex','10000');
		this.getMask().css('position','absolute');
		this.level++;
		this.resize();
	},
	hide:function()
	{
		this.level--;
		if(this.level<1)
		{
			jQuery('.g_layer_mask').css('visibility','hidden');
			jQuery('.g_layer_mask').width(1);
			jQuery('.g_layer_mask').height(1);
			jQuery('embed,object,select').css('visibility','visible');
			this.level=0;
		}
	},
	close:function()
	{
		this.level=0;
		this.hide();
	},
	resize:function()
	{
		if($_Global_Mask.level<1)return ;
		var root=document.documentElement;
		jQuery('.g_layer_mask').css(
		{
			'width':Math.max(root.scrollWidth,root.clientWidth,root.scrollWidth||0)-1+'px',
			'height':Math.max(root.scrollHeight,root.clientHeight,root.scrollHeight||0)-1+'px'
		});

	},
	getBody:function()
	{
		if(!document.body)document.write('<body></body>');
		return document.body;
	},
	getMask:function()
	{
		if(jQuery('.g_layer_mask').length<1)
		{
			jQuery(this.getBody()).append(jQuery('<div class="g_layer_mask"></div>'));
		}
		return jQuery('.g_layer_mask');
	},
	setStyle:function(s)
	{
		if(typeof s=='number')
		{
			this.getMask()[0].style.cssText='filter:alpha(opacity='+s+'); -moz-opacity:'+(s/100)+';opacity:'+(s/100)+';'
			return;
		}
		if(/\#[a-f|A-F|0-9]{6}/.test(s))
			this.getMask().css('background',s);
	}
}
jQuery(window).resize($_Global_Mask.resize);

var $_Global_Layer=function(options)
{
	return new $_Global_Layer.prototype.Init(options);
}
$_Global_Layer.instances=[];
$_Global_Layer.zindex=90001;
$_Global_Layer.prototype={
	Init:function(options)
	{
		//登记实例
		var _id=this.id=$_Global_Layer.instances.length;
		$_Global_Layer.instances[this.id]=this;

		//建立窗口节点
		if(jQuery('#global_WinDiv').length<1)
		{
			$_Global_Mask.getBody();
			this.dom=jQuery('<div id="global_WinDiv" class="global_WinDiv" style="display:none;position:absolute;left:0px;top:0px;"><div id="global_popup" class="global_popup"><table border=0 class="global_popup_table" id="global_popup_table"><tbody><tr><td class="pop_topleft"></td><td class="pop_border"></td><td class="pop_topright"></td></tr><tr><td class="pop_border"></td><td valign="top" id="global_popup_content" class="global_popup_content"><div class="global_popup_title"><h3 id="global_popup_title">加为好友</h3><a class="close" href="javascript:void(0)"></a></div><div class="global_dialog_content">内容</div></td><td class="pop_border"></td></tr><tr><td class="pop_bottomleft"></td><td class="pop_border"></td><td class="pop_bottomright"></td></tr></tbody></table></div></div>');
		}else{
			this.dom=jQuery('#global_WinDiv').eq(0).clone();
		}
		jQuery('.global_popup_title',this.dom).css('cursor','');
		this.dom.mousedown(function(){
			$_Global_Layer.instances[_id].dom.css('zIndex',$_Global_Layer.zindex++);
		})
		jQuery(document.body).append(this.dom);

		//返回初始化后实例
		return this.reset(options);
	},
	reset:function(options)
	{
		options=jQuery.extend(
		{
			top:0,
			left:0,
			width:360,
			height:200,
			title:'窗口标题',
			content:'窗口内容',
			center:false,
			fuckflash:false,
			showCloseButton:true,
			showMask:false,
			style:{},
			drag:{handler:'global_popup_title',effect:'g_layer_move'},
			showHook:function(e){},
			hideHook:function(e){}
		},options);
		//回调函数
		this.showHook=options.showHook;
		this.hideHook=options.hideHook;
		this.center=options.center;
		this.fuckflash=options.fuckflash;
		//宽高定位
		this.top(options.top);
		this.left(options.left);
		this.width(options.width);
		this.height(options.height);
		this.setTitle(options.title);
		this.setContent(options.content);
		this.setStyle(options.style);
		//关闭事件
		var _id=this.id;
		jQuery('.close',this.dom).unbind('click');
		jQuery('.close',this.dom).click(function(event){
			event.preventDefault();
			$_Global_Layer.instances[_id].hide('clickCloseButton');
		}).focus(function(){this.blur();}).mousedown(function(e){e.stopPropagation();});

		//针对list home等fuck_close处理
		jQuery('.fuck_close',this.dom).unbind('click');
		jQuery('.fuck_close',this.dom).click(function(event){
			event.preventDefault();
			$_Global_Layer.instances[_id].hide('clickCloseButton');
		}).focus(function(){this.blur();}).mousedown(function(e){e.stopPropagation();});
		if(options.showCloseButton)
			jQuery('.close',this.dom).show();
		else
			jQuery('.close',this.dom).hide();

		//遮蔽层事件
		if(options.showMask&&$_Global_Mask)
		{
			this.showMask=true;
		}

		if(options.drag&&this.dom.Drag&&!this.drag)
		{
			this.dom.Drag(options.drag);
			this.drag=true;
		}
	},
	show:function(e)
	{
		this.showHook(e)
		if(this.showMask&&this.dom.css('display')!='block')
		{
			this.dom.css('zIndex',$_Global_Layer.zindex++);
			$_Global_Mask.show(this.fuckflash);
		}
		this.dom.css('display','block');
		jQuery('.global_popup').css('position','relative');
		jQuery('.global_popup').css('zIndex',1);
		jQuery('.global_popup_content',this.dom).css('border','1px solid #797979');
		this.dom.css('position','absolute');
		if(this.center)
		{
			var _t = 0;
			var _l = 0;
			//if(top.document.body && top.document.getElementById("oMain")) {
				var scrollTop = top.document.documentElement.scrollTop || top.document.body.scrollTop;
				var clientHeight = top.document.documentElement.clientHeight || top.document.body.clientHeight;
				_t = scrollTop+((clientHeight-this.height())/2);
			//} else {
			//	_t=document.documentElement.scrollTop+((document.documentElement.clientHeight-this.height())/2);
			//}
			_l=document.documentElement.scrollLeft+((document.documentElement.clientWidth-this.width())/2);
			//top.document.getElementById("oMain").height = document.documentElement.offsetHeight);
			this.top(_t);
			this.left(_l);
		}
		jQuery('embed,object,select',this.dom).show();
		//特殊对待ie6
		if($.browser.msie && this.fuckflash == false){
			if($.browser.version=='6.0'){
				jQuery('embed,object,select').css('visibility','hidden');
				jQuery('embed,object,select',this.dom).css('visibility','visible');
			}
		}
		return this;
	},
	hide:function(e)
	{
		if(this.dom.css('display')=='none'){
			return;
		}
		jQuery('embed,object,select',this.dom).hide();
		this.dom.css('display','none');
		if(this.showMask)
		{
			$_Global_Mask.hide();
		}
		this.hideHook(e);
		jQuery('.global_popup_content',this.dom).css('border','0px solid #797979');
		//特殊对待ie6
		if($.browser.msie){
			if($.browser.version=='6.0'){
				jQuery('embed,object,select').css('visibility','visible');
			}
		}
		try {
			var faceObj = document.getElementById('public_51face_box');
			if (faceObj && faceObj.style.display != 'none')
				faceObj.style.display = 'none';
		} catch(e) {}
		return this;
	},
	top:function(n)
	{
		if(n)jQuery(this.dom).css('top',n);
		return parseInt(jQuery(this.dom).css('top'));
	},
	left:function(n)
	{
		if(n)jQuery(this.dom).css('left',n);
		return parseInt(jQuery(this.dom).css('left'));
	},
	width:function(n)
	{
		if(n)
		{
			n=parseInt(n);
			//jQuery(this.dom).width(n);
			jQuery('.global_popup',this.dom).width(n+20);
			jQuery('.global_popup_content',this.dom).width(n+5);
			jQuery('.global_dialog_content', this.dom).width('100%');
		}
		return parseInt(jQuery('.global_popup',this.dom).width());
	},
	height:function(n)
	{
		if(n)
		{
			n=parseInt(n);
			//jQuery(this.dom).height(n);
			jQuery('.global_popup',this.dom).height(n+25);
			jQuery('.global_popup_content',this.dom).height(n+11);
			jQuery('.global_dialog_content',this.dom).height(n-17);

		}
		return parseInt(jQuery('.global_popup',this.dom).height());
	},
	setStyle:function(o)
	{
		if(typeof o=='object')jQuery('.global_dialog_content',this.dom).css(o);
	},
	setTitle:function(o)
	{
		jQuery('#global_popup_title',this.dom).html(o);
		return this;
	},
	hideTitle: function() {
		jQuery('.global_popup_title', this.dom).hide();
		return this;
	},
	showTitle: function() {
		jQuery('.global_popup_title', this.dom).show();
		return this;
	},
	removeTitle: function() {
		jQuery('.global_popup_title', this.dom).remove();
		return this;
	},
	setContent:function(o)
	{
		var _element=jQuery('.global_dialog_content',this.dom),
		    _elemW = _element.width() || _element.css('width') || '100%',
		    _elemH = _element.height() || _element.css('height') || '100%';
		switch(typeof o)
		{
				case 'object':
					jQuery('.global_dialog_content',this.dom).html('').append(jQuery(o).show());
					/*var fuck_object=jQuery('.global_dialog_content',this.dom).html();
					fuck_object=replace_content(fuck_object);
					jQuery('.global_dialog_content',this.dom).html('');
					jQuery('.global_dialog_content',this.dom).html(fuck_object);*/
					break;
				case 'string':
					if(/^http:\/\//.test(o))
						jQuery('.global_dialog_content',this.dom).html('<iframe class="g_layer_iframe" scrolling="no" width="'+_elemW+'" height="'+_elemH+'" frameborder="0" src="'+o+'">');
					else{
						o=replace_content(o);
						jQuery('.global_dialog_content',this.dom).html(o);
					}

		}
		return this;
	}
}
$_Global_Layer.prototype.Init.prototype=$_Global_Layer.prototype;

/*兼容壳*/
var ___win_mask___=$_Global_Mask.getMask();
var ___win_pack___=$_Global_Layer();

var winDiy = function(options) {
	if ('string' == typeof options) {
		options = {msg: options};
	}
	options = jQuery.extend({
		flg:26,
		width:360,
		height:150,
		showMask:true,
		title:'警告',
		msg:'提示内容',
		center:true,
		enter:function(e){},
		cancel:function(e){}
	}, options);
	if (/^#/.test(options.msg)) {
		options.content = jQuery(options.msg);
	} else {
		options.content = options.msg;
	}

	___win_pack___.reset(options);
	___win_pack___.hideTitle();
	___win_pack___.show();
}

var Alert=function(options)
{
	if(typeof options=='string')
	{
		options={msg:options};
	}
/*
 *	参数width：窗口宽度
 *	参数height：窗口高度
 *	参数title：显示窗口标题
 *	参数msg：是必须的其他四个可以没有，如果没有按照默认的
 *	参数enter：返回确认函数
 *	参数cancel：返回取消函数
 *	参数drag：是否拖动默认拖动(false:禁止拖动)
 */
	options=jQuery.extend({
			flg:26,
			width:360,
			height:150,
			showMask:true,
			title:'警告',
			msg:'提示内容',
			center:true,
			enter:function(e){},
			cancel:function(e){}
		},options);
	if(/^#/.test(options.msg))
	{
		options.content=jQuery(options.msg);
	}else{
		options.content='<div class="g_layer_alert_logo"><div class="g_layer_alert_ico"></div></div><div style="height:'+options.flg+'px;line-height:'+options.flg+'px;"></div>'+options.msg+'<div class="g_layer_alert_buttonbox"><span class="g_btn_w"><input onfocus="this.blur();" class="g_btn" onclick="___win_pack___.hide(0);" type="button" value="确 定"></span>';
	}
	___win_pack___.enter=options.enter;
	___win_pack___.cancel=options.cancel;

	options.hideHook=function(s)
	{
		if(s===0)
			___win_pack___.enter(true);
		else
			___win_pack___.cancel(false);
	}
	___win_pack___.reset(options);
	___win_pack___.showTitle();
	___win_pack___.show();
	if(typeof options.timeout=='number')
		setTimeout(function(){___win_pack___.hide();},options.timeout);
}

var Confirm=function(options)
{
	if(typeof options=='string')
	{
		options={msg:options};
	}
/*
 *	确认框使用说明，参数顺序可以任意，参数个数任意
 *	参数msg：是必须的其他四个可以没有，如果没有按照默认的
 *	参数title：显示窗口标题
 *	参数enter：返回确认函数
 *	参数width：窗口宽度
 *	参数height：窗口高度
 *	参数cancel：返回取消函数
 *	参数drag：是否拖动默认拖动(true:拖动;false:禁止拖动)
 */
	options=jQuery.extend({
			flg:26,
			width:360,
			height:150,
			showMask:true,
			title:'确认',
			msg:'提示内容',
			center:true,
			enter:function(e){},
			cancel:function(e){}
		},options);
	if(/^#/.test(options.msg))
	{
		options.content=jQuery(options.msg);
	}else{
		options.content='<div class="g_layer_alert_logo"><div class="g_layer_alert_ico"></div></div><div style="height:'+options.flg+'px;line-height:'+options.flg+'px;"></div>'+options.msg+'<div class="g_layer_alert_buttonbox"><span class="g_btn_w"><input onfocus="this.blur();" class="g_btn" type="button" onclick="___win_pack___.hide(0);" value="确 定"></span><span class="g_btn_w_gray"><input class="g_btn_gray" type="button" onclick="___win_pack___.hide(1);" value="取 消"></span></div>';
	}
	___win_pack___.enter=options.enter;
	___win_pack___.cancel=options.cancel;
	/*jQuery('.g_layer_body',___win_pack___.dom)[0].style.cssText='padding:10px;line-height:130%;word-break:break-all;word-wrap:break-word';*/
	options.hideHook=function(s)
	{
		if(s===0)
			___win_pack___.enter(true);
		else
			___win_pack___.cancel(false);
	}
	___win_pack___.reset(options);
	___win_pack___.showTitle();
	___win_pack___.show();
	if(typeof options.timeout=='number')
		setTimeout(function(){___win_pack___.hide();},options.timeout);
}

var winOpen=winIframe=function(options)
{
/*
 *	Iframe框使用说明(如果想在iframle里边关闭图层调用方法：parent.hidePopWin(false))
 *	参数url：是必须的其他四个可以没有，如果没有按照默认的
 *	参数title：显示窗口标题
 *	参数width：窗口宽度
 *	参数height：窗口高度
 *	参数drag：是否拖动默认拖动(true:拖动;false:禁止拖动)
 */
	if(typeof options=='string')
	{
		options={msg:options};
	}
	options=jQuery.extend({
			width:360,
			height:130,
			title:'系统提示',
			msg:'内容',
			fuckflash:false,
			center:true,
			showMask:true
	},options);
	if(/^#/.test(options.msg))
	{
		options.content=jQuery(options.msg);
	}else
	{
		options.content=options.msg;
		//兼容home list等特殊频道
		//特殊处理绑定fuck_close事件,
		options.content=replace_content(options.content);
	}
	/*jQuery('.g_layer_body',___win_pack___.dom)[0].style.cssText='';*/
	___win_pack___.reset(options);
	___win_pack___.showTitle();
	___win_pack___.show();
	if(typeof options.timeout=='number')
		setTimeout(function(){___win_pack___.hide();},options.timeout);
}

function replace_content(content){
	var regex1=/<input([^>]*)class\s*=\s*['|"][^>]*g_layer_alert_btn[^>]*['|"]([^>]*)>/gi;
	var arrMatches = content.match(regex1);
	if(arrMatches == null){
		return content;
	}
	switch (arrMatches.length){
		//1个按钮
		case 1:
			if(new RegExp(/(<input[^>]*)g_layer_close([^>]*>)/i).test(content)){
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w"><input$1class="g_btn fuck_close"$2></span>');
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w_gray"><input$1class="g_btn_gray fuck_close"$2></span>');
			}else{
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w"><input$1class="g_btn"$2></span>');
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w_gray"><input$1class="g_btn_gray"$2></span>');
			}
			break;
		//2个按钮
		case 2:
			if(new RegExp(/(<input[^>]*)g_layer_close([^>]*>)/i).test(content)){
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w"><input$1class="g_btn"$2></span>');
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w_gray"><input$1class="g_btn_gray fuck_close"$2></span>');
			}else{
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w"><input$1class="g_btn"$2></span>');
				content=content.replace(/<input([^>]*)class\s*=\s*['|"][^("|>|')]*g_layer_alert_btn[^("|>|')]*['|"]([^>]*)>/i,'<span class="g_btn_w_gray"><input$1class="g_btn_gray"$2></span>');
			}

			break;
		default:
			break;

	}
	//处理input里面的style移到外边span来
	content=content.replace(/<span class="g_btn_w"><input([^>]*)(style\s*=\s*['|"][^("|>|')]*['|"])([^>]*)>/i,'<span class="g_btn_w" $2><input$1$3>');
	content=content.replace(/<span class="g_btn_w_gray"><input([^>]*)(style\s*=\s*['|"][^("|>|')]*['|"])([^>]*)>/i,'<span class="g_btn_w_gray" $2><input$1$3>');
	return content;
}

function hidePopWin(e)
{
	___win_pack___.hide(e);
}
