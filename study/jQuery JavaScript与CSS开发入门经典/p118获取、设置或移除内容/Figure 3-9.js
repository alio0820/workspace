$(document).ready(
		function(){
			$('div').hover(
				function() {
					alert('HTML:'+$('div').html()+'\n'+'Text:'+$('div').text());//html()������text()����������΢�Ĳ��
				},
				function(){}
			);
		}
);

				