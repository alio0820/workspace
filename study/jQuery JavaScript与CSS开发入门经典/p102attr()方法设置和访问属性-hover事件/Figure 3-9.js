$(document).ready(
		function(){
			$('div').hover(
				function() {
					$(this).attr('id','tmpExample');
					$(this).text("This element\'s ID is:"+ $(this).attr('id'));
				},
				function() {
					$(this).attr('id','');
					$(this).text("This element\'s ID has been removed.");
				}
				)
				.click()(
				function() {
					$(this).toggleClass('tmpToggle');
				}
			);
		}
);

				