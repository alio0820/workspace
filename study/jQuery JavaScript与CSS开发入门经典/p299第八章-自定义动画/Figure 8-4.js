$(document).ready(
		function(){
			$('input#tmpAnimate').click(
					function($e){
						$('div#tmpDialogue').animate({
							width:'600px',//宽度增加到600
							marginLeft:'-301px'//marginLeft从-251变化到-301
						},3000//变化时间为3000ms=3s
						);
					}
			);
		}
);
/*还可以将回调函数作为第二个参数，传递给slideDown方法或slideUp方法，jQuery还提供了一个slideToggle()方法，
 * 交替完成slideDown和slideUp方法。 
 */ 
