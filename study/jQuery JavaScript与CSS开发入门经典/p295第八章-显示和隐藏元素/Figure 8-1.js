$(document).ready(
		function(){
			$('input#tmpOpen').click(
					function($e){
						$('div#tmpDialogue').show('slow');
					}
			);
			$('input#tmpClose').click(
					function($e){
						$('div#tmpDialogue').hide(5000);
					}
			);
		}
);
/*jQuery的show()方法可以接收一个字符串参数，以指示jQuery对该元素生成动画的显示效果的速度。
 * 对于show()，hide(),toggle()方法，他们都可以接收一个表示动画速度的参数，该参数既可以是
 * 一个字符串，也可以是一个数字的毫秒值。对于字符串参数，它可以是：slow,normal,fast 3个中
 * 的一个。
 */
