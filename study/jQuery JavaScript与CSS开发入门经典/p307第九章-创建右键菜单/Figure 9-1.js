$.fn.extend({
	ContextMenu:function(){
		this.each(
				function(){
					$(this).addClass('tmpContextMenu');
					$(this).hover(
							function(){
								$.data(this,'ContextMenu',true);
							},
							function(){
								$.data(this,'ContextMenu',false);
							}
					);
					//only attach the following event once.
					if(!$.data(document,'MouseDown')){
						$.data(document,'MouseDown',true);
						$(document).mousedown(
								function(){
									$('.tmpContextMenu').each(
											function(){
												if(!$.data(this,'ContextMenu')){
													$(this).hide();
												}
											}
									);
								}
						);
					}
					$(this).parent().bind(						//为什么默认关联的是右击事件
							'contextmenu',
							function($e){
								$e.preventDefault();
								//The contextmenu doesn't work in Opera.
								//Guess those four users will just have to do without.
								var $menu = $(this).find('.tmpContextMenu');
								$menu.show();
								//The following bit gets the dimensions of the viewport
								var $vpx,$vpy;
								if(self.innerHeight){
									//all except Explorer
									$vpx=self.innerWidth;
									$vpy=self.innerHeight;
								}
								else if(document.documentElement &&document.documentElement.clientHeight){
									//Explorer 6 Strict Mode
									$vpx=document.documentElement.clientWidth;
									$vpy=document.documentElement.clientHeight;
								}
								else if(document.body){
									//other Explorer
									$vpx=document.body.clientWidth;
									$vpy=document.body.clientHeight;
								}
								//Reset offset values to their defaluts
								$menu.css({
									top:'auto',
									right:'auto',
									bottom:'auto',
									left:'auto'
								});
								/*
								 * If the height or width of the contextmenu is greater than the amount
								 * of pixels form the point of click to the right or bottom edge of the
								 * viewport adjust the offset accordingly
								 */
								if($menu.outerHeight()>($vpy-$e.pageY)){
									$menu.css('bottom',($vpy-$e.pageY)+'px');
								}
								else{
									$menu.css('top',$e.pageY+'px');
								}
								if($menu.outerWidth()>($vpx-$e.pageX)){
									$menu.css('right',($vpx-$e.pageX)+'px');
								}
								else{
									$menu.css('left',$e.pageX+'px');
								}
							}
					);				
				}
		);
		return $(this);
	},
	MyApplication:{
		Ready:function(){
			$('ul').ContextMenu();
		}
	}
});


$(document).ready(
		function(){
			$.fn.MyApplication.Ready();//直接调用插件
		}
);
