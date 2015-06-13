$(document).bind(
		'ready',
		function(){
			$('div').bind(
					'mouseover',
					function(){
						$(this).addClass('tmpExampleOver');
					}
		);
		$('div').bind(
				'mouseout',
				function(){
					$(this).removeClass('tmpExampleOver');
				}
		);
		$('div').bind(
				'click',
				function(){
					if($(this).hasClass('tmpExampleOn')) {
						$(this).removeClass('tmpExampleOn');
					}
					else {
						$(this).addClass('tmpExampleOn');
					}
				}
				);
		}
		);