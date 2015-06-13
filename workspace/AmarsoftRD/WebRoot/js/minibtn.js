var minibtnjs = function(){
	return{
		init:function(){
			document.body.onclick=function(){
 				$('.btn-focus').removeClass('btn-focus');
 			};
 			//切换miniMenu			/***直接在div上写onclick，...return false并不会阻止事件冒泡****/
 			$('.nui-miniBtn').click(function(){
 				return minibtnjs.nui_miniBtn_Event(this);
 			});
 			//修改帖子状态
 			$('.nui-menu-item').click(function(){
 				return minibtnjs.nui_menu_item_Event(this);
 			});
		},
		nui_miniBtn_Event: function(obj){
			var miniMenu = $(obj).parent().next();
				if(miniMenu.hasClass('btn-focus')){
					miniMenu.removeClass('btn-focus');
				}else{
					$('.btn-focus').removeClass('btn-focus');
 				miniMenu.addClass('btn-focus');
				}
 			return false;
		},
		nui_menu_item_Event: function(obj){
			var _this = $(obj);
			var nui_menu = _this.parent();
			var postId = nui_menu.parent().attr('data-field');
			var data = _this.attr('data');
			var parameter = "postId="+postId;
			var method;
			if(data=='top'){
				var top = nui_menu.attr('data-top');
				method =7;
				parameter += "&content="+top+"&method="+method;
			}else{
				var nicepost = nui_menu.attr('nicepost');
				method =8;
				parameter += "&content="+nicepost+"&method="+method;
			}
			nui_menu.removeClass('btn-focus');
			$.ajax({
			type:'post',
			url:"jsp_file/post_action.jsp",
			async:true,
			cache:false,
			dataType:'text',		//json类型貌似不能用alert弹值，html类型输出的是全部的html,包括换行符
			data:""+parameter,
			success: function(msg){
				msg = eval("("+msg+")");
				if(msg.status=="true"){
					var span = nui_menu.parent().find('span.status');
					if(method==7){
						if(msg.info=="true") {
							span.find('.zding').show();
							nui_menu.attr('data-top',1);
							_this.find('.nui-menu-item-text').html('取消置顶');
						}
						else {
							span.find('.zding').hide();
							nui_menu.attr('data-top',0);
							_this.find('.nui-menu-item-text').html('标记为置顶');
						}
					}
					else{
						if(msg.info=="true") {
							span.find('.jing').show();
							nui_menu.attr('nicepost',1);
							_this.find('.nui-menu-item-text').html('取消精品');
						}
						else {
							span.find('.jing').hide();
							nui_menu.attr('nicepost',0);
							_this.find('.nui-menu-item-text').html('标记为精品');
						}
					}
				}
			}
		});
		return false;
		}
	};
}();
$(document).ready(minibtnjs.init);