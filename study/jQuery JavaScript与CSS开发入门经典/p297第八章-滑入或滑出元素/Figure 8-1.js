$(document).ready(
		function(){
			$('input#tmpOpen').click(
					function($e){
						$('div#tmpDialogue').slideDown('fast');
					}
			);
			$('input#tmpClose').click(
					function($e){
						$('div#tmpDialogue').slideUp(3000);
					}
			);
		}
);
/*还可以将回调函数作为第二个参数，传递给slideDown方法或slideUp方法，jQuery还提供了一个slideToggle()方法，
 * 交替完成slideDown和slideUp方法。 
 */
