$(document).ready(
		function(){
			$('img.hFinderTreeHasChildren').click(
					function(){
						if(!$(this).next().children('ul').length){
							$(this).next().load(
									$(this).prev().attr('id').split('-').pop()+'.html',		//获取属性src的值
									function(){
										$(this).show();
										$(this).prev().attr(
												'src',
												'../images/arrow_expanded.gif'
										);
									}
							);
						}
						else{
							$(this).next().toggle();//toggle() 方法切换元素的可见状态。
							//如果被选元素可见，则隐藏这些元素，如果被选元素隐藏，则显示这些元素。
							$(this).attr(					//设置属性src的值
									'src',
									'../images/'+($(this).attr('src').indexOf('arrow_expanded')!=-1?'arrow_collapsed':'arrow_expanded')+'.gif'
									);
						}
					}
			);
		}
);