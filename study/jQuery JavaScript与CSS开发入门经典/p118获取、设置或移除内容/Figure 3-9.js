$(document).ready(
		function(){
			$('div').hover(
				function() {
					alert('HTML:'+$('div').html()+'\n'+'Text:'+$('div').text());//html()方法与text()方法存在略微的差别
				},
				function(){}
			);
		}
);

				