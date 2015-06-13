$.fn.extend({
	Select:function(){
		return $(this).addClass('tmpSelected');
	},
	Unselect:function(){
		return $(this).removeClass('tmpSelected');
	},
	MyApplication:{
		Ready:function(){
			$('p a').click(
					function($e){
						$e.preventDefault();
						$('li').Select();
					}
			);
			$('li').click(
					function(){
						$(this).hasClass('tmpSelected')?
								$(this).Unselect():$(this).Select();
					}
			);
		}
	}
});

$(document).ready(
		function(){
			$.fn.MyApplication.Ready();//直接调用插件
		}
);
