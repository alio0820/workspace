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
				}//������Ϊ��һ��������������Ϊ�ڶ���������Ϊ�����е�ÿ��Ԫ����Ӹ÷���
			);
		}
);
