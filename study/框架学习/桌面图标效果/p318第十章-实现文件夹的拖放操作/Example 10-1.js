$(document).ready(
		function(){
			$('div.hFinderDirectory').mousedown(
					function(){
						$('div.hFinderDirectory').not(this)
						.find('div.hFinderIcon')
						.removeClass('hFinderIconSelected');		//非当前文件夹取消属性
						$('div.hFinderDirectory').not(this)
						.find('div.hFinderDirectoryName span')
						.removeClass('hFinderDirectoryNameSelected');//非当前文本取消属性
						$(this).find('div.hFinderIcon')
						.addClass('hFinderIconSelected');			//当前文件夹添加属性
						$(this).find('div.hFinderDirectoryName span')
						.addClass('hFinderDirectoryNameSelected');	//当前文本添加属性
					}
			).draggable();
		}
);