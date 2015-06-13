$(document).ready(
		function(){
//			var $items = [
//			     'John Lennon',
//			     'Paul McCartney',
//			     'George Harrison',
//			     'Ringo Starr'
//			];
//			$($items).each(
//					function(){
//						$('ul').append("<li>"+this+"</li>");
//					}
//			);
			$.each(
				['Groucho','Chico','Harpo','Zeppo'],
				function() {
					$('ul').append('<li>'+this+"</li>");
				}//数组作为第一个参数，方法作为第二个参数，为数组中的每个元素添加该方法
			);
		}
);
